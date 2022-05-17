{
  description = ''A TUI -> GUI library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."nimwave-master".dir   = "master";
  inputs."nimwave-master".owner = "nim-nix-pkgs";
  inputs."nimwave-master".ref   = "master";
  inputs."nimwave-master".repo  = "nimwave";
  inputs."nimwave-master".type  = "github";
  inputs."nimwave-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimwave-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimwave-0_1_0".dir   = "0_1_0";
  inputs."nimwave-0_1_0".owner = "nim-nix-pkgs";
  inputs."nimwave-0_1_0".ref   = "master";
  inputs."nimwave-0_1_0".repo  = "nimwave";
  inputs."nimwave-0_1_0".type  = "github";
  inputs."nimwave-0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimwave-0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}