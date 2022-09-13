# MANUAL TÉCNICO 
--------------------------------------
Para la configuración de Cada Nodo utilizado en la topología mostrada anteriormente, se ha realizado el uso de diferentes instrucciones que se detallan a continuación. Se utilizaron protocolos VTP, VLANS, STP, Ethernet Channel con sus variantes LACP y PAGP.

## VTP
----------------------------------------------------------------------------
Como primera configuración se crea la configuración de las VTP utilizando los nodos 

| **R1** | **S0** | **S1** | **S2** | **S3** | **S4** | **S5** |


- ### VLANS UTILIZADAS

    | **VLAN** | **No** | 
    |-------|-----|
    | Ventas |	11 |
    | Distribucion |	21 |
    | Administracion |	31 |
    | Servidores |	41 |
    | Management&Native |	99 |
    | BlackHole |	999 |


- ### VTP SERVER - R1
    ```console
    enable
    configure terminal

    vlan 11
    name VENTAS
    exit

    vlan 21
    name DISTRIBUICION
    exit

    vlan 31
    name ADMINISTRACION
    exit

    vlan 41
    name SERVIDORES
    exit

    vlan 99
    name MANAGEMENT
    exit

    vlan 999
    name BLACKHOLE
    exit

    vtp domain g19
    vtp password g19
    vtp mode server
    vtp version 2
    exit

    conf t
    int range f0/3-4
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp status
    ```

- ### VTP CLIENT - S0

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode client
    vtp version 2
    exit

    configure terminal
    int f0/1
    switchport mode access
    switchport access vlan 11
    exit

    int f0/2
    switchport mode access
    switchport access vlan 21
    exit

    int f0/3
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/5-7
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/10-11
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/10-11
    channel-group 2 mode on
    exit

    int port-channel 2
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/6-7
    channel-group 5 mode on
    exit

    int port-channel 5
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    ```

- ### VTP CLIENT - S2

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode client
    vtp version 2
    exit

    configure terminal
    int f0/1
    switchport mode access
    switchport access vlan 31
    exit

    int f0/2
    switchport mode access
    switchport access vlan 21
    exit

    int range f0/4-5
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/8-9
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/12-13
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/8-9
    channel-group 1 mode on
    exit

    int port-channel 1
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/12-13
    channel-group 3 mode on
    exit

    int port-channel 3
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp status
    ```

- ### VTP CLIENT - S3

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode client
    vtp version 2
    exit

    configure terminal
    int f0/1
    switchport mode access
    switchport access vlan 41
    exit

    int f0/2
    switchport mode access
    switchport access vlan 11
    exit

    int range f0/5-6
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int f0/10
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp-status

    ```

- ### VTP CLIENT - S4

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode client
    vtp version 2
    exit

    configure terminal
    int f0/1
    switchport mode access
    switchport access vlan 21
    exit

    int f0/2
    switchport mode access
    switchport access vlan 31
    exit

    int f0/6
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int f0/8
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/10-13
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/15-16
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/10-11
    channel-group 2 mode on
    exit

    int port-channel 2
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/15-16
    channel-group 4 mode on
    exit

    int port-channel 4
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/12-13
    channel-group 3 mode on
    exit

    int port-channel 3
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp-status
    ```

- ### VTP CLIENT - S5

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode client
    vtp version 2
    exit

    configure terminal
    int f0/1
    switchport mode access
    switchport access vlan 11
    exit

    int f0/2
    switchport mode access
    switchport access vlan 41
    exit

    int f0/5
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int f0/8
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int f0/11
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp-status

    ```

- ### VTP TRANSPARENT - S1

    ```console
    enable
    configure terminal
    vtp domain g19
    vtp password g19
    vtp mode transparent
    vtp version 2
    exit

    configure terminal
    int range f0/6-11
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int range f0/15-16
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/6-7
    channel-group 5 mode on
    exit

    int port-channel 5
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/15-16
    channel-group 4 mode on
    exit

    int port-channel 4
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    interface range f0/8-9
    channel-group 1 mode on
    exit

    int port-channel 1
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    sh vtp-status

    ```


----------------------------------------------------------------------------

<div id = 'asignacion_ip'>

## ASIGNACION DE IP's

A cada PC-PT se le ha asignado una dirección IP la cual realiza la distinción entre cada una de las redes. Se utilizaron las VLAN's explicadas en el primero punto.

A continuacion se detalla la direccion ip, mascara de subred y gateway de cada una:

- ## Ventas
  - ### PC0
    ```console
    ipconfig 192.168.11.2 255.255.255.192 192.168.11.1
    ```
  - ### PC4
    ```console
    ipconfig 192.168.11.3 255.255.255.192 192.168.11.1
    ```
  - ### PC7
    ```console
    ipconfig 192.168.11.4 255.255.255.192 192.168.11.1
    ```

- ## Distribucion
  - ### PC1
    ```console
    ipconfig 192.168.11.65 255.255.255.192 192.168.11.65
    ```
  - ### PC5
    ```console
    ipconfig 192.168.11.66 255.255.255.192 192.168.11.65
    ```
  - ### PC3
    ```console
    ipconfig 192.168.11.67 255.255.255.192 192.168.11.65
    ```

- ## Administracion
  - ### PC6
    ```console
    ipconfig 192.168.11.130 255.255.255.192 192.168.11.129
    ```
  - ### PC2
    ```console
    ipconfig 192.168.11.131 255.255.255.192 192.168.11.129
    ```

- ## Servidores
  - ### SERVER0
    ```console
    ipconfig 192.168.11.194 255.255.255.192 192.168.11.193
    ```
  - ### SERVER1
    ```console
    ipconfig 192.168.11.195 255.255.255.192 192.168.11.193
    ```
----------------------------------------------------------------------------
<div id = 'subredes'>

## SUBREDES FLSM

| Subred | No Hosts | Ip | Mascara | Primer Host | Ultimo Host | Broadcast |
|-------|-----------|----|-------- | ---------- | ----------- | --------- |
| 1 |	62 |	192.168.11.0 /26 |	255.255.255.192 |	192.168.11.1 |	192.168.11.62 |	192.168.11.63 |
| 2 |	62 |	192.168.11.64 /26 |	255.255.255.192 |	192.168.11.65 |	192.168.11.126 |	192.168.11.127 |
| 3 |	62 |	192.168.11.128 /26 |	255.255.255.192 |	192.168.11.129 |	192.168.11.190 |	192.168.11.191 |
| 4 |	62 |	192.168.11.192 /26 |	255.255.255.192 |	192.168.11.193 |	192.168.11.254 |	192.168.11.255 |

