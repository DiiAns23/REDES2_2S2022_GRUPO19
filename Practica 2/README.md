# REDES2_2S2022_GRUPO19

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
## **FLSM**

  |Subred|No. de Hosts|     Ip de Red         |       Mascara       |     Primer Host   |   Ultimo Host   |   Broadcast     |
  |------|------------|-----------------------|---------------------|-------------------|-----------------|-----------------|
  |   1  |   30      |   192.168.29.0/27     |   255.255.255.224   |   192.168.29.1    | 192.168.29.30   | 192.168.29.31   |
  |   2  |    30      |   192.168.29.32/27    |   255.255.255.224   |   192.168.29.33   | 192.168.29.62  | 192.168.29.63  |
  |   3  |    30      |   192.168.29.64/27   |   255.255.255.224   |   192.168.29.65  | 192.168.29.94  | 192.168.29.95  |
  |   4  |    30     |   192.168.29.96/27   |   255.255.255.224   |   192.168.29.97  | 192.168.29.126  | 192.168.29.127  |
  |   5  |    30     |   192.168.29.128/27   |   255.255.255.224   |   192.168.29.129  | 192.168.29.158  | 192.168.29.159  |
  |   6  |    30     |   192.168.29.160/27   |   255.255.255.224   |   192.168.29.161  | 192.168.29.190  | 192.168.29.191  |
  |   7  |    30     |   192.168.29.192/27   |   255.255.255.224   |   192.168.29.193  | 192.168.29.222  | 192.168.29.223 |
  |   8  |    30     |   192.168.29.224/27   |   255.255.255.224   |   192.168.29.225  | 192.168.29.254  | 192.168.29.255  |



## **IP ADDRESS**
### **VR1**
```
enable
conf t
int gig0/0
ip address 192.168.29.34 255.255.255.224
no shutdown
exit

int gig0/2
ip address 192.168.29.161 255.255.255.224
no shutdown
exit

int gig0/1
ip address 192.168.29.226 255.255.255.224
no shutdown
exit

int se0/3/0
ip address 192.168.29.193 255.255.255.224
clock rate 56000
no shutdown
exit
exit

```

### **VR2**
```
enable
conf t
int gig0/1
ip address 192.168.29.1 255.255.255.224
no shutdown
exit

int gig0/0
ip address 192.168.29.33 255.255.255.224
no shutdown
exit
exit
```

### **VR3**
```
enable
conf t
int gig0/1
ip address 192.168.29.65 255.255.255.224
no shutdown
exit

int gig0/0
ip address 192.168.29.225 255.255.255.224
no shutdown
exit
exit
```

### **VR4**
```
enable
conf t
int gig0/1
ip address 192.168.29.129 255.255.255.224
no shutdown
exit

int gig0/0
ip address 192.168.29.162 255.255.255.224
no shutdown
exit
exit
```

### **Vodafone**
```
enable
conf t
int se0/3/0
ip address 192.168.29.194 255.255.255.224
no shutdown
exit
int gig0/0
ip address 192.168.29.97 255.255.255.224
no shutdown
exit
exit
```

### **Telefonica**
```
enable
conf t
int gig0/0
ip address 192.168.29.98 255.255.255.224
no shutdown
exit
exit
```



## **RIP**

### **VR1**
```
enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.29.160
network 192.168.29.32
exit
exit
```

### **VR2**
```
enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.29.0
network 192.168.29.32
exit
exit
```

### **VR4**
```
enable
conf t
router rip
no auto-summary
version 2
default-information originate
network 192.168.29.160
network 192.168.29.128
exit
exit
```

## **OSPF**
### **VR1**
```
enable
conf t
router ospf 200
network 192.168.29.192 0.0.0.31 area 0
network 192.168.29.224  0.0.0.31 area 0
exit
exit
```

### **VR3**
```
enable
conf t
router ospf 100
network 192.168.29.64 0.0.0.31 area 0
network 192.168.29.224  0.0.0.31 area 0
exit
exit
```

### **Vodafone**
```
enable
conf t
router ospf 300
network 192.168.29.192 0.0.0.31 area 0
exit
exit
```

## **REDISTRIBUCION**
### **VR1**
```
conf t
router ospf 200
redistribute rip subnets
exit
router rip
redistribute ospf 200 metric 15
exit
exit
```

