# pmdarima docker

[![CircleCI](https://circleci.com/gh/tgsmith61591/pmdarima-docker.svg?style=svg)](https://circleci.com/gh/tgsmith61591/pmdarima-docker)

The images built here are used for one of two purposes:

    1. As base images for testing and doc generation for the
       [`pmdarima`](http://github.com/tgsmith61591/pmdarima) project. Note that
       for this purpose, the only images that should be included are those that
       help significantly reduce CI/CD build times (i.e., PyPy base).
    
    2. To serve as pre-built base images with `pmdarima` already installed.
       Images that serve this purpose will be tagged with the version of
       `pmdarima` that they have installed.
       
### Pulling images

All images are pushed to the `tgsmith61591` prefix. You can pull whatever image you like
with `docker pull`, e.g.:

```bash
$ docker pull tgsmith61591/pmdarima-circle-pypy-base:latest
$ docker pull tgsmith61591/pmdarima:latest
```

Running the containers will start an `ipython` session by default:

```bash
$ docker run --rm -it tgsmith61591/pmdarima:local
Python 3.7.4 (default, Sep 12 2019, 15:40:15)
Type 'copyright', 'credits' or 'license' for more information
IPython 7.8.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: import pmdarima as pm
```
