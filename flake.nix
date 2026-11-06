{
  description = "Specification format, principles, and methodology for spec-driven development";

  inputs = {
    # graft (https://github.com/danielnaab/graft): each `flake = false` input is a scion, a pinned
    # export of the knowledge this repo follows, in scions/.
    graft.url = "github:danielnaab/graft/v2.6.0";
    meta-knowledge-base = { url = "github:danielnaab/meta-knowledge-base/v1.0.1"; flake = false; };
  };

  outputs = inputs: inputs.graft.lib.mkFlake { inherit inputs; };
}
