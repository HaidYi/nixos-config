let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  programs.zellij = {
    enable = true;
  };

  # only works in bash/zsh, instead of nushell
  home.shellAliases = shellAliases;

  # add the config for zellij
  xdg.configFile."zellij/config.kdl".text =
    ''
      // If you'd like to override the default keybindings completely, be sure to change "keybinds" to "keybinds clear-defaults=true"
      //

      // themes
      theme "catppuccin-mocha"

      keybinds {

          normal {
              // uncomment this and adjust key if using copy_on_select=false
              // bind "Alt c" { Copy; }
              bind "Alt g" { SwitchToMode "locked"; }
              bind "Alt p" { SwitchToMode "pane"; }
              bind "Alt m" { SwitchToMode "move"; }
              bind "Alt r" { SwitchToMode "resize"; }
              bind "Alt f" { SwitchToMode "search"; }
              bind "Alt n" { SwitchToMode "session"; }
              bind "Alt t" { SwitchToMode "tab"; }
              bind "Alt s" { SwitchToMode "scroll"; }
              bind "Alt b" { SwitchToMode "tmux"; }
          }

          locked {
              bind "Alt g" { SwitchToMode "Normal"; }
          }

          move {
              bind "Alt m" { SwitchToMode "Normal"; }
              bind "n" "Tab" { MovePane; }
              bind "p" { MovePaneBackwards; }
              bind "h" "Left" { MovePane "Left"; }
              bind "j" "Down" { MovePane "Down"; }
              bind "k" "Up" { MovePane "Up"; }
              bind "l" "Right" { MovePane "Right"; }
          }

          pane {
              bind "Alt p" { SwitchToMode "Normal"; }
              bind "h" "Left" { MoveFocus "Left"; }
              bind "l" "Right" { MoveFocus "Right"; }
              bind "j" "Down" { MoveFocus "Down"; }
              bind "k" "Up" { MoveFocus "Up"; }
              bind "p" { SwitchFocus; }
              bind "n" { NewPane; SwitchToMode "Normal"; }
              bind "d" { NewPane "Down"; SwitchToMode "Normal"; }
              bind "r" { NewPane "Right"; SwitchToMode "Normal"; }
              bind "x" { CloseFocus; SwitchToMode "Normal"; }
              bind "f" { ToggleFocusFullscreen; SwitchToMode "Normal"; }
              bind "z" { TogglePaneFrames; SwitchToMode "Normal"; }
              bind "w" { ToggleFloatingPanes; SwitchToMode "Normal"; }
              bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "Normal"; }
              bind "c" { SwitchToMode "RenamePane"; PaneNameInput 0;}
          }

          resize {
              bind "Alt r" { SwitchToMode "Normal"; }
              bind "h" "Left" { Resize "Increase Left"; }
              bind "j" "Down" { Resize "Increase Down"; }
              bind "k" "Up" { Resize "Increase Up"; }
              bind "l" "Right" { Resize "Increase Right"; }
              bind "H" { Resize "Decrease Left"; }
              bind "J" { Resize "Decrease Down"; }
              bind "K" { Resize "Decrease Up"; }
              bind "L" { Resize "Decrease Right"; }
              bind "=" "+" { Resize "Increase"; }
              bind "-" { Resize "Decrease"; }
          }

          tab {
              bind "Alt t" { SwitchToMode "Normal"; }
              bind "r" { SwitchToMode "RenameTab"; TabNameInput 0; }
              bind "h" "Left" "Up" "k" { GoToPreviousTab; }
              bind "l" "Right" "Down" "j" { GoToNextTab; }
              bind "n" { NewTab; SwitchToMode "Normal"; }
              bind "x" { CloseTab; SwitchToMode "Normal"; }
              bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }
              bind "b" { BreakPane; SwitchToMode "Normal"; }
              bind "]" { BreakPaneRight; SwitchToMode "Normal"; }
              bind "[" { BreakPaneLeft; SwitchToMode "Normal"; }
              bind "1" { GoToTab 1; SwitchToMode "Normal"; }
              bind "2" { GoToTab 2; SwitchToMode "Normal"; }
              bind "3" { GoToTab 3; SwitchToMode "Normal"; }
              bind "4" { GoToTab 4; SwitchToMode "Normal"; }
              bind "5" { GoToTab 5; SwitchToMode "Normal"; }
              bind "6" { GoToTab 6; SwitchToMode "Normal"; }
              bind "7" { GoToTab 7; SwitchToMode "Normal"; }
              bind "8" { GoToTab 8; SwitchToMode "Normal"; }
              bind "9" { GoToTab 9; SwitchToMode "Normal"; }
              bind "Tab" { ToggleTab; }
          }

          scroll {
              bind "Alt s" { SwitchToMode "Normal"; }
              bind "e" { EditScrollback; SwitchToMode "Normal"; }
              bind "s" { SwitchToMode "EnterSearch"; SearchInput 0; }
              bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
              bind "j" "Down" { ScrollDown; }
              bind "k" "Up" { ScrollUp; }
              bind "PageDown" "Right" "l" { PageScrollDown; }
              bind "PageUp" "Left" "h" { PageScrollUp; }
              bind "d" { HalfPageScrollDown; }
              bind "u" { HalfPageScrollUp; }
              // uncomment this and adjust key if using copy_on_select=false
              // bind "Alt c" { Copy; }
          }

          search {
              bind "Alt f" { SwitchToMode "Normal"; }
              bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }
              bind "j" "Down" { ScrollDown; }
              bind "k" "Up" { ScrollUp; }
              bind "PageDown" "Right" "l" { PageScrollDown; }
              bind "PageUp" "Left" "h" { PageScrollUp; }
              bind "d" { HalfPageScrollDown; }
              bind "u" { HalfPageScrollUp; }
              bind "n" { Search "down"; }
              bind "p" { Search "up"; }
              bind "c" { SearchToggleOption "CaseSensitivity"; }
              bind "w" { SearchToggleOption "Wrap"; }
              bind "o" { SearchToggleOption "WholeWord"; }
          }

          tmux {
              bind "Alt b" { SwitchToMode "Normal"; }
          }

          entersearch {
              bind "Ctrl c" "Esc" { SwitchToMode "Scroll"; }
              bind "Enter" { SwitchToMode "Search"; }
          }
          renametab {
              bind "Ctrl c" { SwitchToMode "Normal"; }
              bind "Esc" { UndoRenameTab; SwitchToMode "Tab"; }
          }
          renamepane {
              bind "Ctrl c" { SwitchToMode "Normal"; }
              bind "Esc" { UndoRenamePane; SwitchToMode "Pane"; }
          }
          session {
              bind "Alt n" { SwitchToMode "Normal"; }
              bind "d" { Detach; }
              bind "w" {
                  LaunchOrFocusPlugin "session-manager" {
                      floating true
                      move_to_focused_tab true
                  };
                  SwitchToMode "Normal"
              }
          }
          shared_except "locked" {
              unbind "Ctrl h" // was Move, Alt-m
              unbind "Ctrl o" // was Session, now Alt-s
              unbind "Ctrl s" // was Search, now Alt-f
              unbind "Ctrl n" // was Resize, now Alt-r
              unbind "Ctrl p" // was Pane, now Alt-p
              unbind "Ctrl t" // was Tab, now Alt-t
              unbind "Ctrl g" // was Locked, now Alt-g
              unbind "Ctrl q" // was Quit, now Alt-q
              unbind "Ctrl b" // was Tmux, now Alt-b
              bind "Alt g" { SwitchToMode "Locked"; }
              bind "Alt q" { Quit; }
              bind "Alt t" { NewTab; }
              bind "Alt i" { MoveTab "Left"; }
              bind "Alt a" { MoveTab "Right"; }
              bind "Alt h" "Alt Left" { MoveFocusOrTab "Left"; }
              bind "Alt l" "Alt Right" { MoveFocusOrTab "Right"; }
              bind "Alt j" "Alt Down" { MoveFocus "Down"; }
              bind "Alt k" "Alt Up" { MoveFocus "Up"; }
              bind "Alt =" "Alt +" { Resize "Increase"; }
              bind "Alt -" { Resize "Decrease"; }
              bind "Alt [" { PreviousSwapLayout; }
              bind "Alt ]" { NextSwapLayout; }
          }
          shared_except "normal" "locked" {
              bind "Esc" { SwitchToMode "Normal"; }
          }
          shared_except "pane" "locked" {
              bind "Alt p" { SwitchToMode "Pane"; }
          }
          shared_except "resize" "locked" {
              bind "Alt r" { SwitchToMode "Resize"; }
          }
          shared_except "scroll" "locked" {
              bind "Alt s" { SwitchToMode "Scroll"; }
          }
          shared_except "session" "locked" {
              bind "Alt n" { SwitchToMode "Session"; }
          }
          shared_except "tab" "locked" {
              bind "Alt t" { SwitchToMode "Tab"; }
          }
      }

      plugins {
          tab-bar location="zellij:tab-bar"
          status-bar location="zellij:status-bar"
          strider location="zellij:strider"
          compact-bar location="zellij:compact-bar"
          session-manager location="zellij:session-manager"
          welcome-screen location="zellij:session-manager" {
              welcome_screen true
          }
          filepicker location="zellij:strider" {
              cwd "/"
          }
      }
    '';

  # add the catppuccin theme file under the zellij config folder
  xdg.configFile."zellij/themes/catppuccin.kdl".text =
    ''
      // custom catppuccin config
    ''
    + builtins.readFile ./themes/catppuccin.kdl;
}
