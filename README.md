[![Build Status](https://travis-ci.com/IllumiDesk/morehouse-outreach-notebook.svg?branch=main)](https://travis-ci.com/IllumiDesk/morehouse-outreach-notebook)

# IllumiDesk Morehouse Outreach Notebook

Dockerfiles and related assets the `illumidesk/morehouse-outreach-notebook` image. The image is based mostly off of the `jupyter/datascience-notebook` image + additional Julia packages managed with `Project.toml` and `Manifest.toml` files to ensure reproducability.

## Pre Requisits

- [Docker](https://docs.docker.com/get-docker/)

## Quickstart

1. Install dependencies

```bash
make venv
```

2. Build images

```bash
make build-all
```

You can also override default tags and/or images using the `--build-args` flag to override the defaults assigned to the `BASE_IMAGE` and `TAG` arguments.

For example:

```bash
docker build \
  --build-arg BASE_IMAGE=jupyter/minimal-notebook \
  --build-arg TAG=latest \
  -t illumidesk/morehouse-outreach-notebook \
  morehouse-outreach-notebook/.
```

3. Run:

Running the image standalone is helpful for testing:

```bash
docker run -p 8888:8888 illumidesk/morehouse-outreach-notebook:latest
```

Then, navigate to `http://localhost:8888` to access your Jupyter Notebook server.

> Refer to [docker's documentation](https://docs.docker.com/engine/reference/run/) for additional `docker run ...` options.

4. Test:

```bash
make test
```
## Development and Testing

1. Create your virtual environment and install dev-requirements:

```bash
make venv
```

2. Check Dockerfiles and code formatting with linters:

```bash
make lint-all
```

3. Run tests:

The standard `make test` command ensures the image is built before running tests:

```bash
make test
```

You can skip the build step and run the tests directly:

```bash
pytest -v
```

## References

These images are based on the `jupyter/docker-stacks` images. [Refer to their documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/) for the full set of configuration options.

## License

MIT
