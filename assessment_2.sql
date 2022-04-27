-- displaying contents of bookings
select * from cd.bookings;

-- displaying contents of facilities
select * from cd.facilities;

-- displaying contents of members
select * from cd.members;

-- 1. Retrieving all the information from cd.facilities table
select * from cd.facilities;

-- 2. You want to print out a list of all of the facilities and their cost to members.
-- How would you retrieve a list of only facility names and costs?
select name, membercost from cd.facilities;

-- 3. How can you produce a list facilities that charge a fee to members?
select * from cd.facilities where membercost > 0 limit 5;

-- 4. Solution
select * from cd.facilities where membercost < (monthlymaintenance / 50) and membercost > 0 limit 2;

-- 5. Solution
select * from cd.facilities where name like '%Tennis%';

-- 6. Solution
select * from cd.facilities where facid in (1,5);

-- 7. Solution
select memid, surname, firstname, joindate from cd.members where joindate > '2012-08-31';

-- 8. Solution
select distinct(surname) from cd.members order by surname asc limit 10;

-- 9. Solution
select joindate from cd.members order by joindate desc limit 1;

-- 10. Solution
select * from cd.facilities;
select * from cd.members;
select * from cd.bookings;

select count(*) from cd.facilities where guestcost > 10;

-- 11. Solution
select * from cd.bookings;

select cd.facilities.facid, sum(slots) from cd.facilities 
join cd.bookings on cd.facilities.facid = cd.bookings.facid
where date(starttime) >='2012-09-01' 
and date(starttime) <='2012-09-30'
group by cd.facilities.facid
order by sum(slots);

-- 12. Solution
select * from cd.bookings;

select cd.facilities.facid, sum(slots) as total_slots from cd.facilities 
join cd.bookings on cd.facilities.facid = cd.bookings.facid
group by cd.facilities.facid
having sum(slots) > 1000
order by cd.facilities.facid;

-- 13. Solution
select * from cd.bookings;
select * from cd.facilities;

select starttime, name from cd.facilities
join cd.bookings on cd.facilities.facid = cd.bookings.facid
where name in ('Tennis Court 1', 'Tennis Court 2') and
date(starttime) ='2012-09-21'
order by starttime;

14. Solution:
select * from cd.bookings;
select * from cd.facilities;
select * from cd.members;

select starttime, firstname, surname from cd.facilities
join cd.bookings on cd.facilities.facid = cd.bookings.facid
join cd.members on cd.members.memid = cd.bookings.memid
where firstname = 'David' and surname = 'Farrell';

select count(*) from (select starttime, firstname, surname from cd.facilities
join cd.bookings on cd.facilities.facid = cd.bookings.facid
join cd.members on cd.members.memid = cd.bookings.memid
where firstname = 'David' and surname = 'Farrell') as T;



