{ pkgs, ... }: {

  virtualisation = {
    # Virtual Machines with qemu & KVM
    libvirtd = {
        enable = true;
        qemu.package = pkgs.qemu_kvm;
    };

    # Docker
    docker.enable = true;
  };

}