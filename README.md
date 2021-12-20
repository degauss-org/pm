# pm <a href='https://degauss.org'><img src='https://github.com/degauss-org/degauss_template/raw/master/DeGAUSS_hex.png' align='right' height='138.5' /></a>

> add daily PM2.5 estimates to geocoded data

[![Docker Build Status](https://img.shields.io/docker/automated/degauss/pm)](https://hub.docker.com/repository/docker/degauss/pm/tags)
[![GitHub Latest Tag](https://img.shields.io/github/v/tag/degauss-org/pm)](https://github.com/degauss-org/pm/releases)

## DeGAUSS example call

If `my_address_file_geocoded.csv` is a file in the current working directory with coordinate columns named `lat` and `lon` and date columns called `start_date` and `end_date` then

```sh
docker run --rm -v $PWD:/tmp degauss/pm:0.1.3 my_address_file_geocoded.csv
```

will produce `my_address_file_geocoded_pm_v0.1.2.csv` with added columns named `pm_pred` and `pm_se`, and a row for each date between the provided `start_date`s and `end_date`s. 

## geomarker methods

This container was built using the [addPmData](https://github.com/geomarker-io/addPmData) package. More information on the development of the spatial model can be found at the [st_pm_hex](https://github.com/geomarker-io/st_pm_hex) repository and in the scientific manuscript describing model development: `Brokamp, C. A High Resolution Spatiotemporal Fine Particulate Matter Exposure Assessment Model for the Contiguous United States. Environmental Advances. In Press. 2021.` (accepted preprint available online: [https://doi.org/10.1016/j.envadv.2021.100155](https://doi.org/10.1016/j.envadv.2021.100155)).

## geomarker data

- PM estimates are stored at: [`s3://pm25-brokamp/`](https://pm25-brokamp.s3.us-east-2.amazonaws.com/)

## DeGAUSS details

For detailed documentation on DeGAUSS, including general usage and installation, please see the [DeGAUSS homepage](https://degauss.org).
