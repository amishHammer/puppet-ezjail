class ezjail::params {
  $package_ensure = 'latest'
  $package_name = 'ezjail'
  $service_ensure = 'running'
  $service_enable = true
  $service_name = 'ezjail'
  $jaildir = '/usr/jails'
  $jailtemplate = "$jaildir/newjail"
  $jailbase = "$jaildir/basejail"
  $sourcetree = '/usr/src'
  $ftphost = 'ftp.freebsd.org'
  $default_execute = '/usr/bin/login -f root'
  $default_flavour = ''
  $archivedir = "$jaildir/ezjail_archives"
  $uglyperlhack = 'YES'
  $mount_enable = 'YES'
  $devfs_enable = 'YES'
  $devfs_ruleset = 'devfsrules_jail'
  $procfs_enable = 'YES'
  $fdescfs_enable = 'YES'
  $use_zfs = undef
  $use_zfs_for_jails = 'YES'
  $jailzfs = undef
  $zfs_properties = undef
  $zfs_jail_properties = undef
  $default_retention_policy = undef
}
