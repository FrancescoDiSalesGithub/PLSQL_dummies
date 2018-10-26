FOR i IN (SELECT DISTINCT department_id, department_name   FROM departments) LOOP
DBMS_OUTPUT.PUT_LINE('HELLO'||i.department_id||' '||i.department_name);
end loop;
