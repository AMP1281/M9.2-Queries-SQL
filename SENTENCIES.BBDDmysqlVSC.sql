select * from airports;
select * from carriers;
select * from flights;
/*EXERCISE 1*/
select count(flightID) from flights;
/*EXERCISE 2*/
select Origin, 
avg(ArrDelay) as prom_arribades, 
avg(DepDelay) as prom_sortides
from flights group by Origin;
/*EXERCISE 3*/
select Origin, colYear, colMonth, avg(ArrDelay)
from flights
group by Origin, colYear, colMonth;
/*EXERCISE 4*/
select a.Location, f.colYear, f.colMonth, avg(f.ArrDelay)
as prom_arribades from flights as f 
inner join airports as a on a.FAAIdentifier=f.Origin
group by Origin, colYear, colMonth
order by a.Location, f.colYear;
/*EXERCISE 5*/
select UniqueCarrier, colYear, colMonth, sum(Cancelled) as total_cancelled
from flights where Cancelled>0
group by UniqueCarrier
order by sum(Cancelled) desc, colYear;
/*EXERCISE 6*/
select TailNum, sum(Distance) from flights
where TailNum is not null
group by TailNum
order by sum(Distance) desc;
/*EXERCISE 7*/
select UniqueCarrier, avg(ArrDelay) as avgDelay from flights 
group by UniqueCarrier
having avg(ArrDelay)>10
order by avg(ArrDelay)desc;