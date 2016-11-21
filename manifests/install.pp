class ezjail::install inherits ezjail {

    package { $package_name:
        ensure => $package_ensure,
    }
}
