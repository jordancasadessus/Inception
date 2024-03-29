if [ -d "/home/$USER/data" ]; then \
    echo "/home/$USER/data already exist"; else \
	mkdir /home/$USER/data; \
fi
if [ -d "/home/$USER/data/mariadb" ]; then \
    echo "/home/$USER/data/mariadb already exist"; else \
	mkdir /home/$USER/data/mariadb; \
fi
if  [ -d "/home/$USER/data/wordpress" ]; then \
    echo "/home/$USER/data/wordpress already exist"; else \
	mkdir /home/$USER/data/wordpress; \
fi

sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo apt-get update
sudo apt-get install make curl lsb-release ca-certificates apt-transport-https software-properties-common hostsed -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce -y
sudo apt-get install docker-compose docker-compose-plugin -y
sudo apt-get upgrade -y