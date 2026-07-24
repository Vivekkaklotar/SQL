-- SESSION 8: Introduction to PL/SQL (Oracle)
-- Run this file in Oracle SQL Developer, not MySQL Workbench.
SET SERVEROUTPUT ON;

DECLARE
  v_name VARCHAR2(50) := 'Aarav'; v_age NUMBER := 22;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
END;
/

DECLARE v_amount NUMBER := 650;
BEGIN
  IF v_amount > 500 THEN DBMS_OUTPUT.PUT_LINE('Eligible for free delivery');
  ELSE DBMS_OUTPUT.PUT_LINE('Delivery charges apply'); END IF;
END;
/

DECLARE v_count NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(v_count); v_count := v_count + 1;
    EXIT WHEN v_count > 5;
  END LOOP;
END;
/

CREATE TABLE PRODUCTS (PRODUCT_NAME VARCHAR2(100));
INSERT INTO PRODUCTS VALUES ('Laptop');
INSERT INTO PRODUCTS VALUES ('Keyboard');

DECLARE
  CURSOR c_products IS SELECT product_name FROM PRODUCTS;
  v_name PRODUCTS.product_name%TYPE;
BEGIN
  OPEN c_products;
  LOOP
    FETCH c_products INTO v_name;
    EXIT WHEN c_products%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_name);
  END LOOP;
  CLOSE c_products;
END;
/

DECLARE
  a NUMBER := 10; b NUMBER := 0; result_value NUMBER;
BEGIN
  result_value := a / b;
  DBMS_OUTPUT.PUT_LINE(result_value);
EXCEPTION
  WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
END;
/
