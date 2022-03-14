# pm <a href='https://degauss.org'><img src='https://github.com/degauss-org/degauss_hex_logo/raw/main/PNG/degauss_hex.png' align='right' height='138.5' /></a>

[![](https://img.shields.io/github/v/release/degauss-org/pm?color=469FC2&label=version&sort=semver)](https://github.com/degauss-org/pm/releases)
[![container build status](https://github.com/degauss-org/pm/workflows/build-deploy-release/badge.svg)](https://github.com/degauss-org/pm/actions/workflows/build-deploy-release.yaml)

## Using

If `my_address_file_geocoded.csv` is a file in the current working directory with coordinate columns named `lat`, `lon`,  `start_date`, and `end_date` then the [DeGAUSS command](https://degauss.org/using_degauss.html#DeGAUSS_Commands):

```sh
docker run --rm -v $PWD:/tmp ghcr.io/degauss-org/pm:0.2.0 my_address_file_geocoded.csv
```

will produce `my_address_file_geocoded_pm_0.2.0.csv` with added columns:

- **`pm_pred`**: predicted PM$_{2.5}$
- **`pm_se`**: standard error for predicted PM$_{2.5}$

The output file will containe one row per day between `start_date` and `end_date`. 

## Geomarker Methods

This container was built using the [addPmData](https://github.com/geomarker-io/addPmData) package. More information on the development of the spatial model can be found at the [st_pm_hex](https://github.com/geomarker-io/st_pm_hex) repository and in the scientific manuscript describing model development: 

> Cole Brokamp. [A High Resolution Spatiotemporal Fine Particulate Matter Exposure Assessment Model for the Contiguous United States.](https://www.sciencedirect.com/science/article/pii/S2666765721001265) *Environmental Advances*. 7:100155. 2022.

## Geomarker Data

- PM estimates are stored at: [`s3://pm25-brokamp/`](https://pm25-brokamp.s3.us-east-2.amazonaws.com/)

## DeGAUSS Details

For detailed documentation on DeGAUSS, including general usage and installation, please see the [DeGAUSS homepage](https://degauss.org).
