---
layout: page
title: Books
description:
  Books where I have collaborated.
---

The following books have been reviewed by me for [packt publishing](https://packtpub.com/).  If you need a technical reviewer for your project, I will be glad to participate if I am available.

{% for book in site.books %}

<h2><a href="{{ book.url | prepend: site.baseurl }}">{{ book.title }}</a></h2>

<p class="post-excerpt">{{ book.description | truncate: 160 }}</p>

{% endfor %}  