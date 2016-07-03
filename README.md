# Find me a7s

This is a small script that scrapes the dslr-forum websites classifieds section and tries to find offers for the sony a7s, then send a mail out.

## Development

Have docker running and do:

```shell
$ docker build -t scraper:latest .
$ docker run --rm -it -v $(pwd):/scraper -e "USER=$PUSHOVER_USER" -e "TOKEN=$PUSHOVER_TOKEN" scraper:latest /bin/sh
```

Once the container is running, start the script:

```shell
$ ruby find_a7s.rb
```

## Production

Create a new code directory in your server and pull this repo into the directory:

```shell
$ mkdir /code && cd /code && git clone git@github.com:mmlkrx/find-me-a7s.git
```

Next, `cd` into the repo and build a docker image off of the `Dockerfile`:

```shell
$ cd /code/find-me-a7s && docker build -t scraper:latest .
```
Create an account and application for [Pushover](https://pushover.net/). Now edit your users `.profile` to export the user key and token you got from Pushover:

```shell
# $HOME/.profile
export PUSHOVER_USER=your user key here
export PUSHOVER_TOKEN=your token here
```

Then edit your crontab with `$ crontab -e` and add the following line to run docker every 5 min:

```shell
*/5 * * * * . $HOME/.profile; /code/find-me-a7s/run_docker.sh
```
