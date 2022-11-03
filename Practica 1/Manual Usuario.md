# **MANUAL USUARIO**
--------------------------------------

## **INDICE**

- [PING's](#ping)
- [VTP STATUS](#vtp)

<div id="ping">

## **PING's**

Para la prueba del funcionamiento de la red es posible realizarlo a través del Router 1 (R1), realizándolo desde
su terminal integrada, se deben de colocar los comandos:

 - ### ROUTER 1
    ```console
    enable
    ```
   - ### PC0
        ```console
        ping 192.168.11.2
        ```
    - ### PC1
        ```console
        ping 192.168.11.66
        ```
    - ### PC2
        ```console
        ping 192.168.11.131
        ```
    - ### PC3
        ```console
        ping 192.168.11.68
        ```
    - ### PC4
        ```console
        ping 192.168.11.3
        ```
    - ### PC5
        ```console
        ping 192.168.11.67
        ```
    - ### PC6
        ```console
        ping 192.168.11.130
        ```
    - ### PC7
        ```console
        ping 192.168.11.4
        ```
    - ### SERVER0
        ```console
        ping 192.168.11.194
        ```
    - ### SERVER1
        ```console
        ping 192.168.11.195
        ```

<div id="vtp">

## VTP STATUS
Es posible observar el modo de funcionamiento de cada Switch de la topologia utilizando los siguientes comandos:

- ### CLIENT
    Los Switchs colocados en modo Cliente son los siguientes:
  - #### Switch 0 (S0)
  - #### Switch 2 (S2)
  - #### Switch 3 (S3)
  - #### Switch 4 (S4)
  - #### Switch 5 (S5)
      ```console
      enable
      show vtp status
      ```
- ### TRANSPARENT
    Los Switchs colocados en modo Transparente son los
    siguientes:

  - #### Switch 1 (S1)
    ```console
    enable
    show vtp status
    ```
