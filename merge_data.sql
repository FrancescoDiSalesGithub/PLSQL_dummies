procedure backup_dati
is

cursor c1 is select * from studente;

type studente_record is record(

matricola varchar(50),
nome varchar(50),
cognome varchar(50)

);

studente_origin studente_record;
studente_dest studente_record;

begin

 open c1;
 
  loop

  fetch c1 into studente_origin.matricola,studente_origin.nome,studente_origin.cognome;
  exit when c1%notfound;

  insert into studentibk values(studente_origin.matricola,studente_origin.nome,studente_origin.cognome);

  exception when DUP_VAL_ON_INDEX then

   update studentebk set matricola=studente_origin.matricola,nome=studente_origin.nome,cognome=studente_origin.cognome;

   end;

  end loop;

 close c1;


end;
