# REDES2_1S2022_GRUPO8

## Practica No.2

## Integrantes💁

| Nombre:                     | Carné     |
| --------------------------- | --------- |
| GERSON GABRIEL REYES MELGAR | 201503906 |
| ALEX YOVANI JERÓNIMO TOMÁS  | 201602912 |
| JORGE DAVID ESPINA MOLINA   | 201403632 |

## Topología

<details><summary>IMAGEN(+)</summary>

![Alt text](topo.png?raw=true "Title")

</details>

## Vodafone

<details><summary>FLSM(+)</summary>
<p>

  |Subred|No. de Hosts|     Ip de Red         |       Mascara       |     Primer Host   |   Ultimo Host   |   Broadcast     |
  |------|------------|-----------------------|---------------------|-------------------|-----------------|-----------------|
  |   1  |   30      |   192.168.58.0/27     |   255.255.255.224   |   192.168.58.1    | 192.168.58.30   | 192.168.58.31   |
  |   2  |    30      |   192.168.58.32/27    |   255.255.255.224   |   192.168.58.33   | 192.168.58.62  | 192.168.58.63  |
  |   3  |    30      |   192.168.58.64/27   |   255.255.255.224   |   192.168.58.65  | 192.168.58.94  | 192.168.58.95  |
  |   4  |    30     |   192.168.58.96/27   |   255.255.255.224   |   192.168.58.97  | 192.168.58.126  | 192.168.58.127  |
  |   5  |    30     |   192.168.58.128/27   |   255.255.255.224   |   192.168.58.129  | 192.168.58.158  | 192.168.58.159  |
  |   6  |    30     |   192.168.58.160/27   |   255.255.255.224   |   192.168.58.161  | 192.168.58.190  | 192.168.58.191  |
  |   7  |    30     |   192.168.58.192/27   |   255.255.255.224   |   192.168.58.193  | 192.168.58.222  | 192.168.58.223 |
  |   8  |    30     |   192.168.58.224/27   |   255.255.255.224   |   192.168.58.225  | 192.168.58.254  | 192.168.58.255  |

</p>
</details>

<details><summary>IP ADDRESS(+)</summary>
<p>

```
** routerSalud

enable
conf t
int gig0/1
ip address 192.168.58.1 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.58.33 255.255.255.224
no shutdown
exit
exit


** routerFPublica

enable
conf t
int gig0/1
ip address 192.168.58.65 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.58.225 255.255.255.224
no shutdown
exit
exit


** routerFPublica

enable
conf t
int gig0/1
ip address 192.168.58.65 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.58.225 255.255.255.224
no shutdown
exit
exit


** routerEstrella

enable
conf t
int gig0/0
ip address 192.168.58.34 255.255.255.224
no shutdown
exit
int gig0/2
ip address 192.168.58.161 255.255.255.224
no shutdown
exit
int gig0/1
ip address 192.168.58.226 255.255.255.224
no shutdown
exit
int se0/3/0
ip address 192.168.58.193 255.255.255.224
clock rate 56000
no shutdown
exit
exit

**routerDEmpresarial
enable
conf t
int gig0/1
ip address 192.168.58.129 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.58.162 255.255.255.224
no shutdown
exit
exit


**routerVodafone
enable
conf t
int se0/3/0
ip address 192.168.58.194 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.58.97 255.255.255.224
no shutdown
exit
exit

**routerTelefonica
enable
conf t
int gig0/0
ip address 192.168.58.98 255.255.255.224
no shutdown
exit
exit

```

</p>
</details>

<details><summary>RIP(+)</summary>
<p>

```

** routerSalud

enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.58.0
network 192.168.58.32
exit
exit


** routerEstrella

enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.58.160
network 192.168.58.32
exit
exit

** routerDEmpresarial

enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.58.160
network 192.168.58.128
exit
exit

```

</p>
</details>

<details><summary>OSPF(+)</summary>
<p>

```

** routerFPublica

enable
conf t
router ospf 100
network 192.168.58.64 0.0.0.31 area 0
network 192.168.58.224  0.0.0.31 area 0
exit
exit

** routerEstrella

enable
conf t
router ospf 200
network 192.168.58.192 0.0.0.31 area 0
network 192.168.58.224  0.0.0.31 area 0
exit
exit

** routerVodafone

enable
conf t
router ospf 300
network 192.168.58.192 0.0.0.31 area 0
exit
exit

```

</p>
</details>

<details><summary>REDISTRIBUCION(+)</summary>
<p>

```

** routerEstrella
conf t
router ospf 200
redistribute rip subnets
exit
router rip
redistribute ospf 200 metric 15

```

