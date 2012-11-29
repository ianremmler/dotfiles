PATH=$HOME/bin:$PATH

udisks-glue -s
wicd-gtk -t &
volti &
cfg &
awesome
pkill udevadm # doesn't die when cfg does for some reason
