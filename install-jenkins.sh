sudo yum update –y
sudo yum install java-1.8.0-openjdk.x86_64 -y
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key 
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig jenkins on
sudo yum install git -y
#sudo yum install docker -y
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker jenkins
chmod 777 /var/run/docker.sock
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
#sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
/usr/local/bin/docker-compose --version
sleep 5
sudo cat /var/lib/jenkins/secrets/initialAdminPassword 
