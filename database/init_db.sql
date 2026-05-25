create database Marketplace
go

use Marketplace
go

CREATE TABLE Category(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL
);

create table Product(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(50) NOT NULL,
	UnitPrice INT NOT NULL,
	CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID)
);

create table Customer(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerName NVARCHAR(255) NOT NULL,
	CustomerAdress NVARCHAR(500)
);

create table [Order](
	OrderID INT IDENTITY(1,1) Primary key,
	OrderDate DATETIME DEFAULT GETDATE(),
	RequireDate DATETIME,
	CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID)
);

create table OrderDetail(
	OrderID INT FOREIGN KEY REFERENCES [Order](OrderID),
	ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
	OrderQuantity INT NOT NULL,
	PRIMARY KEY(OrderID, ProductID)
);

create table Delivery(
	DeliveryID INT IDENTITY(1,1) PRIMARY KEY,
	DeliveryDate DATETIME DEFAULT GETDATE(),
	OrderID INT FOREIGN KEY REFERENCES [Order](OrderID)
);

create table DeliveryDetail(
	DeliveryID INT FOREIGN KEY REFERENCES Delivery(DeliveryID),
	ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
    DeliveryQuantity INT NOT NULL,
    PRIMARY KEY (DeliveryID, ProductID)
);


SET IDENTITY_INSERT Category ON;
INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, N'Điện thoại & Máy tính'),
(2, N'Thiết bị điện gia dụng'),
(3, N'Sách & Văn phòng phẩm'),
(4, N'Thời trang nam nữ'),
(5, N'Giày dép & Túi xách'),
(6, N'Mỹ phẩm & Chăm sóc cá nhân'),
(7, N'Thực phẩm & Đồ uống'),
(8, N'Dụng cụ thể thao'),
(9, N'Đồ chơi & Mẹ bé'),
(10, N'Nội thất & Trang trí nhà cửa');
SET IDENTITY_INSERT Category OFF;
GO

-- =========================================================================
-- 2. INSERT DỮ LIỆU BẢNG: Product (30 dòng)A
-- =========================================================================
SET IDENTITY_INSERT Product ON;
INSERT INTO Product (ProductID, ProductName, UnitPrice, CategoryID) VALUES
-- Nhóm 1: Điện tử
(1, N'Điện thoại iPhone 15 Pro Max 256GB', 29500000.00, 1),
(2, N'Laptop ASUS ROG Strix G16', 31900000.00, 1),
(3, N'Tai nghe Bluetooth Sony WH-1000XM5', 6800000.00, 1),
(4, N'Chuột không dây Logitech MX Master 3S', 2300000.00, 1),
(5, N'Máy tính bảng iPad Air 5 M1', 14500000.00, 1),
-- Nhóm 2: Gia dụng
(6, N'Nồi cơm điện cao tần Toshiba 1.8L', 2400000.00, 2),
(7, N'Quạt cây đứng Senko DR1608', 550000.00, 2),
(8, N'Máy hút bụi cầm tay Xiaomi Vacuum G10', 4200000.00, 2),
(9, N'Lò vi sóng Sharp 20L', 1850000.00, 2),
(10, N'Máy lọc nước Karofi 10 lõi', 5800000.00, 2),
-- Nhóm 3: Sách
(11, N'Sách Nhà Giả Kim (Tái bản)', 79000.00, 3),
(12, N'Sách Đắc Nhân Tâm', 86000.00, 3),
(13, N'Sách Tâm Lý Học Tội Phạm', 145000.00, 3),
(14, N'Bộ 12 bút bi Thiên Long FO-03', 45000.00, 3),
-- Nhóm 4: Thời trang
(15, N'Áo thun Nam Cotton dáng Regular', 199000.00, 4),
(16, N'Quần Jean Nam Culottes ống rộng', 350000.00, 4),
(17, N'Áo khoác Bomber Unisex', 450000.00, 4),
-- Nhóm 5: Giày dép
(18, N'Giày Sneaker Biti''s Hunter X', 950000.00, 5),
(19, N'Giày Tây Nam Da Bò Công Sở', 1200000.00, 5),
(20, N'Túi xách nữ thời trang công sở', 650000.00, 5),
-- Nhóm 6: Mỹ phẩm
(21, N'Kem chống nắng La Roche-Posay Anthelios', 420000.00, 6),
(22, N'Nước tẩy trang Bioderma 500ml', 390000.00, 6),
(23, N'Son thỏi MAC Matte Lipstick', 550000.00, 6),
-- Nhóm 7: Thực phẩm
(24, N'Thùng Bia Heineken 24 lon', 430000.00, 7),
(25, N'Cà phê hòa tan Trung Nguyên G7 (Hộp 21 gói)', 650000.00, 7),
-- Nhóm 8: Thể thao
(26, N'Thảm tập Yoga TPE 6mm', 280000.00, 8),
(27, N'Vợt cầu lông Yonex Astrox 88D', 3200000.00, 8),
-- Nhóm 9: Mẹ bé
(28, N'Tã dán Huggies Skin Perfect Size M', 320000.00, 9),
-- Nhóm 10: Nội thất
(29, N'Ghế Công Trình Ergonomic', 2100000.00, 10),
(30, N'Đèn học để bàn chống cận Philips', 480000.00, 10);
SET IDENTITY_INSERT Product OFF;
GO

