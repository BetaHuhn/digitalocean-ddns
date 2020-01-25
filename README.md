# digitalocean-ddns
 A script to use [DigitalOcean](https://m.do.co/c/779397b07aaa) as a DDNS service.

## Prerequisites
If your domain is hosted on [DigitalOcean](https://m.do.co/c/779397b07aaa) you can use this script to update the address of an A record as if [DigitalOcean](https://m.do.co/c/779397b07aaa) was a DDNS service.

You have to have an A record setup on your [DigitalOcean](https://m.do.co/c/779397b07aaa) DNS like this:
```
pc.example.com.   3600  IN  A  172.27.171.106
```
Then can use this shell script to periodically update that DNS record with your current external IP address.
So you could set this up on your PC at home and always have access to it via pc.example.com or something. Just like a normal DDNS service.
## Setup
Clone [this](https://github.com/BetaHuhn/digitalocean-ddns) repository
Get your api token [here](https://cloud.digitalocean.com/account/api/tokens) and your dns record via this command:
```
curl -X GET -H 'Content-Type: application/json' -H "Authorization: Bearer YOUR API TOKEN" "https://api.digitalocean.com/v2/domains/YOUR DOMAIN/records"
```
and paste them into the [update_ip.sh](https://github.com/BetaHuhn/digitalocean-ddns/blob/master/update_ip.sh) file aswell as your domain.
```
API_TOKEN="F00B4R" #your api token
DOMAIN="foo.bar" #your domain
ID=123456 #your dns record id
```
Change permissions of the update_ip.sh file:
```
chmod +x update_ip.sh
```
Edit your crontab with:
```
crontab -e
```
and add:
```
*/30 * * * * /path/to/the/file/update_ip.sh
```
## Author

**Maximilian Schiller** - *author* - [BetaHuhn](https://github.com/BetaHuhn)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
