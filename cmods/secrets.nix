{lib, config, ...}: {
  sops = {
    defaultSopsFile = ../.secrets/secrets.enc.yaml;
    age.keyFile = "/home/zulu/.config/sops/age/keys.txt";
  };
}
