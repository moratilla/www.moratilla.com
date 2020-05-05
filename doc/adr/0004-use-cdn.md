# 4. Use CDN

Date: 2020-03-04

## Status

Accepted

## Context

The website it's going to be cheap and easy to manage and deploy.  That's for sure.  But
 also I want a good response time and free certificate.  I want to use a CDN. Or should I
 try to distribute it over IPFS?

## Decision

IPFS sounds great, but I don't know anything about how to deploy or manage it.

I want to use Cloudflare's DNS and CDN capabilities for the final product.  But what other
 things I can do with Cloudflare?

## Consequences

Moved DNS to Cloudflare.  Also used the scripts and workers section of Cloudflare to add
 features to the site.

* I found that I can get logs from Cloudflare using Logflare.  ==> GREAT!
* Also I can add consent management without messing my code. ==> GREAT AGAIN!
* There are more addons free to use in Cloudflare, and I haven't started to use workers...




