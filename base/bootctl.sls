{% set root_device = salt['mount.active']()['/']['device'] %}
{% set root_partuuid = salt['disk.blkid'](root_device)[root_device]['PARTUUID'] %}

bootctl install:
  cmd.run:
    - creates: 
      - /boot/EFI/BOOT/BOOTX64.EFI

/boot/loader/loader.conf:
  file.managed:
    - mode: 755
    - contents: |
        default arch
    - require:
      - bootctl install

/boot/loader/entries/arch.conf:
  file.managed:
    - mode: 755
    - contents: |
         title    Arch Linux
         linux    /vmlinuz-linux
         initrd   /initramfs-linux.img
         options  root=PARTUUID={{ root_partuuid }} rw
    - require:
      - bootctl install
