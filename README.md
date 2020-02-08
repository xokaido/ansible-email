## Ansible eMail Server Setup

This repository provisions the email servers with 
```MariaDB```, ```Dovecot``` and ```Postfix```.

It should be working both with ```Ubuntu``` and ```CentOS``` systems



Before running the playbook ensure the ```hosts``` file
contains correct server addresses

The usage is like this:

```
./run.sh
```

For usernames, databases and passwords check the ```./group_vars/all``` file.


When running for the first time the mariadb server should pass an empty password.
Modify the file `roles/mariadb/tasks/main.yml` and uncomment line 72: `# login_password: ''`

After the successfull installation you may need to use valid SSL certificates.
For this purpose we will install certbot ( from letsencrypt) and generate valid ones:

```
sudo yum install epel-release
sudo yum install python2-certbot-nginx nginx
```

You will need to add a domain name you are going to use and then:

```
sudo certbot --nginx
```

Update configuration files `/etc/postfix/main.cf` and `/etc/dovecot/dovecot.conf` files
and point newly generated cert files: `/etc/letsencrypt/live/DOMAIN_NAME/fullchain.pem` and 
`/etc/letsencrypt/live/DOMAIN_NAME/privkey.pem`



---

Please report problems to xokaido at gmail  com

Thank you!
