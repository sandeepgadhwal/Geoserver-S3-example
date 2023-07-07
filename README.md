# Geoserver S3 example
This example shows how to load s3 geotiff in geoserver.


## Start server
```bash
docker compose up
```

## Test


Go to http://localhost:8080/geoserver/web 

Navigate to:

Data > Stores > GeoTiff 

Tick the cog checkbox

Add the following image layer [from this resource](https://registry.opendata.aws/in-imagery/) to test the plugin

<!-- s3://gisimageryingov/imageryoptimized/statewide/2022/SPE/03in/in2022_4150_1270_03.tif?useAnon=true&awsRegion=us-east-2 -->

https://gisimageryingov.s3.amazonaws.com/imageryoptimized/statewide/2022/SPE/03in/in2022_4150_1270_03.tif




