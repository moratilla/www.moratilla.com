---
layout: page
title: Talks
description:
  Index of my personal talks
---

{% assign todos_by_date = site.talks | sort: "date" | reverse %}

{% for item in todos_by_date %}

<h2>{{ item.date | date: "%Y" }}: <a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  