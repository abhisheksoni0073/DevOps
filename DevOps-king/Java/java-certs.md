__pkcs12__

    openssl pkcs12 -export -in eprocure.crt -inkey eprocure.key -name eprocure -out eprocure_keystore.p12
    
    keytool -importkeystore -deststorepass XDp1s1MKCR -destkeystore eprocure.jks -srckeystore eprocure_keystore.p12 -srcstoretype PKCS12
    
    keytool -import -alias eprocure -trustcacerts -file DigiCertCA.crt -keystore eprocure.jks -deststoretype pkcs12