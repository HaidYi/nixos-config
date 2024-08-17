{
  pkgs,
  ...
}: 
let
  catppuccin_mocha = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/starship/main/themes/mocha.toml";
    hash = "sha256-cSaZrSfbk97d2kV3q5dT924MgmUuY8eYIIU0PIygH5w=";
  };
in
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings =
      {
        add_newline = true;
        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };

        hostname = {
          format = "on [$hostname]($style)";
          style = "bold yellow";
        };

        git_branch = {
          format = "[$symbol$branch]($style)";
          symbol = " ";
          style = "bold mauve";
        };

        git_commit = {
          commit_hash_length = 6;
        };

        os = {
          disabled = false;
          format = "$symbol ";
        };

        os.symbols = {
          AIX = "➿ ";
          Alpaquita = "🔔";
          AlmaLinux = "💠";
          Alpine = "🏔️";
          Amazon = "🙂";
          Android = "🤖";
          Arch = "🎗️";
          Artix = "🎗️";
          CentOS = "💠";
          Debian = "🌀";
          DragonFly = "🐉";
          Emscripten = "🔗";
          EndeavourOS = "🚀";
          Fedora = "🎩";
          FreeBSD = "😈";
          Garuda = "🦅";
          Gentoo = "🗜️";
          HardenedBSD = "🛡️";
          Illumos = "🐦";
          Kali = "🐉";
          Linux = "🐧";
          Mabox = "📦";
          Macos = "🍎";
          Manjaro = "🥭";
          Mariner = "🌊";
          MidnightBSD = "🌘";
          Mint = "🌿";
          NetBSD = "🚩";
          NixOS = "❄️";
          OpenBSD = "🐡";
          OpenCloudOS = "☁️";
          openEuler = "🦉";
          openSUSE = "🦎";
          OracleLinux = "🦴";
          Pop = "🍭";
          Raspbian = "🍓";
          Redhat = "🎩";
          RedHatEnterprise = "🎩";
          RockyLinux = "💠";
          Redox = "🧪";
          Solus = "⛵";
          SUSE = "🦎";
          Ubuntu = "🎯";
          Ultramarine = "🔷";
          Unknown = "❓";
          Void = " ";
          Windows = "🪟";
        };

        palette = "catppuccin_mocha";
      }
      // builtins.fromTOML (builtins.readFile (catppuccin_mocha));
  };
}
