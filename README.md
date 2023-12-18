# payu-condaenv

## Overview

This repository is responsible for building, packaging and deploying [`payu`](https://github.com/payu-org/payu) as a [`micromamba` environment](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html).

## Usage

### Triggering a Deployment

In order to trigger a deployment, some steps must be followed:

* First, check that a new version of `payu` has been added to the [`accessnri` conda channel](https://anaconda.org/accessnri/payu/files). This is done via CD on the `payu-org/payu` repository when a new tag is pushed.
* Open a PR modifying the `env.yml` file to refer to the newly updated version of `payu`. The `env.yml` will be checked for validity and that the version of `payu` is defined.
* When this is merged, the `env.yml` will be used to create a `micromamba` environment. This is then packaged using `conda-pack`, and deployed to the appropriate targets (eg. Gadi).

### Using the Deployed `Payu`

On all of the deployment targets, the deployed `Payu`  environment can be activated using Environment Modules.

#### Gadi

Make sure you're a member of the `vk83` project! If not, see [how to join an NCI project](https://access-hive.org.au/getting_started/first_steps/#join-relevant-nci-projects).

**Important**: make sure you do not have another conda environment active - either run `conda deactivate` or `module unload` any modules that are using conda.

Once you are a member, run the following:

```bash
module use /g/data/vk83/modules
module load payu/VERSION
```

`Payu` can then be invoked with `payu COMMAND`. See `payu --help` for more information.

## Notes

### On Future Deployment Environments

New deployment environments must be created as a GitHub Environment and also have an entry in the `config/deployment-environment.json` file.

### Deploying locally

To deploy locally, you can use the assets created in the release. [Releases are found here](https://github.com/ACCESS-NRI/payu-condaenv/releases). Specifically:

* To use the compressed environment (which doesn't require conda or python) you can run `tar -xzf payu-VERSION.tar.gz payu-VERSION` and then `./payu-VERSION/bin/activate` to activate the environment.
* To use the lockfile, you can run `micromamba create -n my-environment -f payu-VERSION.conda-lock.yml` with an appropriate install of `micromamba`.
