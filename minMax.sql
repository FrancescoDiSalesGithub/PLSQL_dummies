
declare

somma_tot integer;
output_number integer;

procedure somma(x in integer,y in integer) 
is
begin

	somma_tot:=x+y;
	dbms_output.put_line(somma_tot);


end;

procedure max_number(x in integer,y in integer) 
is
begin

 if(x>y)then

 	dbms_output.put_line(x);
 	dbms_output.put_line('maggiore di');
 	dbms_output.put_line(y);

 else

	dbms_output.put_line(x);
 	dbms_output.put_line('maggiore di');
 	dbms_output.put_line(y);

 end if;

end;

procedure min_number(x in integer,y in integer)
is
begin

	if(x<y)then

		dbms_output.put_line(x);
		dbms_output.put_line('minore di');
		dbms_output.put_line(y);

	else

		dbms_output.put_line(y);
		dbms_output.put_line('minore di');
		dbms_output.put_line(x);



	end if;

end;

procedure min_max_equal_number(x in integer,y in integer,output out integer)
is
begin


	if(x<y)then

		dbms_output.put_line(x);
		dbms_output.put_line('minore di ');
		dbms_output.put_line(y);
		output:=-1;
	elsif(x>y) then

		dbms_output.put_line(x);
		dbms_output.put_line('maggiore di ');
		dbms_output.put_line(y);
		output:=0;

	else

		dbms_output.put_line(x);
		dbms_output.put_line('uguale a ');
		dbms_output.put_line(y);
		output:=1;
	end if;


end;




begin

	somma(2,2);
	max_number(3,2);
	min_number(3,2);
	min_max_equal_number(3,2,output_number);

	case output_number

		when -1 then
			dbms_output.put_line('minore');
		when 0 then
			dbms_output.put_line('maggiore');
		when 1 then
			dbms_output.put_line('uguale');

	end case;


end;