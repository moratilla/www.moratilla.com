---
layout: page
title: Proxmox for DevOps
category: talk
date: 2013-05-23
community: Madrid DevOps
description: >
  This time I was presenting one of my favorite products: Proxmox VE.
---

## Slides and Video

 {% youtube "https://www.youtube.com/watch?v=LPY1YTiV1k4"%}{:.lead}

* [Slides](https://www.slideshare.net/jmoratilla/promox-27160899)

## Description

I introduce here the audience to a virtualization product called proxmox, that
 I found while I was looking for an alternative to VMware ESXi.  I was in need
 to provide a way to deliver computing power to the Development and QA team.

Proxmox helped me to go from a golden image, badly maintained by developers, to
containers (using openvz), so we could implement a fast CI system that allowed
us to develop and test code faster.

At the end, I introduced a gem I created for Chef and its CLI tool: [knife-proxmox](https://bitbucket.org/jmoratilla/knife-proxmox/src/master/)

This tool allow anybody working with chef and proxmox to manage all the 
 containers and servers from command line.  I used the Rest API provided by
 proxmox and found it very usable.

