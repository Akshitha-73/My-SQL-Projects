create database Project_233_3;
use Project_233_3;

CREATE TABLE MaterialData (
    Material BIGINT,
    Material_Description VARCHAR(255),
    Plant INT,
    Storage_Location VARCHAR(50),
    Movement_Type INT,
    Special_Stock VARCHAR(50),
    Material_Document BIGINT,
    Material_Doc_Item INT,
    Posting_Date VARCHAR(50),
    Qty_in_Un_of_Entry INT,
    Unit_of_Entry VARCHAR(50),
    Batch VARCHAR(50),
    `Order` VARCHAR(50),
    `Reference` VARCHAR(255),
    Movement_Type_Text VARCHAR(255),
    Asset VARCHAR(50),
    Subnumber VARCHAR(50),
    Counter INT,
    Routing_Number INT,
    Document_Date VARCHAR(50),
    Qty_in_OPUn INT,
    Order_Price_Unit VARCHAR(50),
    Order_Unit VARCHAR(50),
    Qty_in_Order_Unit INT,
    Company_Code INT,
    Valuation_Type VARCHAR(50),
    Entry_Date VARCHAR(50),
    Time_of_Entry VARCHAR(50),
    Amount_in_LC BIGINT,
    Purchase_Order  VARCHAR(50),
    Smart_Number VARCHAR(50),
    Item INT,
    Ext_Amount_in_LC INT,
    Sales_Value INT,
    Reason_for_Movement INT,
    Sales_Order VARCHAR(50),
    Sales_Order_Schedule INT,
    Sales_Order_Item INT,
    Cost_Center  VARCHAR(50),
    Customer VARCHAR(50),
    Movement_Indicator VARCHAR(50),
    Consumption VARCHAR(50),
    Receipt_Indicator VARCHAR(50),
    Supplier VARCHAR(50),
    Sales_Order_1 VARCHAR(50),
    Sales_Order_Item_1 VARCHAR(50),
    Base_Unit_of_Measure VARCHAR(50),
    Quantity INT,
    Material_Doc_Year VARCHAR(50),
    Network VARCHAR(50),
    Activity VARCHAR(50),
    WBS_Element VARCHAR(50),
    Reservation INT,
    Item_No_Stock_Transfer_Reserv INT,
    Debit_Credit_Ind VARCHAR(50),
    User_Name VARCHAR(50),
    Trans_Event_Type VARCHAR(50),
    Sales_Value_inc_VAT INT,
    Currency VARCHAR(50),
    Goods_Receipt_Issue_Slip VARCHAR(50),
    Item_Automatically_Created VARCHAR(50),
    Original_Line_Item INT,
    Multiple_Account_Assignment VARCHAR(50),
    Product_Code VARCHAR(50),
    Product_Description VARCHAR(255),
    Material_Type VARCHAR(50),
    Vendor_Code VARCHAR(50)
);

LOAD DATA INFILE 'D:\\Project 3\\Data Set-P3\\DataSet\\Dataset_SQL.csv'
INTO TABLE MaterialData
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE MaterialData;
select * from MaterialData;

SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'MaterialData';

set sql_safe_updates = 0;

UPDATE MaterialData
SET Posting_Date = STR_TO_DATE(Posting_Date, '%d/%m/%Y');
UPDATE MaterialData
SET Document_Date = STR_TO_DATE(Document_Date, '%d/%m/%Y');
UPDATE MaterialData
SET Entry_Date = STR_TO_DATE(Entry_Date, '%d/%m/%Y');
UPDATE MaterialData
SET Time_of_Entry = STR_TO_DATE(Time_of_Entry, '%h:%i:%s %p');

SELECT * FROM MaterialData
WHERE Vendor_Code NOT REGEXP '^[0-9]+$' OR Vendor_Code IS NULL OR TRIM(Vendor_Code) = '';

