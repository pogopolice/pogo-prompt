# bash prompt color codes
class prompt::params {
  $osr_array = split($::operatingsystemrelease,'[\/\.]')
  $distrelease = $osr_array[0]
  if ! $distrelease {
    fail("Class['logwatch::params']: Unparsable \$::operatingsystemrelease: ${::operatingsystemrelease}")
  }

  if($::fqdn) {
    $servername = $::fqdn
  } else {
    $servername = $::hostname
  }

  if $::osfamily == 'RedHat' or $::operatingsystem == 'amazon' {
	$fblack		=  "\[\033[1;30m\]" # foreground black
	$fred		=  "\[\033[1;31m\]" # foreground red
	$fgreen		=  "\[\033[1;32m\]" # foreground green
	$fyellow	=  "\[\033[1;33m\]" # foreground yellow
	$fblue		=  "\[\033[1;34m\]" # foreground blue
	$fmagenta	=  "\[\033[1;35m\]" # foreground magenta
	$fcyan		=  "\[\033[1;36m\]" # foreground cyan
	$fwhite		=  "\[\033[1;37m\]" # foreground white
	$freset		=  "\[\033[0m\]"  # reset
  } else {
    fail("Class['logwatch::params']: Unsupported osfamily: ${::osfamily}")
  }
}
