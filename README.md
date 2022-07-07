# dahua-tftp-recover-docker
Docker compose setup to recover/"unbrick" a Dahua VHC15xx


# Setup

The bricked device will assume the default ip address of 192.168.1.108/24 and a gateway 192.168.1.1 and will look for
tftp-server on 192.168.254.254 udp port 69.

1. Connect your device to a network of 192.168.1.0/24 with a router at 192.168.1.1 
2. Configure your docker host with alias `ifconfig en0 alias 192.168.254.254/32` and make it routable for example by
3. Add a static route for 192.168.254.254/32 on your router 192.168.1.1 to your host
4. Run the `docker compose up`
5. Test your setup with `nc -u 192.168.254.254 5002` and `tftp 192.168.254.254` from another machine on the same net

If you are not getting luck connecting to your tftpd in docker you may try setting up a local tftpd
and copying the content of `tftpbook/VTH15xx-V33` to that root folder.

