{ pkgs, ... }:

{
  imports = [ (import "${builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz"}/nixos") ];

  home-manager.users.madeline =
  {
    home.packages = with pkgs;
    [
    atool
    httpie
    picom
    adwaita-icon-theme
    ];

    programs.bash.enable = true;
    home.stateVersion = "25.11";

      home.file =
      {
              "kwinrc".text =
              ''
                [EffectBlur]
                Enabled=true
              '';

      };





    programs.floorp =
    {
      # Policies configuration - see https://mozilla.github.io/policy-templates/
      # policies = { };

      profiles.default =
      {
          name = "Default";
          path = ./floorp-profile;
          isDefault = true;
        # Custom bookmarks - see https://home-manager-options.extranix.com/?query=bookmarks
        # bookmarks.settings = [
        #   { name = "GitHub"; url = "https://github.com"; }
        #   { name = "NixOS"; url = "https://nixos.org"; }
        # ];
        # bookmarks.force = true;

        # Containers - see https://home-manager-options.extranix.com/?query=containers
        # Configure containers like:
        # work = {
        #   name = "Work";
        #   color = "blue";
        #   icon = "briefcase";
        #   id = 1;
        # };
        # containersForce = true;

        extensions =
        {
          "adnauseam" = "adnauseam@rednoise.org";
          "ublock-origin" = "uBlock0@raymondhill.net";
          "dark-reader" = "{ded95495-d2f7-4c64-9a7f-e1b8902d7f78}";
          "dearrow" = "dearrow@ajay.app";
          "md-reader" = "jid0-0p7p9a9l8w7l9q@jetpack";
          "plasma-integration" = "plasma-integration@kde.org";
          "soundcloud-downloader" = "soundcloud-dl@clarence.net";
          "sponsorblock" = "sponsorBlocker@ajay.app";
          "youtube-shorts-block" = "{a6c4e591-4c1f-4a6d-b9e4-0e4c0e4a9f8b}";
          "noscript" = "{73a6fe31-595d-460b-a920-fcc0f8843232}";
          force = true;
        };

        # Extra config for user.js - https://home-manager-options.extranix.com/?query=extraConfig
        # extraConfig = '''
        #   user_pref("browser.startup.homepage", "about:home");
        # ''';

        # Pre-config for user.js - https://home-manager-options.extranix.com/?query=preConfig
        # preConfig = '''
        #   user_pref("some.setting", true);
        # ''';

        search =
        {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          force = true;
          order = ["DuckDuckGo" "Startpage" "Google" "Bing"];
        };

        # Settings - https://home-manager-options.extranix.com/?query=settings --- Create a local homepage project (HTML/CSS/JS) and set browser.startup.homepage to file:///path/
        # Floorp preferences - https://home-manager-options.extranix.com/?query=settings
        settings =
        {
          "browser.startup.homepage" = "about:home";
          "browser.search.defaultenginename" = "DuckDuckGo";
        };

        # Custom UI CSS - https://home-manager-options.extranix.com/?query=userChrome
        # userChrome = '''
        #   /* Your custom UI styling here */
        # ''';

        # Custom website CSS - https://home-manager-options.extranix.com/?query=userContent
        # userContent = '''
        #   /* Your custom website styling here */
        # ''';
      };
    };
  };
}
