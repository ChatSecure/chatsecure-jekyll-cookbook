name             'chatsecure_jekyll'
maintainer       'ChatSecure'
maintainer_email 'chris@chatsecure.org'
license          'MIT'
description      'Installs/Configures chatsecure_jekyll'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "chatsecure_jekyll", "deploys jekyll blog"

depends "chatsecure_ssl"
depends "nginx"