A super simple proxy for [HCTI API](https://htmlcsstoimage.com/), for automating generation of images from html residing on a specified domain.

## Usage

Configure the following environmental variables.

`HCTI_USER` - Your User ID from HCTI API.
`HCTI_API_KEY` - Your API Key from HCTI API.
`BASE_URL` - The site for which you want to fetch images from.

Then start the proxy with your [Rack compatible web server](https://github.com/rack/rack#label-Supported+web+servers) of choice. (For testing purposes, a `bundle exec rackup` will suffice). It is trivial to deploy this using a cloud platform like [Heroku](https://www.heroku.com/).

Requests to the proxy should be of the pattern `/cache-invalidation-hash/path`, which will use HCTI API to fetch html from `/path` at `BASE_URL`, and then redirect to the resulting image.

