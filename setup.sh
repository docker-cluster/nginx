#!/bin/bash

server1_name="www.ego.com"
server2_name="item.ego.com"
server3_name="manager.ego.com"
server4_name="passport.ego.com"
server5_name="search.ego.com"
server6_name="cart.ego.com"
server7_name="order.ego.com"

base_port=38080

local_host="`hostname --fqdn`"
local_ip=`host $local_host 2>/dev/null | awk '{print $NF}'`

echo "***************************start to configure nginx***************************"
for F in server{1..7}_name ;do sed -i "s/{{ $F }}/$(eval echo \$$F)/g" ./conf/nginx.conf ;done
for F in server{1..7}_ip{1,2} ;do sed -i "s/{{ $F }}/$local_ip/g" ./conf/nginx.conf ;done
for F in server{1..7}_port{1,2} ;do sed -i "s/{{ $F }}/$base_port/g" ./conf/nginx.conf ;base_port=$(expr $base_port + 1) ;done
echo "***************************nginx configured***************************"

echo "***************************start to init nginx container***************************"
docker-compose down
docker-compose up -d
echo "***************************nginx container inited***************************"

echo "success"

exit 0