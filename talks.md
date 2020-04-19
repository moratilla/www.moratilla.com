---
layout: page
title: Talks
description:
  Index of my personal talks
---

{% for talk in site.talks %}

<h2><a href="{{ talk.url | prepend: site.baseurl }}">{{ talk.title }}</a></h2>

<p class="post-excerpt">{{ talk.description | truncate: 160 }}</p>

{% endfor %}  