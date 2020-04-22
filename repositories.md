---
layout: page
title: Repositories
description:
  Index of my personal repositories
---

{% for item in site.repositories %}

<h2><a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  