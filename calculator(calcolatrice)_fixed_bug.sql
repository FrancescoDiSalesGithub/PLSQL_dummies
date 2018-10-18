declare

result_quoziente integer;
result_somma integer;
result_differenza integer;
result_prodotto integer;

error_divisione exception;

function somma(x in integer,y in integer)
return integer
is somma_out integer;
begin

	somma_out:=x+y;
	return somma_out;

end;

function differenza(x in integer,y in integer)
return integer
is differenza_out integer;
begin

	differenza_out:=x-y;
	return differenza_out;	

end;


function prodotto(x in integer,y in integer)
return integer
is prodotto_out integer;
begin

	prodotto_out:=x*y;
	return prodotto_out;

end;

function quoziente(x in integer,y in integer)
return integer
is quoziente_out integer;
begin


	if(y=0)then
		raise error_divisione;
	end if;

	quoziente_out:=x/y;
	return quoziente_out;

end;

begin

	result_somma:=somma(2,2);
	result_differenza:=differenza(2,2);

	result_quoziente:=quoziente(2,2);
	result_prodotto:=prodotto(2,2);

	dbms_output.put_line(result_somma);
	dbms_output.put_line(result_differenza);
	dbms_output.put_line(result_quoziente);
	dbms_output.put_line(result_prodotto);

	exception when

		error_divisione then
			dbms_output.put_line('impossibile dividere per 0');


end;