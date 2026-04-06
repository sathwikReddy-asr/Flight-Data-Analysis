--Platform used:mode.com
--Table used:tutorial.flights 
--Date:27th may 2025

--Q1: List all flights with a departure delay greater than 30 mintutes ?
select *                                                                                                                         --selecting multile columns
from tutorial.flights 
where departure_delay >30;                                                                                                       --departure delay is more than 30 mintues

--Q2: count the number of flights per destination city.sort the result by highest flight count first ?
select destination_city,count(*) as flight_count                                                                                  --selecting destination_city and counting flights and giving alias name
from tutorial.flights
group by destination_city                                                                                                         --grouping by destination_city
order by flight_count desc;                                                                                                       --sorting by flight_count in descending order

--Q3: Find the flights that arrived early (arrival delay <0) ?
select *                                                                                                                           --selecting multiple columns
from tutorial.flights
where arrival_delay <0;                                                                                                             --arrival_delay is greater than 0

--Q4: calculate the average flight distance ?
select avg(distance) as average_flight_distance                                                                                      --selecting average distance and giving alias name
from tutorial.flights;

--Q5: List the top 5 origin airports by flght count ?
select origin_airport,count(*) as flight_count                                                                                      --selecting origin airport column and count flights and giving alias name
from tutorial.flights
group by origin_airport                                                                                                              --grouping by origin airport
order by flight_count desc  limit 5;                                                                                                --sorting flight count by descending order and limiting it to 5 rows

--Q6: Find flights with air traffic control delays ?
select *                                                                                                                           --selecting all columns from data
from tutorial.flights 
where air_traffic_delay>0;                                                                                                        --air traffic delay is greater than 0

--Q7: Calculate the total actual flight time for all flights ?
select sum(actual_flight_time) as total_flight_time                                                                              --selecting sum of actual flight time and giving alias name
from tutorial.flights;

--Q8: List flights with a distance less than 500 miles ?
select *                                                                                                                         --selecting all columns from data
from tutorial.flights 
where distance<500;                                                                                                               --distance is less than 500

--Q9: Find the flight with the longest actual flight time ?
select *                                                                                                                          --selecting all columns from data
from tutorial.flights 
where actual_flight_time = (select max(actual_flight_time) from tutorial.flights);                                                 --by using sub query selecting maximum actual flight time

--Q10: Count flights by destination state ?
select destination_state,count(*) as flight_count                                                                                    --selecting destination state and count f flights and giving alias name
from tutorial.flights
group by destination_state;                                                                                                            --grouping by destination state

--Q11: List flights where the actual flight time differs from the scheduled flight time by more than 10 minutes ?
select *                                                                                                                              --selecting all columns from data
from tutorial.flights 
where 
     abs(actual_flight_time-scheduled_flight_time)>10;                                                                                 --actual flight time difers from scheduled flight time more than 10 min and getting absolute time

--Q12: Find flights with no delays (both departure and arrival delays are 0 or negatie) ?
select *                                                                                                                                --selecting all columns from the data
from tutorial.flights 
where arrival_delay<=0 and departure_delay <=0;                                                                                      --arruval delay is less tha (or) equal to 0 and departure delay is less than (or) equal to 0

--Q13: Calculate the average arrival delay per origin airport ?
select origin_airport,avg(arrival_delay) as avg_arrival_delay                                                                           --selecting origin airport and average arrival delay and giving alias name
from tutorial.flights
group by origin_airport;                                                                                                                  --grouping by arigin airport

--Q14: List flights with a carrier delay greater than 0 ?
select *                                                                                                                                  --selecting all columns from data
from tutorial.flights 
where carrier_delay>0;                                                                                                                     --carrier delay is greater than 0

--Q15 Find the shortest scheduled flight time ?
select min(scheduled_flight_time) as shortest_scheduled_flight_time                                                                       --selecting minimum scheduled flight time and giving alias name
from tutorial.flights ;

--Q16 List flights with a positive arrival delay ?
select *                                                                                                                                  --selecting all columns from data
from tutorial.flights 
where arrival_delay>0;                                                                                                                      --arrival delay is greater than 0

--Q17 Count flights by origin state ? 
select origin_state,count(*) as flight_count                                                                                               --selecting origin state and counting the flighhts and giving alias name
from tutorial.flights 
group by 1;                                                                                                                              --grouping by origin state

--Q18: Find flights with a distance graeter tha 2000miles ?
select *                                                                                                                                  --selecting all columns from data
from tutorial.flights 
where distance>2000;                                                                                                                        --distance is greater than 2000

