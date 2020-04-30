# 5. structure of the site

Date: 2020-03-05

## Status

Accepted

## Context

The purpose of my site is to become my personal profile in the web, like a resume.  I want
 to use it to keep myself involved in web development while I decide what to do next.

This means I don't just want a blog site.  I want more kind of contents.  I want to set
a place for documenting projects, ideas and other things (games maybe).

Jekyll has support for pages and posts, that's the kind of structure I want for me.  But I
 want something like categories to aggregate all the pages and posts by a topic.  And I am
 not sure how to do this.  Jekyll has collections, but I haven't good experiences implementing
 collections.

## Decision

I want to have static pages, index pages, and a blog.  At the end I need these collections. 

## Consequences

It has been difficult, but I have understood how to use collections to aggregate the content, and I feel satisfy with the solution.

Collections can be more than only aggregation.  Using templates, you can create a data file and generate lots of pages with a template.  That is a powerful thing.

