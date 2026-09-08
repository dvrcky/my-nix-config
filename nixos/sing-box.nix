{ config, pkgs, ... }:

let
  configFile = config.sops.templates."sing-box/config.json".path;

in
{
  # TUN replies can fail reverse-path checks due to sing-box policy routing.
  networking.firewall.extraCommands = ''
    iptables -t mangle -I nixos-fw-rpfilter 1 -i singbox_tun -j RETURN
  '';

  sops.age.keyFile = "/home/dvrcky/.config/sops/age/keys.txt";

  sops.secrets."sing-box/trojan-password" = {
    sopsFile = ../secrets/sing-box.yaml;
    key = "trojan-password";
    owner = "root";
    group = "root";
    mode = "0400";
  };

  sops.templates."sing-box/config.json" = {
    mode = "0400";
    content = builtins.toJSON {
    log = {
      level = "info";
    };

    dns = {
      servers = [
        {
          type = "udp";
          tag = "dns-direct";
          server = "223.5.5.5";
        }
        {
          type = "https";
          tag = "dns-proxy";
          server = "cloudflare-dns.com";
          path = "/dns-query";
          domain_resolver = "dns-direct";
          detour = "proxy";
        }
      ];
      final = "dns-proxy";
    };

    inbounds = [
      {
        type = "tun";
        tag = "tun-in";
        interface_name = "singbox_tun";
        address = [ "172.18.0.1/30" ];
        mtu = 9000;
        auto_route = true;
        auto_redirect = true;
        strict_route = true;
        stack = "system";
        route_exclude_address = [
          "10.0.0.0/8"
          "172.16.0.0/12"
          "192.168.0.0/16"
          "fc00::/7"
        ];
      }
    ];

    outbounds = [
      {
        type = "trojan";
        tag = "proxy";
        server = "89.127.232.159";
        server_port = 25571;
        password = config.sops.placeholder."sing-box/trojan-password";
        tls = {
          enabled = true;
          server_name = "www.apple.com";
          utls = {
            enabled = true;
            fingerprint = "chrome";
          };
          reality = {
            enabled = true;
            public_key = "LE4xYc83k6IZ1aLvGhgyVnns_BnMl1uKEVSH3_fnxSE";
            short_id = "a15f2375ab4b4c75";
          };
        };
      }
      {
        type = "direct";
        tag = "direct";
      }
      {
        type = "block";
        tag = "block";
      }
    ];

    route = {
      auto_detect_interface = true;
      default_domain_resolver = "dns-direct";
      rules = [
        {
          action = "sniff";
        }
        {
          protocol = [ "dns" ];
          action = "hijack-dns";
        }
        {
          ip_is_private = true;
          outbound = "direct";
        }
        {
          network = [ "udp" ];
          port = [ 443 ];
          action = "reject";
        }
      ];
      final = "proxy";
    };
    };
  };

  systemd.services.sing-box = {
    description = "sing-box transparent proxy";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      ExecStartPre = [
        "${pkgs.sing-box}/bin/sing-box check -c ${configFile}"
      ];
      ExecStart = "${pkgs.sing-box}/bin/sing-box run -c ${configFile}";
      Restart = "on-failure";
      RestartSec = 5;
      User = "root";
      AmbientCapabilities = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
      CapabilityBoundingSet = [ "CAP_NET_ADMIN" "CAP_NET_RAW" ];
    };
  };
}
