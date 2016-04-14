# Class: ezjail
# ===========================
#
# Full description of class ezjail here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ezjail':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Tom Judge <tom@tomjudge.com>
#
# Copyright
# ---------
#
# Copyright 2016 Tom Judge, unless otherwise noted.
#
class ezjail (
  $package_ensure           = $ezjail::params::package_ensure,
  $package_name             = $ezjail::params::package_name,
  $service_name             = $ezjail::params::service_name,
  $service_ensure           = $ezjail::params::service_ensure,
  $service_enable           = $ezjail::params::service_enable,
  $jaildir                  = $ezjail::params::jaildir,
  $jailtemplate             = $ezjail::params::jailtemplate,
  $jailbase                 = $ezjail::params::jailbase,
  $sourcetree               = $ezjail::params::sourcetree,
  $ftphost                  = $ezjail::params::ftphost,
  $default_execute          = $ezjail::params::default_execute,
  $default_flavour          = $ezjail::params::default_flavour,
  $archivedir               = $ezjail::params::archivedir,
  $uglyperlhack             = $ezjail::params::uglyperlhack,
  $mount_enable             = $ezjail::params::mount_enable,
  $devfs_enable             = $ezjail::params::devfs_enable,
  $devfs_ruleset            = $ezjail::params::devfs_ruleset,
  $procfs_enable            = $ezjail::params::procfs_enable,
  $fdescfs_enable           = $ezjail::params::fdescfs_enable,
  $use_zfs                  = $ezjail::params::use_zfs,
  $uze_zfs_for_jails        = $ezjail::params::use_zfs_for_jails,
  $jailzfs                  = $ezjail::params::jailzfs,
  $zfs_properties           = $ezjail::params::zfs_properties,
  $zfs_jail_properties      = $ezjail::params::zfs_jail_properties,
  $default_retention_policy = $ezjail::params::default_retention_policy,
) inherits ezjail::params {

  include ezjail::install
  include ezjail::config
  include ezjail::basejail

  anchor { 'ezjail::begin': }
  anchor { 'ezjail::end': }


  Anchor['ezjail::begin'] ->
    Class['ezjail::install'] ->
    Class['ezjail::config'] ->
    Class['ezjail::basejail'] ->
  Anchor['ezjail::end']

}
