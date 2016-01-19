#! /bin/bash

cd "$(dirname "${BASH_SOURCE}")";

# Install curl
apt-get install -y --force-yes curl

# Download certificate
curl -#o /etc/ssl/certs/cacert.pem http://curl.haxx.se/ca/cacert.pem

# Edit .curlrc to config certificate path
cat >> ~/.curlrc <<EOF
# Uncomment following line to disable curl's certficate verification
#insecure

cacert=/etc/ssl/certs/cacert.pem
cert-type=PEM
EOF

# Test it out
curl -fsSL https://raw.githubusercontent.com/githubutilities/dotfiles/ubuntu/.ubuntu/bootstrap.sh >/dev/null 2>&1 && echo "Curl successfully installed."

# Reference
#* [My Gist on cURL](https://gist.github.com/githubutilities/361ef7e8e2060e9215d8)
#* [cURL SSL Certificate Verification](http://curl.haxx.se/docs/sslcerts.html)

