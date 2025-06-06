{ config, ... }:

{
  programs.git-credential-oauth = {
    enable = true;
    extraFlags = [ "-device" ];
  };

  programs.git = {
    enable = true;
  };

  nmt.script = ''
    assertFileExists home-files/.config/git/config
    assertFileContains \
      home-files/.config/git/config \
      "${config.programs.git-credential-oauth.package}/bin/git-credential-oauth -device"
  '';
}
