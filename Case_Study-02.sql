--Platform used:Mode.com
--Table used:tutorial.kag_conversion_data
--Date:20-06-2025

--Q1: Write a query to count the total number of records in the tutorial.kag_conversion_data dataset ?
select count(*) as total_records                                                                                                             --counting all records and giving alias name
from tutorial.kag_conversion_data;

--Q2: Write a query to count the distinct number of fb_campaign_id ?
select count(distinct(fb_campaign_id)) as count_of_unique_fb_campaign_id                                                                   --selecting and counting unique fb_campaign_id and giving alias name
from tutorial.kag_conversion_data;

--Q3: Write a query to find the maximum spent, average interest, minimum impressions for ad_id ?
select max(spent) as maximum_spent,avg(interest) as average_interest,min(impressions) as minimum_impression                                 --selecting maximum spent and average interest and minimum impressions and giving alias names
from tutorial.kag_conversion_data;

--Q4: Write a query to create an additional column spent per impressions(spent/impressions) ?
select * ,spent/impressions as spent_per_impressions                                                                                       --selecting all records from table and creating a new column 
from tutorial.kag_conversion_data;

--Q5: Write a query to count the ad_campaign for each age group ?
select age,count(distinct(fb_campaign_id)) as count_of_ad_campaign                                                                           --selecting age column and counting unique fb_campaign_id and giving alias name
from tutorial.kag_conversion_data 
group by 1;                                                                                                                                   --grouping by age column
--Q6: Write a query to calculate the average spent on ads for each gender category ?
select gender,avg(spent) as average_spent_on_ads                                                                                               --selecting gender column and average spent and giving alias name
from tutorial.kag_conversion_data 
group by 1;                                                                                                                                       --grouping by gender column

--Q7: Write a query to find the total approved conversion per xyz campaign id. Arrange the total conversion in descending order ?
select total_conversion,xyz_campaign_id,sum(approved_conversion) as total_approved_conversion                                                   --selecting multiple columns and sum of approved_conversion and giving alias name
from tutorial.kag_conversion_data
group by 1,2                                                                                                                                      --grouping by total_conversion and xyz_campaign_id columns
order by 1 desc;                                                                                                                                   --sorting the output in descending order

--Q8: Write a query to show the fb_campaign_id and total interest per fb_campaign_id. Only show the campaign which has more than 300 interests ?
select fb_campaign_id,sum(interest) as total_interest                                                                                             --selecing fb_campaign_id and sum of interest and giving alias name
from tutorial.kag_conversion_data 
group by 1                                                                                                                                         --grouping by fb_cmpaign_id
having sum(interest)>300;                                                                                                                          --getting the data after grouping and sum is greater than 300

--Q9: Write a query to find the age and gender segment with maximum impression to interest ratio. Return three columns - age, gender, impression_to_interest ?
select age,gender,sum(impressions)/sum(interest) as impression_to_interest                                                                         --selecting multiple columns and ratio and giving alias name
from tutorial.kag_conversion_data 
group by 1,2;                                                                                                                                        --grouping by age and gender columns

--Q10: Write a query to find the top 2 xyz_campaign_id and gender segment with the maximum total_unapproved_conversion ?
select xyz_campaign_id,gender,approved_conversion,count(*) as total_unapproved_conversion                                                          --selecting multiple columns and counting all records from table
from tutorial.kag_conversion_data 
where approved_conversion=0                                                                                                                         --checking condition for approved_conversion=0
group by 1,2,3                                                                                                                                       --grouping the data by xyz_campaign_id,gender,approved_conversion
order by total_unapproved_conversion desc                                                                                                            --sorting the data in descending order
limit 2;                                                                                                                                             --limiting the output only for 2 rows
