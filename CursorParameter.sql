DECLARE
   v_name VARCHAR2(30);
   CURSOR p_cur(var_idhero VARCHAR2) IS SELECT * FROM SUPERHEROES_BACKUP WHERE SH_NAME=var_idhero;

BEGIN

   OPEN p_cur('reaper');

   LOOP
   
      FETCH p_cur INTO v_name;
      EXIT WHEN p_cur%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(p_cur);

   END LOOP;

   CLOSE p_cur;

END;
