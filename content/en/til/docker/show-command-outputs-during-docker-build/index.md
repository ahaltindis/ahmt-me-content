---
date: 2023-07-02 07:36:45
title: Show command outputs during docker build
translationKey: show-command-outputs-during-docker-build
---

When building a docker image, I couldn't see the outputs of the commands I had in the Dockerfile and I tried the understand why.

It seems there are two reasons for this.

The first and probably the obvious reason is that if a command is cached, it will not be executed again. Therefore, there won't be anything to show in the output.
```
=> CACHED [5/8] RUN ls /usr/local/lib/python3.8/site-packages                             0.0s
=> CACHED [6/8] RUN ls /opt/venv/lib/python3.8/site-packages/pyarrow                      0.0s
```
However, for testing purposes, one might still want to see the command output even if it is cached. In this case, caching can be disabled by passing the `--no-cache` flag to the `docker build` ([source](https://docs.docker.com/engine/reference/commandline/build/#options)) command.
```
docker build --no-cache .
```
> Docker cache is explained very well in the Docker documentation: [https://docs.docker.com/build/cache](https://docs.docker.com/build/cache/).


The second reason, which was new to me as well, is that using [BuildKit](https://docs.docker.com/build/buildkit/) automatically hides command outputs once the execution of the command is finished. If the command is fast enough, it may be impossible to catch the response in the console output.
```
=> [5/8] RUN ls /usr/local/lib/python3.8/site-packages                                    0.4s
=> [6/8] RUN ls /opt/venv/lib/python3.8/site-packages/pyarrow                             0.4s
```

There are two ways to expand the outputs in this case. The first way is not to use BuildKit, which might not be ideal. It can be disabled by setting the environment variable `DOCKER_BUILDKIT=0` or by modifying the Docker daemon configuration in  `/etc/docker/daemon.json`:
```
{
  "features": {
    "buildkit": false
  }
}
```
The second way is to pass the  `--progress=plain` flag ([source](https://docs.docker.com/engine/reference/commandline/buildx_build/#progress)) to the build command:
```
#9 [5/8] RUN ls /usr/local/lib/python3.8/site-packages
#9 sha256:ba7b1f744db7694666307383bfb879f8e22f6e792c7b74d50dc01b87841d023e
#9 0.253 PyYAML-6.0.dist-info
#9 0.253 README.txt
#9 0.253 __pycache__
#9 0.253 _distutils_hack
#9 0.253 _multiprocess
#9 0.253 _yaml
#9 0.253 aiohttp
...
```

These options will help to expand the output and see the command results during the Docker image build process.