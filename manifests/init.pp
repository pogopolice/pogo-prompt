# == Class: prompt
#
# Full description of class prompt here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { prompt:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
# "export PS1='\\[\\e[1;31m\\][\\u@\\h \\W]\\$\\[\\e[0m\\] '" >> /root/.bashrc
# export PS1='\\[\\e[1;32m\\][\\u@\\h \\W]\\$\\[\\e[0m\\] '" >> /etc/skel/.bashrc

class prompt (
    $f_black    =       $prompt::params::fblack,
    $f_red      =       $prompt::params::fred,
    $f_green    =       $prompt::params::fgreen,
    $f_yellow   =       $prompt::params::fyellow,
    $f_blue     =       $prompt::params::fblue,
    $f_magenta  =       $prompt::params::fmagenta,
    $f_cyan     =       $prompt::params::fcyan,
    $f_white    =       $prompt::params::fwhite,
    $f_reset    =       $prompt::params::freset,
) inherits prompt::params {

  file { "/root/.bashrc":
    ensure  =>  file,
    content => template('prompt/root_bashrc.erb'),
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '0644',
  }

  file { "/etc/skel/.bashrc":
    ensure  =>  file,
    content => template('prompt/skel_bashrc.erb'),
    owner   =>  'root',
    group   =>  'root',
    mode    =>  '0644',
  }
}
