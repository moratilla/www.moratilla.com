---
layout: page
title: knife-proxmox
category: project
published: true
description: >
  I was working in optimizing a chef server to provision on my Proxmox cluster when I wondered if there was any module that will ease my job.  As there was none, I wrote one and published as gem.
---

## Resources

* [Repository](https://github.com/jmoratilla/knife-proxmox)


## Description

In 2012 I started to work with chef, a configuration management solution, for 
 a company called Abstra.cc, subsidiary of another company called Taric.es.
  Abstra was in need of a quick way to build and test the code of its products,
 and the first action was to change the virtualization technology, moving from 
 VMware ESXi to Proxmox Virtual Environment, to get advantage of the KVM virtual
 machines and OpenVZ containers, faster than the traditional VMs.

Abstra and Taric had chef installations and I was not very satisfied with them, as
 they were installed as prototypes and were not refactored to keep deployments 
 unified.  So I moved all the legacy code to a new chef server installation and
 upgraded all the recipes to allow the maintaining of the service.  Also, I came
 up with the necessity of a faster way to test my recipes and deployments.
  OpenVZ were containers, faster than Virtual Machines, so I started to work with
 them and found them very useful.

Proxmox has an API very useful if you know how to exploit it. It does not only
 allow you to manage virtual machines (VM) or containers (CT), but also it has
 an interface to query and monitor the complete system.

Well, so inspired by the knife-aws plugin, I studied how to mimic the behavior 
 in the Proxmox VE cluster.

The result was a total success and it allowed me to change the way we deployed
 instances in development, qa, and staging environments.  Other teams began to
 use it and I decided to publish it.

In 2014 I moved to another company, BQ, and left this project abandoned.

It helped me a lot to learn more about API's, ruby and Chef.
