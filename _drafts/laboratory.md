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

### Network Diagram




