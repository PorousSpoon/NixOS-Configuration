{lib, config, pkgs, ...}: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/desec@v1.1.0" ];
      hash = "sha256-HrLRezw+q5+dRdJS662686n7xsImSxNb3UqlSo61R8E=";
    };

    environmentFile = config.sops.templates."caddy-env".path;

    virtualHosts."vaultwarden.home.microcloud.co.in".extraConfig = ''
      @notlan not client_ip 192.168.0.0/24
      respond @notlan /admin 403
      reverse_proxy 127.0.0.1:8222
      tls {
        dns desec {
          token {$DESEC_TOKEN}
        }
        propagation_delay 1m
        propagation_timeout 1m
      }
    '';
    virtualHosts."immich.home.microcloud.co.in".extraConfig = ''
      reverse_proxy 127.0.0.1:2283
      request_body { max_size 0 }
      tls {
        dns desec {
          token {$DESEC_TOKEN}
        }
        propagation_delay 1m
        propagation_timeout 1m
      }
    '';
    virtualHosts."cloud.home.microcloud.co.in".extraConfig = ''
      reverse_proxy 127.0.0.1:8080
      request_body { max_size 0 }
      tls {
        dns desec {
          token {$DESEC_TOKEN}
        }
        propagation_delay 1m
        propagation_timeout 1m
      }
    '';

  };

  # Necessary for Nextcloud
  services.nginx.virtualHosts."cloud.home.microcloud.co.in".listen = [ { addr = "127.0.0.1"; port = 8080; } ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # sops
  sops = {
    secrets."desec_token" = {};
    templates."caddy-env" = {
      content = ''
        DESEC_TOKEN=${config.sops.placeholder."desec_token"}     
      '';
      restartUnits = [ "caddy.service" ];
    };
  };
}
