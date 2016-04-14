class ezjail::config inherits ezjail {

  file { "/usr/local/etc/ezjail.conf":
    ensure  => file,
    recurse => true,
    purge   => true,
    force   => true,
    owner   => "root",
    group   => "wheel",
    mode    => "0644",
    content => template('ezjail/ezjail.conf.erb'),
    require => Package[$package_name],
  }
}

