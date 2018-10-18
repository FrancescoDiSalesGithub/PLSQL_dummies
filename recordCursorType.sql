declare

cursor statement is Select * from studente;
row_studente statement%rowtype;

c_nome varchar2(50);
c_cognome varchar2(50);
c_matricola varchar2(50);

begin


	open statement;

	loop

		fetch row_studente into row_studente;
		exit when statement%notfound;

		dbms_output.put_line(row_studente.nome);
		dbms_output.put_line(row_studente.cognome);
		dbms_output.put_line(row_studente.matricola);

	end loop;





end;