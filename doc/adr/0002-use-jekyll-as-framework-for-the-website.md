# 2. Use Jekyll as framework for the website

Date: 2020-03-02

## Status

Accepted

## Context

The current version of the system is hosted by blogspot.  I don't like to keep
 using it as I would like to do something by myself.

But what to do? a Wordpress? Recently I have been working in a Wordpress site
 for the company, and I don't feel comfortable with it, as it has a lot of 
 plugins and the base programming language is PHP and I don't want to use it
 again.

Another option could be a Java based CMS, like MagnoliaCMS, but it seems it cannot
 be downloaded to localhost.  And it can be expensive.

This pointed to another requirement: money.  I don't want to expend money on this.
So at least, the new website should run on very low resources.  Maybe I could use
free hours of Heroku and a free addon to do the job.

Last I recognized I don't want to manage a Database.

So I was thinking in taking my old project jekyll4ops and use it for the job.

## Decision

Any free option is valid for me, and it's also a challenge.  I decided that for the
 kind of content I'm going to keep in the site, (blog post mostly and some static
 pages), I don't want to run a database.  So a static site is better.  Also, I want 
 it to be easily deployable, so I can use it for my coding challenges.

So static page generator are a good solution.  Jekyllrb... or should I try another
 one like Hugo or JBake?

I decided to keep using jekyllrb as I want something I can finish quickly.  Also, I
 have the perfect theme for it and I have experience on it.  

## Consequences

It is easier to begin as I have a previous knowledge about jekyllrb and I have created
 sites before with it (at Kelisto, at Minsait, at home...).

I have no need of databases or other external dependencies, so it's mostly content and
 configuration.  And the result is very easy to deploy: a static site done with HTML.


