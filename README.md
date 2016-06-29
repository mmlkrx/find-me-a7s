# Find me a7s

This is a small script that scrapes the dslr-forum websites classifieds section and tries to find offers for the sony a7s, then send a mail out.

## Development

Have docker running and do:

```shell
$ docker build . -t scraper:latest
$ docker run -it -v $(pwd):/scraper scraper:latest /bin/sh
```

Once the container is running, start the script:

```shell
/scraper $ ruby find_a7s.rb
```
