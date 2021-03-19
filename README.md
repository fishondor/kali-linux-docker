# kali-linux-docker

This project is intended for penetration testing learning.
It provides the infrastructure to run local kali-linux system with pre ready packages and tools to run penetration testing.
Other services are provided also to enable running the tests localy:
- Wordpress
- Bwapp

## How to use
* clone this repo
* ```docker-compose up``` will download and run all exploitable services
* ```docker-compose run kali /bin/bash``` will run kali-linux container and start bash session

### Services
- [Kali-linux](https://www.kali.org/docs/containers/using-kali-docker-images/):
    - Run or from docker-compose: ```docker-compose run kali /bin/bash``` or with docker ```docker run -it fishondor/pentests /bin/bash```
    - This container will stop once bash session is exited and will not persist with data. To persist data add volumes as necessary.
    - configured to use host for network, this enables making reqests to other services via localhost of host. No need to address the docker network service name when making http requests.
- [Wordpress](https://codex.wordpress.org/Main_Page):
    - Run by using docker compose: ```docker-compose run wordpress```
    - Creates a new wordpress installation available at port 4500.
    - Once running the container go to ```http://localhost:4500``` and configure wordpress.
    - Persisting data based on named volumes
- [Bwapp](http://www.itsecgames.com/):
    - Run by using docker compose: ```docker-compose run bwapp```
    - Creates a new bwapp installation available at port 4600.
    - Once running the container go to ```http://localhost:4600/install.php```, this will enable db initialization. After that, create user and continue hacking
    - Persisting data based in named volumes

*All services can be started with ```docker-compose up```.*

> This image includes cusotm command for copying lists of passwords, directories etc. that are relevant for some of the packages.<br>
Run `get-list` in running kali container for description and help



## Installed packages
* [tor](https://2019.www.torproject.org/docs/documentation.html.en)
* [proxychains](https://github.com/haad/proxychains)
* [Wafw00f](https://github.com/EnableSecurity/wafw00f)
* [wpscan](https://wpscan.com/wordpress-security-scanner)
* [dirb](http://dirb.sourceforge.net/)
* [sslscan](https://github.com/rbsec/sslscan)
* [sqlmap](http://sqlmap.org/)
* [weevely](https://tools.kali.org/maintaining-access/weevely)

> For a full list of available packages (not installed here) reffer to https://tools.kali.org/tools-listing