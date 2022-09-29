# REDES2_2S2022_GRUPO19

## Practica No.2

## Integrantes💁

| Nombre:                     | Carné     |
| --------------------------- | --------- |
| ALDO RIGOBERTO HERNANDEZ AVILA  | 201800585 |
| JOSUE DAVID ZEA HERRERA  | 201807159 |


## Topología

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
### **TR4**
```
conf t
router eigrp 100
redistribute rip metric 255 1 1 1 1
exit
router rip 
redistribute eigrp 100 metric 15
exit
exit
```


### **Vodafone**

```
conf t
route bgp 100
redistribute ospf 300
exit
router ospf 300
redistribute bgp 100 metric 1 subnets
exit
exit

conf t
router bgp 100
redistribute connected
network 192.168.29.32 mask 255.255.255.224
network 192.168.29.16 mask 255.255.255.224
network 192.168.29.160 mask 255.255.255.224
network 192.168.29.128 mask 255.255.255.224
network 192.168.29.0 mask 255.255.255.224
exit
exit
```

## **Telefonica**
```
conf t
route bgp 200
redistribute eigrp 100
exit

router eigrp 100
redistribute bgp 200 metric 1 1 1 1 1
exit
exit
```
