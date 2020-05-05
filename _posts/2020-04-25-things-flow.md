---
layout: post
title: Website flows smoothly
categories: [personal, website]
---

Another week confined at home because of the COVID-19 disease outbreak, so all that I can do is to play with kids and clean the house, but I had some time to do some personal work.

![stay at home](/assets/img/stay_at_home.png){:.lead}


This week I have accomplished several tasks and I am working on the next ones.
  As I was working fast, I closed the first sprint and opened a new one, to
 include things once the website was alive.  Here I am going to summarize the work done and later I will create posts to describe in deep the things I have been doing.


The first sprint main's goal was to develop a new website as I published before,
 this time hosted by me, instead of simply using a blog service or platform.  I 
 am happy with the result and was difficult to stop adding details after deploy 
 the first version.

Summarized these are the things I have done in this sprint:

* Add Google Tag Manager support
* Add Google Analytics
* Create a Cookie policy page
* Add a consent cookie management
* Get logs and analyze them
* Create about me page
* Use Cloudflare as DNS, CDN and Proxy
* Create collections for books, repositories, and talks 
* Implement a CI/CD toolchain using Github Actions (vs my current CircleCI)
* Create a new asset for the welcome image.

In the second sprint I have finished by now the following:

* Create collection for projects
* Sort talks collection by year
* Add a post_deploy step that invalidates cloudflare's cache

As you can see, there are lots of interesting things that can be described in a 
 full post.  By now I will finish the tasks I compromised and then I will write
 posts for the things I consider more relevant for the future me.

Then, I am not only working in the site, but also I am working in Kubernetes.  
  I have been working with kops on AWS for a while, but now it's time to build my own three cluster with kubeadm running on kvm, and haproxy as external reverse proxy, I need to deep down on several technologies internal to Kubernetes before I feel satisfied with my cluster.

And that's all for this week, at least for summarize it.

See you next week.
