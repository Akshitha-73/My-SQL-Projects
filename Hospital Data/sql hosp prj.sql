use project_hosp;

select * from affiliated_with;
select * from appointment;
select * from block;
select * from department;
select * from medication;
select * from nurse;
select * from on_call;
select * from patient;
select * from  physician;
select * from procedures;
select * from prescribes;
select * from room;
select * from stay;
select * from trained_in;
select * from undergoes;	

-- Write a query in SQL to find all the information of the nurses who are yet to be registered. 
select * from nurse
where registered='f';
		
-- Write a query in SQL to find the name of the nurse who are the head of their department.
select * from nurse
where position='Head Nurse';

-- Write a query in SQL to obtain the name of the physicians who are the head of each department.

select p.name as physician_name,
d.name as department_name
 from physician p
inner join department d
on p.employeeid = d.head;

-- Write a query in SQL to count the number of patients who taken appointment with at least one physician.
select count(distinct(patient)) 
 as patients_appointment 
from appointment;

-- Write a query in SQL to find the floor and block where the room number 212 belongs to.
select roomnumber, roomtype,blockfloor from room
where roomnumber = 212;

-- Write a query in SQL to count the number available rooms
select count(unavailable)  as available_rooms
 from room
where unavailable='f';

-- Write a query in SQL to count the number of unavailable rooms.
select count(unavailable)  as unavailable_rooms
 from room
where unavailable='t';

-- Write a query in SQL to obtain the name of the physician and the departments they are affiliated with. 
select  employeeid, department_id,p.name as physician_name, 
d.name as depart_name from department d 
inner join affiliated_with a
on d.department_id=a.department
inner join physician p
on p.employeeid=a.physician
where  a.primaryaffiliation ='t';

-- Write a query in SQL to obtain the name of the physicians who are trained for a special treatement
select distinct(p.employeeid),p.name  as physician_name, pr.name as special_treatment_name  from physician as p
inner join trained_in
on p.employeeid=trained_in.physician
inner join procedures as pr
on pr.code=trained_in.treatment;

-- Write a query in SQL to obtain the name of the physicians with department who are yet to be affiliated.
select a.physician, a.department,p.name as physician_name ,d.name as department_name from physician as p
inner join affiliated_with as a
on p.employeeid=a.physician  
inner join department d 
on d.department_id =a.department
where primaryaffiliation='f';

-- Write a query in SQL to obtain the name of the physicians who are not a specialized physician.
select employeeid, name as physician_name 
from physician 
where employeeid not in 
(select distinct(physician) from trained_in);

-- Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement. 
select pt.name as patient_name ,p.name as physician_name from patient as pt
inner join physician as p
on p.employeeid=pt.pcp;

-- Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment.
select p.name as patient_name, count(distinct(physician)) as no_of_phy from patient as p
inner join appointment as a
on a.patient=p.ssn
group by p.name;

-- Write a query in SQL to count number of unique patients who got an appointment for examination room C. 

select examinationroom, count(distinct(patient)) 
as patients_room_c from appointment
where examinationroom='C';

-- Write a query in SQL to find the name of the patients and the number of the room where they have to go for their treatment. 
select p.name as patient_name,s.room as roomnumber
from patient p
inner join stay s
on p.ssn = s.patient
inner join room r
on s.room = r.roomnumber;

-- Write a query in SQL to find the name of the nurses and the room scheduled, where they will assist the physicians.
select n.employeeid as nurse_id,n.name, s.room as room_number from nurse as n
inner join undergoes u 
on u.ingnurse=n.employeeid
inner join stay as s
on s.stayid=u.stay;

-- Write a query in SQL to find the name of the patients who taken the appointment on the 25th of April at 10 am,
--  and also display their physician, assisting nurses and room no.
select p.name as patient_name,py.name as physician_name,
n.name as nurse_name,room as room_no from physician as py
inner join appointment as a
on a.physician=py.employeeid
inner join patient as p
on p.ssn=a.patient
inner join nurse as n
on n.employeeid=a.prepnurse
inner join stay 
on stay.patient=p.ssn
where start_dt='25/4/2008';

