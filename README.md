# cacert Cookbook

This cookbook provides LWRP to install certificate authorities and set the needed hash-symlinks.

## Attributes

You can specify the default path were the ssl certificates and symlinks are stored using an attribute

```ruby
node['cacert']['cert_dir'] # defaults to '/etc/ssl/certs'
```

## Recipes

### default

The default recipe will install CA certificates defined in the `certs` attributes of the node.

Eg.

```
"cacert": {
   "certs": [
      {
         "my.ca.cert.org": {
            "cert": "my.ca.cert.org",
            "source": "https://my.ca.cert.org/certs/root.crt",
            "cert_dir": "/etc/ssl/certs"
            "hash": "492ffc07"
         }
      }
   ]
}
```

### cacert.org

This recipe installs the cacert.org root certificate

It automatically sets the correct symlinks on broken systems (like Debian Squeeze), see this gist: https://gist.github.com/chr4/5805334


## Providers

To use the providers, add the following to your metadata.rb

    depends 'cacert'

### cacert

Installs a certificate from a given URL, and calls cacert_hash to create the necessary symlinks.
The following example installs the cacert.org root certificate to /etc/ssl/certs/cacert.org.pem

*NOTE* On Debian Squeeze (and potentially on other systems), openssl generates the wrong hash. As a workaround, you can specify the hash manually, see the "hash" attribute below.

    cacert 'cacert.org.pem' do
      cert     'cacert.org.pem'                        # name attribute
      source   'https://www.cacert.org/certs/root.crt' # required
      cert_dir '/etc/ssl/certs'                        # defaults to node['cacert']['cert_dir']
      action   :create                                 # default :create

      # You can specify the hash for the symlink manually.
      # Ff not given, this will be generated using openssl x509 -hash
      hash     '99d0fa06' # correct hash for cacerts root certificate
    end

### cacert_hash

You can use the cacert_hash provider by its own, too

    cacert_hash 'cacert.org.pem' do
      cert     'cacert.org.pem'                        # name attribute
      cert_dir '/etc/ssl/certs'                        # defaults to node['cacert']['cert_dir']

      # You can specify the hash for the symlink manually.
      # Ff not given, this will be generated using openssl x509 -hash
      hash     '99d0fa06' # correct hash for cacerts root certificate
    end


# Contributing

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

# License and Authors

Authors: Chris Aumann <me@chr4.org>

License: GPLv3
