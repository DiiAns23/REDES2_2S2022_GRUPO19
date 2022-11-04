## Security groups
grupo-frontend-redes-proyecto2

Reglas de entrada y salida:
| **Tipo** | **Protocolo** | **Puertos** | **Origen**| 
|-------|-----| ----- | ---- | 
| SSH |	TCP | 22 | 0.0.0.0/0 |
| HTTP |	TCP | 80 | 0.0.0.0/0 |

Utilizados par permitir las configuraciones desde una terminal y también para que pueda accederse desde el navegador.

grupo-backend -> Es usado en los backends

Reglas de entrada y salida:
| **Tipo** | **Protocolo** | **Puertos** | **Origen**| 
|-------|-----| ----- | ---- |
| TCP-Personalizado | TCP | 27017 | 0.0.0.0/0|
| ICMP Ipv4 | ICMP | Todo | 0.0.0.0/0 |
| SSH | TCP | 22 | 0.0.0.0/0 |
| HTTP | TCP | 80 | 0.0.0.0/0 |

Este grupo de seguridad necesita utilizarse para permitir la comunicación hacia la base de datos y también para comuncarse con el balanceador de carga, asi misno es necesario poder configurarlo desde ssh, al estar desde una red privada se le permite el acceso a todos los destinos, la red privada hace que solo pueda accederse desde la misma red únicamente.

redes2-backend -> Aunque se llame así, este se usa solo en la base de datos

Reglas de entrada y salida:
| **Tipo** | **Protocolo** | **Puertos** | **Origen**| 
|-------|-----| ----- | ---- |
| ICMP Ipv4 | ICMP | Todo | 0.0.0.0/0 |
| TCP-Personalizado | TCP | 27017 | 0.0.0.0/0|
| SSH | TCP | 22 | 0.0.0.0/0 |

Ya que nuestra base de datos de mongo opera en el puerto 27017, es el único puerto diferente en todas las configuraciones, es necesario el puerto 22 para las configuraciones mediante ssh y también se dejo el icmp para poder realizar pruebas de conección.

Grupo del Load Balancer
