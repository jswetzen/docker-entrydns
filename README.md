# entrydns-update

Docker container for automatic IP updates with EntryDNS.

## Usage

The script reads the `AUTH_TOKEN` environment variable to tell EntryDNS what to
update.

    docker run --rm -e "AUTH_TOKEN=abcdef...." jswetzen/entrydns-update

## Details

The public IP is fetched from [http://icanhazip.com](http://icanhazip.com) when
the container starts, and then at the start of every new hour.

## Support

Add a [GitHub issue](https://github.com/jswetzen/docker-entrydns/issues).
