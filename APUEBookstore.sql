CREATE DATABASE APU_EBookstore;

CREATE TABLE Members (
MemberID nvarchar(50) PRIMARY KEY,
Member_Name nvarchar(50),
Member_Email_Address nvarchar(50),
Member_Contact_Number nvarchar(50)
);
INSERT INTO Members (MemberID, Member_Name, Member_Email_Address, Member_Contact_Number) 
VALUES ('M01', 'Joey Khaw', 'joeykhaw@gmail.com', '019-1122201'),
('M02', 'Aaron', 'aaron@yahoo.com', '017-2281928'),
('M03', 'Justin Lee', 'justinlee@gmail.com', '011-29938291'),
('M04', 'Christopher Lee', 'christopherlee@hotmail.com', '012-8392846'),
('M05', 'Shawn Lim', 'shawnlim@gmail.com', '017-2263887'),
('M06', 'Christine Yap', 'christineyap@yahoo.com', '019-5542155'),
('M07', 'Michelle Soo', 'michellesoo@gmail.com', '012-3385475'),
('M08', 'Catherine Lim', 'catherinelim@gmail.com', '011-22390101');

SELECT * FROM Members;

CREATE TABLE Publishers (
PublisherID nvarchar(50) PRIMARY KEY,
Publisher_Name nvarchar(50),
Publisher_Email nvarchar(50),
Publisher_Contact_Number nvarchar(50),
);
INSERT INTO Publishers (PublisherID, Publisher_Name, Publisher_Email, Publisher_Contact_Number)
VALUES ('P01', 'Edison Lim', 'edisonlim@gmail.com', '011-82936673'),
('P02', 'Ashley Lau', 'ashlau@gmail.com', '011-92284730'),
('P03', 'Emma', 'emma@yahoo.com', '019-2737293'),
('P04', 'Lorickson', 'lorickson@gmail.com', '018-26382291'),
('P05', 'Henry Chong', 'henrychong@yahoo.com', '015-4454811'),
('P06', 'Natalie Tan', 'natalietan@gmail.com', '014-5542544');

SELECT * FROM Publishers;

CREATE TABLE Books (
BookID nvarchar(50) PRIMARY KEY,
Book_Name nvarchar(50),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publishers(PublisherID),
Price decimal(10,2),
Quantity_in_stock int
);
INSERT INTO Books (BookID, Book_Name, PublisherID, Price, Quantity_in_stock)
VALUES ('B01', 'Science', 'P01', '40.50', '65'),
('B02', 'Computer Architecture', 'P06', '60.20', '50'),
('B03', 'Operating System', 'P06', '48.00', '44'),
('B04', 'Python Programming', 'P02', '72.80', '20'),
('B05', 'C Programming', 'P02', '75.00', '57'),
('B06', 'Database Sytems', 'P05', '65.50', '25'),
('B07', 'Introduction to Networking', 'P03', '88.00', '8'),
('B08', 'Data Analytics', 'P04', '75.50', '30');

SELECT * FROM Books;

