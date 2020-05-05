---
layout: page
title: PostgreSQL on Docker containers
category: talk
date: 2014-03-26
community: PostgreSQL España, Madrid DevOps
description: >
  My first collaboration between two communities: PostgreSQL España and Madrid DevOps.
  I was invited by Alvaro Hernandez to talk about how to use Docker as a container for
  PostgreSQL development.
---


## Slides and Video

* [Slides](https://www.slideshare.net/jmoratilla/docker-y-postgresql)

## Description

This was my first collaboration with another community, PostgreSQL España.  
  Alvaro Hernandez challenged me to talk in his forum I was happy to accept.
  He asked me to talk about how new DevOps tools could help PostgreSQL to be
 more used in projects.

I was working at a company that was moving from golden images to containers in that
 time, and I was researching Docker as a solution for development, so the talk was
 almost done.  Also we were using PostgreSQL for a couple of systems at work and I
 was using configuration management tools to automate the process.  Docker helped me
 to avoid the usual developer's reticence to use sysadmin tools to install software
 at their machines.  The process helped us to accelerate testing and development as
 we could change the testing from central point (in the Continuous Integration System)
 to local, so integration and unit tests were ran earlier and code was fixed before 
 the CI processes, saving time.

