xtend-example
=============

Here's how you can make this example run:

- install mongodb
- install nodejs v0.8.x
- install coffee-script globally (npm install coffee-script -g)

Forward port 80 & 443 to 8080/8443 with iptables:

    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443

Clone this repo and run it:

    git clone http://github.com/deanmao/xtend-example
    cd xtend-example
    npm install
    cake run

