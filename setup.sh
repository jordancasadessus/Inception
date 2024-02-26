if [ -d "/home/jcasades/data" ]; then \
    echo "/home/jcasades/data already exist"; else \
	mkdir /home/jcasades/data; \
fi
if [ -d "/home/jcasades/data/mariadb" ]; then \
    echo "/home/jcasades/data/mariadb already exist"; else \
	mkdir /home/jcasades/data/mariadb; \
fi
if  [ -d "/home/jcasades/data/wordpress" ]; then \
    echo "/home/jcasades/data/wordpress already exist"; else \
	mkdir /home/jcasades/data/wordpress; \
fi


sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install make curl lsb-release ca-certificates apt-transport-https software-properties-common hostsed -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce -y
sudo apt-get update
sudo apt-get install docker-compose docker-compose-plugin -y
sudo apt-get update