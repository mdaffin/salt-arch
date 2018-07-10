# SaltStack desktop scripts

**Not actively maintained, leaving up for reference**

See [this](https://disconnected.systems/blog/archlinux-meta-packages/) for my current approch.

This repo contains the saltstack states that I use to provision my computers. It is able to fully bootstrap and manage an archlinux install with nothing but a arch live disk, an internet connection and minimal interaction.

This repo requires a companion private repo on github that contains pillar and extra state infomation. See [salt-private-example](https://github.com/mdaffin/salt-private-example) for a barebones example.

To bootstrap a new computer boot it with an archlinux live usb/cd in UEFI mode, set up the networking (run `wifi-menu` for wireless, ethernet should be automatic) then run `curl -sL https://git.io/vXzvY | bash` and answer the dialogs. This will reformat and install archlinux/salt on the selected drive, once done simply reboot into the new install.

These scripts are tailered to my personal prefences, it is recomended that you inspect the salt states and custmise them to your tastes before hand. I hope to make these more generic and reuseable over time.

Once installed computers can be kept upto date with changes by running `salt-call state.apply` or you can run `salt-call state.apply test=True` to do a dry run first. If you wish to use these script I recomed forking the repo and changing the [bootstrap script](https://github.com/mdaffin/salt/blob/master/bootstrap#L67-L71) to point to your fork
