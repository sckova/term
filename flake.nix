# flake.nix
{
  description = "home-manager terminal setup";

  inputs = {
    base16.url = "github:SenchoPens/base16.nix";

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/*";

    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };

    pedantix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:swarsel/pedantix/v1.1.0";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      homeModules.default = { ... }: {
        imports = with inputs; [
          ./modules
          base16.homeManagerModule
        ];

        _module.args.termInputs = inputs;
      };
    };
}
