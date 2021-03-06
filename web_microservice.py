#paso-1
from shade import *

simple_logging(debug=True)
conn = openstack_cloud(cloud='rocket-raccoon')

#lista de imagenes y flavors
images = conn.list_images()
for image in images:
    print(image)

flavors =  conn.list_flavors()
for flavor in flavors:
    print(flavor)


#paso-2
print "Selected image:"
image_id = '0e524d47-6b9f-403d-8eeb-d96bb344651d'
image = conn.get_image(image_id)
print(image)

#paso-3
print "\nSelected flavor:"
flavor_id = '2'
flavor = conn.get_flavor(flavor_id)
print(flavor)

#28 paso-4 Ejecuta el init para montar servicios en servidor
ex_userdata = '''#!/usr/bin/env bash
curl -L -s https://raw.githubusercontent.com/CETHER/Hackathon-OpenStack/master/init.sh | bash -s --
'''

#paso-5
external_network = '1f2a91f7-e3c1-48c9-b1fb-320dface898a'


#lista instancias
instances = conn.list_servers()
for instance in instances:
    print(instance)

#paso-6 puertos de servicios
print('Checking for existing security groups...')
sec_group_name = 'default'
if conn.search_security_groups(sec_group_name):
    print('Security group already exists. Skipping creation.')
else:
    print('Creating security group.')
    conn.create_security_group(sec_group_name, 'network access for a web application.')
    conn.create_security_group_rule(sec_group_name, 80, 80, 'TCP')

#paso 7 creacion de instancia
print "\nServer creation:"
instance_name = 'ROCKET-RACCOON'
testing_instance = conn.create_server(wait=True, auto_ip=True,
    name=instance_name,
    image=image_id,
    flavor=flavor_id,
    key_name='raccoon',
    userdata=ex_userdata,
    network=external_network,
    security_groups=[sec_group_name])