{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    docker-compose
    dive # explore docker layers
    lazydocker #  Docker tui tool
    skopeo # copy/sync images between registries and local storage

    kubectl
    kubectx # a tool to switch between contexts on kubectl faster
    kubebuilder # a framework for building Kubernetes APIs
    istioctl
    clusterctl # for k8s cluster-api
    kubevirt # virtctl
    kubernetes-helm
    fluxcd # k8s-based GitOps
    argocd # GitOps-cd tool for k8s
  ];

  programs = {
    k9s = {
      enable = true;

      settings = {
        k9s = {
          ui = {
            skin = "catppuccin-mocha";
          };
        };
      };

      skins = {
        catppuccin-mocha = {
          k9s = {
            body = {
              fgColor = "#cdd6f4";
              bgColor = "#1e1e2e";
              logoColor = "#cba6f7";
            };
            prompt = {
              fgColor = "#cdd6f4";
              bgColor = "#181825";
              suggestColor = "#89b4fa";
            };
            help = {
              fgColor = "#cdd6f4";
              bgColor = "#1e1e2e";
              sectionColor = "#a6e3a1";
              keyColor = "#89b4fa";
              numKeyColor = "#eba0ac";
            };
            frame = {
              title = {
                fgColor = "#94e2d5";
                bgColor = "#1e1e2e";
                highlightColor = "#f5c2e7";
                counterColor = "#f9e2af";
                filterColor = "#a6e3a1";
              };
              border = {
                fgColor = "#cba6f7";
                focusColor = "#b4befe";
              };
              menu = {
                fgColor = "#cdd6f4";
                keyColor = "#89b4fa";
                numKeyColor = "#eba0ac";
              };
              crumbs = {
                fgColor = "#1e1e2e";
                bgColor = "#eba0ac";
                activeColor = "#f2cdcd";
              };
              status = {
                newColor = "#89b4fa";
                modifyColor = "#b4befe";
                addColor = "#a6e3a1";
                pendingColor = "#fab387";
                errorColor = "#f38ba8";
                highlightColor = "#89dceb";
                killColor = "#cba6f7";
                completedColor = "#6c7086";
              };
            };
            info = {
              fgColor = "#fab387";
              sectionColor = "#cdd6f4";
            };
            views = {
              table = {
                fgColor = "#cdd6f4";
                bgColor = "#1e1e2e";
                cursorFgColor = "#313244";
                cursorBgColor = "#45475a";
                markColor = "#f5e0dc";
                header = {
                  fgColor = "#f9e2af";
                  bgColor = "#1e1e2e";
                  sorterColor = "#89dceb";
                };
              };
              xray = {
                fgColor = "#cdd6f4";
                bgColor = "#1e1e2e";
                cursorColor = "#45475a";
                cursorTextColor = "#1e1e2e";
                graphicColor = "#f5c2e7";
              };
              charts = {
                bgColor = "#1e1e2e";
                chartBgColor = "#1e1e2e";
                dialBgColor = "#1e1e2e";
                defaultDialColors = [ "#a6e3a1" "#f38ba8" ];
                defaultChartColors = [ "#a6e3a1" "#f38ba8" ];
                resourceColors = {
                  cpu = [ "#cba6f7" "#89b4fa" ];
                  mem = [ "#f9e2af" "#fab387" ];
                };
              };
              yaml = {
                keyColor = "#89b4fa";
                valueColor = "#cdd6f4";
                colonColor = "#a6adc8";
              };
              logs = {
                fgColor = "#cdd6f4";
                bgColor = "#1e1e2e";
                indicator = {
                  fgColor = "#b4befe";
                  bgColor = "#1e1e2e";
                  toggleOnColor = "#a6e3a1";
                  toggleOffColor = "#a6adc8";
                };
              };
            };
            dialog = {
              fgColor = "#f9e2af";
              bgColor = "#9399b2";
              buttonFgColor = "#1e1e2e";
              buttonBgColor = "#7f849c";
              buttonFocusFgColor = "#1e1e2e";
              buttonFocusBgColor = "#f5c2e7";
              labelFgColor = "#f5e0dc";
              fieldFgColor = "#cdd6f4";
            };
          };
        };
      };
    };
  };

}
