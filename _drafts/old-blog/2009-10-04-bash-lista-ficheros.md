---
title: Crear una lista de ficheros en una sola línea
layout: post
categories: unix
---

Truco en bash para crear una secuencia de ficheros en bash:

Queremos crear 4 ficheros: quota.user, aquota.user, quota.group, aquota.group en 2 directorios, dir1 y dir2:

    $ touch {dir1,dir2}/{,a}quota.{user,group}

