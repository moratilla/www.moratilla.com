---
layout: page
title: Repositories
description:
  Index of my personal repositories
---

{% for repo in site.repositories %}

<h2><a href="{{ repo.url | prepend: site.baseurl }}">{{ repo.title }}</a></h2>

<p class="post-excerpt">{{ repo.description | truncate: 160 }}</p>

{% endfor %}  