--Q19: Calculate the maximum arrival delay ?
select max(arrival_delay) as max_arrival_delay                                                                                            --selecting maximun arrival delay and giving alias name
from tutorial.flights;

--Q20: List flights with no cancellation ?
select *                                                                                                                                   --selecting all columns from data
from tutorial.flights 
where was_cancelled=false;                                                                                                                   --flights with no cancelation

--Q21: Calculate the average air time per flight ?
select flight_number,avg(air_time) as avg_air_time                                                                                             --selecting flight number column and average air time and giving alias name
from tutorial.flights
group by 1;                                                                                                                                     --grouping by flight number

--Q22: Find flights with a scheduled departure time before 8 AM ?
select *                                                                                                                                         --selecting all columns from data
from tutorial.flights 
where scheduled_departure_time<800;                                                                                                               --scheduled departure time is less than 800

--Q23: Count flights per airline code ?
select airline_code,count(*) as flight_count                                                                                                     --selecting airline code and count of flights and giving alias name
from tutorial.flights 
group by airline_code;                                                                                                                           --grouping by airline code

--Q24:List flights with a late aircraft delay greater than 0 ?
select *                                                                                                                                            --selecting all columns from data
from tutorial.flights 
where late_aircraft_delay>0;                                                                                                                        --late aircraft delay is greater than 0

--Q25: Calculate the total distance flown ?
select sum(distance) as total_distance_flown                                                                                                        --selecting sum of distance and giving alias name
from tutorial.flights;

--Q26: Find the flights with a scheduled arrival time after 10 PM ?
select *                                                                                                                                          --selecting all columns from the data
from tutorial.flights 
where scheduled_arrival_time>2200;                                                                                                                   --scheduled arrival time is greater than 2200

--Q27: List flights with a flight number between 2450 and 2500 ?
select *                                                                                                                                              --selecting all columns from data
from tutorial.flights 
where flight_number  between 2450 and 2500;                                                                                                   --flight number is between 2450 and 2500

--Q28: Calculate the average departure delay ?
select avg(departure_delay) as avg_departure_delay                                                                                        --selecting average departure delay and giving alias name
from tutorial.flights;

--Q29: Find flights with  a security delay greater than 0 ?
select *                                                                                                                                    --selecting all columns from data
from tutorial.flights 
where security_delay>0;                                                                                                                  --security delay is greater than 0

--Q30: List flights sorted by distance in descending order ?
select *                                                                                                                                   --selecting all columns from data
from tutorial.flights 
order by distance desc;                                                                                                                    --sorting distance in descending order

--Q31: Find round-trip flights (same origin and destination airports) ?
--Del-Mum,Mum-Del (round trip flight example)
select *                                                                                                                                   --selecting all columns from data
from tutorial.flights as a                                                                                                                 --taking tutorial.flights table as a
join tutorial.flights as b                                                                                                                   --taking tutorial.flights table as b and join with a
on a.origin_airport=b.destination_airport and a.destination_airport=b.origin_airport and a.flight_number<b.flight_number;                    --doing join based on example(Del-Mum,Mum-Del)

--Q32: Calculate the average departure delay by destination city ?
select destination_city,avg(departure_delay) as avg_departure_delay                                                                          --selecting destination city and average departure delay and giving alias name
from tutorial.flights
group by 1;                                                                                                                                   --groupong by destination city

--Q33: Find total arrival and departure delay for all flights ?
Method_1:
select flight_number,sum(departure_delay) as total_departure_delay,sum(arrival_delay) as total_arrival_delay                              --selecting flight number and sum of departure delay and total departure delay and giving alias name
from tutorial.flights
group by 1;                                                                                                                              --grouping by flight number
Method_2:
select flight_number,(arrival_delay+departure_delay) as total_arri_depar_delay                                                             --selecting flight number and adding arrival and departure delays and giving alias name
from tutorial.flights;

--Q34: Find the top 3 routes (origin to destination) by flight count ?
select origin_airport,destination_airport,COUNT(*) as flight_count                                                                     --selecting origin airport and destination airport and count of flights and giving alias name
from tutorial.flights
group by origin_airport,destination_airport                                                                                                 --grouping by origin airport and destination airport
order by flight_count desc                                                                                                               --sorting flight count in descending order
limit 3;                                                                                                                                --limiting the data for only 3 rows

