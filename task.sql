USE ShopDB; 

SET @customer_id:=1;
SET @product_id:=1;
SET @count:=1;

INSERT INTO Orders (CustomerID, DATE)
VALUES (@customer_id, '2024-02-02');

START TRANSACTION; 

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (LAST_INSERT_ID(), @product_id, @count);

UPDATE Products SET WarehouseAmount = WarehouseAmount - @count WHERE ID = @product_id;

-- IF (SELECT WarehouseAmount FROM Products WHERE ID = @product_id) < 0 THEN
--   ROLLBACK;
-- END IF;

COMMIT; 