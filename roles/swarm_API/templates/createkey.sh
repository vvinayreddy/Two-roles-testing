#!/bin/bash

IPS=`hostname -I`
arrIPS=($IPS)
HOST_LOCAL_IP=${arrIPS[0]}

HOSTNAME=${1:-$HOST_LOCAL_IP}
CERTS_FOLDER=${2:-/etc/certs}
echo HOSTNAME $HOSTNAME

mkdir -p ${CERTS_FOLDER}
echo CERTS_FOLDER $CERTS_FOLDER


cat <<EOF > ./openssl.cnf
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth, clientAuth

EOF

export OPENSSL_CONF=./openssl.cnf
echo 01 > ${CERTS_FOLDER}/ca.srl
if [ ! -f ${CERTS_FOLDER}/ca.pem ]; then
echo 'Creating CA (ca-key.pem, ca.pem)'
openssl genrsa -des3 -passout pass:password -out ${CERTS_FOLDER}/ca-key.pem 2048
openssl req -new -passin pass:password \
       -subj '/CN=Non-Prod Test CA/C=US' \
      -x509 -days 365 -key ${CERTS_FOLDER}/ca-key.pem -out ${CERTS_FOLDER}/ca.pem
else
    echo 'CA file exists'

fi


echo "Creating  certificates for $HOSTNAME"
openssl genrsa -des3 -passout pass:password -out ${CERTS_FOLDER}/key.pem 2048
openssl req -passin pass:password -subj "/CN=${HOSTNAME}" -new -key ${CERTS_FOLDER}/key.pem -out  ${CERTS_FOLDER}/client.csr
echo 'extendedKeyUsage = clientAuth,serverAuth' > ${CERTS_FOLDER}/extfile.cnf
openssl x509 -passin pass:password -req -days 365 -in  ${CERTS_FOLDER}/client.csr -CA ${CERTS_FOLDER}/ca.pem -CAkey ${CERTS_FOLDER}/ca-key.pem -out  ${CERTS_FOLDER}/cert.pem -extfile ${CERTS_FOLDER}/extfile.cnf
openssl rsa -passin pass:password -in  ${CERTS_FOLDER}/key.pem -out  ${CERTS_FOLDER}/key.pem

#cp -rp  ca.pem ${CERTS_FOLDER}/ca.pem

# We don't need the CSRs once the cert has been generated
#rm -f $HOSTNAME/*.csr
