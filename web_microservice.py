#paso-1
from shade import *

simple_logging(debug=True)
conn = openstack_cloud(cloud='rocket-raccoon')

#paso-2
print "Selected image:"
image_id = '767e8319-bd62-4957-ae41-680f66d129cf'
image = conn.get_image(image_id)
print(image)

#paso-3
print "\nSelected flavor:"
flavor_id = '2'
flavor = conn.get_flavor(flavor_id)
print(flavor)

#paso-4 Ejecuta el init para montar servicios en servidor
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
sec_group_name = 'web'
if conn.search_security_groups(sec_group_name):
    print('Security group already exists. Skipping creation.')
else:
    print('Creating security group.')
    conn.create_security_group(sec_group_name, 'network access for a web application.')
    conn.create_security_group_rule(sec_group_name, 80, 80, 'TCP')

#paso 7 creación de instancia
print "\nServer creation:"
instance_name = 'ROCKET_RACCOON'
testing_instance = conn.create_server(wait=True, auto_ip=True,
    name=instance_name,
    image=image_id,
    flavor=flavor_id,
    userdata=ex_userdata,
    network=external_network,
    security_groups=[sec_group_name])
