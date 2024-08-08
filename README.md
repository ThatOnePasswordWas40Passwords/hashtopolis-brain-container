# Container for running Hashcat brain

That's it. That's all it does.

## Why?

For running alongside [hashtopolis](https://github.com/hashtopolis/server/blob/master/docker-compose.yml)
in the `docker-compose.yaml` file setup.

Something like so:

```yaml
# ... hashtopolis docker-compose.yaml upstream as is .... then,
  hashcat-brain:
    container_name: hashcat-brain
    image: ghcr.io/thatonepasswordwas40passwords/hashtopolis-brain-container:<VERSION>
    restart: always
    ports:
      - 9876:9876

# ... rest of hashtopolis docker-compise.yaml upstream ...
```

NOTE: Must have logged in to `ghcr.io` reg prior.
