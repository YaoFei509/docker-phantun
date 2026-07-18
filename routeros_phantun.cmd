# RouterOS script to use phantun 
#
# Yao Fei
#
# Interface
/interface veth add address=192.168.91.20/24 comment=Phantun gateway=192.168.91.1 name=veth-ph
/interface bridge port add bridge=dockers interface=veth-ph

#Route
/ip route add comment=phantun dst-address=192.168.200.2/32 gateway=192.168.91.20

#Container 
/container envs add key=REMOTE_HOST list=phantun_envs value=YOUR_REMOTE_HOST
/container envs add key=REMOTE_PORT list=phantun_envs value=443

# for multi interfaces
#/container envs add key=TUN_LOCAL list=phantun_envs_2 value=192.168.202.1
#/container envs add key=TUN_PEER list=phantun_envs_2 value=192.168.202.2

# phantun 
/container add comment=Phantun envlists=phantun_envs file=yf-phantun-aarch64.tar interface=veth-ph logging=yes name=phantun restart-interval=23h root-dir=/usb1-part1/phantun start-on-boot=yes

#Wireguard
/interface wireguard peers add endpoint-address=192.168.91.20 endpoint-port=51820
