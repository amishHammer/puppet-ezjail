class ezjail::basejail inherits ezjail {

  exec { 'create_basejail':
    command => '/usr/local/bin/ezjail-admin install -p',
    creates => $jailbase,
  }
}

