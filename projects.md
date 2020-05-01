---
layout: page
title: Projects
description:
  Not only work.  Passion.   In review.
---

In  this area I will describe personal projects I have finished or I have been
working on.

{% for item in site.projects %}

<h2><a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  