</p>
</details>

<details><summary>ACCESS LIST(+)</summary>
<p>

```

** routerSalud
conf t
access-list 101 permit ip 192.168.58.0 0.0.0.31 192.168.58.64 0.0.0.31
access-list 101 permit ip 192.168.58.0 0.0.0.31 192.168.98.0 0.0.0.63
access-list 101 deny ip 192.168.58.0 0.0.0.31 any 
int gig0/1
ip access-group 101 in


** routerDEmpresarial
conf t
access-list 101 permit ip 192.168.58.128 0.0.0.31 192.168.58.64 0.0.0.31
access-list 101 deny ip 192.168.58.128 0.0.0.31 any 
int gig0/1
ip access-group 101 in


--copy running-config startup-config

```

</p>
</details>

## Telefonica

<details><summary>FLSM(+)</summary>
<p>

#### Tabla Telefonica

  |Subred|No. de Hosts|     Ip de Red         |       Mascara       |     Primer Host   |   Ultimo Host   |   Broadcast     |
  |------|------------|-----------------------|---------------------|-------------------|-----------------|-----------------|
  |   1  |    62      |   192.168.98.0/24     |   255.255.255.192   |   192.168.98.1    | 192.168.98.62   | 192.168.98.63   |
  |   2  |    62      |   192.168.98.64/26    |   255.255.255.192   |   192.168.98.65   | 192.168.98.126  | 192.168.98.127  |
  |   3  |    62      |   192.168.98.128/26   |   255.255.255.192   |   192.168.98.129  | 192.168.98.190  | 192.168.18.191  |

</p>
</details>

<details><summary>IP ADDRESS(+)</summary>
<p>

```
** ROUTER tel_router_1

Router>enable
Router#conf t
Router(config)#int gig0/0
Router(config-if)#no shutdown
Router(config-if)#ip address 6.6.6.1 255.255.255.252
Router(config-if)#exit
Router(config)#
Router(config)#int gig0/1 
Router(config-if)#no shutdown
Router(config-if)#ip address 192.168.98.1 255.255.255.192
Router(config-if)#
Router(config-if)#exit
Router(config)#int gig0/2
Router(config-if)#no shutdown
Router(config-if)#ip address 4.4.4.1 255.255.255.252
Router(config-if)#exit
Router(config)#exit
Router#wr


** ROUTER tel_router_2


Router>enable
Router#conf t
Router(config)#int gig0/0
Router(config-if)#ip address 4.4.4.2 255.255.255.252
Router(config-if)#no shutdown
Router(config-if)#
Router(config-if)#exit
Router(config)#int gig0/1
Router(config-if)#ip address 192.168.98.65 255.255.255.192
Router(config-if)#no shutdown
Router(config-if)#
Router(config-if)#exit
Router(config)#int gig0/2
Router(config-if)#ip address 5.5.5.2 55.255.255.252
Router(config-if)#no shutdown
Router(config-if)#end
Router#
Router#wr


** ROUTER tel_router_3


Router>enable
Router#conf t
Router(config)#
Router(config)#int gig0/2
Router(config-if)#ip address 5.5.5.1 255.255.255.252
Router(config-if)#no shutdown
Router(config-if)#
Router(config-if)#exit
Router(config)#
Router(config)#int gig0/1
Router(config-if)#ip address 192.168.98.129 255.255.255.192
Router(config-if)#no shutdown
Router(config-if)#exit
Router(config)#
Router(config)#int gig0/0
Router(config-if)#ip address 2.2.2.1 255.255.255.252
Router(config-if)#no shutdown
Router(config-if)#end
Router#
Router#wr


** ROUTER tel_router_4

Router>enable
Router#conf t
Router(config)#
Router(config)#
Router(config)#int gig0/2
Router(config-if)#no shutdown
Router(config-if)#ip address 2.2.2.2 255.255.255.252
Router(config-if)#exit
Router(config)#
Router(config)#
Router(config)#int gig0/0
Router(config-if)#ip address 6.6.6.2 255.255.255.252
Router(config-if)#no shutdown
Router(config-if)#exit
Router(config)#
Router(config)#int s0/3/0
Router(config-if)#no shutdown
Router(config-if)#ip address 1.1.1.2 255.255.255.252
Router(config-if)#end
Router#wr

** ROUTER telefonica

Router>
Router>enable 
Router#conf t
Router(config)#int s0/3/0
Router(config-if)#ip address 1.1.1.1 255.255.255.252
Router(config-if)#no shutdown
Router(config-if)#end
Router#wr


```

</p>
</details>

