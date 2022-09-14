# **MANUAL TÉCNICO**
--------------------------------------

## **INDICE**

 - [VTP](#vtp)
 - [ASIGNACION DE IP's](#ip)
 - [INTERVLAN's](#intervlans)
 - [ETHERNETCHANNEL](#ethernet)
 - [PRUEBAS CONVERGENCIA](#convergencia)
 - [SUBREDES FLSM](#subredes)
 - [EXPLICACIONES](#explicaciones)


Para la configuración de Cada Nodo utilizado en la topología mostrada anteriormente, se ha realizado el uso de diferentes instrucciones que se detallan a continuación. Se utilizaron protocolos VTP, VLANS, STP, Ethernet Channel con sus variantes LACP y PAGP.

<div id = "vtp">

## **VTP**
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

<div id = "ip">

## **ASIGNACION DE IP's**

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

<div id = 'intervlans'>

## **INTERVLAN's**

```console
enable
conf t
ip routing
int vlan 11
description Interfaz de enlace para vlan 11
ip address 192.168.11.1 255.255.255.192
no shutdown
exit

int vlan 21
description Interfaz de enlace para vlan 21
ip address 192.168.11.65 255.255.255.192
no shutdown
exit

int vlan 31
description Interfaz de enlace para vlan 31
ip address 192.168.11.129 255.255.255.192
no shutdown
exit

int vlan 41
description Interfaz de enlace para vlan 41
ip address 192.168.11.193 255.255.255.192
no shutdown
exit
```

<div id='ethernet'>


## **ETHERNETCHANNEL**

- ## PAGP
  - ### S0
    ```console
    interface range f0/6-7
    no channel-protocol
    no channel-group
    exit
    no interface port-channel 5


    interface range f0/10-11
    no channel-protocol
    no channel-group
    exit
    no interface port-channel 2

    interface range f0/6-7
    channel-protocol pagp
    channel-group 5 mode desirable
    exit

    interface range f0/10-11
    channel-protocol pagp
    channel-group 2 mode desirable
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

   - ### S1
      ```console
      interface range f0/8-9
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 1

      interface range f0/15-16
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 4

      interface range f0/6-7
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 5


      interface range f0/8-9
      channel-protocol pagp
      channel-group 1 mode desirable
      exit

      interface range f0/15-16
      channel-protocol pagp
      channel-group 4 mode desirable
      exit

      interface range f0/6-7
      channel-protocol pagp
      channel-group 5 mode desirable
      exit

      int port-channel 1
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 4
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 5
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
      ```

    - ### S2
      ```console
      interface range f0/8-9
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 1

      interface range f0/12-13
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 3

      interface range f0/8-9
      channel-protocol pagp
      channel-group 1 mode desirable
      exit

      interface range f0/12-13
      channel-protocol pagp
      channel-group 3 mode desirable
      exit



      int port-channel 1
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 3
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
      ```

   - ### S4
      ```console
      interface range f0/10-11
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 2

      interface range f0/12-13
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 3

      interface range f0/15-16
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 4


      interface range f0/10-11
      channel-protocol pagp
      channel-group 2 mode desirable
      exit

      interface range f0/12-13
      channel-protocol pagp
      channel-group 3 mode desirable
      exit

      interface range f0/15-16
      channel-protocol pagp
      channel-group 4 mode desirable
      exit



      int port-channel 2
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 3
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 4
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
      ```

- ## LACP
  - ### S0
    ```console
    interface range f0/6-7
    no channel-protocol
    no channel-group
    exit
    no interface port-channel 5

    interface range f0/10-11
    no channel-protocol
    no channel-group
    exit
    no interface port-channel 2


    interface range f0/6-7
    channel-protocol lacp
    channel-group 5 mode active
    exit

    interface range f0/10-11
    channel-protocol lacp
    channel-group 2 mode active
    exit


    int port-channel 2
    switchport mode trunk
    switchport trunk allowed vlan all
    exit

    int port-channel 5
    switchport mode trunk
    switchport trunk allowed vlan all
    exit
    ```
  - ### S1
      ```console
      interface range f0/8-9
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 1

      interface range f0/15-16
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 4

      interface range f0/6-7
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 5


      interface range f0/8-9
      channel-protocol lacp
      channel-group 1 mode active
      exit

      interface range f0/15-16
      channel-protocol lacp
      channel-group 4 mode active
      exit

      interface range f0/6-7
      channel-protocol lacp
      channel-group 5 mode active
      exit

      int port-channel 1
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 4
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 5
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
      ```
  - ### S2
    ```console
      interface range f0/8-9
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 1

      interface range f0/12-13
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 3



      interface range f0/8-9
      channel-protocol lacp
      channel-group 1 mode active
      exit

      interface range f0/12-13
      channel-protocol lacp
      channel-group 3 mode active
      exit



      int port-channel 1
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 3
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
    ``` 

  - ### S4
    ```console
      interface range f0/10-11
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 2

      interface range f0/12-13
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 3

      interface range f0/15-16
      no channel-protocol
      no channel-group
      exit
      no interface port-channel 4


      interface range f0/10-11
      channel-protocol lacp
      channel-group 2 mode active
      exit

      interface range f0/12-13
      channel-protocol lacp
      channel-group 3 mode active
      exit

      interface range f0/15-16
      channel-protocol lacp
      channel-group 4 mode active
      exit



      int port-channel 2
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 3
      switchport mode trunk
      switchport trunk allowed vlan all
      exit

      int port-channel 4
      switchport mode trunk
      switchport trunk allowed vlan all
      exit
    ```

<div id = 'convergencia'>

## **PRUEBAS CONVERGENCIA**

| Escenario | EtherChannel | STP  | Tiempo  | Cantidad TimeOuts |
| --------- | ------------ | ---- | ------- | ----------------- |
| 1         | LACP         | PVST | 59.87 s  | 6                 |
| 2         | LACP         | Rapid PVST | 1 ms  | 0                 |
| 3         | PAGP         | PVST | 59.87 s  | 6                 |
| 4         | PAGP         | Rapid PVST | 14.1 s  | 2                 |


<div id = 'subredes'>

## **SUBREDES FLSM**

| Subred | No Hosts | Ip | Mascara | Primer Host | Ultimo Host | Broadcast |
|-------|-----------|----|-------- | ---------- | ----------- | --------- |
| 1 |	62 |	192.168.11.0 /26 |	255.255.255.192 |	192.168.11.1 |	192.168.11.62 |	192.168.11.63 |
| 2 |	62 |	192.168.11.64 /26 |	255.255.255.192 |	192.168.11.65 |	192.168.11.126 |	192.168.11.127 |
| 3 |	62 |	192.168.11.128 /26 |	255.255.255.192 |	192.168.11.129 |	192.168.11.190 |	192.168.11.191 |
| 4 |	62 |	192.168.11.192 /26 |	255.255.255.192 |	192.168.11.193 |	192.168.11.254 |	192.168.11.255 |


<div id='explicaciones'>

## **EXPLICACIONES**

 - VTP
    ```
    Para la creacion de las VLAN Trunking Protocol (VTP) se utilizo el router R1 donde fueron creadas las distintas VLANS's y caminos a seguir para cada host.
    ```
 - SUBNETING
    ```
    Se utilizo para la creacion de Subredes, la mascara de subred de direccion fisica conocida como FLSM en la cual se detallan la cantidad de hosts a utilizar, direccion ip, mascara de subred, primer host, ultimo host y la direccion de broadcast; permitiendo de esta manera una comunicacion entre los dispositivos pertenecientes a la misma red.
    ``` 
 - CONVERGENCIA
    ```
    Nuestro mejor tipo fue LACP y nuestro protocolo RAPID PVST, al usar ésta configuración no se recibió ningún timeout, por ésto definimos que para ésta topología es muy eficiente dejar estos tipos de protocolos.
    ```

## **SEGURIDAD**
  - ### S0
    ```
    --- TRUNK
      interface f0/3
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/5-7
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/10-11
      switchport mode trunk
      switchport trunk native vlan 99
      exit

    --- ACCESS
      interface f0/4
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/8-9
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/12-24
      switchport mode access
      switchport access vlan 999
      exit

    --- SECURITY
      interface f0/1
      switchport port-security mac-address sticky
      switchport port-security maximum 5

      interface f0/2
      switchport port-security mac-address sticky
      switchport port-security maximum 1
      switchport port-security violation shutdown
    ```
  - ### S1
    ```
    --- TRUNK
      interface range f0/6-11
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/15-16
      switchport mode trunk
      switchport trunk native vlan 99
      exit

    --- ACCESS
      interface range f0/1-5
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/12-14
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/17-24
      switchport mode access
      switchport access vlan 999
      exit
    ```
  - ### S2
    ```
    --- TRUNK
      interface range f0/4-5
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/8-9
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/12-13
      switchport mode trunk
      switchport trunk native vlan 99
      exit

    --- ACCESS
      interface f0/3
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/6-7
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/10-11
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/14-24
      switchport mode access
      switchport access vlan 999
      exit

    --- SECURITY
      interface f0/1
      switchport port-security mac-address sticky
      switchport port-security maximum 1
      switchport port-security violation shutdown

      interface f0/2
      switchport port-security mac-address sticky
      switchport port-security maximum 1
      switchport port-security violation shutdown
    ```
  - ### S3
    ```
    --- TRUNK
      interface range f0/5-6
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface f0/10
      switchport mode trunk
      switchport trunk native vlan 99
      exit
    --- ACCESS
      interface range f0/3-4
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/7-9
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/11-24
      switchport mode access
      switchport access vlan 999
      exit

    -- SECURITY
      interface f0/2
      switchport port-security mac-address sticky
      switchport port-security maximum 5

    ```
  - ### S4
    ```
    --- TRUNK  
      interface f0/6
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface f0/8
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/10-13
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface range f0/15-16
      switchport mode trunk
      switchport trunk native vlan 99
      exit

    --- ACCESS
      interface range f0/3-5
      switchport mode access
      switchport access vlan 999
      exit

      interface f0/7
      switchport mode access
      switchport access vlan 999
      exit

      interface f0/9
      switchport mode access
      switchport access vlan 999
      exit

      interface f0/14
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/17-24
      switchport mode access
      switchport access vlan 999
      exit

    --- SECURITY
      interface f0/1
      switchport port-security mac-address sticky
      switchport port-security maximum 1
      switchport port-security violation shutdown

      interface f0/2
      switchport port-security mac-address sticky
      switchport port-security maximum 1
      switchport port-security violation shutdown
      
    ```
  - ### S4
    ```
    --- ACCESS
      interface f0/5
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface f0/8
      switchport mode trunk
      switchport trunk native vlan 99
      exit

      interface f0/11
      switchport mode trunk
      switchport trunk native vlan 99
      exit
    --- ACCESS
      interface range f0/3-4
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/6-7
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/9-10
      switchport mode access
      switchport access vlan 999
      exit

      interface range f0/12-24
      switchport mode access
      switchport access vlan 999
      exit
    --- SECURITY
      interface f0/1
      switchport port-security mac-address sticky
      switchport port-security maximum 5
    ```