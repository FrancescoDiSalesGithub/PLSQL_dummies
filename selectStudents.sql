declare

nome varchar2(50);
cognome varchar2(50);
matricola varchar2(50);

cursor studenti is select * from studente;

begin

open studenti;

loop
	
	fetch studenti into nome,cognome,matricola;
	exit when studenti%notfound;
	
	dbms_output.put_line(nome);
	dbms_output.put_line(cognome);
	dbms_output.put_line(matricola);

	

end loop;

close studenti;


end