<details><summary>RIP(+)</summary>
<p>

```

** ROUTER tel_router_1

Router# conf t
Router(config)#router rip 
Router(config-router)#network 4.4.4.0
Router(config-router)#no auto-summary
Router(config-router)#version 2
Router(config-router)#default-information originate
Router(config-router)#exit
Router(config)#exit
Router#



** ROUTER tel_router_2

Router#conf t
Router(config)#router rip 
Router(config-router)#network 4.4.4.0
Router(config-router)#network 5.5.5.0
Router(config-router)#network 192.168.98.64
Router(config-router)#version 2
Router(config-router)#default-information originate
Router(config-router)#end
Router#wr
Router#


** ROUTER tel_router_3

Router# conf t
Router(config)#router rip 
Router(config-router)#network 5.5.5.0 
Router(config-router)#no auto-summary
Router(config-router)#version 2
Router(config-router)#default-information originate
Router(config-router)#exit
Router(config)#exit
Router#wr
```

</p>
</details>

<details><summary>EIGRP(+)</summary>
<p>

```

** ROUTER tel_router_1

Router#conf t
Router(config)#router eigrp 100
Router(config-router)#network 6.6.6.0 0.0.0.3
Router(config-router)#network 192.168.98.0 0.0.0.63
Router(config-router)#exit
Router(config)#exit
Router#

** ROUTER tel_router_3

Router>enable
Router#conf t
Router(config)#router eigrp 100
Router(config-router)#network 2.2.2.0 0.0.0.3
Router(config-router)#network 192.168.98.128 0.0.0.63
Router(config-router)#exit
Router(config)#exit
Router#

** ROUTER tel_router_4

Router>enable
Router#conf t
Router(config)#router eigrp 100
Router(config-router)#network 6.6.6.0 0.0.0.3
Router(config-router)#network 2.2.2.0 0.0.0.3
Router(config-router)#network 1.1.1.0 0.0.0.3
Router(config-router)#exit
Router(config)#exit
Router#

** ROUTER telefonica

Router#enable
Router#conf t
Router(config)#router eigrp 100
Router(config-router)#network 1.1.1.0 0.0.0.3
Router(config-router)#end
Router#wr

```

</p>
</details>

<details><summary>BGP(+)</summary>
<p>

```
** ROUTER telefonica


Router#conf t
Router(config)#
Router(config)#router bgp 200
Router(config-router)#network 192.168.58.96 mask 255.255.255.224
Router(config-router)#neighbor 192.168.58.97 remote-as 100
Router(config-router)#exit
Router(config)#exit
Router#


** ROUTER vodafone

Router#
Router#conf t
Router(config)#router bgp 100
Router(config-router)#network 192.168.58.96 mask 255.255.255.224
Router(config-router)#neighbor 192.168.58.98 remote-as 200
Router(config-router)#%BGP-5-ADJCHANGE: neighbor 192.168.58.98 Up
Router(config-router)#
Router(config-router)#end
Router#


```
</p>

</details>


<details><summary>REDISTRIBUCION(+)</summary>
<p>

```

** ROUTER tel_router_3

Router#conf t
Router(config)#
Router(config)#router eigrp 100
Router(config-router)#redistribute rip metric 255 1 1 1 1
Router(config-router)#exit

Router(config)#router rip 
Router(config-router)#redistribute eigrp 100 metric 15
Router(config-router)#exit
Router(config)#exit
Router#

** ROUTER "vodafone"

Router#conf t
Router(config)#
Router(config)#route bgp 100
Router(config-router)#redistribute ospf 300
Router(config-router)#exit
Router(config)#
Router(config)#router ospf 300
Router(config-router)#redistribute bgp 100 metric 1 subnets
Router(config-router)#exit
Router(config)#exit
Router#

NECESARIO HACER ESTO, PARA QUE FUNCIONE LA REDISTRIBUCIÓN ENTRE LOS ISP's
CADA RED AGREGADA ES UNA EN LA QUE ESTA CONFIGURADA EL PROTOCOLO RIP 



Router#conf t
Router(config)#router bgp 100
Router(config-router)#
Router(config-router)#
Router(config-router)#redistribute connected
Router(config-router)#network 192.168.58.32 mask 255.255.255.224
Router(config-router)#network 192.168.58.16 mask 255.255.255.224
Router(config-router)#network 192.168.58.160 mask 255.255.255.224
Router(config-router)#network 192.168.58.128 mask 255.255.255.224
Router(config-router)#network 192.168.58.0 mask 255.255.255.224
Router(config-router)#


** ROUTER "telefonica"

Router#conf t
Router(config)#route bgp 200
Router(config-router)#redistribute eigrp 100
Router(config-router)#exit
Router(config)#
Router(config)#router eigrp 100
Router(config-router)#redistribute bgp 200 metric 1 1 1 1 1
Router(config-router)#exit
Router(config)#


Comandos adicionales para comunicacion entre RIP y BGP

Dentro de RIP
- version 2
- default-information originate

Dentro de BGP
- redistribute connected
- Se agrega como red todas las conexiones que esten con protocolo RIP



```

