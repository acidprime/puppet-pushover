# You can use the following in hiera taglog::tags for data binding
class pushover(
  $userkey,
  $apikey,
){

  $hash = {
    'userkey' => $userkey,
    'apikey'  => $apikey,
  }

  file { "${settings::confdir}/pushover.yaml" :
    ensure  => 'file',
    content => inline_template('<%= @hash.to_yaml %>'),
  }
}
