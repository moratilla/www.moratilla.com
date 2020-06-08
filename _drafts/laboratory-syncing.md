---
layout: post
title: Syncing files in my laboratory
categories: [laboratory, network]
---


In my laboratory I have three nodes that can provision virtual machines or containers from local file systems or shared storage systems.

To create a new VM or container I have to upload an ISO image or a tar filesystem to the storage area so the node creating the VM can locate the source image.

As I don't have a dedicated network interface for the storage network, I have to use local storage to lookup for images, and that means I need a way to keep images synchronized between nodes.

## ZFS

I tried to mount it as a datasource, but it didn't work.  Maybe I should try again, because it was the best option.

    ```
    zfs snapshot
    zfs send
    zfs receive
    ```  

## Rsync

    ```
    rsync -avh source destination
    ```

## Syncthing

* [Resource](https://syncthing.net)

