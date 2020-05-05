---
layout: page
title: Books
description:
  Books where I have collaborated.
---

The following books have been reviewed by me for [Packt Publishing](https://packtpub.com/).  If you need a technical reviewer for your project, I will be glad to participate if I am available.

{% for item in site.books %}

<h2><a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  