<?php

$databases['default']['default'] = array (
  'database' => $_ENV['MYSQL_DATABASE'],
  'username' => $_ENV['MYSQL_USER'],
  'password' => $_ENV['MYSQL_PASSWORD'],
  'prefix' => $_ENV['MYSQL_PREFIX'],
  'host' => $_ENV['MYSQL_HOSTNAME'],
  'port' => $_ENV['MYSQL_PORT'],
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);
$settings['config_sync_directory'] = '../config/sync';

$settings['trusted_host_patterns'] = [
  '^localhost$',
  '^192\.168\.00\.52$',
  '^127\.0\.0\.1$',
  ];
