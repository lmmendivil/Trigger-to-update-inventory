
#CREATING TRIGGER TO UPDATE Stock_On_Hand FIELD IN inventory TABLE AFTER A SALES HAS BEEN DONE
DELIMITER $$
DROP TRIGGER IF EXISTS update_stock_on_hand;
CREATE TRIGGER update_stock_on_hand
	AFTER INSERT ON sales
	FOR EACH ROW
BEGIN
	UPDATE toys_store.inventory
	SET Stock_On_Hand = Stock_On_Hand - NEW.Units
    WHERE Product_ID = NEW.Product_ID 
		  AND Store_ID = NEW.Store_ID
    ;   
END $$
DELIMITER ;


#CREATING A NEW SALE TO TEST TRIGGER  
#Selling 3 units of product_id 1 of store_id 1 with current stock_on_hand of 27 - should be left with 24 after sale is complete. 
INSERT INTO sales
VALUES(355441+1, '2024-02-25', 1, 1, 3);


#CREATING A TRIGGER TO ADJUST Stock_On_Hand IN CASE OF PRODUCT RETURN
DELIMITER $$
CREATE TRIGGER update_stock_product_return
	AFTER DELETE ON sales
	FOR EACH ROW
BEGIN
	UPDATE inventory
    SET Stock_On_Hand = Stock_On_Hand + OLD.Units
    WHERE Store_ID = OLD.Store_ID AND Product_ID = OLD.Product_ID
;
END $$
DELIMITER ;



#REVERSING A SALES DUE TO PRODUCT RETURN
DELETE FROM sales
WHERE Sale_ID = 355441+1 
;









