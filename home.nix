{ config, pkgs, ... }:

{  
  home.username = "nix-on-droid";

  home.homeDirectory = "/data/data/com.termux.nix/files/home";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    jujutsu
    gh
    git
    helix
    starship
    nano
  ];
	
    programs.starship = {
      enable = true;
      programs.bash.bashrcExtra = ''
    eval "$(starship init bash)"
  '';
      settings = {
        # Core Formatting
        add_newline = false;
        format = "$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs $cmd_duration$character";

        # Baduk Git Theme
        git_branch = {
          format = ''[●○ @ \($branch\)]($style)'';
          style = "bold";
          symbol = "";
        };
        git_status = {
          conflicted = "✖";  # Atari!
          ahead = "▲";       # Winning
          behind = "▼";      # Losing
          diverged = "⏣";    # Seki (stalemate)
          staged = "○";      # White stone (staged)
          modified = "●";    # Black stone (unstaged)
          untracked = "◻";   # Empty intersection
          stashed = "≡";     # Ko fight
          style = "dimmed";
        };
        directory = {
          format = ''[\($path\)]($style)'';
          style = "blue dimmed";
          truncation_length = 3;
          substitutions = {
            "Documents" = "D";
            "Projects" = "P";
            "Downloads" = "DL";
          };
        };

        # User/System Info
        username = {
          disabled = false;
          style_user = "bright-white bold";
          style_root = "bright-red bold";
          format = "[$user]($style)";
          show_always = true;
        };
        hostname = {
          disabled = false;
          format = "[@$hostname]($style)";
          style = "bright-green bold";
        };

        # Shell/System
        shell = {
          disabled = false;
          format = "$indicator";
          fish_indicator = ''[●⋉](bold)'';
          bash_indicator = ''[🌀](bold #9a77cf)'';
        };
        cmd_duration = {
          format = ''[$duration]($style)'';
          style = "yellow";
          min_time = 5000;
        };

        # Optional: Nix Shell Indicator
        nix_shell = {
          disabled = false;
          format = "[via  $name]($style)";
          style = "bold purple";
        };



      };
			    };



  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
