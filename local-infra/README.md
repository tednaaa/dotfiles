### Run playwright server in docker, useful for unsupported platforms like NixOS/ArchLinux

- [see more](https://playwright.dev/docs/docker)

```fish
docker run -p 3000:3000 --rm --init \
	--workdir "/home/$(whoami)" \
	--user "$(id -u):$(id -g)" \
	mcr.microsoft.com/playwright:v1.57.0-noble \
	/bin/sh -c "npx -y playwright@1.57.0 run-server --port 3000 --host 0.0.0.0"
```
