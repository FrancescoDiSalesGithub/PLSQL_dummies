declare
type mio_record is record(

nome varchar2(20),
cognome varchar2(20)


);

prova_record mio_record;

begin

	prova_record.nome:='michele';
	prova_record.cognome:='michelini';
		
	dbms_output.put_line(prova_record.nome);
	dbms_output.put_line(prova_record.cognome);




end;