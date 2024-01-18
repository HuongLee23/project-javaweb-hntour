drop DATABASE HaNoiTour

CREATE DATABASE HaNoiTour
USE HaNoiTour

ALTER TABLE Account
ADD cmnd VARCHAR(max);

CREATE TABLE Account
(
    id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(250),
    username NVARCHAR(100),
    [password] VARCHAR(100),
    [role] INT,
    [address] NVARCHAR(MAX),
	avatar varchar(max),
    phoneNumber VARCHAR(10),
	cmnd VARCHAR(max),
    [status] VARCHAR(100) DEFAULT 'True'
)

CREATE TABLE Category 
(
    id INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(MAX),
    [description] NVARCHAR(MAX)
)

CREATE TABLE ImageAlbum
(
    id INT PRIMARY KEY IDENTITY(1,1),
    imgMain VARCHAR(MAX),
    img1 VARCHAR(MAX),
    img2 VARCHAR(MAX),
    img3 VARCHAR(MAX),
    img4 VARCHAR(MAX)
)

CREATE TABLE [Rule]
(
    id INT PRIMARY KEY IDENTITY(1,1),
    [description] NVARCHAR(MAX)
)

CREATE TABLE Supplier
(
    [name] NVARCHAR(MAX),
    phoneNumber VARCHAR(10),
	cmnd VARCHAR(12),
    [address] NVARCHAR(MAX),
    businessCode VARCHAR(10),
    [certificate] VARCHAR(MAX),
    accId INT PRIMARY KEY, -- ??t accId làm khóa chính
    CONSTRAINT FK_Supplier_Account FOREIGN KEY (accId) REFERENCES Account(id)
)

CREATE TABLE Voucher
(
    id INT PRIMARY KEY IDENTITY(1,1),
    code NVARCHAR(50) UNIQUE,
    discountPercentage INT,
    [status] VARCHAR(50) DEFAULT 'True',
    supplierId INT,
    CONSTRAINT FK_Voucher_Supplier FOREIGN KEY (supplierId) REFERENCES Supplier(accId)
);



CREATE TABLE Tour
(
    id INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(MAX),
    imageId INT,
    intendedTime TIME,
    price INT,
    [description] NVARCHAR(MAX),
    categoryId INT, 
	versionId INT,
    ruleId INT,
    feedbackID INT,
    supplierId INT,
	[status] varchar(max) DEFAULT 'True',
    CONSTRAINT FK_Tour_Category FOREIGN KEY (categoryId) REFERENCES Category(id),
    CONSTRAINT FK_Tour_ImageAlbum FOREIGN KEY (imageId) REFERENCES ImageAlbum(id),
    CONSTRAINT FK_Tour_Rule FOREIGN KEY (ruleId) REFERENCES [Rule](id),
    CONSTRAINT FK_Tour_Supplier FOREIGN KEY (supplierId) REFERENCES Supplier(accId),
)

CREATE TABLE [Order]
(
    id INT PRIMARY KEY IDENTITY(1,1),
    accId INT,
    totalPrice INT,
	voucherId INT,
    CONSTRAINT FK_Order_Account FOREIGN KEY (accId) REFERENCES Account(id),
	CONSTRAINT FK_Order_Voucher FOREIGN KEY (voucherId) REFERENCES Voucher(id)
)

CREATE TABLE OrderDetail
(
    orderId INT,
    tourId INT,
    [date] DATE,
    quantity INT,
    price INT,
	versonId INT,
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (orderId) REFERENCES [Order](id),
    CONSTRAINT FK_OrderDetail_Tour FOREIGN KEY (tourId) REFERENCES Tour(id),
)

CREATE TABLE Feedback
(
    id INT PRIMARY KEY IDENTITY(1,1),
    accId INT,
    tourId INT,
    comment NVARCHAR(MAX),
    rating FLOAT,
    CONSTRAINT FK_Feedback_Account FOREIGN KEY (accId) REFERENCES Account(id),
    CONSTRAINT FK_Feedback_Tour FOREIGN KEY (tourId) REFERENCES Tour(id)
)

CREATE TABLE Schedule
(
    tourId INT,
    [location] NVARCHAR(MAX),
	[date] TIME,
    [description] NVARCHAR(MAX),
CONSTRAINT FK_Schedule_Tour FOREIGN KEY (tourId) REFERENCES Tour(id)
)


CREATE TABLE Blog
(
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(MAX),
    content NVARCHAR(MAX),
	[image] VARCHAR(MAX),
    publishDate DATETIME,
    accountId INT,
    CONSTRAINT FK_Blog_Account FOREIGN KEY (accountId) REFERENCES Account(id)
)

