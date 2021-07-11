# ERR_CERT_AUTHORITY_INVALID

https://tinaciousdesign.com/blog/ssl-chrome-vagrant/

You need MacOS keychain to trust the certificate.

Steps:

## Trust your certificate in macOS Keychain Access

Now that you’ve created this awesome certificate, you’ll need to tell your computer to trust the certificate authority since it’s not trusted by default.

Google Chrome uses macOS’s Keychain Access to manage SSL certificates. After creating the perfect certificate, you’ll need to trust it.

- Open Keychain Access
- Highlight the System section on the left
- Puppet would have generated the certs in /var/www/vhosts/WEBSITE/certs/
- Drag and drop your new certificate onto the System tab. My certificate is dev.londonparkour.com.crt so this is what I dragged and dropped onto Keychain Access > System
- Navigate to your certificate and double click it
- In the dropdown “When using this certificate” choose “Always trust“
- Close the window to save your changes—this will prompt you for your administrator password

# CHOWN

chown -Rf www-data:www-data dev.londonparkour.com


# Vagrant /etc/hosts

Make sure there in an entry in /etc/hosts:

10.11.12.15         dev.londonparkour.com


# Restart

Restart Apache and Chrome.