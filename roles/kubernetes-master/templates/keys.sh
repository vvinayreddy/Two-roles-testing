cat .kube/config | grep certificate-auth > ca-auth

cat .kube/config | grep client-certificate > cert-auth

cat .kube/config | grep client-key > key-auth

sed -i -e 's/    certificate-authority-data: //g' ca-auth


sed -i -e 's/    client-certificate-data: //g' cert-auth 


sed -i -e 's/    client-key-data: //g' key-auth


base64 --decode ca-auth > ca.pem

base64 --decode cert-auth > cert.pem

base64 --decode key-auth > key.pem
