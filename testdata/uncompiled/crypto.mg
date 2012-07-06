# Type: OpenSSL certificates/key files
# From: Nicolas Collignon <tsointsoin@gmail.com>

0       string  -----BEGIN\ CERTIFICATE-----    PEM certificate
0       string  -----BEGIN\ CERTIFICATE\ REQ    PEM certificate request
0       string  -----BEGIN\ RSA\ PRIVATE        PEM RSA private key
0       string  -----BEGIN\ DSA\ PRIVATE        PEM DSA private key

# Type: OpenSSH key files
# From: Nicolas Collignon <tsointsoin@gmail.com>

0       string  SSH\ PRIVATE\ KEY       OpenSSH RSA1 private key,
>28     string  >\0                     version %s

0       string  ssh-dss\                OpenSSH DSA public key
0       string  ssh-rsa\                OpenSSH RSA public key
