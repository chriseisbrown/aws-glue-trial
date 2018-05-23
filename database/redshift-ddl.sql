drop schema inflight_data;
create schema flight_data;

-- flight metadata
drop table flight_data.flight_info_ex;
create table flight_data.flight_info_ex(
 actualarrivaltime datetime,
 actualdeparturetime datetime,
 aircrafttype varchar(32),
 destination varchar(32),
 destinationCity varchar(64),
 destinationName varchar(64),
 diverted boolean null,
 estimatedarrivaltime datetime,
 flightId varchar(64) not null,
 filed_airspeed_kts float,
 filed_airspeed_mach float,
 filed_altitude float,
 filed_departuretime datetime,
 filed_ete varchar(8),
 filed_time varchar(32),  -- check this is usually a datetime but some data it is crap
 ident varchar(32),
 origin varchar(32),
 originCity varchar(64),
 originName varchar(64),
 route varchar(32) null
);

--load data from S3 bucket files
copy flight_data.flight_info_ex from 's3://endava-fds/data/adsb-flight/processed'
credentials 'aws_iam_role=arn:aws:iam::004532751075:role/endava-redshift-s3-access-role'
format as csv
null as 'null'
region 'eu-west-1';

-- flight time series
drop table flight_data.flight_track_point;
create table flight_data.flight_track_point(
 utc_date_time  datetime,
 flight_timestamp bigint,
 latitude decimal(12,7),
 longitude decimal(12,7),
 altitude int,
 altitudeChange char,
 altitudeStatus char,
 groundspeed  int,
 updateType char,
 flightId varchar(64) not null);

--load data from S3 bucket files
copy flight_data.flight_track_point from 's3://endava-fds/data/adsb/'
credentials 'aws_iam_role=arn:aws:iam::004532751075:role/endava-redshift-s3-access-role'

format as csv
null as 'null'
region 'eu-west-1';



