id: 924585542151
Josue
abc123456789ABC

Instalar docker
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
 
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo service docker start
sudo usermod -aG docker ${USER}
sudo su - ${USER}

Para iniciar mongo
docker run -d -p 27017:27017 --name mongo-redes2 \
    -e MONGO_INITDB_ROOT_USERNAME=admin-redes2 \
    -e MONGO_INITDB_ROOT_PASSWORD=admin-redes2 \
    mongo

docker exec -it mongo-redes2 mongosh -u admin-redes2 -p admin-redes2