## **ACCESS LIST**
### **VR2**
```
conf t
access-list 101 permit ip 192.168.29.0 0.0.0.31 192.168.29.64 0.0.0.31
access-list 101 deny ip 192.168.29.0 0.0.0.31 any 
int gig0/1
ip access-group 101 in
exit
exit
```

### **VR3**
```
conf t
access-list 101 permit ip 192.168.29.64 0.0.0.31 192.168.29.0 0.0.0.31
access-list 101 deny ip 192.168.29.64 0.0.0.31 any 
int gig0/1
ip access-group 101 in
exit
exit
```

## **Telefonica**

## **FLSM**


#### Tabla Telefonica

  |Subred|No. de Hosts|     Ip de Red         |       Mascara       |     Primer Host   |   Ultimo Host   |   Broadcast     |
  |------|------------|-----------------------|---------------------|-------------------|-----------------|-----------------|
  |   1  |    62      |   192.168.89.0/24     |   255.255.255.192   |   192.168.89.1    | 192.168.89.62   | 192.168.89.63   |
  |   2  |    62      |   192.168.89.64/26    |   255.255.255.192   |   192.168.89.65   | 192.168.89.126  | 192.168.89.127  |
  |   3  |    62      |   192.168.89.128/26   |   255.255.255.192   |   192.168.89.129  | 192.168.89.190  | 192.168.89.191  |


## **IP ADDRESS**

### **TR2**
```
enable
conf t
int gig0/0
ip address 6.6.6.1 255.255.255.252
no shutdown
exit

int gig0/1 
ip address 192.168.89.1 255.255.255.192
no shutdown
exit

int gig0/2
ip address 4.4.4.1 255.255.255.252
no shutdown
exit
exit
```

### **TR3**

```
enable
conf t
int gig0/0
ip address 4.4.4.2 255.255.255.252
no shutdown
exit

int gig0/1
ip address 192.168.89.65 255.255.255.192
no shutdown
exit

int gig0/2
ip address 5.5.5.2 55.255.255.252
no shutdown
exit
exit
```


### **TR4**
```
enable
conf t
int gig0/2
ip address 5.5.5.1 255.255.255.252
no shutdown
exit

int gig0/1
ip address 192.168.89.129 255.255.255.192
no shutdown
exit

int gig0/0
ip address 2.2.2.1 255.255.255.252
no shutdown
exit
exit
```


### **TR1**
```
enable
conf t
int gig0/2
no shutdown
ip address 2.2.2.2 255.255.255.252
exit

int gig0/0
ip address 6.6.6.2 255.255.255.252
no shutdown
exit

int s0/3/0
no shutdown
ip address 1.1.1.2 255.255.255.252
exit
exit
```

### **Telefonica** 

```
enable 
conf t
int s0/3/0
ip address 1.1.1.1 255.255.255.252
no shutdown
exit
exit
```

## **RIP**

### **TR2**
```
enable
conf t
router rip 
network 4.4.4.0
no auto-summary
version 2
default-information originate
exit
exit
```

### **TR3**
```
enable
conf t
router rip 
network 4.4.4.0
network 5.5.5.0
network 192.168.89.64
version 2
default-information originate
exit
exit
```

### **TR4**
```
enable
conf t
router rip 
network 5.5.5.0 
no auto-summary
version 2
default-information originate
exit
exit

```

## **EIGRP**

### TR2
```
conf t
router eigrp 100
network 6.6.6.0 0.0.0.3
network 192.168.89.0 0.0.0.63
exit
exit
```

### TR4

```
enable
conf t
router eigrp 100
network 2.2.2.0 0.0.0.3
network 192.168.89.128 0.0.0.63
exit
exit
```

### TR1

```
enable
conf t
router eigrp 100
network 6.6.6.0 0.0.0.3
network 2.2.2.0 0.0.0.3
network 1.1.1.0 0.0.0.3
exit
exit
```

### **Telefonica**

```
enable
conf t
router eigrp 100
network 1.1.1.0 0.0.0.3
exit
exit
```

## **BGP**

###  **Telefonica**
```
enable
conf t
router bgp 200
network 192.168.29.96 mask 255.255.255.224
neighbor 192.168.29.97 remote-as 100
exit
exit
```

### **Vodafone**

```
enable
conf t
router bgp 100
network 192.168.29.96 mask 255.255.255.224
neighbor 192.168.29.98 remote-as 200
exit
exit
```

## **REDISTRIBUCION**

```

** ROUTER TR4

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

** ROUTER TR2

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


** ROUTER TR3

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



** ROUTER "TR4"

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