-- Write a query in SQL to find the name of patients and their physicians who does not require any assistance of a nurse.
select p.name as patient_name , py.name as physician_name from undergoes as u
left join patient as p
on u.patient=p.ssn
left join physician as py
on u.physicianassit =py.employeeid
where ingnurse is null;

-- 19)Write a query in SQL to find the name of the patients, their treating physicians and medication
select p.name as patient_name, ph.name as physician_name, m.name as medicine_name
from patient p
inner join undergoes u
on p.ssn = u.patient
inner join prescribes pr
on u.patient = pr.patient
inner join medication m
on pr.medication = m.code
inner join physician ph
on pr.physician = ph.employeeid;

-- 20)Write a query in SQL to find the name of the patients who taken an advanced appointment, and also display their physicians and medication.
select p.ssn ,p.name as patient_name, ph.name as physician_name, m.name as medicine_name
from patient p
left join appointment a
on p.ssn = a.patient
left join prescribes pr
on a.patient = pr.patient
left join medication m
on pr.medication = m.code
inner join physician ph
on pr.physician = ph.employeeid;

-- 21)Write a query in SQL to find the name and medication for those patients who did not take any appointment.
select p.name, m.name as medicine_name from prescribes as pr
left join patient p
on pr.patient=p.ssn
left join medication m
on pr.medication=m.code
where appointment is null;

-- 22)Write a query in SQL to count the number of available rooms in each block.  
select count(roomnumber) as no_of_rooms, blockcode as block_number from room
where unavailable='f'
group by blockcode;

-- 23)Write a query in SQL to count the number of available rooms in each floor.
select blockfloor as floor_number,count(roomnumber) as no_of_rooms  from room
where unavailable='f'
group by blockfloor;

 -- 24)Write a query in SQL to count the number of available rooms for each block in each floor. 
select blockcode as block_number,blockfloor as floor_number,count(roomnumber) as no_of_rooms  from room
where unavailable='f'
group by blockcode,blockfloor;

-- 25)Write a query in SQL to count the number of unavailable rooms for each block in each floor. 
select blockcode as block_number,blockfloor as floor_number,count(roomnumber) as no_of_rooms  from room
where unavailable='t'
group by blockcode,blockfloor;

-- 26)Write a query in SQL to find out the floor where the maximum no of rooms are available. 
select blockfloor as floor_number,count(roomnumber)  as no_of_rooms  from room
where unavailable='f'
group by blockfloor 
order by no_of_rooms desc
limit 1;

-- 27)Write a query in SQL to find out the floor where the minimum no of rooms are available
select blockfloor as floor_number,count(roomnumber)  as no_of_rooms  from room
where unavailable='f'
group by blockfloor 
order by no_of_rooms 
limit 1;

-- 28)Write a query in SQL to obtain the name of the patients, their block, floor, and room number where they are admitted. 
select p.ssn,p.name ,  blockcode as block_number,blockfloor as floor_number, roomnumber from room
inner join stay 
on stay.room=room.roomnumber
inner join patient  p
on p.ssn=stay.patient;

-- 29)Write a query in SQL to obtain the nurses and the block where they are booked for attending the patients on call.
select n.employeeid,  n.name, blockcode from on_call
inner join nurse n
on n.employeeid=on_call.nurse;

-- 30)Write a query in SQL to make a report which will show -
-- ) name of the patient,
-- b) name of the physician who is treating him or her,
-- c) name of the nurse who is attending him or her,
-- d) which treatement is going on to the patient,
-- e) the date of release,
-- f) in which room the patient has admitted and which floor and block the room belongs to respectively

select p.name, ph.name,n.name, pr.name , s.room, r.blockcode,r.blockfloor
from undergoes as u
left join patient p
on u.patient=p.ssn
left join physician ph
on u.physicianassit=ph.employeeid
left join nurse n
on u.ingnurse=n.employeeid
left join procedures  pr 
on u.procedures=pr.code
inner join stay s
on u.stay=s.stayid
inner join room r
on s.room=r.roomnumber;

