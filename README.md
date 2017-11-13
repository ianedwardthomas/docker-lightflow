docker-lightflow
================

Docker deployment of the [Lightflow Workflow System](https://australiansynchrotron.github.io/lightflow/)

* Install latest version of docker-engine and docker-compose from [Docker.com](docker.com)

* Build the images:

```bash
   docker-compose build
   ```

* Start redis, mongodb and 2 workers:

```bash
  docker-compose scale worker=2
```

* Run the simple example workflow (change "simple" to name of workflow to run as needed):

```bash
   docker-compose -f workflow.yml run --entrypoint "lightflow workflow start simple" workflow
```

* View the worklow progress

```bash
   docker-compose logs -f worker
```
