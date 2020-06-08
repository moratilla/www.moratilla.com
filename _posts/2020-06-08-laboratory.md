---
layout: post
title: My laboratory
categories: [laboratory, network]
---

This article is about how I have setup my personal Proxmox VE cluster, hosted by [kimsufi](https://kimsufi.com).

## Needs

First of all, I was interested in work again with Proxmox VE as it's a virtualization platform I find very flexible (and low cost, of course).  This time I want to document it everything as a product itself, as a way to improve my planning and architecture skills.

### The MoSCoW method for requisites

- The cluster must have three nodes.
- It must be hosted externally.
- The cluster must share an isolated network for its own traffic (corosync).
- The cluster must have share an isolated network for virtual machines.
- It could have a shared network for storage needs.
- It won't have any production service by now.  It is just an experimental laboratory.
- The nodes must be able to work as one.
- The cluster must be resilience.  In case a node dies, no functionallity will be lost.
- User Management could be externalized to a LDAP provider.

### Physical Diagram

As the three nodes in the cluster are dedicated servers rented to OVH, each
 machine has two interfaces, one of them connected to the internet with a fix
 IP address.  The other one has no link.

![Physical Network Diagram](/assets/img/lab_physical_nodes.png)

### Network Diagram

The first goal is to create a Proxmox cluster with three nodes.  Proxmox uses
 a clustering solution called [Corosync](https://corosync.github.io/corosync/).
  To join, each node must share the same network segment with the others.

In my scenario, each machine has its own IP address and they are not sharing the
 segment, so I decided to create a VPN between them to init the clustering.

Following the instructions in this post about using [tinc as VPN service](/network/security/2020/05/tinc/)
 I set up the network between the nodes, so each node can connect to the other two.

Also I want a separate network for services isolated from the cluster network, so
 I set another VPN for services using tinc as well.

![Network diagram](/assets/img/lab_networking.png)


#### High Availability Router

All physical hosts share the same network rules to control traffic.  So in
 case one host goes down, the VM's will be moved to the rest of the living
 hosts.  But what would happend with the default router? 

To allow all vms to move from one physical host to another and keep sending and
 receiving traffic, I have configured a VRRP service called keepalived that
 helped me to create a Virtual IP used as router so if one host fails, the
 services won't get down.

Configuration:

* master:

```
vrrp_instance VI_10 {
    state MASTER
    interface vmbr1
    virtual_router_id 10
    priority 100
    authentication {
        auth_type PASS
        auth_pass XXXXXX
    }
    virtual_ipaddress {
        10.0.X.XXX/24 brd 10.0.1.255 dev vmbr1
    }
}

```

* backup

```
vrrp_instance VI_10 {
    state BACKUP
    interface vmbr1
    virtual_router_id 10
    priority 50
    authentication {
        auth_type PASS
        auth_pass XXXXXX
    }
    virtual_ipaddress {
        10.0.X.XXX/24 brd 10.0.1.255 dev vmbr1
    }
}
```



#### DNS and DHCP

To assign IP addresses I have chosen dnsmasq, as it is a good friend of mine since
 long time ago.

The configuration of this service (running in a container) is the following:

```
port=53
local=/example.lab/
interface=eth0
bind-interfaces
domain=example.lab
dhcp-range=10.0.X.XYZ,10.0.X.XYZ,48h
dhcp-option=option:router,10.0.X.XYZ
```

So I can have an internal DHCP with DNS for the domain example.lab.

### General Services Diagram

I have disposed some services that should be consumed for all the instances:

- DNS/DHCP
- HAPROXY
- PROMETHEUS
- KUBERNETES

All of them are hosted in the services network, and can be hosted by any of the
 physical hosts at any time.

![Services Diagram](/assets/img/lab_services.png)

### Other Services

Other services I have deployed here:

- VDI instances: to work remotely, I have created several Virtual Machines that
 can be used through the SPICE or NoVNC protocols.

- Zerotier VPN: for some users, I have created a secondary VPN that grant them
 access to specific services using the free VPN [zerotier](https://zerotier.com).
