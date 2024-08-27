{
  lib,
  fetchCrate,
  rustPlatform,
  ...
}:
{
  rustPlatform.buildRustPackage = rec {
    pname = "nu_plugin_bash_env";
    version = "0.13.0";

    src = fetchCrate {
      inherit pname version;
      hash = lib.fakeHash;
    };

    cargoHash = lib.fakeHash;
    cargoDepsName = pname;
  }
}