--Q35: Calculate the percentage of flights delayed (arrival delay>0) ?
select 
round(count(case                                                                                                                           --by using case when we getting arrival delay is greater than 0 it gives 1 else 0 and we are counting all  1's and dividing by total rows and rounding it to 2 values and giving alias name
    when arrival_delay>0 then 1
    else 0
    end )*100/count(*),2) as flight_delayed_percentage
from tutorial.flights;

--Q36: List flights where the air time is less than 90% of the actual flight time ?
select *                                                                                                                                 --selecting all columns from data
from tutorial.flights
where air_time<0.9*actual_flight_time;                                                                                                      --air ttime is less tha 90% of actual flight time

--Q37: Calculate the percentage of flights with any delay type ?
select 
   round(count( CASE                                                                                                                          --by using case when we getting departure delay is greater than 0 gives 1's else 0 and we counting all 1's and dividing by getting total rows and rounding it to 2 values and giving an alias name
          when departure_delay>0 then 1
          else 0
          end)*100/count(*),2) as percentage_delay_flight
from tutorial.flights;

--Q38: Find flights with a weather delay and their origin state ?
select origin_state,flight_number,weather_delay                                                                                                 --selecting origin state ,flight number and weather delay
from tutorial.flights
where weather_delay>0;                                                                                                                       --weather delay is greater than 0

--Q39: Calculate the total distance flown by flights originating from Atlanta ?
select sum(distance) as total_distance_from_atlanta                                                                                        --selecting sum of distance and giving alias name
from tutorial.flights
where origin_city=atlanta;                                                                                                                  --origin city is equal to atlanta

--Q40: List flights where the actual arrival time is earlier than the scheduled arrival time ?
select *                                                                                                                                   --selecting all columns from data
from tutorial.flights 
where actual_arrival_time<scheduled_arrival_time;                                                                                             --actual arrival time is less than scheduled arrival time

--Q41: Find the average flight time for flights over 1000 miles ?
select avg(air_time) as avg_flight_time                                                                                                     --selecting average air time and giving alias name
from tutorial.flights 
where distance>1000;                                                                                                                         --distance is greater than 1000

--Q42: List flights with the same origin and destination state ?
select *                                                                                                                                          --selecting all columns from data
from tutorial.flights 
where origin_state=destination_state;                                                                                                              --origin state is equal to destination state

--Q43: Calculate the maximum departure delay per origin airport ?
select origin_airport,max(departure_delay) as max_departure_delay                                                                                    --selecting origin airport and maximum departure delay and giving alias name
from tutorial.flights 
group by 1;                                                                                                                                           --grouping by origin airport

--Q44: List flights sorted by total delay (arrival+departure) ?
select flight_number,(arrival_delay+departure_delay) as total_delay                                                                                --selecting flight number and adding arrival and departure delays and giving alias name
from tutorial.flights
order by total_delay;                                                                                                                               --sorting by total delay

--Q45: Find flights with a departure delay but no arrival delay ?
select *                                                                                                                                           --selecting all columns from data
from tutorial.flights
where departure_delay>0 and arrival_delay<=0;                                                                                                  --departure delay is grester than 0 and arrival delay is less than (or) equal to 0

--Q46: Calculate the average distance by origin city ?
select origin_city,avg(distance) as avg_distance                                                                                           --selecting origin city and average distance and giving alias name
from tutorial.flights 
group by 1;                                                                                                                                 --grouping by origin city

--Q47: List flights with actual flight time less than scheduled flight time ?
select *                                                                                                                                     --selecting all columns from data
from tutorial.flights 
where actual_flight_time<scheduled_flight_time;                                                                                           --actual flight time is less than scheduled flight time

--Q48: Find the top 5 destination airports by total distance flown ?
select destination_airport,sum(distance) as total_distance_flown                                                                       --selecting destination airport and sum of distance amd giving alias name
from tutorial.flights 
group by destination_airport                                                                                                            --grouping by destination airport
order by total_distance desc                                                                                                             --sorting by total distance in descending order
limit 5;                                                                                                                                  --limiting the result to 5 rows

--Q49: Calculate the percentage of flights with all delay type ?
select 
   round(count( CASE 
          when departure_delay+carrier_delay+late_aircraft_delay+security_delay+weather_delay>0 then 1                                       --by using case when we are getting 1 when sum of all delays is greater tha 0 else getting 0 and dividing it by total rows and rounding it to 2 values and giving alias name
          else 0
          end)*100/count(*),2) as percentage_delay_flight
from tutorial.flights;
