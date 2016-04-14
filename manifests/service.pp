class ezjail::service inherits ezjail {

    service { $service_name:
        enable => $service_enable,
        ensure => $service_ensure,
        hasstatus  => false,
        hasrestart => true,
        require => Package[$package_name],
    }

}

