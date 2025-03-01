let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";

      keybinds = {
        normal = {
          bind = {
            "Alt g" = { SwitchToMode = "locked"; };
            "Alt p" = { SwitchToMode = "pane"; };
            "Alt m" = { SwitchToMode = "move"; };
            "Alt r" = { SwitchToMode = "resize"; };
            "Alt f" = { SwitchToMode = "search"; };
            "Alt n" = { SwitchToMode = "session"; };
            "Alt t" = { SwitchToMode = "tab"; };
            "Alt s" = { SwitchToMode = "scroll"; };
            "Alt b" = { SwitchToMode = "tmux"; };
          };
        };

        locked = {
          bind = {
            "Alt g" = { SwitchToMode = "Normal"; };
          };
        };

        move = {
          bind = {
            "Alt m" = { SwitchToMode = "Normal"; };
            "n" = { MovePane = {}; };
            "Tab" = { MovePane = {}; };
            "p" = { MovePaneBackwards = {}; };
            "h" = { MovePane = "Left"; };
            "Left" = { MovePane = "Left"; };
            "j" = { MovePane = "Down"; };
            "Down" = { MovePane = "Down"; };
            "k" = { MovePane = "Up"; };
            "Up" = { MovePane = "Up"; };
            "l" = { MovePane = "Right"; };
            "Right" = { MovePane = "Right"; };
          };
        };

        pane = {
          bind = {
            "Alt p" = { SwitchToMode = "Normal"; };
            "h" = { MoveFocus = "Left"; };
            "Left" = { MoveFocus = "Left"; };
            "l" = { MoveFocus = "Right"; };
            "Right" = { MoveFocus = "Right"; };
            "j" = { MoveFocus = "Down"; };
            "Down" = { MoveFocus = "Down"; };
            "k" = { MoveFocus = "Up"; };
            "Up" = { MoveFocus = "Up"; };
            "p" = { SwitchFocus = {}; };
            "n" = [
              { NewPane = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "d" = [
              { NewPane = "Down"; }
              { SwitchToMode = "Normal"; }
            ];
            "r" = [
              { NewPane = "Right"; }
              { SwitchToMode = "Normal"; }
            ];
            "x" = [
              { CloseFocus = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "f" = [
              { ToggleFocusFullscreen = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "z" = [
              { TogglePaneFrames = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "w" = [
              { ToggleFloatingPanes = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "e" = [
              { TogglePaneEmbedOrFloating = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "c" = [
              { SwitchToMode = "RenamePane"; }
              { PaneNameInput = 0; }
            ];
          };
        };

        resize = {
          bind = {
            "Alt r" = { SwitchToMode = "Normal"; };
            "h" = { Resize = "Increase Left"; };
            "Left" = { Resize = "Increase Left"; };
            "j" = { Resize = "Increase Down"; };
            "Down" = { Resize = "Increase Down"; };
            "k" = { Resize = "Increase Up"; };
            "Up" = { Resize = "Increase Up"; };
            "l" = { Resize = "Increase Right"; };
            "Right" = { Resize = "Increase Right"; };
            "H" = { Resize = "Decrease Left"; };
            "J" = { Resize = "Decrease Down"; };
            "K" = { Resize = "Decrease Up"; };
            "L" = { Resize = "Decrease Right"; };
            "=" = { Resize = "Increase"; };
            "+" = { Resize = "Increase"; };
            "-" = { Resize = "Decrease"; };
          };
        };

        tab = {
          bind = {
            "Alt t" = { SwitchToMode = "Normal"; };
            "r" = [
              { SwitchToMode = "RenameTab"; }
              { TabNameInput = 0; }
            ];
            "h" = { GoToPreviousTab = {}; };
            "Left" = { GoToPreviousTab = {}; };
            "Up" = { GoToPreviousTab = {}; };
            "k" = { GoToPreviousTab = {}; };
            "l" = { GoToNextTab = {}; };
            "Right" = { GoToNextTab = {}; };
            "Down" = { GoToNextTab = {}; };
            "j" = { GoToNextTab = {}; };
            "n" = [
              { NewTab = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "x" = [
              { CloseTab = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "s" = [
              { ToggleActiveSyncTab = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "b" = [
              { BreakPane = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "]" = [
              { BreakPaneRight = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "[" = [
              { BreakPaneLeft = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "1" = [
              { GoToTab = 1; }
              { SwitchToMode = "Normal"; }
            ];
            "2" = [
              { GoToTab = 2; }
              { SwitchToMode = "Normal"; }
            ];
            "3" = [
              { GoToTab = 3; }
              { SwitchToMode = "Normal"; }
            ];
            "4" = [
              { GoToTab = 4; }
              { SwitchToMode = "Normal"; }
            ];
            "5" = [
              { GoToTab = 5; }
              { SwitchToMode = "Normal"; }
            ];
            "6" = [
              { GoToTab = 6; }
              { SwitchToMode = "Normal"; }
            ];
            "7" = [
              { GoToTab = 7; }
              { SwitchToMode = "Normal"; }
            ];
            "8" = [
              { GoToTab = 8; }
              { SwitchToMode = "Normal"; }
            ];
            "9" = [
              { GoToTab = 9; }
              { SwitchToMode = "Normal"; }
            ];
            "Tab" = { ToggleTab = {}; };
          };
        };

        scroll = {
          bind = {
            "Alt s" = { SwitchToMode = "Normal"; };
            "e" = [
              { EditScrollback = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "s" = [
              { SwitchToMode = "EnterSearch"; }
              { SearchInput = 0; }
            ];
            "Ctrl c" = [
              { ScrollToBottom = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "j" = { ScrollDown = {}; };
            "Down" = { ScrollDown = {}; };
            "k" = { ScrollUp = {}; };
            "Up" = { ScrollUp = {}; };
            "PageDown" = { PageScrollDown = {}; };
            "Right" = { PageScrollDown = {}; };
            "l" = { PageScrollDown = {}; };
            "PageUp" = { PageScrollUp = {}; };
            "Left" = { PageScrollUp = {}; };
            "h" = { PageScrollUp = {}; };
            "d" = { HalfPageScrollDown = {}; };
            "u" = { HalfPageScrollUp = {}; };
          };
        };

        search = {
          bind = {
            "Alt f" = { SwitchToMode = "Normal"; };
            "Ctrl c" = [
              { ScrollToBottom = {}; }
              { SwitchToMode = "Normal"; }
            ];
            "j" = { ScrollDown = {}; };
            "Down" = { ScrollDown = {}; };
            "k" = { ScrollUp = {}; };
            "Up" = { ScrollUp = {}; };
            "PageDown" = { PageScrollDown = {}; };
            "Right" = { PageScrollDown = {}; };
            "l" = { PageScrollDown = {}; };
            "PageUp" = { PageScrollUp = {}; };
            "Left" = { PageScrollUp = {}; };
            "h" = { PageScrollUp = {}; };
            "d" = { HalfPageScrollDown = {}; };
            "u" = { HalfPageScrollUp = {}; };
            "n" = { Search = "down"; };
            "p" = { Search = "up"; };
            "c" = { SearchToggleOption = "CaseSensitivity"; };
            "w" = { SearchToggleOption = "Wrap"; };
            "o" = { SearchToggleOption = "WholeWord"; };
          };
        };

        tmux = {
          bind = {
            "Alt b" = { SwitchToMode = "Normal"; };
          };
        };

        entersearch = {
          bind = {
            "Ctrl c" = { SwitchToMode = "Scroll"; };
            "Esc" = { SwitchToMode = "Scroll"; };
            "Enter" = { SwitchToMode = "Search"; };
          };
        };

        renametab = {
          bind = {
            "Ctrl c" = { SwitchToMode = "Normal"; };
            "Esc" = [
              { UndoRenameTab = {}; }
              { SwitchToMode = "Tab"; }
            ];
          };
        };

        renamepane = {
          bind = {
            "Ctrl c" = { SwitchToMode = "Normal"; };
            "Esc" = [
              { UndoRenamePane = {}; }
              { SwitchToMode = "Pane"; }
            ];
          };
        };

        session = {
          bind = {
            "Alt n" = { SwitchToMode = "Normal"; };
            "d" = { Detach = {}; };
            "w" = [
              {
                LaunchOrFocusPlugin = [
                  "session-manager"
                  {
                    floating = true;
                    move_to_focused_tab = true;
                  }
                ];
              }
              { SwitchToMode = "Normal"; }
            ];
          };
        };

        shared_except = {
          locked = {
            unbind = [
              "Ctrl h"
              "Ctrl o"
              "Ctrl s"
              "Ctrl n"
              "Ctrl p"
              "Ctrl t"
              "Ctrl g"
              "Ctrl q"
              "Ctrl b"
            ];
            bind = {
              "Alt g" = { SwitchToMode = "Locked"; };
              "Alt q" = { Quit = {}; };
              "Alt t" = { NewTab = {}; };
              "Alt i" = { MoveTab = "Left"; };
              "Alt a" = { MoveTab = "Right"; };
              "Alt h" = { MoveFocusOrTab = "Left"; };
              "Alt Left" = { MoveFocusOrTab = "Left"; };
              "Alt l" = { MoveFocusOrTab = "Right"; };
              "Alt Right" = { MoveFocusOrTab = "Right"; };
              "Alt j" = { MoveFocus = "Down"; };
              "Alt Down" = { MoveFocus = "Down"; };
              "Alt k" = { MoveFocus = "Up"; };
              "Alt Up" = { MoveFocus = "Up"; };
              "Alt =" = { Resize = "Increase"; };
              "Alt +" = { Resize = "Increase"; };
              "Alt -" = { Resize = "Decrease"; };
              "Alt [" = { PreviousSwapLayout = {}; };
              "Alt ]" = { NextSwapLayout = {}; };
            };
          };
          
          normal_locked = {
            bind = {
              "Esc" = { SwitchToMode = "Normal"; };
            };
          };
          
          pane_locked = {
            bind = {
              "Alt p" = { SwitchToMode = "Pane"; };
            };
          };
          
          resize_locked = {
            bind = {
              "Alt r" = { SwitchToMode = "Resize"; };
            };
          };
          
          scroll_locked = {
            bind = {
              "Alt s" = { SwitchToMode = "Scroll"; };
            };
          };
          
          session_locked = {
            bind = {
              "Alt n" = { SwitchToMode = "Session"; };
            };
          };
          
          tab_locked = {
            bind = {
              "Alt t" = { SwitchToMode = "Tab"; };
            };
          };
        };
      
      };

      plugins = {
        tab-bar = { location = "zellij:tab-bar"; };
        status-bar = { location = "zellij:status-bar"; };
        strider = { location = "zellij:strider"; };
        compact-bar = { location = "zellij:compact-bar"; };
        session-manager = { location = "zellij:session-manager"; };
        welcome-screen = {
          location = "zellij:session-manager";
          welcome_screen = true;
        };
        filepicker = {
          location = "zellij:strider";
          cwd = "/";
        };
      };

    };
  };

  # only works in bash/zsh, instead of nushell
  home.shellAliases = shellAliases;
  
  # add the catppuccin theme file under the zellij config folder
  xdg.configFile."zellij/themes/catppuccin.kdl".text = 
    ''
      // custom catppuccin config
    ''
    + builtins.readFile ./themes/catppuccin.kdl;
}
