## ROUTER Knology
```enable 
conf t
int gig0/0
ip address 1.1.1.1 255.255.255.252
no shutdown
exit
exit
```

## ROUTER KR1
```
enable
conf t
int gig0/0
ip address 2.2.2.2 255.255.255.252
no shutdown
exit

int gig0/1
no shutdown
ip address 1.1.1.2 255.255.255.252
exit

int s0/3/0
ip address 6.6.6.2 255.255.255.252
no shutdown
exit
exit
```
## ROUTER KR2
```
enable
conf t
int s0/3/0
ip address 6.6.6.1 255.255.255.252
no shutdown
exit

int gig0/0
ip address 4.4.4.2 255.255.255.252
no shutdown
exit

int gig0/1
ip address 5.5.5.2 55.255.255.252
no shutdown
exit

int gig0/2
ip address 192.168.59.1 255.255.255.192
no shutdown
exit
exit
```

## ROUTER KR3
```
enable
conf t
int gig0/0
ip address 4.4.4.1 255.255.255.252
no shutdown
exit

int gig0/2
ip address 192.168.59.65 255.255.255.192
no shutdown
exit
exit

access-list 101 permit ip 192.168.59.65 0.0.0.63 192.168.59.1 0.0.0.63
access-list 101 deny ip any any

access-list 102 permit icmp 192.168.59.1 0.0.0.63 any echo
access-list 102 deny ip any any

int g0/2
ip access-group 101 in
ip access-group 102 out
```

## ROUTER KR4

```
enable
conf t
int gig0/0
ip address 2.2.2.1 255.255.255.252
no shutdown
exit

int gig0/1
ip address 5.5.5.1 255.255.255.252
no shutdown
exit

int gig0/2
ip address 192.168.59.129 255.255.255.192
no shutdown
exit
exit
```

## CONFIGURACION ENRUTAMIENTO 

### ROUTER Knology

```
enable
conf t

router ospf 200
network 1.1.1.0 0.0.0.3 area 0
exit
exit
```

### ROUTER KR1

```
enable
conf t
router ospf 200
network 1.1.1.0 0.0.0.3 area 0
exit
exit
```

### ROUTER KR1

```
enable
conf t

router eigrp 100
network 6.6.6.0 0.0.0.3
network 2.2.2.0 0.0.0.3
exit
exit
```

### ROUTER KR2

```
enable
conf t

router eigrp 100
network 6.6.6.0 0.0.0.3
network 4.4.4.0 0.0.0.3
network 5.5.5.0 0.0.0.3
network 192.168.59.0 0.0.0.63
exit
exit
```

### ROUTER KR3

```
enable
conf t

router eigrp 100
network 4.4.4.0 0.0.0.3
network 192.168.59.64 0.0.0.63
exit
exit
```

### ROUTER KR4

```
enable
conf t

router eigrp 100
network 2.2.2.0 0.0.0.3
network 5.5.5.0 0.0.0.3
network 192.168.59.128 0.0.0.63
exit
exit
```


### ROUTER KR1

```
router ospf 200
redistribute eigrp 100 subnets
exit

router eigrp 100
redistribute ospf 200 metric 10000 10 255 255 1500
exit
```