-- =========================================================================
-- 3. INSERT DỮ LIỆU BẢNG: Customer (15 dòng)
-- =========================================================================
SET IDENTITY_INSERT Customer ON;
INSERT INTO Customer (CustomerID, CustomerName, CustomerAdress) VALUES
(1, N'Nguyễn Văn An', N'123 Nguyễn Trãi, Quận 1, TP. HCM'),
(2, N'Trần Thị Bình', N'456 Lê Lợi, Quận Gò Vấp, TP. HCM'),
(3, N'Lê Hoàng Cường', N'789 Cách Mạng Tháng 8, Quận 3, TP. HCM'),
(4, N'Phạm Minh Đức', N'12 Hoàng Hoa Thám, Quận Tây Hồ, Hà Nội'),
(5, N'Hoàng Lan Hương', N'34 Nguyễn Chí Thanh, Quận Đống Đa, Hà Nội'),
(6, N'Đỗ Khắc Long', N'56 Hùng Vương, Quận Hải Châu, Đà Nẵng'),
(7, N'Vũ Thị Mai', N'78 Điện Biên Phủ, Quận Thanh Khê, Đà Nẵng'),
(8, N'Bùi Quang Nam', N'90 Lê Hồng Phong, TP. Nha Trang, Khánh Hòa'),
(9, N'Ngô Ngọc Oanh', N'11 Lý Tự Trọng, Quận Ninh Kiều, Cần Thơ'),
(10, N'Phan Thanh Phúc', N'22 Trần Hưng Đạo, TP. Quy Nhơn, Bình Định'),
(11, N'Tạ Văn Quân', N'55 Lê Lai, Quận 1, TP. HCM'),
(12, N'Trịnh Thu Thảo', N'88 Láng Hạ, Quận Đống Đa, Hà Nội'),
(13, N'Đặng Gia Uy', N'99 Nguyễn Văn Linh, Quận Long Biên, Hà Nội'),
(14, N'Đoàn Thúy Vy', N'44 Thống Nhất, TP. Vũng Tàu, Bà Rịa - Vũng Tàu'),
(15, N'Tống Minh Triết', N'66 Xuân Thủy, Quận Cầu Giấy, Hà Nội');
SET IDENTITY_INSERT Customer OFF;
GO

-- =========================================================================
-- 4. INSERT DỮ LIỆU BẢNG: Order (15 đơn hàng)
-- =========================================================================
SET IDENTITY_INSERT [Order] ON;
INSERT INTO [Order] (OrderID, OrderDate, RequireDate, CustomerID) VALUES
(1, '2026-05-01 09:30:00', '2026-05-05', 1),
(2, '2026-05-02 14:15:00', '2026-05-06', 2),
(3, '2026-05-03 10:00:00', '2026-05-08', 3),
(4, '2026-05-05 16:45:00', '2026-05-10', 4),
(5, '2026-05-08 11:20:00', '2026-05-12', 5),
(6, '2026-05-10 08:00:00', '2026-05-15', 6),
(7, '2026-05-12 13:30:00', '2026-05-16', 7),
(8, '2026-05-15 19:00:00', '2026-05-20', 8),
(9, '2026-05-17 15:10:00', '2026-05-22', 9),
(10, '2026-05-18 10:25:00', '2026-05-23', 10),
(11, '2026-05-20 09:00:00', '2026-05-25', 11),
(12, '2026-05-21 14:40:00', '2026-05-26', 12),
(13, '2026-05-22 17:00:00', '2026-05-27', 13),
(14, '2026-05-23 11:15:00', '2026-05-28', 14),
(15, '2026-05-24 16:00:00', '2026-05-29', 15);
SET IDENTITY_INSERT [Order] OFF;
GO

