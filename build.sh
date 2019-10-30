 #!/bin/bash

export SUPERMIN_KERNEL=/home/preichl/repos/linux_stable/arch/x86_64/boot/bzImage
export SUPERMIN_MODULES=/home/preichl/repos/linux_stable/modules_tmp/lib/modules/5.3.7preichl+

supermin -v -v -v --build /tmp/supermin.d -f ext2 -o /tmp/appliance.d

qemu-kvm -nodefaults -nographic \
         -kernel /tmp/appliance.d/kernel \
         -initrd /tmp/appliance.d/initrd \
         -hda /tmp/appliance.d/root \
         -serial stdio -append "console=ttyS0 root=/dev/sda"

