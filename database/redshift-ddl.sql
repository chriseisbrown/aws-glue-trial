create table flight_data.flight_info_ex(
15/03/17 06:38	15/03/17 05:35	B736	ESSA	Stockholm	Stockholm-Arlanda		15/03/17 06:38	SAS1011-1489383000-schedule-0000	268		0
	15/03/17 05:30	00:50:00	13/03/17 05:30	SAS1011	ESNS	Skelleftea	Skelleftea

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
)


create table flight_data.flight_track_point(
(fa_flight_point['timestamp'],
  fa_flight_point['latitude'],
  fa_flight_point['longitude'],
  fa_flight_point['altitude'],
  fa_flight_point['altitudeChange'],
  fa_flight_point['altitudeStatus'],
  fa_flight_point['groundspeed'],
  fa_flight_point['updateType'],
  fa_flight_id))