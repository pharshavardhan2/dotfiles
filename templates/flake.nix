{
  description = "my flake templates";

  outputs = { ... }: {
    templates = {
      python = {
        path = ./python;
        description = "python dev environment";
      };
    };
  };
}
