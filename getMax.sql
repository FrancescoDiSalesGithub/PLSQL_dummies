declare

type number_array is varray(5) of integer;

mio_array number_array;

function getMax(x in number_array)
return integer
is output_max integer;
begin

	for i in 1..number_array.lenght-1 loop

		if(x(i)>x(i+1))then
			output_max=x(i);
		end if;

	end loop;

 return output_max;

end;


begin

	
mio_array=number_array(1,2,3,4,5);

dbms_output.put_line(getMax(mio_array));


end;