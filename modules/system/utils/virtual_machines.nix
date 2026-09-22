{pkgs, ...}:

{ 
  environment.systemPackages = with pkgs; [
    qemu_kvm
    virtio-win
  ];

  programs.virt-manager.enable = true;

  boot.kernelModules = [ "kvm-amd" ];

  users.groups.libvirtd.members = ["ontos"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
