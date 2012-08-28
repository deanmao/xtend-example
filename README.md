xtend-example
=============

Here's how you can make this example run:

- install mongodb
- install nodejs v0.8.x
- install coffee-script globally (npm install coffee-script -g)

Forward port 80 & 443 to 8080/8443 with iptables:

    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443

Clone this repo and make some brief modifications:

    git clone http://github.com/deanmao/xtend-example
    cd xtend-example
    vim app.coffee

Inside app.coffee, you'll have to tweak it so that it uses your root domain.

Change this line:

    host = 'xtendthis.com'

Into this line:

    host = 'your-domain-that-you-bought.com'

Then run it:

    npm install
    cake run

Disclaimer: I'm using iptables here, but if you were to implement this on
a production server, you may choose to use something more scalable like
haproxy or nginx.  I'm only using iptables as example for demonstration
purposes.
