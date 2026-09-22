{ ... }:

{
  networking = {
    hostName = "nixos"; # Define your hostname.

    wireless = {
      enable = false;
      #secretsFile = "/home/ontos/nixos/secrets/network.env";

      #networks = {
        #"SpectrumSetup-4D" = {
          #psk = "@HOME_WIFI_PASSWORD@";
        #};
      #};
    };

    networkmanager = {
      enable = true;
      #unmanaged = ["*" "except:type:wwan" "except:type:gsm"];

      wifi = {
        backend = "iwd";
        powersave = false;
      };
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
