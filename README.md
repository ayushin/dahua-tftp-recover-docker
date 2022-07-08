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

## What's here?
.
├── README.md
├── VTH15xx
│   ├── firmware --- A bunch of firmware files
│   │   ├── 1.Multi2_VTH1510_EngRusItlFreGerDutSpaPor_P_V2.100.0000.0.R.20160311.bin
│   │   ├── 2.Multi2_VTH1510_EngRusItlFreGerDutCzeSpa_P_16M_V2.100.00.0.R_20160323.data.bin
│   │   ├── General_Multi3_VTH1510_EngBulCzeFinHgrPolSloSvn_P_16M_V3.100.00.0.R_20170413.data.bin
│   │   ├── General_Multi3_VTH1510_EngRusItlFreGerDutSpaPor_P_V3.100.0000.0.R.20170401.bin
│   │   ├── General_VDPConfig_Eng_V1.008.0000004.0.R.20200420.zip
│   │   ├── General_VTH151X_Eng_P_V4.000.0000.0.R.20171024.bin
│   │   ├── General_VTH151X_Eng_P_V4.000.0000.0.R.20180622.bin
│   │   ├── General_VTH151X_Eng_SIP_V4.300.0000000.8.R.20190316
│   │   ├── General_VTH151X_Eng_SIP_V4.300.0000000.8.R.20190316.zip
│   │   └── General_VTH1550CHW-2_Eng_SIP_V4.300.0000000.4.R.20190321.zip
│   └── tftp-unbrick -- A ready tftp root for unbricking with upgrade_info_7db780a713a4.txt
│       ├── commands.txt
│       ├── custom-x.cramfs.img
│       ├── data-x.cramfs.img
│       ├── dm365_ubl_boot_16M.bin.img
│       ├── gui-x.cramfs.img
│       ├── kernel-x.cramfs.img
│       ├── pd-x.cramfs.img
│       ├── romfs-x.cramfs.img
│       ├── upgrade_info_7db780a713a4.txt
│       └── user-x.cramfs.img
├── docker -- netcat & tftp server to run in docker
│   ├── console-monitor
│   │   ├── Dockerfile
│   │   └── entrypoint.sh
│   ├── docker-compose.yaml
│   └── tftp-server
│       ├── Dockerfile
│       └── entrypoint.sh
└── tools --- assorted / unsorted tools
    ├── mac
    │   └── General_SmartPSS-Mac64_ChnEng_IS_V2.003.0000000.0.R.20200320.zip
    ├── upgrade_info.py -- a python script to 
    └── win
        └── General_VDPConfig_Eng_V1.06.1.T.20171204.rar

