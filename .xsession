PATH=$HOME/devel/go/bin:$HOME/bin:$PATH:/usr/sbin:/sbin

udisks-glue -s
pnmixer &
cfg &
(sleep 3 && wpa_gui -t) &
(sleep 3 && cfgvid) &
exec awesome
