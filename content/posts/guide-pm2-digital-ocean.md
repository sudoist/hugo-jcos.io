+++
date = "2020-11-08T07:08:09+10:11"
title = "Guide: Setting up multiple Node.js applications on DigitalOcean"
cover = "sgbiyixdr1hkfuuuy7fr.jpg"
summary = "Setting up guide for multiple node applications on a single pm2 instance."
categories = ["Development","Anything Goes","Blog"]
tags = [
  "Blogging",
  "Programming"
]
layout = "post"
+++

## Set up

- LEMP droplet from marketplace
- 2 Node applications, 1 for an Express API and another for a Nuxt.js application.

## Situation

I am updating my portfolio website and running all the public apps I can on one droplet.

Is it recommended? Not sure.. Probably not advisable but if you're broke like me, even the lowest droplet can handle most of my demo sites.

My goal is to have node and php apps play together in one server.

All seems to work well but it goes south when running the Nuxt app.

PM2 is stopping for my API when starting Nuxt and then stopping Nuxt when starting the API.

I had to use my Full Stackoverflow skills to make this work.

This guide is mainly for me as a reminder when I eventually forget about this when I move onto other stuff.

## Solution

### Including the guides I followed for reference.

- Step 1: [Setting up LEMP stack](https://marketplace.digitalocean.com/apps/lemp#getting-started)
- Step 2: [Adding NGINX sites](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
- Step 3: [Set up Node apps and pm2](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04)

Now I needed to add an [ecosystem config](https://github.com/sudoist/practice-nuxt-tic-tac-toe/blob/master/ecosystem.config.js.example) to list all the apps on this server.

```javascript
module.exports = {
  apps: [
    {
      name: 'nuxt',
      exec_mode: 'cluster',
      instances: 'max', // Max or a number of instances
      script: './node_modules/nuxt/bin/nuxt.js',
      args: 'start'
    },
    {
      name: 'express',
      script: 'path/to/express/api/bin/www', // express project folder/bin/www
      cwd: 'path/to/express/api', // express project folder
      args: 'start',
      node_args: '--require dotenv/config', // Include this to fix issue that dotenv variables are empty
    }
  ]
}
```

That's it, see step 2 to update the ports of your apps then restart nginx.

The final working apps are somewhat like this:

### List of apps and their ports.

```
App 1 = port 4000
App 2 = port 5000
App 3 = port 6000

```

### Example config
```
module.exports = {
  apps: [
    {
      name: 'nuxt',
      exec_mode: 'cluster',
      instances: 'max', // Max or a number of instances
      script: './node_modules/nuxt/bin/nuxt.js',
      args: 'start'
    },
    {
      name: 'express',
      script: 'path/to/express/api/bin/www', // express project folder/bin/www
      cwd: 'path/to/express/api', // express project folder
      args: 'start',
      node_args: '--require dotenv/config', // Include this to fix issue that dotenv variables are empty
    },
    {
      name: 'another-express',
      script: 'path/to/another-express/api/bin/www', // express project folder/bin/www
      cwd: 'path/to/another-express/api', // express project folder
      args: 'start',
      node_args: '--require dotenv/config', // Include this to fix issue that dotenv variables are empty
    }
  ]
}
```

After these are in place just restart pm2 and the sites should be back up now.

```
pm2 kill

pm2 start
```

#### Here are the demo apps that made me go through this last night.

[Express API](https://api.labada.tigasoft.dev/api/order/5f9ccfe54dcc92012501909e)

[Nuxt.js app](https://tictacvue.tigasoft.dev/)

### I almost forgot

If you want to try out DigitalOcean, you can use my [referral link](https://m.do.co/c/83cff1ac53a7).

Using my link saves us both some extra hosting money.

## Closing

Ok that was longer than expected.
Let's end it here for today. Bye then!...........

By the way it was all over the internet that Biden won today...

Bye then for real :D
