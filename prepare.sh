 #!/bin/bash

export SUPERMIN_KERNEL=/home/preichl/repos/linux_stable/arch/x86_64/boot/bzImage
export SUPERMIN_MODULES=/home/preichl/repos/linux_stable/modules_tmp/lib/modules/5.3.7preichl+

supermin -v -v -v --prepare bash util-linux -o /tmp/supermin.d

cat > init <<EOF
#!/bin/sh
mount -t proc /proc /proc
mount -t sysfs /sys /sys
echo Welcome to supermin
bash -i
EOF

# Files to copy from host to guest
# Files are copied to same destination as is their location host 
cat > /tmp/supermin.d/hostfiles <<EOF
/home/preichl/repos/linux_stable/preichl
/home/preichl/repos/linux_stable/hi

EOF

chmod +x init
tar zcf /tmp/supermin.d/init.tar.gz ./init

