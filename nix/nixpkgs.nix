let source = rec {
        owner = "NixOS";
        repo = "nixpkgs-channels";
        rev = "0a146054bdf6f70f66de4426f84c9358521be31e";
        sha256 = "154ypjfhy9qqa0ww6xi7d8280h85kffqaqf6b6idymizga9ckjcd";
        name = "${repo}-${rev}";
      };
in
import ((import <nixpkgs> {}).fetchFromGitHub source)
