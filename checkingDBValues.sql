declare

cursor studente_view is select * from studente;
cursor esami_view is select * from esami;

type local_studente is record
(

	nome varchar2(50),
	cognome varchar2(50),
	matricola char(3)

);

type local_esame is record
(

	id_esame char(2),
	nome varchar2(50)

);


temp_studente local_studente;
temp_esame local_esame;

begin


open studente_view;

	loop

		fetch studente_view into temp_studente.nome,temp_studente.cognome,temp_studente.matricola;
		exit when studente_view%notfound;

		dbms_output.put_line('fetching cursore info studenti');
		dbms_output.put_line('studente: '||temp_studente.nome||' cognome: '||temp_studente.cognome||' matricola: '||temp_studente.matricola);

		if(temp_studente.nome='nicola')then
			dbms_output.put_line('oh santa is here');
		end if;


	end loop;

close studente_view;


open esami_view;

	loop

		fetch esami_view into temp_esame.id,temp_esame.nome;
		exit when esami_view%notfound;

		dbms_output.put_line('fetching cursore info esami');
		dbms_output.put_line('esame: '||temp_esame.id_esame||' nome: '||temp_esame.nome);

		if(temp_esame.nome='database') then
			dbms_output.put_line('yay databases');
		end if;

	end loop;

close esami_view;

end;