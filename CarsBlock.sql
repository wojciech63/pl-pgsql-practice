create or replace procedure GENERATE_CARS(n integer) language plpgsql as $$
	declare
		c_id INT;
		price int;
		description TEXT := '*** generated ***';
		make varchar(20)[] := array['porsche',
		'mercedes' , 'mercedes', 'audi', 'audi', 'audi', 'bmw',
		'bmw', 'bmw','mercedes'];
		model varchar(20)[] := array['911','e','glc', 'a4', 'a6', 
		'q5', '3', '5', 'x3','c'];
		pick int;
	begin
		for i in 1..n loop
			c_id := i;
			price := floor(random() * (100000-1000+1) + 1000)::int;
			pick := floor(random() * 10)::int + 1;
			raise notice '%, %, %, %, %', c_id, make[pick], model[pick], price, description;
			insert into cars (c_id, make, model, price, description)
			values (c_id, make[pick], model[pick], price, description);
		end loop;
	end $$;
			
/*
create table cars (
 c_id integer,
 make varchar(20),
 model varchar(20),
 price float,
 description char(250)
);
*/