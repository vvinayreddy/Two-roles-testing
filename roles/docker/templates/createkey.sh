#!/bin/bash

IPS=`dig +short myip.opendns.com @resolver1.opendns.com`
arrIPS=($IPS)
HOST_LOCAL_IP=${arrIPS[0]}

HOSTNAME=${1:-$HOST_LOCAL_IP}
CERTS_FOLDER=${2:-/etc/certs}
echo HOSTNAME $HOSTNAME

mkdir -p ${CERTS_FOLDER}
echo CERTS_FOLDER $CERTS_FOLDER

cat <<EOF > /etc/certs/ca.pem
-----BEGIN CERTIFICATE-----
MIICzDCCAbQCCQDvATkf3WU/VDANBgkqhkiG9w0BAQsFADAoMRkwFwYDVQQDDBBO
b24tUHJvZCBUZXN0IENBMQswCQYDVQQGEwJVUzAeFw0xNzA1MTkyMzA1MjVaFw0x
ODA1MTkyMzA1MjVaMCgxGTAXBgNVBAMMEE5vbi1Qcm9kIFRlc3QgQ0ExCzAJBgNV
BAYTAlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr5PnnkrG00z5
sTTX1swb3UExvkQ1uBwCaHR0z0+vOtQxI0BDuCM0JhpIZbUmRTK7tM4eqOOktKBF
b9KO4RE2y5VJLBz922btaXaoG91t3ehIp1SvoA2jaLuRrRYVyuwWbATH2tYAQjad
3WdV6jjYoubiBxgt0+iOsd4RWOCPNp6jvebhSxtJfV3Kw/XqFdjSb3yEh3wAGFZb
iysJmjtrzlj0/h2J7fWe0HErj40vCXIM8/Ex1esgHfo56fpX53ZFaCnbP3DS6sWu
dWMPjUD5g8Ft4DKldOTL4Q1JyW/GCaaCxX+TVGVBEl+5KGosxFiM8Imp+yk/JOC5
CJ2TA/DvRwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCuDdzdJPjLiQugyahSqaml
NXJqvAs/dXWd3LoAG2wA6Xp5XCQK666vTmrgkxkn78fyCpOHJ7tzz31U7zCxxKE4
XRYTc9Mqe/VrP0lswAg3GXtnHhpmMVIPQzaZQNBRlGRkYp+Fxqp2hCLLzaNkfFrQ
5YTbmMM0rjtCVyc4V1GkePQ17fMuBpggdPcsywE/fABrK6zeifJ+WFtH87Bp9mzj
CHxIWpO6s0RFTkEfgBWCFmsAq2SfrTlo9cg+AhXqr5XW547Bj9VD4/zgIv3fVaNs
V4k1rtR28WjhlkR9OpZdtvgwXNkk+r43yKzxXiBbFPUQNFfIN+secJobcIgB8e9r
-----END CERTIFICATE-----
EOF

cat <<EOF > /etc/certs/ca-key.pem
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,F4E207E170B7C65C

4CZP0mOkhdJjoiHptY3ZblC3HMOGpYfDvjF83PGQRvGYlOJmeqYzozkquONWDyh9
+86NS7imlIgQlvRO++gHYs4wHenrBfCZqA+xvSy3o76n+jlAyDTvRsL2WrGn3/fY
eQ8TrqYefVya3WtlQnuRuprX4atw8twzSGo8v1wP7jh45P8zOS1YwB9SjBd8b/WR
eiWMCLlga2e6vzpItV+hPZpgsrQbwDJ/L7z9viZASKCQlRc2jJEuTLj+7VAk/Hgc
ObsEQT1S/9v2/KtXEZynV8niusdOf+kvAR61d6ECBFMj9jxYOPcILpReF3Bc+0Zy
Ecp8x5DnEohMcnjQXJQ9KAOl+CETKK99ZJpBLEajfJjQUt0n4XvptWMfGws1zrkk
LxZtUaUDq34uwiokCPdPjdS6/e/kf+oEK7x+GAarK4uFVXHJzi/PDpm5S2sEBQ6/
kCBg1enWhqJkY3bHNnQ7ub63gmCWrFhXkDDXgr50/lO7KQB+9criaAXJclfYgzhd
EwnGjuPhkmS8+HTp7jFr2N7kX3kesHmXVMKWOBGCSvyvK8c6r/77CLFhXMFVQRHT
f9nd37TYnJ0GeMTQNOf+YE3HubiiDXi8q0KyUvMyefnNb2xIJJEwGsVVipvZeVSR
tFK+XL5XiHNvfyWzBVcgJidjlXFH1w71k57414VRA6Bw8PGDVFFiOWsDTcyZhjYt
EWsvyeVy7TE9SRYwsGuqP+B0DaRczIRoXALhOKYMA4+D6bUkWfPQna/aQFG5pzSu
ENdskYwLQUPDujGktck2ljomrZDRupW+ZKFGAhTh+HlTbd13h80dy8Cwi+vfDSsK
ruYuF+UDCO5/Eyiqi9issbIcbkCj86tVtEYGo1MhOpa3TxuwoL8umPs2PNy637Bs
UyiHXIuRNXNF+PDbt8qA11gBtaOTfvPxsF5hyiWx3m3y2dcKmrlpk2Z9uUn861cR
XlQkkz5G2m2t4qwdXbYu0hAKVZsf1dNgpY7dJRrGofCNotiMJaXKJoL+8FbGCLzP
bs02QQQRE8Nlozep00wNrb0NgMaGaK3boey0CBDqDAOGl5ryYQbpij4bN+hDVqFH
oRkyk0IlL5+eDbQDJUy41LYPOS9dSxm7Jrb9T4wlgXE60eG7omrXumT2710m3ciI
toOdDm6jMeKVW2PG011RAsWwIOvFwIqgEXoY2lN1ofLqKWFq9MF09m/SskFoL6sJ
7Mea5Mp9ObEOdW8vfgSN4144Z6fcQTVg2Hoah12QhXts/UmGQ3vXro7MspOOEc+6
csi2zxsk/qkG88g/eHyxbY6qZpHmrRhZBkoiHzRpgQL5aPKthSP+dZeORPISkL/+
Onb4Snt43sSK4Zzcr20LqiOpkf0uYXVRumkzNz+4Lo8CpEJSkaj76of8KjK9GvJJ
bon7G4Tb2FIBjIok4+as7Cz7KlBgc1hZFaxFtxkPkvwiR6HU8zJQnwTg5zzZkKYZ
6RYF0khAJIfecChwYDFw+f/cPrNunV2agEvRK0pLDvrKPnymaiNXtWHjTi8v9ORZ
Fx87L/28RLSZPSF4xaHWsX3jk7qT+60RKlQCUk4RRneaZ5xfk8LRa+blGhrSM7sR
-----END RSA PRIVATE KEY-----
EOF

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