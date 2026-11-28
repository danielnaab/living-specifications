{
  description = "Specification format, principles, and methodology for spec-driven development";
  inputs.self.submodules = true;
  inputs.graft.url = "github:danielnaab/tuteur/v0.3.0";
  outputs = inputs: inputs.graft.lib.mkFlake { inherit inputs; };
}
