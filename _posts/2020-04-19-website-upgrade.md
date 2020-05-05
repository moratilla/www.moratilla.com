---
layout: post
title: Website Upgrade
categories: [personal, website]
---

During the past week I have made some work to upgrade and improve this website.

The purpose is to maintain a web site more easily using the tools I frequently
 use at work. 

This version of the website is based on [Jekyllrb](https://jekyllrb.com/) static
 website generator.

Previous version was based on Google Blogger and the first version was done
 using last versions of MamboCMS and first versions of JoomlaCMS.

To summarize the change log:

1. **Website running now on Jekyll 3.8.x**.  Tried to work with Github pages,
 but  desisted as the theme I wanted to use depends on gem versions that were in 
 conflict with the gems supported by Github Pages.
2. **New content**.  I have moved from a blog site to a website with
 documentation pages and blog posts.  I want to include more content in a future 
 and I was not satisfied with Blogger.
3. **English**.  The new website is built in English.  This will be the main 
 language of my content, but some posts will remain in Spanish.
4. **CI**.  The new site is built using a CI/CD toolchain to allow me keep my hands dirty on DevOps practices.  Currently the solution is based on git, CircleCI, AWS S3, and Cloudflare CDN.

### One more thing

It won't stop here.  I have been working to implement more stuff.  Things 
 planned for next releases:

* **Collections sorted by date**.  I had not enough time to work on this one as 
  I wanted to release the new site this weekend.  
* **Categories and Tags**.  Add a way to access content by category or tag.
* **New Collection: Projects**.  I will be adding my personal projects here as a portfolio.
* **CI step for testing link references**.  One of the advantages for using CI is that testing must ensure the final product has been tested from the beginning to detect in the early stages any error, bug or bad syntax that can affect in production.  I have planned to work on testing when I finally solve an issue with the html-proofer gem.



