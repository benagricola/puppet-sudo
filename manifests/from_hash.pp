# = Class: sudo::from_hash
#
# This is a small class designed to allow realisation of
# sudo directives from a hash within hiera. Depending on
# hiera merge settings, this can merge directives from multiple
# levels.
class sudo::from_hash inherits sudo::params {
    $directives = hiera_hash("%{calling_module}::directives",$default_directives)
    create_resources('sudo::directive',$directive,$directive_defaults)
}