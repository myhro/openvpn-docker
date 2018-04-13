OpenVPN with Docker
===================

A Docker Compose + GNU Make setup to make the [kylemanna/openvpn][k-openvpn] Docker image even easier to use.

## Initial setup

In order to initialize the [public key infrastructure (PKI)][pki] needed by OpenVPN, use:

    make init server=vpn.example.org

Where the `server` value should be the IP or hostname of the VPN server. The same input should be informed when it asks for the server `Common Name`.

The initialization setup will ask you to `Enter PEM pass phrase`, which can be any string from 4 to 1023 characters. This passphrase will be needed by every operation which creates server or client certificates. If it is lost, the PKI has to be recreated.

## Running

To start the server, use:

    make up

## Creating clients

To create a new client, use:

    make genclient name=johndoe

Where `name` value can be any string used to identify a client later. It will ask for the private key passphrase defined before.

To get the OpenVPN ready-to-use configuration file (with embedded client certificate and private key), use:

    make getclient name=johndoe

A `johndoe.ovpn` file will be created on the current directory. It can be used by an OpenVPN client to connect to the server.


[k-openvpn]: https://hub.docker.com/r/kylemanna/openvpn/
[pki]: https://en.wikipedia.org/wiki/Public_key_infrastructure
