# Trigger to update inventory

This project consists of two trigger queries that adjust the stock on hand of a toys store, when either there’s a new sale or a product return. 
The tables are “sales” and “inventory”.
A trigger in MySQL can be triggered with the “insert”, “update” or “delete” keywords that take action in other tables. 

When there’s a new sale, a new row gets inserted into the sales table along with its columns, so this insert action is the trigger. 

 ![image](https://github.com/lmmendivil/Trigger-to-update-inventory/assets/159588430/1f49eba0-d07d-40d9-8efa-367a63a8fbff)


Here’s view of the inventory table before the trigger was created. 

![image](https://github.com/lmmendivil/Trigger-to-update-inventory/assets/159588430/8522a097-61ce-408d-98a5-efa211e4bfe6)

 
The first row is highlighted as it is the product that’s going to be used for testing the trigger. We see that there are 27 units in stock, therefore whenever units of Product_ID 1 are sold in Store_ID 1, this column Stock_On_Hand should be updated. 

Now take a look at the table below, a new sale was generated on 02-25-2024, that comprised 3 units of Product_ID 1 of the Store_ID 1. 

![image](https://github.com/lmmendivil/Trigger-to-update-inventory/assets/159588430/d3c8f1d8-9c65-4c28-86df-48cadfb6fff1)
![image](https://github.com/lmmendivil/Trigger-to-update-inventory/assets/159588430/dacadc3d-263c-4e55-b798-dc1b7922c659)
  
The last sale must have triggered the update_stock_on_hand trigger. Let’s see how’s the inventory table now. 

![image](https://github.com/lmmendivil/Trigger-to-update-inventory/assets/159588430/a88d8dbf-d765-4fa8-bb2e-c66d4a2fbd4a)

 
As you can see there are 24 units of Product_ID 1 in Store_ID 1. Before the sale there were 27. Therefore, the trigger worked. 

The following trigger was created to adjust the stock on hand column in the inventory table, whenever there is a return of product. This is triggered after a delete action in the sales table. 

 

