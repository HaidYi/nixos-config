{
  pkgs,
  ...
}: 
let
  catppuccin_mocha = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/starship/main/themes/mocha.toml";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
in
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings =
      {
        add_newline = false;
        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };

        os = {
          disabled = false;
        };

        os.symbols = {
          AIX = "➿ ";
          Alpaquita = "🔔 ";
          AlmaLinux = "💠 ";
          Alpine = "🏔️ ";j
          Amazon = "🙂 ";
          Android = "🤖 ";
          Arch = "🎗️ ";
          Artix = "🎗️ ";
          CentOS = "💠 ";
          Debian = "🌀 ";
          DragonFly = "🐉 ";
          Emscripten = "🔗 ";
          EndeavourOS = "🚀 ";
          Fedora = "🎩 ";
          FreeBSD = "😈 ";
          Garuda = "🦅 ";
          Gentoo = "🗜️ ";
          HardenedBSD = "🛡️ ";
          Illumos = "🐦 ";
          Kali = "🐉 ";
          Linux = "🐧 ";
          Mabox = "📦 ";
          Macos = "🍎 ";
          Manjaro = "🥭 ";
          Mariner = "🌊 ";
          MidnightBSD = "🌘 ";
          Mint = "🌿 ";
          NetBSD = "🚩 ";
          NixOS = "❄️  ";
          OpenBSD = "🐡 ";
          OpenCloudOS = "☁️ ";
          openEuler = "🦉 ";
          openSUSE = "🦎 ";
          OracleLinux = "🦴 ";
          Pop = "🍭 ";
          Raspbian = "🍓 ";
          Redhat = "🎩 ";
          RedHatEnterprise = "🎩 ";
          RockyLinux = "💠 ";
          Redox = "🧪 ";
          Solus = "⛵ ";
          SUSE = "🦎 ";
          Ubuntu = "🎯 ";
          Ultramarine = "🔷 ";
          Unknown = "❓ ";
          Void = "  ";
          Windows = "🪟 ";
        };

        palette = "catppuccin_mocha";
      }
      // builtins.fromTOML (builtins.readFile (catppuccin_mocha));
  };
}