-- =========================================================================
-- 5. INSERT DỮ LIỆU BẢNG: OrderDetail (Chi tiết cho 15 đơn hàng - tổng cộng 25 dòng)
-- =========================================================================
INSERT INTO OrderDetail (OrderID, ProductID, OrderQuantity) VALUES
-- Đơn 1 mua iPhone (1) và ốp/tai nghe (3)
(1, 1, 1),
(1, 3, 1),
-- Đơn 2 mua Nồi cơm điện (6) và quạt (7)
(2, 6, 1),
(2, 7, 2),
-- Đơn 3 mua Sách (11, 12)
(3, 11, 3),
(3, 12, 2),
-- Đơn 4 mua áo thun (15) và quần jean (16)
(4, 15, 5),
(4, 16, 2),
-- Đơn 5 mua giày (18)
(5, 18, 1),
-- Đơn 6 mua mỹ phẩm (21, 22)
(6, 21, 2),
(6, 22, 1),
-- Đơn 7 mua Bia (24)
(7, 24, 2),
-- Đơn 8 mua Thảm Yoga (26) và Vợt cầu lông (27)
(8, 26, 1),
(8, 27, 2),
-- Đơn 9 mua tã (28)
(9, 28, 3),
-- Đơn 10 mua ghế (29) và đèn (30)
(10, 29, 1),
(10, 30, 1),
-- Đơn 11 mua laptop (2)
(11, 2, 1),
-- Đơn 12 mua chuột (4) và máy tính bảng (5)
(12, 4, 1),
(12, 5, 1),
-- Đơn 13 mua lò vi sóng (9)
(13, 9, 1),
-- Đơn 14 mua sách tâm lý (13) và bút (14)
(14, 13, 1),
(14, 14, 2),
-- Đơn 15 mua son mac (23)
(15, 23, 2);
GO

-- =========================================================================
-- 6. INSERT DỮ LIỆU BẢNG: Delivery (Giao hàng cho các đơn từ đơn 1 đến đơn 10)
-- =========================================================================
SET IDENTITY_INSERT Delivery ON;
INSERT INTO Delivery (DeliveryID, DeliveryDate, OrderID) VALUES
(1, '2026-05-03 10:00:00', 1),
(2, '2026-05-04 15:30:00', 2),
(3, '2026-05-05 09:00:00', 3),
(4, '2026-05-07 11:00:00', 4),
(5, '2026-05-10 14:00:00', 5),
(6, '2026-05-12 16:20:00', 6),
(7, '2026-05-14 10:15:00', 7),
(8, '2026-05-17 09:45:00', 8),
(9, '2026-05-19 15:00:00', 9),
(10, '2026-05-20 11:30:00', 10);
SET IDENTITY_INSERT Delivery OFF;
GO

-- =========================================================================
-- 7. INSERT DỮ LIỆU BẢNG: DeliveryDetail (Chi tiết số lượng đã giao)
-- =========================================================================
INSERT INTO DeliveryDetail (DeliveryID, ProductID, DeliveryQuantity) VALUES
-- Giao Đơn 1 (Đã giao đủ)
(1, 1, 1),
(1, 3, 1),
-- Giao Đơn 2 (Đã giao đủ)
(2, 6, 1),
(2, 7, 2),
-- Giao Đơn 3 (Mới giao trước 2 cuốn Nhà giả kim, thiếu 1 cuốn và thiếu Đắc nhân tâm)
(3, 11, 2),
-- Giao Đơn 4 (Đã giao đủ)
(4, 15, 5),
(4, 16, 2),
-- Giao Đơn 5 (Đã giao đủ)
(5, 18, 1),
-- Giao Đơn 6 (Đã giao đủ)
(6, 21, 2),
(6, 22, 1),
-- Giao Đơn 7 (Đã giao đủ)
(7, 24, 2),
-- Giao Đơn 8 (Giao trước thảm yoga, chưa giao vợt)
(8, 26, 1),
-- Giao Đơn 9 (Đã giao đủ)
(9, 28, 3),
-- Giao Đơn 10 (Đã giao đủ)
(10, 29, 1),
(10, 30, 1);
GO

SELECT * FROM Product;

