{ pkgs, ... }:

{

  environment.etc."jetbrains/idea.properties".text =
  ''
    idea.preferences.system.auto.save.enabled=true
    idea.preferences.system.backup.enabled=false
    idea.look.and.feel=com.intellij.ide.ui.laf.darcula.DarculaLaf
  '';

  environment.systemPackages =
  [
    (pkgs.jetbrains.rider.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.rust-rover.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.ruby-mine.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.pycharm.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.webstorm.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.phpstorm.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.mps.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.idea.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.clion.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.goland.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.dataspell.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.datagrip.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })

    (pkgs.jetbrains.gateway.override
    {
      vmopts =
      ''
        -Dsun.java2d.uiScale.enabled=true
        -Dsun.java2d.uiScale=1.35
        -Dswing.aatext=true
        -Xms512m
        -Xmx2048m
      '';
    })
  ];
}