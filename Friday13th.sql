do $$
	declare
		start_date date := date '2025-01-01';
		end_date date := date '2025-12-31';
	begin
		while start_date <= end_date loop
			if extract(day from start_date) = 13 and extract(dow from start_date) = 5 then
			raise notice '% is Friday 13th', to_char(start_date, 'YYYY-MM-DD');
			end if;
			start_date := start_date + interval '1 day';
		end loop;
end $$