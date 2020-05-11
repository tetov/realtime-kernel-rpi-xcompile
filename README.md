# ros-ur-controller-rpi

## Instructions

### Build kernel

1. Set up kernel version, patch and conf in `./get-src.sh`
1. Run `./build_kernel.sh`
1. When `menuconfig` show up, change two things:
    * In _General options/Preemption Model_ choose _Fully Preemptible Kernel_. 
    * Under _Boot options_ make sure _Default kernel command string_ is
    completely empty.
1. Wait. (This takes \~ 1h on a ThinkPad T25)

### Set up RPi

Ansible instructions

## Utilities

### Clean repo

This can actually take a bit. Just `rm -rf` the kernel src directory if you are impatient.

```bash
# first check what will be removed
git clean -Xdn
# then run it
git clean -Xdf
```

### Print time build has run every 10 seconds until its done
```bash
PID={pid} && while true; do ps -o etime= -p $PID || break; sleep 10; done
```

