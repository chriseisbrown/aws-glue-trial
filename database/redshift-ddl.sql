15/03/17 06:38	15/03/17 05:35	B736	ESSA	Stockholm	Stockholm-Arlanda		15/03/17 06:38	SAS1011-1489383000-schedule-0000	268		0
	15/03/17 05:30	00:50:00	13/03/17 05:30	SAS1011	ESNS	Skelleftea	Skelleftea

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
 filed_ete datetime,
 filed_time datetime,
 ident varchar(32),
 origin varchar(32),
 originCity varchar(64),
 originName varchar(64),
 route varchar(32) null
);

-- flight time series
drop table flight_data.flight_track_point;
create table flight_data.flight_track_point(
(  timestamp  datetime,
    latitude  ,
    longitude  ,
    altitude  ,
    altitudeChange  ,
    altitudeStatus  ,
    groundspeed  ,
    updateType  ,
  fa_flight_id));

--load data from S3 bucket file
copy flight_data.flight_info_ex from 's3://endava-fds/data/flight/flight_timeseries_v2_updated.csv'
credentials 'aws_iam_role=arn:aws:iam::004532751075:role/endava-redshift-s3-access-role'
ignoreheader 1
format as csv
null as 'null'
region 'eu-west-1';