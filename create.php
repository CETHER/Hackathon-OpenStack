<?php

	require 'vendor/autoload.php';

	$openstack = new OpenStack\OpenStack([
	    'authUrl' => 'http://172.16.6.2:5000/v2.0',
	    'region'  => 'RegionOne',
	    'user'    => [
		'id'       => 'team.c2',
		'password' => 'kNd38H92'
	    ],
	    'scope'   => ['project' => ['id' => 'c040e89fe37e4d61826fed24d25c4983']]
	]);

	$service = $openstack->objectStoreV1();
	$container = $service->createContainer([
	    'name' => 'pistones'
	]);
?>
