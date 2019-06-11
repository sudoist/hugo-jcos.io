+++
categories = ["Anything Goes","Blog","Project"]
cover = "migrating_to_hugo_yxw5x1.png"
date = "2019-06-12T07:08:09+10:11"
layout = "post"
summary = "I've been busy lately with migrating my site from WordPress to Hugo. Here are some points on why I made the switch."
tags = [
  "Blogging",
  "WordPress",
  "Hugo"
]
title = "Switching from WordPress to Hugo"
+++

### Hey how's it going?

I've been busy lately with migrating my site from WordPress to Hugo.
Playing around with Digital Ocean droplets, Setting up Laradock,
Laravel projects with CI tools like Travis and Bitbucket Pipelines.

### How did I come to the decision to leave WordPress

Well I've been doing a lot of WordPress for a long time.

Not entirely though since for now I am having second thoughts to recommend Hugo to clients even with Forestry.

There will still be lots of use for WordPress.

The problem is after you create a child theme, you are not sure if the parent will still be
updated unless they are really big.

I've haven't touch my site that much after moving it to Digital Ocean and testing out the [Roots](https://roots.io/) stack.

The theme I was using was Beans framework with [Bedrock](https://roots.io/bedrock/) and [Trellis](https://roots.io/trellis/).

This was working for a while until editing something or updating plugins or WordPress itself became a hassle.

Everything has to go into composer then you do Trellis commands to push it to your server.
Something like `trellis deploy production xxx`

Not to mention that the local environment for Trellis is [Vagrant](https://www.vagrantup.com/) when almost everything nowadays is moving towards Docker.

This took me a couple of weeks to get working.
My setup was I am on a Lubuntu 18.04 laptop then Digital Ocean for server.

Alright I'm getting out of topic.

#### So I was trying to make a new Droplet with Laradock.

The plan was to have some WordPress sites also on Laradock along with new Laravel Projects.

Getting WordPress to work was successful but when I tried my site(This one) it does not work when changing to my theme.

Following standard debugging of WordPress to use default theme and turning off plugins the culprit was the theme itself.

This happens after I import my files. I am using the WordPress importer.

Ok so at this point I am tired of things not working. I may now know what I am doing.

I've exhausted multiple solutions from Stack Overflow.

There is this option to look for a new base theme since Beans is not actively being updated anymore.
A bit sad since this was promising some years ago.

I'm checking out [Sage](https://roots.io/sage/) it uses blade templating same with Laravel.

The thing is when I go this route the things are still the same.

#### Then while surfing the vast oceans of the internet(mostly Google) I came upon static site generators and Hugo

When reading the documentation there are a few points that got me interested.
 
 - Hugo is using Go or Go Language
    - Haven't heard of this before but looks like blade templates.
    - New language to learn and use, that's a plus

 - Hugo has great themes ready to use

 - It is fast since they are static sites

 - Can be hosted anywhere

 - Writing posts and pages are done by using Markdown
    - The new WordPress editor are doing that
    - Don't like the feel of new page builder like blocks so might as well give this a try
    - Markdown seems simpler to write as you get more familiar. Used in Github, Jira, etc.

After reading and installing it one weekend I got hooked.

[{{< image src="hugo_github_c3vz7o.png">}}](https://github.com/sudoist)

There are lots of things to do. Doing automatic deploys on commit and more.

### Further development

I am using the issues in Github to add things needed in this site.

It is easier since the code and blog itself are in one place.

### Quick recap of my setup

These are what I used for this site. I think that's all but will update later when I forgot some.

[Hugo](https://gohugo.io/) +
[Digital Ocean](https://m.do.co/c/83cff1ac53a7) +
[Laradock](http://laradock.io/) +
[hello-friend-ng theme](https://themes.gohugo.io/hugo-theme-hello-friend-ng/) +
[Fancybox](https://www.fancyapps.com/fancybox/3/) +
[Cloudinary](https://cloudinary.com/invites/lpov9zyyucivvxsnalc5/j0ngsbsm3znc0tpfjaw2) + 
[Forestry](https://forestry.io/) +
[Talkyard](https://www.talkyard.io/) +
[Travis CI](https://travis-ci.org/)

Most can be authenticated with your Github account, with this my Github got a lot of important points.

I will be writing more details on the tools and other stuff I used but that will be on another post.

### TLDR

Not able to make old theme and updated WordPress to work so instead of redoing site with new theme,
moved over to hugo made a blog static.

Learned a couple of new stuff along the way.

### Commercial time

Thank you for reaching this part.

Not sure if this was interesting. Just rambling about my experience on switching.

So far, I'm happy with Hugo and creating new posts and pages.

Would like to take this time to mention a couple of sites that would certainly support me run this blog.

##### Digital Ocean
Easy cloud hosting for developers.

Create servers on 1 click they play around with them then delete if you messed it up without repair then repeat.

##### Cloudinary
Image management tools. We can upload our files here instead of making our repo bulky with cover and gallery images.

>:point_up: *I receive a commission from Digital Ocean and incentives from Cloudinary
for purchases made through these links.*

>*This comes with no additional cost and helps me with ~~food~~ Gundam money*

>*Thank you*