CREATE TABLE Orders (
OrderID nvarchar(50) PRIMARY KEY,
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publishers(PublisherID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Books(BookID),
Date_Ordered date,
Date_Received date,
Order_Quantity int
);
INSERT INTO Orders (OrderID, PublisherID, BookID, Date_Ordered, Date_Received, Order_Quantity)
VALUES ('O01', 'P01', 'B01', '20 March 2022', '25 March 2022', '20'),
('O02', 'P05', 'B06', '8 April 2022', '13 April 2022', '30'),
('O03', 'P03', 'B01', '12 April 2022', '19 April 2022', '50'),
('O04', 'P02', 'B04', '14 April 2022', '20 April 2022', '20'),
('O05', 'P02', 'B05', '14 April 2022', '20 April 2022', '10'),
('O06', 'P06', 'B03', '17 April 2022', '22 April 2022', '15'),
('O07', 'P01', 'B03', '20 April 2022', '26 April 2022', '15');

SELECT * FROM Orders;

CREATE TABLE Cart (
CartID nvarchar(50) PRIMARY KEY,
MemberID nvarchar(50) FOREIGN KEY REFERENCES Members(MemberID),
Books_In_Cart integer,
Date_purchased date,
Final_Price decimal(10,2)
);
INSERT INTO Cart (CartID, MemberID, Books_In_Cart, Date_purchased, Final_Price)
VALUES ('C01', 'M03', '1', '6 April 2022', '48'),
('C02', 'M01','4', '18 April 2022', '248.70'),
('C03', 'M03','1', '18 April 2022', '75.50'),
('C04', 'M02','1', '18 April 2022', '72.80'),
('C05', 'M07', '1', '20 April 2022', '72.80'),
('C06', 'M04','2', '26 April 2022', '123.00');

SELECT * FROM Cart;

CREATE TABLE Delivery (
DeliveryID nvarchar(50) PRIMARY KEY,
MemberID nvarchar(50) FOREIGN KEY REFERENCES Members(MemberID),
Delivery_Status nvarchar(50),
Delivery_startdate date,
Delivery_enddate date,
Delivery_Address nvarchar(150),
Delivery_Quantity int
);
INSERT INTO Delivery (DeliveryID, MemberID, Delivery_Status, Delivery_startdate, Delivery_enddate, Delivery_Address, Delivery_Quantity)
VALUES ('D01', 'M03', 'Delivered', '5 April 2022', '8 April 2022', '10, Taman Gemilang Bukit Jalil 57000 Kuala Lumpur', '1'),
('D02', 'M01', 'Delivered', '10 April 2022', '15 April 2022', '23, Taman Belia 68000 Ampang Selangor', '4'),
('D03', 'M04', 'In Progress', '12 April 2022', NULL, '8, Taman Hijau 71000 Port Dickson Negeri Sembilan', '2'),
('D04', 'M02', 'Delivered', '19 April 2022', '22 April 2022', '14, Taman Bukit Samudra 43300 Serdang Selangor', '1'),
('D05', 'M03', 'In Progress', '19 April 2022', NULL, '244, Taman Koperasi 43300 Serdang Selangor', '1');

SELECT * FROM Delivery;

CREATE TABLE Feedback (
FeedbackID nvarchar(50) PRIMARY KEY,
MemberID nvarchar(50) FOREIGN KEY REFERENCES Members(MemberID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Books(BookID),
Book_Rating integer,
Book_Comment nvarchar(50)
);
INSERT INTO Feedback (FeedbackID, MemberID, BookID, Book_Rating, Book_Comment)
VALUES ('F01', 'M01', 'B02', '4', 'Could be better by providing more examples.'),
('F02', 'M01', 'B05', '7', 'Recommended!'),
('F03', 'M01', 'B06', '6', 'Easy to understand'),
('F04', 'M01', 'B03', '3', 'Not recommended. More examples should be provided.'),
('F05', 'M02', 'B06', '8', 'Recommended for self learners!'),
('F06', 'M03', 'B08', '2', 'Not recommended'),
('F07', 'M04', 'B05', '9', 'Great overall!'),
('F08', 'M04', 'B03', '6', 'Good value for money');

SELECT * FROM Feedback;

CREATE TABLE BookCart (
BookCartID nvarchar(50) PRIMARY KEY,
BookID nvarchar(50) FOREIGN KEY REFERENCES Books(BookID),
CartID nvarchar(50) FOREIGN KEY REFERENCES Cart(CartID)
);
INSERT INTO BookCart (BookCartID, BookID, CartID)
VALUES ('BC001', 'B03', 'C01'),
('BC002', 'B02', 'C02'),
('BC003', 'B05', 'C02'),
('BC004', 'B06', 'C02'),
('BC005', 'B03', 'C02'),
('BC006', 'B08', 'C03'),
('BC007', 'B04', 'C04'),
('BC008', 'B04', 'C05'),
('BC009', 'B05', 'C06'),
('BC010', 'B03', 'C06');

SELECT * FROM BookCart;

CREATE TABLE BookDelivery (
BookDeliveryID nvarchar(50) PRIMARY KEY,
DeliveryID nvarchar(50) FOREIGN KEY REFERENCES Delivery(DeliveryID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Books(BookID)
);
INSERT INTO BookDelivery (BookDeliveryID, DeliveryID, BookID)
VALUES ('BD001', 'D01', 'B03'),
('BD002', 'D02', 'B02'),
('BD003', 'D02', 'B05'),
('BD004', 'D02', 'B06'),
('BD005', 'D02', 'B03'),
('BD006', 'D03', 'B05'),
('BD007', 'D03', 'B03'),
('BD008', 'D04', 'B04'),
('BD009', 'D05', 'B08');

SELECT * FROM BookDelivery;