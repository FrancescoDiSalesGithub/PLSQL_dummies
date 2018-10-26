declare

cursor studente_cursor is select * from studente;

type studente_record is record
(

 matricola varchar2(50),
 nome varchar2(50),
 cognome varchar2(50)

);
studente_dati studente_record;


begin

 open studente_cursor;

 loop
  
 fetch studente_cursor into studente_dati.matricola,studente_dati.nome,studente_dati.cognome;

MERGE INTO studente e USING studentebk bk ON (e.matricola = bk.matricola)

  WHEN MATCHED THEN update SET e.nome=studente_dati.nome,e.cognome=studente_dati.cognome where e.matricola=bk.matricola 
  WHEN NOT MATCHED THEN insert(e.matricola,e.nome,e.cognome) values(studente_dati.matricola,studente_dati.nome,studente_dati.cognome); 

exit when studente_cursor%notfound;
	
   
end loop;

close studente_cursor;

end;
