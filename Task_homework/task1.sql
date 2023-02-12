-- 1. Create the employees table    
create table employees(
		id serial primary key,
		employee_name varchar (50) not null
);

-- 2. Insert 70 rows into the employee table  
insert into employees(id, employee_name)
values (1,	'Abigail'),
		(2,	'Alexander'),
		(3,	'Alexis'),
		(4,	'Alyssa'),
		(5,	'Amanda'),
		(6,	'Andrew'),
		(7,	'Anna'),
		(8,	'Anthony'),
		(9,	'Ashley'),
		(10, 'Austin'),
		(11, 'Benjamin'),
		(12, 'Brandon'),
		(13, 'Brianna'),
		(14, 'Cameron'),
		(15, 'Christian'),
		(16, 'Christopher'),
		(17, 'Daniel'),
		(18, 'David'),
		(19, 'Destiny'),
		(20, 'Dylan'),
		(21, 'Elizabeth'),
		(22, 'Emily'),
		(23, 'Emma'),
		(24, 'Ethan'),
		(25, 'Grace'),
		(26, 'Hailey'),
		(27, 'Harley'),
		(28, 'Hannah'),
		(29, 'Hunter'),
		(30, 'Jacob'),
		(31, 'James'),
		(32, 'Jasmine'),
		(33, 'Jennifer'),
		(34, 'Jessica'),
		(35, 'John'),
		(36, 'Jonathan'),
		(37, 'Jose'),
		(38, 'Joseph'),
		(39, 'Joshua'),
		(40, 'Julia'),
		(41, 'Justin'),
		(42, 'Kaitlyn'),
		(43, 'Katherine'),
		(44, 'Kayla'),
		(45, 'Kevin'),
		(46, 'Lauren'),
		(47, 'Madison'),
		(48, 'Matthew'),
		(49, 'Megan'),
		(50, 'Michael'),
		(51, 'Morgan'),
		(52, 'Natalie'),
		(53, 'Nathan'),
		(54, 'Nicholas'),
		(55, 'Nicole'),
		(56, 'Noah'),
		(57, 'Olivia'),
		(58, 'Rachel'),
		(59, 'Robert'),
		(60, 'Ryan'),
		(61, 'Samantha'),
		(62, 'Samuel'),
		(63, 'Sarah'),
		(64, 'Sydney'),
		(65, 'Taylor'),
		(66, 'Thomas'),
		(67, 'Tyler'),
		(68, 'Victoria'),
		(69, 'William'),
		(70, 'Zachary');

-- 3. Create salary table   
create table salary(
		id serial primary key,
		monthly_salary int not null
);

--	4. Insert 15 rows into the salary table   
insert into salary(monthly_salary)
values  (1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);

-- 5. Create employee_salary table  	
create table employee_salary(
		id serial primary key,
		employee_id int not null unique,
		salary_id int not null);