SELECT 
    SUM(CASE WHEN Material IS NULL OR Material = '' THEN 1 ELSE 0 END) AS Missing_Material,
    SUM(CASE WHEN Material_Description IS NULL OR Material_Description = '' THEN 1 ELSE 0 END) AS Missing_Material_Description,
    SUM(CASE WHEN Plant IS NULL OR Plant = '' THEN 1 ELSE 0 END) AS Missing_Plant,
    SUM(CASE WHEN Storage_Location IS NULL OR Storage_Location = '' THEN 1 ELSE 0 END) AS Missing_Storage_Location,
    SUM(CASE WHEN Movement_Type IS NULL OR Movement_Type = '' THEN 1 ELSE 0 END) AS Missing_Movement_Type,
    SUM(CASE WHEN Special_Stock IS NULL OR Special_Stock = '' THEN 1 ELSE 0 END) AS Missing_Special_Stock,
    SUM(CASE WHEN Material_Document IS NULL OR Material_Document = '' THEN 1 ELSE 0 END) AS Missing_Material_Document,
    SUM(CASE WHEN Material_Doc_Item IS NULL OR Material_Doc_Item = '' THEN 1 ELSE 0 END) AS Missing_Material_Doc_Item,
    SUM(CASE WHEN Posting_Date IS NULL OR Posting_Date = '' THEN 1 ELSE 0 END) AS Missing_Posting_Date,
    SUM(CASE WHEN Qty_in_Un_of_Entry IS NULL OR Qty_in_Un_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_Un_of_Entry,
    SUM(CASE WHEN Unit_of_Entry IS NULL OR Unit_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Unit_of_Entry,
    SUM(CASE WHEN Batch IS NULL OR Batch = '' THEN 1 ELSE 0 END) AS Missing_Batch,
    SUM(CASE WHEN `Order` IS NULL OR `Order` = '' THEN 1 ELSE 0 END) AS Missing_Order,
    SUM(CASE WHEN `Reference` IS NULL OR `Reference` = '' THEN 1 ELSE 0 END) AS Missing_Reference,
    SUM(CASE WHEN Movement_Type_Text IS NULL OR Movement_Type_Text = '' THEN 1 ELSE 0 END) AS Missing_Movement_Type_Text,
    SUM(CASE WHEN Asset IS NULL OR Asset = '' THEN 1 ELSE 0 END) AS Missing_Asset,
    SUM(CASE WHEN Subnumber IS NULL OR Subnumber = '' THEN 1 ELSE 0 END) AS Missing_Subnumber,
    SUM(CASE WHEN Counter IS NULL OR Counter = '' THEN 1 ELSE 0 END) AS Missing_Counter,
    SUM(CASE WHEN Routing_Number IS NULL OR Routing_Number = '' THEN 1 ELSE 0 END) AS Missing_Routing_Number,
    SUM(CASE WHEN Document_Date IS NULL OR Document_Date = '' THEN 1 ELSE 0 END) AS Missing_Document_Date,
    SUM(CASE WHEN Qty_in_OPUn IS NULL OR Qty_in_OPUn = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_OPUn,
    SUM(CASE WHEN Order_Price_Unit IS NULL OR Order_Price_Unit = '' THEN 1 ELSE 0 END) AS Missing_Order_Price_Unit,
    SUM(CASE WHEN Order_Unit IS NULL OR Order_Unit = '' THEN 1 ELSE 0 END) AS Missing_Order_Unit,
    SUM(CASE WHEN Qty_in_Order_Unit IS NULL OR Qty_in_Order_Unit = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_Order_Unit,
    SUM(CASE WHEN Company_Code IS NULL OR Company_Code = '' THEN 1 ELSE 0 END) AS Missing_Company_Code,
    SUM(CASE WHEN Valuation_Type IS NULL OR Valuation_Type = '' THEN 1 ELSE 0 END) AS Missing_Valuation_Type,
    SUM(CASE WHEN Entry_Date IS NULL OR Entry_Date = '' THEN 1 ELSE 0 END) AS Missing_Entry_Date,
    SUM(CASE WHEN Time_of_Entry IS NULL OR Time_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Time_of_Entry,
    SUM(CASE WHEN Amount_in_LC IS NULL OR Amount_in_LC = '' THEN 1 ELSE 0 END) AS Missing_Amount_in_LC,
    SUM(CASE WHEN Purchase_Order IS NULL OR Purchase_Order = '' THEN 1 ELSE 0 END) AS Missing_Purchase_Order,
    SUM(CASE WHEN Smart_Number IS NULL OR Smart_Number = '' THEN 1 ELSE 0 END) AS Missing_Smart_Number,
    SUM(CASE WHEN Item IS NULL OR Item = '' THEN 1 ELSE 0 END) AS Missing_Item,
    SUM(CASE WHEN Ext_Amount_in_LC IS NULL OR Ext_Amount_in_LC = '' THEN 1 ELSE 0 END) AS Missing_Ext_Amount_in_LC,
    SUM(CASE WHEN Sales_Value IS NULL OR Sales_Value = '' THEN 1 ELSE 0 END) AS Missing_Sales_Value,
    SUM(CASE WHEN Reason_for_Movement IS NULL OR Reason_for_Movement = '' THEN 1 ELSE 0 END) AS Missing_Reason_for_Movement,
    SUM(CASE WHEN Sales_Order IS NULL OR Sales_Order = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order,
    SUM(CASE WHEN Sales_Order_Schedule IS NULL OR Sales_Order_Schedule = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order_Schedule,
    SUM(CASE WHEN Sales_Order_Item IS NULL OR Sales_Order_Item = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order_Item,
    SUM(CASE WHEN Cost_Center IS NULL OR Cost_Center = '' THEN 1 ELSE 0 END) AS Missing_Cost_Center,
    SUM(CASE WHEN Customer IS NULL OR Customer = '' THEN 1 ELSE 0 END) AS Missing_Customer,
    SUM(CASE WHEN Movement_Indicator IS NULL OR Movement_Indicator = '' THEN 1 ELSE 0 END) AS Missing_Movement_Indicator,
    SUM(CASE WHEN Consumption IS NULL OR Consumption = '' THEN 1 ELSE 0 END) AS Missing_Consumption,
    SUM(CASE WHEN Receipt_Indicator IS NULL OR Receipt_Indicator = '' THEN 1 ELSE 0 END) AS Missing_Receipt_Indicator,
    SUM(CASE WHEN Supplier IS NULL OR Supplier = '' THEN 1 ELSE 0 END) AS Missing_Supplier,
    SUM(CASE WHEN Sales_Order_1 IS NULL OR Sales_Order_1 = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order_1,
    SUM(CASE WHEN Sales_Order_Item_1 IS NULL OR Sales_Order_Item_1 = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order_Item_1,
    SUM(CASE WHEN Base_Unit_of_Measure IS NULL OR Base_Unit_of_Measure = '' THEN 1 ELSE 0 END) AS Missing_Base_Unit_of_Measure,
    SUM(CASE WHEN Quantity IS NULL OR Quantity = '' THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN Material_Doc_Year IS NULL OR Material_Doc_Year = '' THEN 1 ELSE 0 END) AS Missing_Material_Doc_Year,
    SUM(CASE WHEN Network IS NULL OR Network = '' THEN 1 ELSE 0 END) AS Missing_Network,
    SUM(CASE WHEN Activity IS NULL OR Activity = '' THEN 1 ELSE 0 END) AS Missing_Activity,
    SUM(CASE WHEN WBS_Element IS NULL OR WBS_Element = '' THEN 1 ELSE 0 END) AS Missing_WBS_Element,
    SUM(CASE WHEN Reservation IS NULL OR Reservation = '' THEN 1 ELSE 0 END) AS Missing_Reservation,
    SUM(CASE WHEN Item_No_Stock_Transfer_Reserv IS NULL OR Item_No_Stock_Transfer_Reserv = '' THEN 1 ELSE 0 END) AS Missing_Item_No_Stock_Transfer_Reserv,
    SUM(CASE WHEN Debit_Credit_Ind IS NULL OR Debit_Credit_Ind = '' THEN 1 ELSE 0 END) AS Missing_Debit_Credit_Ind,
    SUM(CASE WHEN User_Name IS NULL OR User_Name = '' THEN 1 ELSE 0 END) AS Missing_User_Name,
    SUM(CASE WHEN Trans_Event_Type IS NULL OR Trans_Event_Type = '' THEN 1 ELSE 0 END) AS Missing_Trans_Event_Type,
    SUM(CASE WHEN Sales_Value_inc_VAT IS NULL OR Sales_Value_inc_VAT = '' THEN 1 ELSE 0 END) AS Missing_Sales_Value_inc_VAT,
    SUM(CASE WHEN Currency IS NULL OR Currency = '' THEN 1 ELSE 0 END) AS Missing_Currency,
    SUM(CASE WHEN Goods_Receipt_Issue_Slip IS NULL OR Goods_Receipt_Issue_Slip = '' THEN 1 ELSE 0 END) AS Missing_Goods_Receipt_Issue_Slip,
    SUM(CASE WHEN Item_Automatically_Created IS NULL OR Item_Automatically_Created = '' THEN 1 ELSE 0 END) AS Missing_Item_Automatically_Created,
    SUM(CASE WHEN Original_Line_Item IS NULL OR Original_Line_Item = '' THEN 1 ELSE 0 END) AS Missing_Original_Line_Item,
    SUM(CASE WHEN Multiple_Account_Assignment IS NULL OR Multiple_Account_Assignment = '' THEN 1 ELSE 0 END) AS Missing_Multiple_Account_Assignment,
    SUM(CASE WHEN Product_Code IS NULL OR Product_Code = '' THEN 1 ELSE 0 END) AS Missing_Product_Code,
    SUM(CASE WHEN Product_Description IS NULL OR Product_Description = '' THEN 1 ELSE 0 END) AS Missing_Product_Description,
    SUM(CASE WHEN Material_Type IS NULL OR Material_Type = '' THEN 1 ELSE 0 END) AS Missing_Material_Type,
    SUM(CASE WHEN Vendor_Code IS NULL OR Vendor_Code = '' THEN 1 ELSE 0 END) AS Missing_Vendor_Code
FROM MaterialData;

#delete empty rows
ALTER TABLE MaterialData
DROP COLUMN Special_Stock, 
DROP COLUMN Batch, 
DROP COLUMN Asset, 
DROP COLUMN Subnumber,
DROP COLUMN Counter, 
DROP COLUMN Routing_Number, 
DROP COLUMN Valuation_Type, 
DROP COLUMN Smart_Number, 
DROP COLUMN Ext_Amount_in_LC, 
DROP COLUMN Sales_Value,
DROP COLUMN Reason_for_Movement,
DROP COLUMN Sales_Order, 
DROP COLUMN Sales_Order_Schedule, 
DROP COLUMN Sales_Order_Item, 
DROP COLUMN Customer,
DROP COLUMN Consumption,
DROP COLUMN Receipt_Indicator, 
DROP COLUMN Sales_Order_1,
DROP COLUMN Network, 
DROP COLUMN Activity, 
DROP COLUMN WBS_Element,
DROP COLUMN Reservation, 
DROP COLUMN Item_No_Stock_Transfer_Reserv, 
DROP COLUMN Sales_Value_inc_VAT,
DROP COLUMN Goods_Receipt_Issue_Slip,
DROP COLUMN Item_Automatically_Created, 
DROP COLUMN Original_Line_Item, 
DROP COLUMN Multiple_Account_Assignment,
DROP COLUMN Product_Code, 
DROP COLUMN Product_Description;

SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'MaterialData';

#-------------------------------------------------------------------------------------------------------------------
#Mean 
describe MaterialData;

select round(avg(Material),2) as mean_material,     
	   round(avg(Plant),2) as mean_plant,        
       round(avg(Movement_Type),2) as mean_mt,        
       round(avg(Material_Document),2) as mean_MD,        
       round(avg(Material_Doc_Item),2) as mean_DI,        
       round(avg(Qty_in_Un_of_Entry),2) as mean_Q_UN_E,        
       round(avg(Qty_in_OPUn),2) as mean_Q_OPUn,        
       round(avg(Qty_in_Order_Unit),2) as mean_Q_OU,   
       round(avg(Company_Code),2) as mean_Company_C, 
       round(avg(Amount_in_LC),2) as mean_Amount_LC,        
       round(avg(Item),2) as mean_item,        
       round(avg(Quantity),2) as mean_quantity
from MaterialData;

#-------------------------------------------------------------------------------------------------------------------
#Median

select Material as med_material from  
(select Material,    
		row_number() over(order by Material) as row_num,         
		count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Plant as med_plant from  
(select Plant,    
	    row_number() over(order by Plant) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Movement_Type as med_mt from  
(select Movement_Type,    
		row_number() over(order by Movement_Type) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Material_Document as med_MD from  
(select Material_Document,    
		row_number() over(order by Material_Document) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Material_Doc_Item as med_DI from  
(select Material_Doc_Item,    
		row_number() over(order by Material_Doc_Item) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Qty_in_Un_of_Entry as med_Q_UN_E from  
(select Qty_in_Un_of_Entry,    
		row_number() over(order by Qty_in_Un_of_Entry) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Qty_in_OPUn as med_Q_OPUn from  
(select Qty_in_OPUn,    
		row_number() over(order by Qty_in_OPUn) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Qty_in_Order_Unit as med_Q_OU from  
(select Qty_in_Order_Unit,    
		row_number() over(order by Qty_in_Order_Unit) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Company_Code as med_Company_C from  
(select Company_Code,    
		row_number() over(order by Company_Code) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Amount_in_LC as med_Amount_LC from  
(select Amount_in_LC,    
		row_number() over(order by Amount_in_LC) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Item as med_item from  
(select Item,    
		row_number() over(order by Item) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

select Quantity as med_quantity from  
(select Quantity,    
		row_number() over(order by Quantity) as row_num,         
        count(*) over() as total_count 
from MaterialData) as subquery 
where row_num = (total_count+1)/2 or row_num = (total_count+2)/2;

#-------------------------------------------------------------------------------------------------------------------
#Mode

select Material as mode_material from 
(select Material,   
		count(*) as freq from MaterialData         
        group by Material         
        order by freq desc         
        Limit 1 
) as subquery;

select Plant as mode_plant from 
(select Plant,   
		count(*) as freq from MaterialData         
        group by Plant         
        order by freq desc         
        Limit 1 
) as subquery;

select Movement_Type as mode_mt from 
(select Movement_Type,   
		count(*) as freq from MaterialData         
        group by Movement_Type         
        order by freq desc         
        Limit 1 
) as subquery;

select Material_Document as mode_MD from 
(select Material_Document,   
		count(*) as freq from MaterialData         
        group by Material_Document         
        order by freq desc         
        Limit 1 
) as subquery;

select Material_Doc_Item as mode_DI from 
(select Material_Doc_Item,   
		count(*) as freq from MaterialData         
        group by Material_Doc_Item         
        order by freq desc         
        Limit 1 
) as subquery;

select Qty_in_Un_of_Entry as mode_Q_UN_E from 
(select Qty_in_Un_of_Entry,   
		count(*) as freq from MaterialData         
        group by Qty_in_Un_of_Entry         
        order by freq desc         
        Limit 1 
) as subquery;

select Qty_in_OPUn as mode_Q_OPUn from 
(select Qty_in_OPUn,   
		count(*) as freq from MaterialData         
        group by Qty_in_OPUn         
        order by freq desc         
        Limit 1 
) as subquery;

select Qty_in_Order_Unit as mode_Q_OU from 
(select Qty_in_Order_Unit,   
		count(*) as freq from MaterialData         
        group by Qty_in_Order_Unit         
        order by freq desc         
        Limit 1 
) as subquery;

select Company_Code as mode_Company_C from 
(select Company_Code,   
		count(*) as freq from MaterialData         
        group by Company_Code         
        order by freq desc         
        Limit 1 
) as subquery;

select Amount_in_LC as mode_Amount_LC from 
(select Amount_in_LC,   
		count(*) as freq from MaterialData         
        group by Amount_in_LC         
        order by freq desc         
        Limit 1 
) as subquery;

select Item as mode_item from 
(select Item,   
		count(*) as freq from MaterialData         
        group by Item         
        order by freq desc         
        Limit 1 
) as subquery;

select Quantity as mode_quantity from 
(select Quantity,   
		count(*) as freq from MaterialData         
        group by Quantity         
        order by freq desc         
        Limit 1 
) as subquery;

#-------------------------------------------------------------------------------------------------------------------
#Standard Variance

select round(std(Material),2) as mean_material,     
	   round(std(Plant),2) as mean_plant,        
       round(std(Movement_Type),2) as mean_mt,        
       round(std(Material_Document),2) as mean_MD,        
       round(std(Material_Doc_Item),2) as mean_DI,        
       round(std(Qty_in_Un_of_Entry),2) as mean_Q_UN_E,        
       round(std(Qty_in_OPUn),2) as mean_Q_OPUn,        
       round(std(Qty_in_Order_Unit),2) as mean_Q_OU,        
	   round(std(Company_Code),2) as mean_Company_C,  
       round(std(Amount_in_LC),2) as mean_Amount_LC,        
       round(std(Item),2) as mean_item,        
       round(std(Quantity),2) as mean_quantity      
from MaterialData;

#-------------------------------------------------------------------------------------------------------------------
#Variance

select round(variance(Material),2) as var_material,     
	   round(variance(Plant),2) as var_plant,        
       round(variance(Movement_Type),2) as var_mt,        
       round(variance(Material_Document),2) as var_MD,        
       round(variance(Material_Doc_Item),2) as var_DI,        
       round(variance(Qty_in_Un_of_Entry),2) as var_Q_UN_E,        
       round(variance(Qty_in_OPUn),2) as var_Q_OPUn,        
       round(variance(Qty_in_Order_Unit),2) as var_Q_OU,  
       round(variance(Company_Code),2) as var_Comapany_C,   
       round(variance(Amount_in_LC),2) as var_Amount_LC,        
       round(variance(Item),2) as var_item,        
       round(variance(Quantity),2) as var_quantity
from MaterialData;

#-------------------------------------------------------------------------------------------------------------------
#Variance

select round(max(Material) - min(Material),2) as range_material,     
	   round(max(Plant) - min(Plant),2) as range_plant,        
       round(max(Movement_Type) - min(Movement_Type),2) as range_mt,        
       round(max(Material_Document) - min(Material_Document),2) as range_MD,        
       round(max(Material_Doc_Item) - min(Material_Doc_Item),2) as range_DI,        
       round(max(Qty_in_Un_of_Entry) - min(Qty_in_Un_of_Entry),2) as range_Q_UN_E,        
       round(max(Qty_in_OPUn) - min(Qty_in_OPUn),2) as range_Q_OPUn,        
       round(max(Qty_in_Order_Unit) - min(Qty_in_Order_Unit),2) as range_Q_OU,     
       round(max(Company_Code) - min(Company_Code),2) as range_Company_C, 
       round(max(Amount_in_LC) - min(Amount_in_LC),2) as range_Amount_LC,        
       round(max(Item) - min(Item),2) as range_item,        
       round(max(Quantity) - min(Quantity),2) as range_quantity
from MaterialData;

select round(max(Material),2) as Max_material, round(min(Material),2) as Min_material,     
	   round(max(Plant),2) as Max_plant, round(min(Plant),2) as Min_plant,        
       round(max(Movement_Type),2) as Max_mt, round(min(Movement_Type),2) as Min_mt,        
       round(max(Material_Document),2) as Max_MD, round(min(Material_Document),2) as Min_MD,        
       round(max(Material_Doc_Item),2) as Max_DI, round(min(Material_Doc_Item),2) as Min_DI,        
       round(max(Qty_in_Un_of_Entry),2) as Max_Q_UN_E, round(min(Qty_in_Un_of_Entry),2) as Min_Q_UN_E,        
       round(max(Qty_in_OPUn),2) as Max_Q_OPUn, round(min(Qty_in_OPUn),2) as Min_Q_OPUn,        
       round(max(Qty_in_Order_Unit),2) as Max_Q_OU, round(min(Qty_in_Order_Unit),2) as Min_Q_OU,        
	   round(max(Company_Code),2) as Max_Company_C, round(min(Company_Code),2) as Min_Company_C,   
       round(max(Amount_in_LC),2) as Max_Amount_LC, round(min(Amount_in_LC),2) as Min_Amount_LC,        
       round(max(Item),2) as Max_item, round(min(Item),2) as Min_item,        
       round(max(Quantity),2) as Max_quantity, round(min(Quantity),2) as Min_quantity
from MaterialData;

#-------------------------------------------------------------------------------------------------------------------
#3rd Moment Skewness & 4th Business Moment Kurtosis 

select(   
		sum(power(Material - (select avg(Material) from MaterialData) , 3))/         
		(count(*) * power((select stddev(Material) from MaterialData) , 3))    
	  ) as skewness,       
      (    
		sum(power(Material - (select avg(Material) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Material) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Plant - (select avg(Plant) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Plant) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Plant - (select avg(Plant) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Plant) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Movement_Type - (select avg(Movement_Type) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Movement_Type) from MaterialData) , 3))    
	  ) as skewness,       
      (    
		sum(power(Movement_Type - (select avg(Movement_Type) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Movement_Type) from MaterialData) , 4)) - 3    
	  ) as kurtosis  
from MaterialData;

select(   
		sum(power(Material_Document - (select avg(Material_Document) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Material_Document) from MaterialData) , 3))    
	  ) as skewness,       
      (    
		sum(power(Material_Document - (select avg(Material_Document) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Material_Document) from MaterialData) , 4)) - 3    
	  ) as kurtosis  
from MaterialData;

select(   
		sum(power(Material_Doc_Item - (select avg(Material_Doc_Item) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Material_Doc_Item) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Material_Doc_Item - (select avg(Material_Doc_Item) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Material_Doc_Item) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Qty_in_Un_of_Entry - (select avg(Qty_in_Un_of_Entry) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Qty_in_Un_of_Entry) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Qty_in_Un_of_Entry - (select avg(Qty_in_Un_of_Entry) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Qty_in_Un_of_Entry) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Qty_in_OPUn - (select avg(Qty_in_OPUn) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Qty_in_OPUn) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Qty_in_OPUn - (select avg(Qty_in_OPUn) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Qty_in_OPUn) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Qty_in_Order_Unit - (select avg(Qty_in_Order_Unit) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Qty_in_Order_Unit) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Qty_in_Order_Unit - (select avg(Qty_in_Order_Unit) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Qty_in_Order_Unit) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Company_Code - (select avg(Company_Code) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Company_Code) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Company_Code - (select avg(Company_Code) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Company_Code) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Amount_in_LC - (select avg(Amount_in_LC) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Amount_in_LC) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Amount_in_LC - (select avg(Amount_in_LC) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Amount_in_LC) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Item - (select avg(Item) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Item) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Item - (select avg(Item) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Item) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

select(   
		sum(power(Quantity - (select avg(Quantity) from MaterialData) , 3))/         
        (count(*) * power((select stddev(Quantity) from MaterialData) , 3))    
        ) as skewness,       
	  (    
		sum(power(Quantity - (select avg(Quantity) from MaterialData) , 4))/   
        (count(*) * power((select stddev(Quantity) from MaterialData) , 4)) - 3    
	   ) as kurtosis  
from MaterialData;

#-------------------------------------------------------------------------------------------------------------------

#checking for duplicate rows
select Material, Material_Description, Plant, Storage_Location, Movement_Type, Material_Document, 
Material_Doc_Item, Posting_Date, Qty_in_Un_of_Entry, Unit_of_Entry, `Order`, `Reference`, Movement_Type_Text, 
Document_Date, Qty_in_OPUn, Order_Price_Unit, Order_Unit, Qty_in_Order_Unit, Company_Code, Entry_Date, Time_of_Entry, 
Amount_in_LC, Purchase_Order, Item, Cost_Center, Movement_Indicator,Supplier, Sales_Order_Item_1, 
Base_Unit_of_Measure, Quantity, Material_Doc_Year, Debit_Credit_Ind, User_Name, Trans_Event_Type, Currency, 
Material_Type, Vendor_Code
from MaterialData
group by Material, Material_Description, Plant, Storage_Location, Movement_Type, Material_Document, 
Material_Doc_Item, Posting_Date, Qty_in_Un_of_Entry, Unit_of_Entry, `Order`, `Reference`, Movement_Type_Text, 
Document_Date, Qty_in_OPUn, Order_Price_Unit, Order_Unit, Qty_in_Order_Unit, Company_Code, Entry_Date, Time_of_Entry, 
Amount_in_LC, Purchase_Order, Item, Cost_Center, Movement_Indicator,Supplier, Sales_Order_Item_1, 
Base_Unit_of_Measure, Quantity, Material_Doc_Year, Debit_Credit_Ind, User_Name, Trans_Event_Type, Currency, 
Material_Type, Vendor_Code
having count(*) > 1;

#Missing Values
SELECT
    SUM(CASE WHEN Material IS NULL OR Material = '' THEN 1 ELSE 0 END) AS Missing_Material,
    SUM(CASE WHEN Material_Description IS NULL OR Material_Description = '' THEN 1 ELSE 0 END) AS Missing_Material_Description,
    SUM(CASE WHEN Plant IS NULL OR Plant = '' THEN 1 ELSE 0 END) AS Missing_Plant,
    SUM(CASE WHEN Storage_Location IS NULL OR Storage_Location = '' THEN 1 ELSE 0 END) AS Missing_Storage_Location,
    SUM(CASE WHEN Movement_Type IS NULL OR Movement_Type = '' THEN 1 ELSE 0 END) AS Missing_Movement_Type,
    SUM(CASE WHEN Material_Document IS NULL OR Material_Document = '' THEN 1 ELSE 0 END) AS Missing_Material_Document,
    SUM(CASE WHEN Material_Doc_Item IS NULL OR Material_Doc_Item = '' THEN 1 ELSE 0 END) AS Missing_Material_Doc_Item,
    SUM(CASE WHEN Posting_Date IS NULL OR Posting_Date = '' THEN 1 ELSE 0 END) AS Missing_Posting_Date,
    SUM(CASE WHEN Qty_in_Un_of_Entry IS NULL OR Qty_in_Un_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_Un_of_Entry,
    SUM(CASE WHEN Unit_of_Entry IS NULL OR Unit_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Unit_of_Entry,
    SUM(CASE WHEN `Order` IS NULL OR `Order` = '' THEN 1 ELSE 0 END) AS Missing_Order,
    SUM(CASE WHEN `Reference` IS NULL OR `Reference` = '' THEN 1 ELSE 0 END) AS Missing_Reference,
    SUM(CASE WHEN Movement_Type_Text IS NULL OR Movement_Type_Text = '' THEN 1 ELSE 0 END) AS Missing_Movement_Type_Text,
    SUM(CASE WHEN Document_Date IS NULL OR Document_Date = '' THEN 1 ELSE 0 END) AS Missing_Document_Date,
    SUM(CASE WHEN Qty_in_OPUn IS NULL OR Qty_in_OPUn = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_OPUn,
    SUM(CASE WHEN Order_Price_Unit IS NULL OR Order_Price_Unit = '' THEN 1 ELSE 0 END) AS Missing_Order_Price_Unit,
    SUM(CASE WHEN Order_Unit IS NULL OR Order_Unit = '' THEN 1 ELSE 0 END) AS Missing_Order_Unit,
    SUM(CASE WHEN Qty_in_Order_Unit IS NULL OR Qty_in_Order_Unit = '' THEN 1 ELSE 0 END) AS Missing_Qty_in_Order_Unit,
    SUM(CASE WHEN Company_Code IS NULL OR Company_Code = '' THEN 1 ELSE 0 END) AS Missing_Company_Code,
    SUM(CASE WHEN Entry_Date IS NULL OR Entry_Date = '' THEN 1 ELSE 0 END) AS Missing_Entry_Date,
    SUM(CASE WHEN Time_of_Entry IS NULL OR Time_of_Entry = '' THEN 1 ELSE 0 END) AS Missing_Time_of_Entry,
    SUM(CASE WHEN Amount_in_LC IS NULL OR Amount_in_LC = '' THEN 1 ELSE 0 END) AS Missing_Amount_in_LC,
    SUM(CASE WHEN Purchase_Order IS NULL OR Purchase_Order = '' THEN 1 ELSE 0 END) AS Missing_Purchase_Order,
    SUM(CASE WHEN Item IS NULL OR Item = '' THEN 1 ELSE 0 END) AS Missing_Item,
    SUM(CASE WHEN Cost_Center IS NULL OR Cost_Center = '' THEN 1 ELSE 0 END) AS Missing_Cost_Center,
    SUM(CASE WHEN Movement_Indicator IS NULL OR Movement_Indicator = '' THEN 1 ELSE 0 END) AS Missing_Movement_Indicator,
    SUM(CASE WHEN Supplier IS NULL OR Supplier = '' THEN 1 ELSE 0 END) AS Missing_Supplier,
    SUM(CASE WHEN Sales_Order_Item_1 IS NULL OR Sales_Order_Item_1 = '' THEN 1 ELSE 0 END) AS Missing_Sales_Order_Item_1,
    SUM(CASE WHEN Base_Unit_of_Measure IS NULL OR Base_Unit_of_Measure = '' THEN 1 ELSE 0 END) AS Missing_Base_Unit_of_Measure,
    SUM(CASE WHEN Quantity IS NULL OR Quantity = '' THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN Material_Doc_Year IS NULL OR Material_Doc_Year = '' THEN 1 ELSE 0 END) AS Missing_Material_Doc_Year,
    SUM(CASE WHEN Debit_Credit_Ind IS NULL OR Debit_Credit_Ind = '' THEN 1 ELSE 0 END) AS Missing_Debit_Credit_Ind,
    SUM(CASE WHEN User_Name IS NULL OR User_Name = '' THEN 1 ELSE 0 END) AS Missing_User_Name,
    SUM(CASE WHEN Trans_Event_Type IS NULL OR Trans_Event_Type = '' THEN 1 ELSE 0 END) AS Missing_Trans_Event_Type,
    SUM(CASE WHEN Currency IS NULL OR Currency = '' THEN 1 ELSE 0 END) AS Missing_Currency,
    SUM(CASE WHEN Material_Type IS NULL OR Material_Type = '' THEN 1 ELSE 0 END) AS Missing_Material_Type,
    SUM(CASE WHEN Vendor_Code IS NULL OR Vendor_Code = '' THEN 1 ELSE 0 END) AS Missing_Vendor_Code
FROM MaterialData;

#-------------------------------------------------------------------------------------------------------------------
select * from MaterialData;

WITH Material_D AS (
    SELECT 
        Material,
        NTILE(4) OVER (ORDER BY Material) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Material END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Material END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Material < lower_bound OR Material > upper_bound;

WITH Material_D AS (
    SELECT 
        Plant,
        NTILE(4) OVER (ORDER BY Plant) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Plant END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Plant END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Plant < lower_bound OR Plant > upper_bound;

WITH Material_D AS (
    SELECT 
        Movement_Type,
        NTILE(4) OVER (ORDER BY Movement_Type) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Movement_Type END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Movement_Type END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Movement_Type < lower_bound OR Movement_Type > upper_bound;

WITH Material_D AS (
    SELECT 
        Material_Document,
        NTILE(4) OVER (ORDER BY Material_Document) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Material_Document END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Material_Document END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Material_Document < lower_bound OR Material_Document > upper_bound;

WITH Material_D AS (
    SELECT 
        Material_Doc_Item,
        NTILE(4) OVER (ORDER BY Material_Doc_Item) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Material_Doc_Item END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Material_Doc_Item END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Material_Doc_Item < lower_bound OR Material_Doc_Item > upper_bound;

WITH Material_D AS (
    SELECT 
        Qty_in_Un_of_Entry,
        NTILE(4) OVER (ORDER BY Qty_in_Un_of_Entry) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Qty_in_Un_of_Entry END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Qty_in_Un_of_Entry END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Qty_in_Un_of_Entry < lower_bound OR Qty_in_Un_of_Entry > upper_bound;

WITH Material_D AS (
    SELECT 
        Qty_in_OPUn,
        NTILE(4) OVER (ORDER BY Qty_in_OPUn) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Qty_in_OPUn END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Qty_in_OPUn END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Qty_in_OPUn < lower_bound OR Qty_in_OPUn > upper_bound;

WITH Material_D AS (
    SELECT 
        Qty_in_Order_Unit,
        NTILE(4) OVER (ORDER BY Qty_in_Order_Unit) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Qty_in_Order_Unit END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Qty_in_Order_Unit END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Qty_in_Order_Unit < lower_bound OR Qty_in_Order_Unit > upper_bound;

WITH Material_D AS (
    SELECT 
        Company_Code,
        NTILE(4) OVER (ORDER BY Company_Code) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Company_Code END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Company_Code END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Company_Code < lower_bound OR Company_Code > upper_bound;

WITH Material_D AS (
    SELECT 
        Amount_in_LC,
        NTILE(4) OVER (ORDER BY Amount_in_LC) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Amount_in_LC END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Amount_in_LC END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Amount_in_LC < lower_bound OR Amount_in_LC > upper_bound;

WITH Material_D AS (
    SELECT 
        Item,
        NTILE(4) OVER (ORDER BY Item) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Item END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Item END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Item < lower_bound OR Item > upper_bound;

WITH Material_D AS (
    SELECT 
        Quantity,
        NTILE(4) OVER (ORDER BY Quantity) AS quartile
    FROM MaterialData
),
Quartiles AS (
    SELECT 
        MAX(CASE WHEN quartile = 1 THEN Quantity END) AS Q1,
        MIN(CASE WHEN quartile = 4 THEN Quantity END) AS Q3
    FROM Material_D
),
IQR_Calculations AS (
    SELECT 
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        (Q1 - 1.5 * (Q3 - Q1)) AS lower_bound,
        (Q3 + 1.5 * (Q3 - Q1)) AS upper_bound
    FROM Quartiles
)
SELECT * FROM MaterialData, IQR_Calculations
WHERE Quantity < lower_bound OR Quantity > upper_bound;



