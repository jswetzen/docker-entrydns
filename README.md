# entrydns-update

Docker container for automatic IP updates with EntryDNS.

## Usage

The script reads the `AUTH_TOKEN` environment variable to tell EntryDNS what to
update.

    docker run --rm -e "AUTH_TOKEN=abcdef...." jswetzen/entrydns-update

Multiple A records? No problem. Just set `AUTH_TOKEN=token1,token2,...` instead.

## Details

The public IP is fetched from [http://icanhazip.com](http://icanhazip.com) when
the container starts, and then at the start of every new hour.

### Supported tags and architectures

For use on a normal machine, use the `latest` tag.
For ARM computers (like the Raspberry Pi) use `arm32v7`.

## Support

Add a [GitHub issue](https://github.com/jswetzen/docker-entrydns/issues).
