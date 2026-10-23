# wp-skins.com: Storefront Pro demos on WordPress Playground

Static site for GitHub Pages. Each demo is a real WooCommerce store that boots in the visitor's browser.

```
index.html               landing page
blueprints/<skin>.json   Playground blueprint per demo
bundles/<skin>.zip       wp-content: SQLite DB, Storefront Pro & co, demo mu-plugin (~6 MB each)
media/<skin>/...         original uploads, served straight from GitHub Pages
<skin>/index.html        old URLs (wp-skins.com/barossa/ etc.) redirect into Playground
thumbs/                  card images
```

At launch, Playground installs WooCommerce 11.2.1 and Storefront 4.6.2 from wordpress.org, then unpacks the bundle.
Login is admin / password. The mu-plugin `wp-skins-demo.php` maps the placeholder host
to the Playground URL and loads any image that isn't present locally from `https://wp-skins.com/media/<skin>`.

## Deploy
1. Run `./add-media.sh` once to copy the uploads from the WP Engine backup into `media/`.
2. Create a GitHub repo, push this folder, then go to Settings → Pages → Deploy from branch `main`, folder `/`.
3. In the same Pages settings, set the custom domain to `wp-skins.com` (the CNAME file is already here) and tick Enforce HTTPS.
4. DNS: remove the WP Engine records and add A records for `@` pointing to 185.199.108.153, .109.153, .110.153 and .111.153, plus `www` as a CNAME to `<user>.github.io`.
