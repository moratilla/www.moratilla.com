---
layout: page
title: ToDo
published: false
description:
  My own way to manage tasks.  Each link is a week, where all my tasks are listed.
---

## Description

On Mondays I open a new TODO list and begin to annotate all the new requesst I
 have to attend.  Also I keep all the tasks that were not finished on previous
 weeks, just to keep an eye on how much work is still not finished.

Each TODO list has a table with the following fields:

| Priority | Task | Urgency | Outcomes | Costs | Status |
| ---------: | ------------ | :-------: | :--------: | :----: | ------: |
|   100 | What to do | High, Low | High, Low | High, Low | -, WIP, Done, Canceled |

## TODOs

{% assign todos_by_date = site.todos | sort: "date" | reverse %}

{% for item in todos_by_date %}


<h2><a href="{{ item.url | prepend: site.baseurl }}">{{ item.title }}</a></h2>

<p class="post-excerpt">{{ item.description | truncate: 160 }}</p>

{% endfor %}  