</p>
</details>

<details><summary>ACCESS LIST(+)</summary>
<p>

```

** ROUTER tel_router_1

Router>enable
Router#conf t
Router(config)#access-list 101 permit ip 192.168.98.0 0.0.0.63 192.168.58.64 0.0.0.31
Router(config)#access-list 101 permit ip 192.168.98.0 0.0.0.63 192.168.58.0 0.0.0.31
Router(config)#access-list 101 deny ip 192.168.98.0 0.0.0.63 any 
Router(config)#exit
Router#
Router#sh access-list
Extended IP access list 101
    10 permit ip 192.168.98.0 0.0.0.63 192.168.58.64 0.0.0.31
	20 permit ip 192.168.98.0 0.0.0.63 192.168.58.0 0.0.0.31
    30 deny ip 192.168.98.0 0.0.0.63 any

Router#
Router#
Router#
Router#conf t
Router(config)#int gig0/1
Router(config-if)#ip access-group 101 in 
Router(config-if)#end
Router#
Router#wr
Router#


** ROUTER tel_router_2

Router#
Router#conf t 
Router(config)#access-list 101 permit ip 192.168.98.64 0.0.0.63 192.168.58.64 0.0.0.31
Router(config)#access-list 101 permit ip 192.168.98.64 0.0.0.63 192.168.98.128 0.0.0.63
Router(config)#access-list 101 deny ip 192.168.98.64 0.0.0.63 any
Router(config)#exit
Router#
Router#sh access-list 
Extended IP access list 101
    10 permit ip 192.168.98.64 0.0.0.63 192.168.58.64 0.0.0.31
    20 permit ip 192.168.98.64 0.0.0.63 192.168.98.128 0.0.0.63
    30 deny ip 192.168.98.64 0.0.0.63 any

Router#conf t
Router(config)#int gig0/1
Router(config-if)#ip access-group 101 in 
Router(config-if)#exit
Router(config)#exit
Router#wr
Router#



** ROUTER "tel_router_3"

Router#
Router#conf t 
Router(config)#access-list 101 permit ip 192.168.98.128 0.0.0.63 192.168.58.64 0.0.0.31
Router(config)#access-list 101 permit ip 192.168.98.128 0.0.0.63 192.168.98.64 0.0.0.63
Router(config)#access-list 101 deny ip 192.168.98.128 0.0.0.63 any
Router(config)#exit
Router#
Router#sh access-list 
Extended IP access list 101
    10 permit ip 192.168.98.128 0.0.0.63 192.168.58.64 0.0.0.31
    20 permit ip 192.168.98.128 0.0.0.63 192.168.98.64 0.0.0.63
    30 deny ip 192.168.98.128 0.0.0.63 any

Router#conf t
Router(config)#int gig0/1
Router(config-if)#ip access-group 101 in 
Router(config-if)#exit
Router(config)#exit
Router#wr
Router#



--copy running-config startup-config

```

</p>
</details>

## IPV6

<details><summary>IPV6(+)</summary>

![Alt text](ipv6.jpeg?raw=true "Title")

```

** routerFPublica
enable
conf t
ipv6 unicast-routing
int gig0/1
ipv6 address 2002:c0a8:3a41::/48
ipv6 enable
exit
int gig0/0
ipv6 address 2002:c0a8:3ae1::/48
ipv6 enable

** routerEstrella
enable
conf t
ipv6 unicast-routing
ipv6 router rip enlacerip
int gig0/1
ipv6 address 2002:c0a8:3ae2::/48

ipv6 enable
exit
int gig0/2
ipv6 address 2002:c0a8:3aa1::/48
ipv6 rip enlacerip enable
ipv6 enable

** routerDEmpresarial
enable
conf t
ipv6 unicast-routing
ipv6 router rip enlacerip
int gig0/1
ipv6 address 2002:c0a8:3a81::/48
ipv6 rip enlacerip enable
ipv6 enable
exit
int gig0/0
ipv6 address 2002:c0a8:3aa2::/48
ipv6 rip enlacerip enable
ipv6 enable

```

</details>