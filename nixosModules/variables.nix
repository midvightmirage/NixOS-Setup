{ config, pkgs, ... }:

{
  environment.variables =
  {
    RUSTICL_ENABLE = "radeonsi";
    IDEA_PROPERTIES = "-Dswing.aatext=true -Dsun.j";

  };
}
