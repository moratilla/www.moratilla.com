---
layout: page
title: Talks
description:
  Index of my personal talks
---

{% for item in site.talks %}

<h2><a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  