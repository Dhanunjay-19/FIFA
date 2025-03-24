
use student_db;
select * from fifa limit 10;

#-----------------------------------------------------------------------------------------------------------------------------------

# 1. how many players are there in the dataset?
# Ans :-

select count(*) as Total_Players from fifa; # 16643

#-----------------------------------------------------------------------------------------------------------------------------------

# 2. how many nationalities do these players belong to?
# Ans :-

select count(distinct nationality) as Total_Nationalities from fifa; #161

#---------------------------------------------------------------------------------------------------------

# 3. which nationality has the highest no of players, what are the top 3 nationalities by # of players?
# Ans:-

select nationality, count(*) as player_count 
from fifa
group by nationality
order by player_count desc limit 3;

#-----------------------------------------------------------------------------------------------------------------------------------

# 4. what is the total wage given to all players? what's the average and standard deviation?
# Ans:-

select * from fifa limit 10;

select sum(wage) as total_wage, avg(wage) as avg_wage, stddev(wage) as standard_deviation from fifa;

#-----------------------------------------------------------------------------------------------------------------------------------

# 5. which player has the highest wage? who has the lowest?
# Ans:-
select * from fifa limit 10;

# max_wage
select name, wage as Highest_wage from fifa order by wage desc limit 1;

# min_wage
select `name`, wage as Lowest_wage from fifa order by wage asc limit 1;

#-----------------------------------------------------------------------------------------------------------------------------------

# 6. The player having the- best overall rating? worst overall rating?
# Ans:-
select * from fifa limit 10;

select name, overall as Best_Rating from fifa where overall =  (select max(overall) from fifa); 

#-----------------------------------------------------------------------------------------------------------------------------------

# 7. CLub having the highest total of overall rating? highest average of overall rating?
# Ans:-
select * from fifa limit 10;

select club, sum(overall) as highest_total_rating, avg(overall) as highest_avg_rating 
from fifa group by club order by highest_total_rating desc limit 1;

#-----------------------------------------------------------------------------------------------------------------------------------

# 8. what are the top 5 clubs based on the average rating of their players?
# Ans:-
select `club`, avg(overall) as highest_avg_rating 
from fifa group by `club` order by highest_avg_rating desc limit 5;

#-----------------------------------------------------------------------------------------------------------------------------------

# 9. What is the distribution of players whose preferred foot is left vs right?
# Ans:-
select preferred_foot, count(*) as cnt
from fifa
group by preferred_foot;

#-----------------------------------------------------------------------------------------------------------------------------------

# 10.  Which jersey number is the luckiest?
# Ans:-
select * from fifa limit 10;

select jersey_number as Lucky_number,
count(*) as selected_players
from fifa
group by jersey_number
order by selected_players desc limit 1;

#-----------------------------------------------------------------------------------------------------------------------------------

# 11. What is the frequency distribution of nationalities among players whose club name starts with M?
# Ans:-
select * from fifa limit 10;

select nationality,
count(*) as club_with_M
from fifa where club like "m%"
group by nationality
order by club_with_M desc;

#-----------------------------------------------------------------------------------------------------------------------------------

# 12. How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019(both inclusive)?
# Ans:-
select * from fifa limit 10;

select club, count(*) as cnt from fifa 
where str_to_date(joined, "%d-%m-%Y") 
between "2018-05-20" and "2019-04-10" 
group by club;

#-----------------------------------------------------------------------------------------------------------------------------------

# 13. How many players have joined their respective clubs date wise?
# Ans:-

select club, count(*) as total_joined, 
str_to_date(joined, '%d-%m-%Y') as joined_date 
from fifa group by club,joined_date order by joined_date asc;

#-----------------------------------------------------------------------------------------------------------------------------------

# 14. How many players have joined their respective clubs yearly?
# Ans:-
select * from fifa limit 10;

select club, year(str_to_date(joined, '%d-%m-%Y')) as Joined_Year,
count(*) as Yearly_Joined from fifa 
group by club, Joined_Year order by Joined_Year;

#-----------------------------------------------------------------------------------------------------------------------------------