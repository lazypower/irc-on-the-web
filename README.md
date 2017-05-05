# Dockerfiles and Kubernetes OH MY!

### Glowing-Bear

A web front end for weechat. Highly recommended you get a letsencrypt cert and host this behind an TLS terminated endpoint if you plan on accessing it outside of your LAN.

*Building glowing-bear*
```
cd glowing-bear
docker build -t myusername/glowing-bear
```

### Weechat

A super neat curses based irc client that has every function known to humankind.

*Building weechat*
```
cd weechat
docker build -t mysuername/weechat
```

### Kubernetes

I dont always run Docker containers, but when I do, I use Kubernetes.

Note: this is just a quick workload template, and probalby wont 100% apply to you unless you own the dashome.co domain. Which I dont, I DNS hijacked it on my LAN :)  Edit the container names and domains as appropriate.

The weechat service is exposed as a NodePort workload to bypass ingress entirely, and host the web front-end of glowing-bear out of the ingress controller. Make sure you set a password (or better yet, refactor to use a secret!)

```
kubectl apply -f stack.yml
```

That should be it. you're now running a persistent weechat relay, secured by a self signed cert.  Navigate over to your endpoint you defined in `stack.yaml` to accept the self signed cert in your browser. Once thats done, you're ready to hit up the glowing-bear endpoint, configure to connect to the weechat endpoint and VIOLA!  Irc in a webbrowser.

 
