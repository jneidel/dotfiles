# firefox

## My setup

My [firefox](https://www.mozilla.org/en-US/firefox/nightly/notes/) is configured for maximum privacy. (If you want even more privacy use [Tor](https://www.torproject.org).)

It removes the history and all cookies after closing. This will cause problems, e.g. for Google CAPTCHA you will have to use a diffent browser.

After installing all privacy relevant [browser extensions](#browser-extensions) open the preferences (via menu or `about:preferences`).

### `about:preferences` under "Privacy & Security":

**Content Blocking:**

Under "Content Blocking" select Custom and check "Trackers - In all windows" and "Cookies - Third-party trackers".

**DNT:**

Set "Send websites a “Do Not Track” signal" to "Always".

![content blocking & dnt](https://i.imgur.com/gcehBcm.png)

**Cookies and Site Data:**

Check "Delete cookies and site data when Nightly is closed".

![cookies](https://i.imgur.com/jhgQvdq.png)

**History:**

Choose "Never remember history".

![history](https://i.imgur.com/BEuKmdA.png)

**Permissions:**

Check "Block websites from automatically playing sound" and "Block pop-up windows".

![permissions](https://i.imgur.com/BUwYSWO.png)

## Block `open with` prompt

The `open with` prompt is based on the mime types that the server sends. For
most you can set an `always do` option, but for example for `.cbz` files
you can't. 

Now open the mime tpye handlers file for your firefox installation:

```sh
# nightly:
vim ~/.mozilla/firefox/*.default-nightly*/handlers.json
# developer-edition:
vim ~/.mozilla/firefox/*.dev-edition-default/handlers.json
```

You can either add a new mime type to the `mimeTypes` object:

```js
"application/your-mime-type": {
  "action": 0,
  "extensions": [ "pdf" ]
}
```

Or add the desired file extension to an existing file type that has the correct
action:

```js
"application/zip": {
  "action": 0,
  "extensions": ["zip","cbz","cbr"]
}
```

The action you probably want is `0` to always save the file.

