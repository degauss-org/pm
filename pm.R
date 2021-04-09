#!/usr/local/bin/Rscript

dht::greeting(geomarker_name = 'pm', version = '0.1', description = 'adds PM2.5 estimates based on lat/lon and date')

dht::qlibrary(dplyr)

doc <- '
      Usage:
      pm.R <filename>
      '

opt <- docopt::docopt(doc)
## for interactive testing
## opt <- docopt::docopt(doc, args = 'test/my_address_file_geocoded.csv')

message('reading input file...')
d <- dht::read_lat_lon_csv(opt$filename)

dht::check_for_column(d, 'lat', d$lat)
dht::check_for_column(d, 'lon', d$lon)
dht::check_for_column(d, 'start_date', d$start_date)
dht::check_for_column(d, 'end_date', d$end_date)
d$start_date <- dht::check_dates(d$start_date)
d$end_date <- dht::check_dates(d$end_date)

# check for aws credentials
if (fs::file_exists('pm_aws_user_keys.R')) {
   source('pm_aws_user_keys.R')
   cli::cli_alert_success(glue::glue('AWS credentials sourced from ', {fs::path_file("pm_aws_user_keys.R")}))
}
s3:::check_for_aws_env_vars()

## function for creating a pm based on a single sf point
message('joining PM estimates to data...')
d <- addPmData::add_pm(d)

## merge back on .row after unnesting .rows into .row
dht::write_geomarker_file(d = d,
                     filename = opt$filename,
                     geomarker_name = 'pm',
                     version = '0.1')
