--From the above given tables perform the following queries:  //virajodedra
--  Create the Products table 

CREATE TABLE Products ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 


); --  Insert data into the Products table 
INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(1, 'Smartphone', 35000), 
(2, 'Laptop', 65000), 
(3, 'Headphones', 5500), 
(4, 'Television', 85000), 
(5, 'Gaming Console', 32000); 




--Part - A 
--1. Create a cursor Product_Cursor to fetch all the rows from a products table. 
	declare @ID int, @Name varchar(100), @Price decimal(10,2) 

	declare cursor_FetchData cursor
	for
		select * 
		from Products

	open cursor_FetchData

	fetch next from cursor_FetchData
	into @ID, @Name, @Price

	while @@FETCH_STATUS = 0
	begin
		print(cast(@ID as varchar(100)) + ' ' + @Name + ' ' +  cast(@Price as varchar(100)))

		fetch next from cursor_FetchData
		into @ID, @Name, @Price
	end

	close cursor_FetchData

	deallocate cursor_FetchData
--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 

	declare @ID1 int, @Name1 varchar(100) 

	declare Product_Cursor_Fetch cursor
	for
		select Product_id, Product_Name
		from Products

	open Product_Cursor_Fetch

	fetch next from Product_Cursor_Fetch
	into @ID1, @Name1

	while @@FETCH_STATUS = 0
	begin
		print(cast(@ID1 as varchar(100)) + '_' + @Name1)

		fetch next from Product_Cursor_Fetch
		into @ID1, @Name1
	end

	close Product_Cursor_Fetch

	deallocate Product_Cursor_Fetch
--(Example: 1_Smartphone) 
--3. Create a Cursor to Find and Display Products Above Price 30,000. 
	
	declare @ID2 int, @Name2 varchar(100), @Price2 decimal(10, 2)

	declare Product_Cursor_Fetch_Price cursor
	for 
		select *
		from Products
		where Price > 30000

	open Product_Cursor_Fetch_Price

	fetch next from Product_Cursor_Fetch_Price
	into @ID2, @Name2, @Price2

	while @@FETCH_STATUS = 0
	begin
		print(cast(@ID2 as varchar(100)) + '_' + @Name2 + ' ' + cast(@Price2 as varchar(100)))

		fetch next from Product_Cursor_Fetch_Price
		into @ID2, @Name2, @Price2
	end

	close Product_Cursor_Fetch_Price

	deallocate Product_Cursor_Fetch_Price




--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
	
	declare @ProductID int;

	declare Product_CursorDelete cursor
	for
		select Product_id
		from Products

	open Product_CursorDelete

	fetch next from Product_CursorDelete
	into @ProductID

	while @@FETCH_STATUS = 0
	begin
		delete from
		Products 
		where Product_id = @ProductID

		fetch next from Product_CursorDelete 
		into @ProductID

	end

	close Product_CursorDelete

	deallocate Product_CursorDelete
		
			
		
		--Part – B 
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases 
--the price by 10%. 

declare @ID12 int, @Price1 decimal(10,2) 

	declare Product_CursorUpdate cursor
	for
		select Product_id, Price
		from Products

	open Product_CursorUpdate

	fetch next from Product_CursorUpdate
	into @ID12,  @Price1

	while @@FETCH_STATUS = 0
	begin
		update Products
		set Price = @Price1 + (@Price1 * 10)/100
		where Product_id = @ID12

		fetch next from Product_CursorUpdate
		into @ID12,  @Price1
	end

	close Product_CursorUpdate

	deallocate Product_CursorUpdate


	select * from Products
	
--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
	declare @IDunique int, @Price3 decimal(10,2) 

	declare Product_CursorRound cursor
	for
		select Product_id, Price
		from Products

	open Product_CursorRound

	fetch next from Product_CursorRound
	into @IDunique,  @Price3

	while @@FETCH_STATUS = 0
	begin
		update Products
		set Price = round(@Price3, 2)
		where Product_id = @IDunique

		fetch next from Product_CursorRound
		into @IDunique,  @Price3
	end

	close Product_CursorRound

	deallocate Product_CursorRound


	select * from Products
--Part – C 

CREATE TABLE NewProducts ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
)

--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 


	--declare @idProduct int, @nameProduct varchar(100) , @priceProduct decimal(8, 2)
	declare cursor_newProduct cursor
	for
		select * 
		from Products
		where Product_Name = 'Laptop'

	open cursor_newProduct

	fetch next from cursor_newProduct
	into @idProduct, @nameProduct, @priceProduct

	while @@FETCH_STATUS = 0
	begin
		insert into NewProducts values (@idProduct, @nameProduct, @priceProduct)

		fetch next from cursor_newProduct
		into @idProduct, @nameProduct, @priceProduct
	end

	close cursor_newProduct

	deallocate cursor_newProduct

	select * from NewProducts
	
--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table.
 
 CREATE TABLE Archive ( 
Product_id INT PRIMARY KEY, 
Product_Name VARCHAR(250) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL 
)

 	declare @idArchive int, @nameArchive varchar(100) , @priceArchive decimal(8, 2)
	declare cursor_newTable cursor
	for
		select * 
		from Products
		where Price >= 50000

	open cursor_newTable

	fetch next from cursor_newTable
	into @idArchive, @nameArchive, @priceArchive

	while @@FETCH_STATUS = 0
	begin
		insert into Archive values (@idArchive, @nameArchive, @priceArchive)

		delete from Products
		where Product_id = @idArchive;

		fetch next from cursor_newTable
		into @idArchive, @nameArchive, @priceArchive
	end

	close cursor_newTable

	deallocate cursor_newTable

	select * from Archive
	select * from Products










------------------------------------------------------------------------------------------------------------------Vir---------------Odedra----------------------------------------------------------------------------------------------------------------------------
