use hotelres

select * from hotelres

--1. What is the total number of reservations in the dataset?
select count(*) as total from hotelres

--2. Which meal plan is the most popular among guests?

select type_of_meal_plan, count(type_of_meal_plan) as type_count from hotelres 
group by type_of_meal_plan 
order by type_count desc

--3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as avg_price from hotelres
where no_of_children != 0

--4. How many reservations were made for the year 20XX 
--(replace XX with the desired year)?
select count(*) as reservations_2017
from hotelres
where year(arrival_date) = 2017;

select count(*) as reservations_2018
from hotelres
where year(arrival_date) = 2018;

--5. What is the most commonly booked room type?
select room_type_reserved, count(*) as count_reserved from hotelres
group by room_type_reserved
order by count_reserved desc

--6. How many reservations fall on a weekend 
--(no_of_weekend_nights > 0)?
select count(no_of_week_nights) as count_wn from hotelres
where no_of_weekend_nights > 0

--7. What is the highest and lowest lead time for reservations?
select max(lead_time) as max_leadtime,min(lead_time) as min_leadtime 
from hotelres

--8. What is the most common market segment type for reservations?
select  market_segment_type,count(market_segment_type) as count_mst 
from hotelres
group by market_segment_type
order by count_mst desc

--9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as confirmed from hotelres
where booking_status='Confirmed'

--10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults, sum(no_of_children) as total_children
from hotelres;

--11. What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as week_night_children from hotelres
where no_of_children !=0

--12. How many reservations were made in each month of the year?
select month(arrival_date) AS arrival_month, count(*) AS res_count
FROM hotelres
GROUP BY month(arrival_date)
ORDER BY arrival_month;

--13. What is the average number of nights (both weekend and weekday)
--spent by guests for each room type?
select room_type_reserved, 
avg(no_of_weekend_nights + no_of_week_nights) as average_total_nights
from hotelres
group by room_type_reserved;

--14. For reservations involving children, what is the most common room type,
--and what is the average price for that room type?
select room_type_reserved, count(*) as count_res,
avg(avg_price_per_room) as average_price
from hotelres
where no_of_children > 0
group by room_type_reserved
order by count_res desc


--15. Find the market segment type that generates the highest average price per room.
select market_segment_type, avg(avg_price_per_room) as average_price
from hotelres
group by market_segment_type
order by average_price desc