CREATE TABLE BlogComment
(
    id INT PRIMARY KEY IDENTITY(1,1),
    blogId INT,
    accountId INT,
    comment NVARCHAR(MAX),
    commentDate DATETIME,
    CONSTRAINT FK_BlogComment_Blog FOREIGN KEY (blogId) REFERENCES Blog(id),
    CONSTRAINT FK_BlogComment_Account FOREIGN KEY (accountId) REFERENCES Account(id)
)

/*
INSERT INTO Tour
([name], imageId, intendedTime, price, [description], categoryId, versionId, ruleId, feedbackId, supplierId)
VALUES
(N'Tour Hành Trình Lịch Sử', 1, '09:00:00', '700000', '', 1, 1, 1, 1, 1),
(N'Tour Dấu Chân Của Người', 2, '09:00:00', '600000', '', 1, 1, 1, 1, 2),
(N'Tour Dấu Ấn Thời Gian', 3, '09:00:00', '650000', '', 1, 1, 1, 1, 2),
(N'Tour Du Lịch Làng Gốm Bát Tràng', 4, '07:00:00', '750000', '', 2, 1, 2, 1, 3),
(N'Tour Du Lịch Làng Văn Hóa Các Dân Tộc Việt Nam', 5, '08:00:00', '500000', '', 2, 1, 2, 1, 2),
(N'Tour Hương Vị Hà Nội', 6, '05:00:00', '350000', '', 3, 1, 3, 1, 1),
(N'Tour Hương Vị Tình Thân', 7, '06:00:00', '400000', '', 3, 1, 3, 1, 2),
(N'Tour Bồng Bềnh Mây Trắng', 8, '10:00:00', '1500000', '', 4, 1,4, 1, 3),
(N'Tour Đi Mây Về Gió', 9, '12:00:00', '2500000', '', 4, 1, 4, 1, 2);
*/


INSERT INTO Tour
([name], intendedTime, price, [description], categoryId)
VALUES
(N'Tour Hành Trình Lịch Sử','09:00:00', '700000', '', 1),
(N'Tour Dấu Chân Của Người','09:00:00', '600000', '', 1),
(N'Tour Dấu Ấn Thời Gian', '09:00:00', '650000', '', 1),
(N'Tour Du Lịch Làng Gốm Bát Tràng','07:00:00', '750000', '', 2),
(N'Tour Du Lịch Làng Văn Hóa Các Dân Tộc Việt Nam','08:00:00', '500000', '', 2),
(N'Tour Hương Vị Hà Nội','05:00:00', '350000', '', 3),
(N'Tour Hương Vị Tình Thân','06:00:00', '400000', '', 3),
(N'Tour Bồng Bềnh Mây Trắng','10:00:00', '1500000', '', 4),
(N'Tour Đi Mây Về Gió','12:00:00', '2500000', '', 4);

select * from Tour


insert into Category ([name], [description])
values
(N'Tour Lịch Sử', N'Khám phá vẻ đẹp kỳ diệu của Hà Nội thông qua hành trình du lịch lịch sử. Đồng hành cùng chúng tôi để đặt chân đến những di tích lịch sử lâu dài, ngôi đền cổ kính và những câu chuyện hấp dẫn về quá khứ rực rỡ của thành phố. Hãy để chúng tôi là cầu nối giữa bạn và những huyền thoại được truyền miệng từ thế kỷ.'),
(N'Tour Văn Hóa', N'Đắm chìm trong sự đa dạng văn hóa của Hà Nội thông qua chuyến du lịch văn hóa của chúng tôi. Từ lễ hội truyền thống đến nghệ thuật đương đại, chúng tôi sẽ đưa bạn đến những trải nghiệm độc đáo mà thành phố mang lại. Hãy để chúng tôi giúp bạn hiểu rõ sâu sắc về nền văn hóa độc đáo và phong cách sống tại Hà Nội.'),
(N'Tour Ẩm Thực', N'Đắm chìm vào thế giới ẩm thực tuyệt vời của Hà Nội thông qua chuyến du lịch ẩm thực của chúng tôi. Từ những quán phố nổi tiếng đến những địa điểm ẩm thực bí mật, chúng tôi sẽ hướng dẫn bạn qua hương vị độc đáo và đa dạng của ẩm thực Việt Nam. Đặc biệt, trải nghiệm bữa ăn tại những nơi chỉ địa phương mới biết để có cái nhìn chân thực nhất về văn hóa ẩm thực đặc sắc của thành phố.'),
(N'Tour Nghỉ Dưỡng', N'Tránh xa khỏi cuộc sống hối hả, chúng tôi mời bạn đến với những điểm đến nghỉ dưỡng tuyệt vời nhất tại Hà Nội. Tận hưởng không gian yên bình, tiện nghi hiện đại và dịch vụ chăm sóc tận tâm. Điều chỉnh tâm hồn và tái tạo năng lượng tại những khu nghỉ dưỡng sang trọng, nơi bạn sẽ trải qua những trải nghiệm nghỉ dưỡng đáng nhớ.');
select * from Category





