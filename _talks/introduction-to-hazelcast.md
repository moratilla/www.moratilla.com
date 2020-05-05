---
layout: page
title: Introducción a Hazelcast
category: talk
date: 2012-02-22
community: Madrid DevOps
description: >
  A light talk about how to use a distributed hash table (DHT) in memory in your projects.
---

## Video and Slides

* [Slides](https://www.xmind.net/m/5VLm/)

This time I used a mindmap in Xmind.net.

## Description

This talk introduces a Distributed Hash Table in memory called [Hazelcast](https://hazelcast.org).
  It is a java database in memory that distributes its data between several
  nodes using a p2p mesh.  My experience with it began in the times I was working with grid
  technologies and I was looking for a database capable to work with several nodes.  The main
  advantage I found in this product was the ways to access data contained in the data grid.

The product can be used as an external NoSQL database, with a great capability to scale horizontally, 
 or used as a part of your application code, so application nodes will have data in their own user
 space, without having to request to external servers.  Any application could then communicate with
 others without depending on a third product.  Think in a easy way to share sessions between java
 app servers.