-- 31) Write a SQL query to obtain the names of all the physicians performed a medical procedure but they are not ceritifed to perform. 

select ph.name as physician_name,u.procedures
from physician ph
inner join undergoes u
on ph.employeeid = u.physicianassit
left outer join trained_in ti
on u.physicianassit = ti.physician
and u.procedures  = ti.treatment
where treatment is null;

-- 32)Write a query in SQL to obtain the names of all the physicians, their procedure, date when the procedure was carried out and 
-- name of the patient on which procedure have been carried out but those physicians are not cetified for that procedure.
select p.name as patient_name,ph.name as physician_name,date as date_of_procedure,
       pr.name as procedure_name,code as procedure_code
from physician ph
inner join undergoes u
on ph.employeeid = u.physicianassit
left outer join trained_in ti
on u.physicianassit = ti.physician
and u.procedures = ti.treatment
left outer join patient p
on u.patient = p.ssn
left outer join procedures pr
on u.procedures = pr.code
where treatment is null;


-- 33) Write a query in SQL to obtain the name and position of all physicians who completed a 
-- medical procedure with certification after the date of expiration of their certificate. 
select p.employeeid, p.name, p.position from physician p
where employeeid in (select u.physicianassit from undergoes as u
inner join trained_in t
on u.physicianassit=t.physician
where date>certificationexpires);

-- 34) Write a query in SQL to obtain the name of all those physicians who completed a 
-- medical procedure with certification after the date of expiration of their certificate, 
-- their position, procedure they have done, date of procedure, name of the patient on which the procedure
--  had been applied and the date when the certification expired.
select p.employeeid  as physician_id,
p.name as physician_name ,p.position as physician_position 
,pt.name as patient_name ,pr.name as procedure_name ,t.certificationexpires,u.date as date_of_procedure from physician p
inner join undergoes u
on u.physicianassit=p.employeeid
inner join trained_in t
on u.physicianassit=t.physician
inner join procedures pr
on t.treatment=pr.code
inner join patient pt
on u.patient=pt.ssn
where date>certificationexpires;

-- 35) Write a query in SQL to obtain the names of all the nurses who have ever been on call for room 122. 
select n.employeeid, n.name as nurse_name  from nurse n 
inner join on_call o
on n.employeeid=o.nurse
inner join room
on o.blockcode=room.blockcode
where roomnumber =122;

-- 36) Write a query in SQL to Obtain the names of all patients who has been prescribed some medication by his/her 
-- physician who has carried out primary care and the name of that physician.  
select p.pcp,p.name as patient_name, py.name as physician_name from physician py
inner join patient p
on   py.employeeid=p.pcp
inner join prescribes 
on py.employeeid= prescribes.physician;

-- 37) Write a query in SQL to obtain the names of all patients who has been undergone a procedure costing
--  more than $5,000 and the name of that physician who has carried out primary care.
select p.ssn,ph.employeeid as physician_id,p.name as patient_name, ph.name as physician_name 
from patient p
inner join undergoes u
on p.ssn = u.patient
inner join procedures pr
on u.procedures = pr.code
inner join physician ph
on p.pcp = ph.employeeid
where cost > 5000;

-- 38)Write a query in SQL to Obtain the names of all patients who had at least two appointment where the nurse
--  who prepped the appointment was a registered nurse and the physician who has carried out primary care. 
select a.patient as patient_id,p.name as patient_name,ph.name as physician_name
from patient p
inner join appointment a
on p.ssn = a.patient
inner join nurse n
on a.prepnurse = n.employeeid
inner join physician ph
on p.pcp = ph.employeeid
where registered='t'
group by a.patient,p.name,ph.name
having count(start_dt) >=2;

-- write a query in SQL to Obtain the names of all patients whose primary care is taken by a physician 
-- who is not the head of any department and name of that physician along with their primary care physician.

select p.pcp, p.name as patient_name, ph.name as physician_name 
from patient p
inner join physician as ph
on ph.employeeid=p.pcp
where employeeid not in (select head from department);


