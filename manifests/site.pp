hiera_include('classes')

create_resources('package', hiera_hash('packages'))
