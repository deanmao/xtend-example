xtend-example
=============

Here's how you can make this example run.

Forward port 80 & 443 to 8080/8443 with iptables:

    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
    iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443

Run the server:

    cake run
