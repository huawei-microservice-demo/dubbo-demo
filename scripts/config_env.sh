net_name=$(ip -o -4 route show to default | awk '{print $5}')
SERVER_HOST=$(ifconfig $net_name | grep -E 'inet\W' | grep -o -E [0-9]+.[0-9]+.[0-9]+.[0-9]+ | head -n 1)

sed -i s/"serveraddress"/"$SERVER_HOST"/ docker-compose.yml

sed -i s/"serveraddress"/"$SERVER_HOST"/ cse-demo/microservice.yaml
