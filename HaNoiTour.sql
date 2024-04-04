/*Muốn drop thì thực hiện lần lượt 3 dòng ở dưới*/
USE master;
ALTER DATABASE HaNoiTour SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
drop DATABASE HaNoiTour
/*-------------------------------------------*/

CREATE DATABASE HaNoiTour
USE HaNoiTour

/*Tạo các bảng database*/

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
    [status] bit DEFAULT 1
)



CREATE TABLE InformationAccounts
(
    id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(250),
    username NVARCHAR(100),
    phoneNumber VARCHAR(10),
	birthday date,
	accountId int foreign key references Account(id)
)


CREATE TABLE Category 
(
    id INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(MAX),
    [description] NVARCHAR(MAX)
)


CREATE TABLE Supplier
(
    fullName NVARCHAR(MAX),
	birthday DATE,
	email VARCHAR(MAX),
    phoneNumber VARCHAR(10),
	frontCMND VARCHAR(max),
	backCMND VARCHAR(max),

	nameCompany NVARCHAR(MAX),
    addressCompany NVARCHAR(MAX),
	emailCompany VARCHAR(MAX),
	phoneNumberCompany VARCHAR(10),

    businessCode VARCHAR(10),
	businessRegis VARCHAR(MAX),
	taxCertificate VARCHAR(MAX),
	taxPayment VARCHAR(MAX),
    accId INT PRIMARY KEY, 
    CONSTRAINT FK_Supplier_Account FOREIGN KEY (accId) REFERENCES Account(id)
)

CREATE TABLE Voucher
(
    id INT PRIMARY KEY IDENTITY(1,1),
    code NVARCHAR(50) UNIQUE,
    discountPercentage INT,
    [status] bit DEFAULT 1,
    supplierId INT,
	idAcc INT,
    CONSTRAINT FK_Voucher_Supplier FOREIGN KEY (supplierId) REFERENCES Supplier(accId),
	CONSTRAINT FK_Voucher_Account FOREIGN KEY (idAcc) REFERENCES Account(id),
);



CREATE TABLE Tour
(
    id INT IDENTITY(1,1),
    [name] NVARCHAR(MAX),
	[imageMain] VARCHAR(MAX),
	[imageAlbum] VARCHAR(MAX),
    intendedTime TIME,
    price DECIMAL(10,0),
    [description] NVARCHAR(MAX),
    categoryId INT,
	[version] INT,
    [rule] nvarchar(max),
    supplierId INT,
	[status] bit DEFAULT 1,
	primary key(id, [version]),
    CONSTRAINT FK_Tour_Category FOREIGN KEY (categoryId) REFERENCES Category(id),
    CONSTRAINT FK_Tour_Supplier FOREIGN KEY (supplierId) REFERENCES Supplier(accId),
)


CREATE TABLE Feedback
(
    id INT PRIMARY KEY IDENTITY(1,1),
    accId INT,
    tourId INT,
	versionId int,
    comment NVARCHAR(MAX),
    rating FLOAT,
    CONSTRAINT FK_Feedback_Account FOREIGN KEY (accId) REFERENCES Account(id),
    CONSTRAINT FK_Feedback_Tour FOREIGN KEY (tourId, versionId) REFERENCES Tour(id, [version]),
)

CREATE TABLE FeedbackWeb
(
    id INT PRIMARY KEY IDENTITY(1,1),
    accId INT,
	[date] DATE,
	[subject] NVARCHAR(MAX),
    [message] NVARCHAR(MAX),
    CONSTRAINT FK_FeedbackWeb_Account FOREIGN KEY (accId) REFERENCES Account(id)
)

CREATE TABLE Schedule
(
	id INT primary key IDENTITY(1,1),
    tourId INT,
	versionId int,
    [location] NVARCHAR(MAX),
	[date] TIME,
    [description] NVARCHAR(MAX),
	CONSTRAINT FK_Schedule_Tour FOREIGN KEY (tourId, versionId) REFERENCES Tour(id, [version]),
)

CREATE TABLE [Order]
(
    id INT PRIMARY KEY IDENTITY(1,1),
    accId INT,
	idInforAcc INT,
	[date] DATE,
    totalPrice DECIMAL(10,0),
    CONSTRAINT FK_Order_Account FOREIGN KEY (accId) REFERENCES Account(id),
	CONSTRAINT FK_Order_InformationAccounts FOREIGN KEY (idInforAcc) REFERENCES InformationAccounts(id),
)

CREATE TABLE OrderDetail
(
    orderId INT,
    tourId INT,
    quantity INT,
    price DECIMAL(10,0),
	dateDeparture date,
	[status] nvarchar(max) default N'Đang xử lý',
	versionId INT,
	voucherId int null DEFAULT 0,
	CONSTRAINT FK_OrderDetail_Voucher FOREIGN KEY (voucherId) REFERENCES [Voucher](id),
    CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (orderId) REFERENCES [Order](id),
    CONSTRAINT FK_OrderDetail_Tour FOREIGN KEY (tourId, versionId) REFERENCES Tour(id, [version]),
)
ALTER TABLE OrderDetail
DROP CONSTRAINT FK_OrderDetail_Voucher;


CREATE TABLE Blog
(
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(MAX),
    content NVARCHAR(MAX),
	[image] VARCHAR(MAX),
    publishDate DATETIME,
	[status] bit default 1,
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

/*-------------------------------------------------------*/


/*Thực hiện việc insert tất cả các bảng database*/
-- Bật chế độ IDENTITY_INSERT(tự insert chay phần id)
SET IDENTITY_INSERT Category ON;
insert into Category (id,[name], [description])
values
(1, N'Tour Lịch Sử', N'Khám phá vẻ đẹp kỳ diệu của Hà Nội thông qua hành trình du lịch lịch sử. Đồng hành cùng chúng tôi để đặt chân đến những di tích lịch sử lâu dài, ngôi đền cổ kính và những câu chuyện hấp dẫn về quá khứ rực rỡ của thành phố. Hãy để chúng tôi là cầu nối giữa bạn và những huyền thoại được truyền miệng từ thế kỷ.'),
(2, N'Tour Văn Hóa', N'Đắm chìm trong sự đa dạng văn hóa của Hà Nội thông qua chuyến du lịch văn hóa của chúng tôi. Từ lễ hội truyền thống đến nghệ thuật đương đại, chúng tôi sẽ đưa bạn đến những trải nghiệm độc đáo mà thành phố mang lại. Hãy để chúng tôi giúp bạn hiểu rõ sâu sắc về nền văn hóa độc đáo và phong cách sống tại Hà Nội.'),
(3, N'Tour Ẩm Thực', N'Đắm chìm vào thế giới ẩm thực tuyệt vời của Hà Nội thông qua chuyến du lịch ẩm thực của chúng tôi. Từ những quán phố nổi tiếng đến những địa điểm ẩm thực bí mật, chúng tôi sẽ hướng dẫn bạn qua hương vị độc đáo và đa dạng của ẩm thực Việt Nam. Đặc biệt, trải nghiệm bữa ăn tại những nơi chỉ địa phương mới biết để có cái nhìn chân thực nhất về văn hóa ẩm thực đặc sắc của thành phố.'),
(4, N'Tour Nghỉ Dưỡng', N'Tránh xa khỏi cuộc sống hối hả, chúng tôi mời bạn đến với những điểm đến nghỉ dưỡng tuyệt vời nhất tại Hà Nội. Tận hưởng không gian yên bình, tiện nghi hiện đại và dịch vụ chăm sóc tận tâm. Điều chỉnh tâm hồn và tái tạo năng lượng tại những khu nghỉ dưỡng sang trọng, nơi bạn sẽ trải qua những trải nghiệm nghỉ dưỡng đáng nhớ.');
SET IDENTITY_INSERT Category off;


SET IDENTITY_INSERT Account ON;
insert into Account(id, [email], [username],[password],[role],[address],[avatar],[phoneNumber],[status])
values
(1, 'huongllhe171065@fpt.edu.vn', N'Lê Lộc Hưởng','217f2372ac9127ef69f7fcd0a6268cb3',1,N'Hà Nội','avatar/images.jpg','0928008008','true'),
(2, 'soncthe171406@fpt.edu.vn', N'Cao Trường Sơn','38a925948661e6d72a592449d845bf1a',2,N'Hà Nội','avatar/images.jpg','0946578798','true'),
(3, 'dinamok59@gmail.com', N'Nguyễn Văn Sơn','38a925948661e6d72a592449d845bf1a',2,N'Hà Nội','avatar/images.jpg','0978968989','true'),
(4, 'quancthe171331@fpt.edu.vn', N'Phan Anh Quân', '8ef9d0c4cc4a47afa4a8eecbd2a69d6a', 2, N'Hà Nội', 'avatar/images.jpg', '0967936578', 'true'),
(5, 'thanhnamcan59@gmail.com', N'Cấn Thành Nam','94ddd8e2d4807e1112d3e95b599d7856',2,N'Hà Nội','avatar/images.jpg','0945637689','true'),
(6, 'huong838386@icloud.com', N'Hưởng Lê','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Nội','https://statics.vinpearl.com/du-lich-mot-minh-4_1632395487.jpeg','0978968978','true'),
(7, 'huong1@gmail.com', N'Trần Kỳ Du','9f84cd11dbe67acc92f82a31223c6983',3,N'Đà Nẵng','https://danviet.mediacdn.vn/upload/4-2016/images/2016-12-30/148303092210134-3.jpg','0958790679','true'),
(8, 'huong2@gmail.com', N'Nguyễn Tuấn Hưng','9f84cd11dbe67acc92f82a31223c6983',3,N'Nam Định','https://luxtour.com.vn/wp-content/uploads/2022/05/du-lich-ha-giang-mot-minh.jpg','095978096','true'),
(9, 'huong3@gmail.com', N'Nguyễn Anh Đức','9f84cd11dbe67acc92f82a31223c6983',3,N'Thạch Thất','https://artclick.vn/wp-content/uploads/2023/08/20-cach-tao-dang-chup-anh-du-lich-cho-nam-326-6-yDr3YQtQgb.jpg','095789878','true'),
(10, 'huong4@gmail.com', N'Chu Hải Đăng','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Đông','https://inkythuatso.com/uploads/thumbnails/800/2023/02/tao-dang-buoc-di-that-tu-nhien-4-16-09-42-49.jpg','0965789548','true'),
(11, 'huong5@gmail.com', N'Đặng Tuấn Long','9f84cd11dbe67acc92f82a31223c6983',3,N'Hải Phòng','https://inkythuatso.com/uploads/thumbnails/800/2023/02/tao-dang-chup-anh-nam-ngau-khi-di-du-lich-1-16-09-34-48.jpg','0976048438','true'),
(12, 'huong6@gmail.com', N'Vũ Anh Tuấn','9f84cd11dbe67acc92f82a31223c6983',3,N'Thái Bình','https://tiemanhsky.com/wp-content/uploads/2020/02/IMG_3278-scaled.jpg','0912385738','true'),
(13, 'huong7@gmail.com', N'Chu Hải An','9f84cd11dbe67acc92f82a31223c6983',3,N'Bình Định','https://cdn3.ivivu.com/2016/05/nhung-kieu-anh-dam-chat-toi-dang-di-du-lich-do-cua-nguoi-tre-viet-ivivu-3.jpg','0912345490','true'),
(14, 'huong8@gmail.com', N'Nguyễn Tấn Dũng','9f84cd11dbe67acc92f82a31223c6983',3,N'Bắc Ninh','https://cdn3.ivivu.com/2016/05/nhung-kieu-anh-dam-chat-toi-dang-di-du-lich-do-cua-nguoi-tre-viet-ivivu-1.jpg','0945875798','true'),
(15, 'huong9@gmail.com', N'Nguyễn Ngọc Ánh','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Đông','https://static.vinwonders.com/2022/11/thang-5-nen-di-dau-o-mien-bac-1.jpg','','true'),
(16, 'huong10@gmail.com', N'Nguyễn Thị Linh','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Nội','https://static.vinwonders.com/2022/11/th-ng-2-n-n-i-du-l-ch-u-mi-n-b-c-1.jpg','','true'),
(17, 'huong11@gmail.com', N'Nguyễn Minh Tuấn','9f84cd11dbe67acc92f82a31223c6983',3,N'Bình Định','https://cdn3.ivivu.com/2016/05/nhung-kieu-anh-dam-chat-toi-dang-di-du-lich-do-cua-nguoi-tre-viet-ivivu-3.jpg','0912345490','true'),
(18, 'huong12@gmail.com', N'Nguyễn Đình Long','9f84cd11dbe67acc92f82a31223c6983',3,N'Bắc Ninh','https://cdn3.ivivu.com/2016/05/nhung-kieu-anh-dam-chat-toi-dang-di-du-lich-do-cua-nguoi-tre-viet-ivivu-1.jpg','0945875798','true'),
(19, 'huong13@gmail.com', N'Ngô Bá Hoàng','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Đông','https://static.vinwonders.com/2022/11/thang-5-nen-di-dau-o-mien-bac-1.jpg','','true'),
(20, 'huong14@gmail.com', N'Trịnh Văn Quyết','9f84cd11dbe67acc92f82a31223c6983',3,N'Hà Nội','https://static.vinwonders.com/2022/11/th-ng-2-n-n-i-du-l-ch-u-mi-n-b-c-1.jpg','','true')
SET IDENTITY_INSERT Account off;


SET IDENTITY_INSERT InformationAccounts ON;
insert into InformationAccounts (id, email, username, phoneNumber, birthday, accountId)
values
(1, 'huong838386@icloud.com', N'Lê Lộc Hưởng', '0928008008', '2003-9-16', 5),
(2, 'huongllhe171065@fpt.edu.vn', N'Hưởng Lê', '0929196196', '2003-9-16', 5),
(3, 'sonngocle160923@gmail.com', N'Ngọc Sơn', '0929196196', '2003-9-16', 5)
SET IDENTITY_INSERT InformationAccounts off;


INSERT INTO [dbo].[Supplier]
           ([fullName]
           ,[birthday]
           ,[email]
           ,[phoneNumber]
           ,[frontCMND]
           ,[backCMND]
           ,[nameCompany]
           ,[addressCompany]
           ,[emailCompany]
           ,[phoneNumberCompany]
           ,[businessCode]
           ,[businessRegis]
           ,[taxCertificate]
           ,[taxPayment]
           ,[accId])
     VALUES
           (N'Cao Trường Sơn','2003-1-1','soncthe@fpt.edu.vn','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch Sơn Dương',N'Hà Nội','soncthe@fpt.edu.vn'
           ,'0357888956','1234567891'
		   ,'https://dulichhaiphong.com.vn/wp-content/uploads/2013/07/DKKD1.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','2'),
		   (N'Cấn Thành Nam','2003-1-1','thanhnamcan59@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch Nam Ánh',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','6'),
		   (N'Chu Thiên Quân','2003-1-1','quancthe171331@fpt.edu.vn','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch Phan Anh',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','4'),
		   (N'Pham Tuấn Anh','2003-1-1','dinamok59@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch Đông Sơn',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','3'),

		   (N'Nguyễn Minh Tuấn','2003-1-1','huong11@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch và nghỉ dưỡng Minh Tuấn',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','17'),
		   
		   (N'Nguyễn Đình Long','2003-1-1','huong12@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch văn hóa Long Hải',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','18'),

		   (N'Ngô Bá Hoàng','2003-1-1','huong13@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch nghỉ dưỡng Hoàng Mai',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','19'),

		   (N'Trịnh Văn Quyết','2003-1-1','huong12@gmail.com','0357888956','https://accgroup.vn/wp-content/uploads/2022/08/chung-minh-nhan-dan-12-so-1.jpg'
           ,'https://i.pinimg.com/736x/0e/a6/07/0ea60749572d399218b842931f892f86.jpg'
		   ,N'Công ty du lịch ẩm thực Văn Nam',N'Hà Nội','namcthe@fpt.edu.vn'
           ,'0357888956','1234567891','https://www.tuanlinhtravel.com/images/Business_License.jpg'
		   ,'https://luatduonggia.vn/wp-content/uploads/2021/06/Mau-thong-bao-thay-doi-thong-tin-dang-ky-thue.jpg'
		   ,'https://cdn.luatvietnam.vn/uploaded/Images/Original/2022/04/13/mau-xac-nhan-hoan-thanh-nghia-vu-thue_1304094849.png','20');

SET IDENTITY_INSERT Tour ON;
INSERT INTO Tour
(id, [name], [imageMain], [imageAlbum], intendedTime, price, [description], categoryId, [version], [rule], supplierId, [status])
VALUES  
(1, N'Tour Hành Trình Lịch Sử','https://s.net.vn/Gs2w','https://www.vietfuntravel.com.vn/image/data/Ha-Noi/Chua-mot-cot/Gioi-thieu-doi-net-ve-lich-su-chua-mot-cot-ha-noi-01.jpg/splitAlbum/https://dulichtoday.vn/wp-content/uploads/2018/09/Di-tich-lich-su-ha-noi-hoang-thanh-thang-long1.jpg/splitAlbum/https://hoangthanhthanglong.vn/wp-content/uploads/2023/05/hoangthanh.jpg/splitAlbum/https://res.klook.com/image/upload/q_85/c_fill,w_750/v1612410607/blog/cx5b7abrkj3dddsfgrd3.jpg',
'9:00:00', 700000, N'Hoàng thành Thăng Long - Phố cổ Hà Nội - Văn Miếu Quốc Tử Giám Tour:
Khám phá lịch sử và văn hóa phong phú của Hà Nội với hành trình qua Hoàng thành Thăng Long cổ kính, tản bộ dọc theo những con phố duyên dáng của Khu Phố Cổ và viếng thăm Văn Miếu Quốc Tử Giám, Văn Miếu, nơi thờ phụng Nho giáo.', 1, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(2, N'Tour Dấu Chân Của Người','https://s.net.vn/Cca6','https://imagevietnam.vnanet.vn//MediaUpload/Org/2023/05/18/vna-potal-lang-bac-noi-hoi-tu-niem-tin-tinh-cam-kinh-yeu-cua-nhan-dan-ca-nuoc-doi-voi-chu-tich-ho-chi-minh-673742918-9-47-2.jpg/splitAlbum/https://file1.dangcongsan.vn/data/0/images/2023/06/21/upload_36/img-0085.jpg?dpi=150&quality=100&w=780/splitAlbum/https://image.baogialai.com.vn/w800/Uploaded/2024/fkxdronexq/2023_06_21/898-5476.jpg/splitAlbum/https://cdn.tuoitrethudo.com.vn/stores/news_dataimages/nguyentuananh/052022/10/11/145c58c603fdc808baf6b8b758a298d0.png?rt=20220510113632',
'9:00:00', 600000, N'Nhà Tù Hỏa Lò - Chùa Một Cột - Lăng Chủ Tịch Tour:
Khám phá những câu chuyện về quá khứ của Việt Nam với chuyến tham quan Nhà tù Hỏa Lò khét tiếng, chiêm ngưỡng vẻ đẹp kiến trúc của Chùa Một Cột (Chùa Một Cột) và tỏ lòng thành kính tại Lăng Chủ Tịch lịch sử, nơi an nghỉ cuối cùng của Chủ tịch Hồ Chí Minh .', 1, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(3, N'Tour Dấu Ấn Thời Gian','https://s.net.vn/bQvm', 'https://wtravel.wolfgroup.vn/wp-content/uploads/2022/10/lang-co-duong-lam-ha-noi-1024x682.jpg/splitAlbum/https://dulichxudoai.com/wp-content/uploads/2022/05/bf50210b-90be-4cb5-9d29-ea2df4de251c-2-1.jpg/splitAlbum/https://media.baodautu.vn/Images/honghanh/2022/03/22/Thanh-co-Son-Tay-toa-thanh-da-ong-duy-nhat-tai-Viet-Nam-1.jpg/splitAlbum/https://cdn.asahiluxstay.com/media/2022/1213/0304-8c6af436dba8acf-mceu-76656770511670900665512.jpg',
'9:00:00', 650000, N'Làng Cổ Đường Lâm - Chùa Mía - Thành Cổ Sơn Tây Tour:
Quay ngược thời gian khi bạn khám phá ngôi làng cổ Đường Lâm, ghé thăm Chùa Mía (Chùa Mía) độc đáo và khám phá nét quyến rũ lịch sử của Thành Cổ Sơn Tây, một tòa thành được bảo tồn tốt.', 1, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(4, N'Tour Du Lịch Làng Gốm Bát Tràng','https://s.net.vn/LI7s', 'https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/20/8/11/bat_trang_1.jpg/splitAlbum/https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/20/8/11/phu_nu_bat_trang.jpg/splitAlbum/https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/20/8/11/langgombattrang.jpg/splitAlbum/https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/20/8/11/trai_nghiem_lam_gom.jpg',
'7:00:00', 750000, N'Làng Gốm Bát Tràng Tour:
Đắm mình trong nghệ thuật gốm sứ truyền thống tại Bát Tràng, một làng gốm sứ nổi tiếng, nơi các nghệ nhân lành nghề tạo ra đồ gốm tinh xảo bằng kỹ thuật lâu đời.', 2, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(5, N'Tour Du Lịch Làng Văn Hóa Các Dân Tộc Việt Nam','https://s.net.vn/J9YJ', 'https://vietair.com.vn/Media/Images/vietair/Tin-tuc/2023/5/lang-van-hoa-54-dan-toc-gioi-thieu-ve-lang-van-hoa-54-dan-toc.jpg?p=1&w=790/splitAlbum/https://vietair.com.vn/Media/Images/vietair/Tin-tuc/2023/5/lang-van-hoa-54-dan-toc.jpg/splitAlbum/https://vietair.com.vn/Media/Images/vietair/Tin-tuc/2023/5/lang-van-hoa-54-dan-toc-khu-lang-dan-toc.jpg?p=1&w=790/splitAlbum/https://vietair.com.vn/Media/Images/vietair/Tin-tuc/2023/5/lang-van-hoa-54-dan-toc-khu-di-san-the-gioi.jpg?p=1&w=790',
'8:00:00', 500000, N'Làng Văn Hóa Dân Tộc Việt Nam Tour:
Trải nghiệm sự đa dạng sống động của văn hóa dân tộc Việt Nam tại Làng Văn Hóa Dân Tộc Việt Nam, một bảo tàng sống giới thiệu phong tục, truyền thống và nghề thủ công của các dân tộc khác nhau.', 2, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(6, N'Tour Hương Vị Hà Nội', 'https://s.net.vn/kdw4', 'https://images.foody.vn/res/g1/9244/s400x400/foody-bach-phuong-bun-bo-nam-bo-902-636613307032745235.jpg/splitAlbum/https://axwwgrkdco.cloudimg.io/v7/__gmpics__/b5c53cc7f8444c0cae55ec2b49e7739c?w=1100&h=1100&org_if_sml=1/splitAlbum/https://axwwgrkdco.cloudimg.io/v7/__gmpics__/7dff90cc96a6435ebb9db45c0186280d?width=1000/splitAlbum/https://axwwgrkdco.cloudimg.io/v7/__gmpics__/9719fb7a35604ae896a44d4edf180a9f?width=1000',
'7:00:00', 350000, N'Nhà Hàng Chả Cá Thăng Long - Phở 10 Lý Quốc Sư - Bún Chả Hàng Than - Bún Bò Nam Bộ Hàng Điếu Tour:
Thỏa mãn vị giác của bạn với chuyến phiêu lưu ẩm thực khắp Hà Nội, thưởng thức hương vị độc đáo của các món ăn mang tính biểu tượng như chả cá (cá nướng), phở, bún chả và bún bò Nam Bộ tại các quán ăn nổi tiếng như Chả Cá Thăng Long và Phở 10 Lý Quốc Sư.', 3, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(7, N'Tour Hương Vị Tình Thân','https://s.net.vn/IfhO', 'https://static.riviu.co/image/2020/12/17/fca76b0d0f3c269a16df6c4d7847f850_output.jpeg/splitAlbum/https://images.foody.vn/res/g87/868902/prof/s640x400/file_fe59bdb9-09ee-4e1c-98a3-283-2f321299-220106234901.jpeg/splitAlbum/https://images.foody.vn/res/g73/724818/prof/s640x400/foody-upload-api-foody-mobile-d5-200923153426.jpg',
'6:00:00', 400000, N'Miến Lươn Đông Thịnh - Bún Bò Huế 67 - Bánh Mì Pate Hàng Cả Tour:
Thưởng thức ẩm thực Việt Nam đa dạng với tour ẩm thực gồm các đặc sản như miến lươn (mì lươn) từ Đông Thịnh, bún bò Huế chính thống và Pate Bánh Mì thơm ngon từ phố Hàng Cả.', 3, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(8, N'Tour Bồng Bềnh Mây Trắng','https://s.net.vn/b4gc', 'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/43/75434/3c211725e0caba40208da0cdae4e7335-1642151652.jpg?im=RegionOfInterestCrop=(1020,681),regionOfInterest=(1476.5,984.5)/splitAlbum/https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/8e/75410/c1de9e75607bef2a8bd0e24137a70187-1642151652.jpg?im=RegionOfInterestCrop=(1020,630),regionOfInterest=(1771.5,1093.0)/splitAlbum/https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/42/75407/3db328ffdb84b7a15ecb7e388886655c-1642151652.jpg?im=RegionOfInterestCrop=(1020,681),regionOfInterest=(1476.5,984.5)/splitAlbum/https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/e2/75412/ecb90032d1f70381389888025918f8fc-1642151652.jpg?im=RegionOfInterestCrop=(1020,1020),regionOfInterest=(1476.5,984.0)',
'10:00:00', 1500000, N'Melia Ba Vì Resort - Đỉnh Núi Quốc Gia Ba Vì Tour:
Hãy trốn thoát đến sự yên tĩnh của Meliá Ba Vì Resort và đắm mình trong khung cảnh ngoạn mục của Vườn Quốc gia Ba Vì. Khám phá vẻ đẹp hoang sơ của đỉnh núi và tận hưởng những tiện nghi sang trọng của khu nghỉ dưỡng.', 4, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(9, N'Tour Đi Mây Về Gió','https://s.net.vn/nGuw', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/cc/81/6a/asean-resort.jpg?w=700&h=-1&s=1/splitAlbum/https://ticotravel.com.vn/wp-content/uploads/2023/03/ASEAN-RESORT-_-SPA-THACH-THAT-10.jpg/splitAlbum/https://s1.odt.vn/uploads/02-2021/06/galleries/asean-resort-ba-vi-16132659442.jpg/splitAlbum/https://reviewvilla.vn/wp-content/uploads/2022/01/asean-resort-4.5.jpg',
'12:00:00', 2500000, N'Khu Nghỉ Dưỡng Asean Ba Vì Tour:
Thư giãn trong khung cảnh thanh bình của Khu nghỉ dưỡng Asean Ba Vì, được bao quanh bởi cây xanh tươi tốt và khung cảnh tuyệt đẹp. Trẻ hóa với các hoạt động giải trí và tận hưởng bầu không khí yên bình của khu nghỉ dưỡng bình dị này.', 4, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(10, N'Thiên Nhiên Bình Yên','https://pme.vn/Uploads/images/avatar/Avata%20Du%20an/Flamigo-Dailai.jpg',
'https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-1-1024x1024.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-2.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-4.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-5.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-6.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-7.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-8.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2022/10/kinh-nghiem-du-lich-dai-lai-9.jpg?tr=dpr-2,w-675',
'12:00:00', 1500000, N'Chuyến đi này không chỉ là một cơ hội để thư giãn và tận hưởng không gian thiên nhiên, mà còn là một hành trình để khám phá và trải nghiệm sự thanh bình của cuộc sống nông thôn. Với nhịp sống hối hả, căng thẳng của cuộc sống đô thị, đây chắc chắn sẽ là một lựa chọn hoàn hảo để bạn có thể tạm gác lại mọi lo toan, lo âu để thả lỏng tâm hồn và tìm lại sự cân bằng bên trong.

Khu du lịch sinh thái Đại Lải nằm bên cạnh dãy núi Tam Đảo, với không gian mênh mông của hồ nước xanh biếc và những cánh rừng phong phú. Tại đây, bạn sẽ được hòa mình vào không khí trong lành của thiên nhiên, điều mà ít nơi nào có thể mang lại. Cảm giác thoải mái, yên bình khi đắm chìm trong tiếng hát của những con chim ríu rít, tiếng sóng nước lập lòe và làn gió nhẹ nhàng thổi qua, tất cả đều tạo nên một bức tranh thiên nhiên tuyệt vời.

Tận hưởng không gian rộng lớn của Đại Lải, bạn có thể tham gia vào các hoạt động thư giãn như chèo thuyền kayak trên hồ, câu cá hoặc dạo bước khám phá trong khu rừng xanh mát. Cảm giác tự do khi đắm mình trong làn nước trong xanh của hồ, hoặc khi ngồi bên bờ đất và thưởng thức cảnh đẹp của mặt nước hòa quyện với bầu trời xanh thẳm.

Buổi trưa, một bữa trưa ngon miệng sẽ được phục vụ tại nhà hàng trong khu du lịch, với đủ loại món ăn đặc sản của vùng miền. Bạn sẽ được thưởng thức hương vị tinh tế và độc đáo 
', 4, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(11, N'Hành Trình Bình Yên tại Ecopark','https://imagev3.vietnamplus.vn/w1000/Uploaded/2024/ngtmbh/2022_12_13/Ecopark2.jpg.webp', 'https://thanhnien.mediacdn.vn/Uploaded/linhnt.qc/2021_08_18/ecopark/ecopark_1_XJWB.jpg?width=500/splitAlbum/https://thanhnien.mediacdn.vn/Uploaded/linhnt.qc/2021_08_18/ecopark/ecopark_2_DBQQ.jpg?width=500/splitAlbum/https://thanhnien.mediacdn.vn/Uploaded/linhnt.qc/2021_08_18/ecopark/ecopark_3_LUIE.jpg?width=500/splitAlbum/https://thanhnien.mediacdn.vn/Uploaded/linhnt.qc/2021_08_18/ecopark/ecopark_5_SLPQ.jpg?width=500/splitAlbum/https://ecopark.com.vn/images/overview/2020/10/31/large/moitruongecopark_1604135559.jpg',
'12:00:00',  1200000, N'Chuyến đi này không chỉ đơn thuần là một chuyến tham quan, mà còn là một hành trình khám phá và trải nghiệm không gian sống xanh mát tại Ecopark - một trong những khu đô thị sinh thái hàng đầu tại Hà Nội. Tại đây, du khách sẽ được đắm chìm trong không gian bình yên của thiên nhiên, tận hưởng những khoảnh khắc thư giãn và gắn kết cùng gia đình và bạn bè.
Khu đô thị Ecopark không chỉ là một nơi ở, mà còn là một thiên đường ngoại khoá cho mọi lứa tuổi. Với hệ thống công viên xanh mướt, hồ nước trong lành và khu vườn hoa đa dạng, du khách có thể thả lỏng tâm hồn và tận hưởng những khoảnh khắc yên bình giữa lòng thành phố. Mỗi bước đi, mỗi hơi thở tại Ecopark đều là một cơ hội để tái tạo năng lượng và tận hưởng hương vị của cuộc sống tự nhiên.
Với các hoạt động ngoại khoá thú vị như đạp xe đạp, đạp thuyền kayak trên hồ, hoặc tham gia các lớp học yoga và thảo dược, du khách có thể tận hưởng một ngày trọn vẹn với niềm vui và sự thư giãn. Bên cạnh đó, Ecopark cũng có các tiện ích đẳng cấp như các nhà hàng, quán cà phê và khu vui chơi giải trí, đảm bảo mọi nhu cầu giải trí và thưởng thức ẩm thực của du khách được đáp ứng đầy đủ.
Với không gian xanh mát và bình yên, Ecopark là điểm đến lý tưởng cho du khách muốn trốn khỏi sự ồn ào của cuộc sống đô thị và tận hưởng những khoảnh khắc thư giãn và gắn kết bên gia đình và bạn bè. Đây chắc chắn sẽ là một chuyến đi đáng nhớ và trọn vẹn cho mọi du khách.
', 4, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(12, N'Hành Trình Khám Phá Chùa Thầy - Hòa Mình Trong Di Sản Văn Hóa Tâm Linh','https://static-images.vnncdn.net/files/publish/2023/7/25/l1018126-869.jpg', 'https://static-images.vnncdn.net/files/publish/2023/7/25/l1018123-870.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018083-871.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018056-872.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018050-873.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018037-874.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018118-879.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018111-883.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018103-882.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018101-885.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018091-884.jpg',
'12:00:00', 250000, N'Chuyến đi này sẽ không chỉ mang lại cho du khách cơ hội khám phá vẻ đẹp tự nhiên và kiến trúc độc đáo của Chùa Thầy mà còn làm sâu sắc hơn với những huyền thoại và di sản văn hóa của nơi đây. Tại Chùa Thầy, du khách sẽ được nghe kể về những câu chuyện và truyền thống lâu đời liên quan đến chùa, từ những câu chuyện về sự thành lập của nó cho đến các truyền thuyết về những vị thầy có công trong lịch sử Phật giáo Việt Nam. Bên cạnh đó, du khách cũng sẽ được tìm hiểu về nghệ thuật và văn hóa tôn giáo của người Việt Nam thông qua việc tham gia các hoạt động tâm linh và lễ cúng truyền thống tại chùa. Tất cả những trải nghiệm này sẽ tạo ra một hành trình văn hóa sâu sắc và đầy ý nghĩa, để du khách có cơ hội thấu hiểu và trải nghiệm sâu hơn về tinh thần và nền văn hóa của người dân Việt Nam.

', 2, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(13, N'Hành Trình Khám Phá Chùa Trấn Quốc - Huyền Thoại và Vẻ Đẹp Tâm Linh Bên Bờ Hồ Tâ','https://ik.imagekit.io/tvlk/blog/2022/08/chua-tran-quoc-1-1024x683.jpg?tr=dpr-2,w-675', 'https://static-images.vnncdn.net/files/publish/2023/7/25/l1018123-870.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018083-871.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018066-880.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018050-873.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018037-874.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018118-879.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018111-883.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018103-882.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018101-885.jpg/splitAlbum/https://static-images.vnncdn.net/files/publish/2023/7/25/l1018091-884.jpg

',
'12:00:00', 100000, N'
Chuyến đi này không chỉ mang lại cho du khách cơ hội khám phá vẻ đẹp tâm linh và kiến trúc độc đáo của Chùa Trấn Quốc mà còn làm sâu sắc hơn với những huyền thoại và di sản văn hóa của nơi đây. Tại Chùa Trấn Quốc, du khách sẽ được nghe kể về lịch sử và ý nghĩa tâm linh của ngôi chùa, từ những câu chuyện về sự thành lập của nó cho đến những truyền thuyết về các vị thần linh và các sự kiện lịch sử quan trọng.

Ngoài ra, du khách cũng sẽ được tìm hiểu về nghệ thuật và văn hóa tôn giáo của người Việt Nam thông qua việc tham gia các hoạt động tâm linh và lễ cúng truyền thống tại chùa. Qua những trải nghiệm này, du khách có cơ hội thấu hiểu và trải nghiệm sâu hơn về tinh thần và nền văn hóa của người dân Việt Nam. Đồng thời, khám phá vẻ đẹp tĩnh lặng của bờ Hồ Tây cũng sẽ là một trải nghiệm đáng nhớ trong hành trình này.
', 2, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 2, 'true'),
(14, N'Hành Trình Khám Phá Di Sản Lịch Sử ở Ngoại Ô Hà Nội - K9 Di tích lịch sử quốc gia','https://ik.imagekit.io/tvlk/blog/2023/09/go-and-share-khu-di-tich-k9-da-chong-3.webp?tr=dpr-2,w-675', '
https://ik.imagekit.io/tvlk/blog/2023/09/go-and-share-khu-di-tich-k9-da-chong-4.webp?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2023/09/go-and-share-khu-di-tich-k9-da-chong-8.webp?tr=dpr-2,w-675/splitAlbum/
https://photo-cms-vovworld.zadn.vn/w730/uploaded/vovworld/ujwyqdxwp/2020_09_03/kpvn-1_szzy.jpg/splitAlbum/
https://photo-cms-vovworld.zadn.vn/w730/uploaded/vovworld/ujwyqdxwp/2020_09_03/kpvn-2_mqoz.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18b7befc27.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18bb5bffc7.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18c94b24d8.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18dbb297a0.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18d77c6a74.jpg/splitAlbum/
https://s3-hn-2.cloud.cmctelecom.vn/tapchicongthuong.vn/tcct-media/23/9/1/tro-lai-vung-dat-thieng-khu-di-tich-lich-su-k9_64f18d13e1dc9.jpg

',
'12:00:00', 500000, N'Trải nghiệm này sẽ đưa du khách vào một hành trình khám phá lịch sử sâu sắc tại Di tích lịch sử quốc gia K9, một trong những điểm đến lịch sử đặc biệt ở ngoại ô Hà Nội. Khởi hành từ trung tâm thành phố, du khách sẽ được đưa đến K9, nơi lưu giữ nhiều kí ức và di sản về thời kỳ kháng chiến chống Mỹ cứu nước.
Tại K9, du khách sẽ bước vào một thế giới lịch sử sống động thông qua việc khám phá các hang động, hầm trú ẩn và bí mật của Bộ Tổng Tư lệnh Quân đội nhân dân Việt Nam. Hành trình này không chỉ là cơ hội để hiểu rõ hơn về cuộc chiến tranh và sự hy sinh của những người lính và nhân dân Việt Nam mà còn là dịp để tưởng nhớ và ghi nhận những giá trị văn hóa, tinh thần mạnh mẽ của dân tộc.
Điều đặc biệt của tour này là khách hàng sẽ được nghe những câu chuyện lịch sử, những tình huống thú vị từ hướng dẫn viên, tạo nên một trải nghiệm thú vị và ý nghĩa trong hành trình khám phá văn hóa và lịch sử của đất nước. Hơn nữa, bữa trưa với các món ăn đặc sản địa phương sẽ là điểm nhấn cuối cùng, kết thúc một ngày tràn đầy ấn tượng và ý nghĩa.
', 1, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 4, 'true'),
(15, N'Hành Trình Khám Phá Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam','https://statics.vinpearl.com/bao-tang-lich-su-quoc-gia-1_1681308349.jpeg', 'https://statics.vinpearl.com/bao-tang-lich-su-quoc-gia-2_1681308419.jpeg/splitAlbum/
https://statics.vinpearl.com/bao-tang-lich-su-quoc-gia-3_1681308505.jpeg/splitAlbum/
https://statics.vinpearl.com/bao-tang-lich-su-quoc-gia-4_1681308551.jpeg/splitAlbum/
https://statics.vinpearl.com/bao-tang-lich-su-quoc-gia-5_1681308596.jpeg/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2018/11/bao-tang-lich-su-viet-nam-3.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2018/11/bao-tang-lich-su-viet-nam-8.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2018/11/bao-tang-lich-su-viet-nam-13.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2018/11/bao-tang-lich-su-viet-nam-14.jpg?tr=dpr-2,w-675/splitAlbum/
https://ik.imagekit.io/tvlk/blog/2018/11/bao-tang-lich-su-viet-nam-17.jpg?tr=dpr-2,w-675
',
'12:00:00', 300000, N'Bảo tàng Lịch sử Việt Nam không chỉ là một nơi trưng bày các hiện vật lịch sử mà còn là một kho tàng văn hóa, ghi chép lại những biến cố lịch sử quan trọng của dân tộc Việt Nam. Hành trình khám phá Bảo tàng này sẽ đưa du khách qua một cuộc hành trình thú vị và sâu sắc vào quá khứ lịch sử của đất nước.

Buổi sáng, từ trung tâm Hà Nội, chúng ta bắt đầu hành trình đến Bảo tàng Lịch sử Việt Nam. Tại đây, hướng dẫn viên sẽ dẫn dắt du khách qua các phòng trưng bày, từ những di vật tiền sử đến hiện đại, từ lịch sử dân tộc đến lịch sử chiến tranh và văn hóa.

Cùng với hướng dẫn viên, du khách sẽ có cơ hội tìm hiểu sâu hơn về những giai đoạn lịch sử quan trọng, những sự kiện định hình nên bức tranh lịch sử của Việt Nam. Những câu chuyện lịch sử, những diễn biến quan trọng, và những con người anh hùng sẽ được tái hiện một cách sống động thông qua những hiện vật và tư liệu đặc biệt trong Bảo tàng.

Buổi trưa, du khách sẽ được thưởng thức các món ăn đặc sản tại một nhà hàng gần khu vực Bảo tàng, tạo điểm dừng chân lý tưởng sau buổi tham quan.

Buổi chiều tiếp tục với việc khám phá các phòng trưng bày còn lại của Bảo tàng, hoặc du khách có thể tùy chọn tham gia các hoạt động tương tác văn hóa được tổ chức tại Bảo tàng.

Cuối ngày, chúng ta trở về điểm xuất phát với những kỷ niệm đáng nhớ và kiến thức mới được cập nhật về lịch sử và văn hóa của Việt Nam.
', 2, 1, N'(1) Yêu cầu du khách đến điểm hẹn trước ít nhất 15 phút so với thời gian khởi hành dự kiến.
(2) Cấm hút thuốc trong suốt chuyến đi.
(3) Tuân thủ mọi chỉ dẫn của hướng dẫn viên du lịch.
(4) Không được phép uống rượu trong suốt chuyến đi.
(5) Khuyến khích mặc trang phục phù hợp với thời tiết và mang giày đi bộ thoải mái.
(6) Giữ cho môi trường tour luôn sạch sẽ bằng cách giữ rác trong túi và vứt vào thùng rác chỉ định.
(7) Chụp ảnh chỉ được phép ở những điểm được phép và vui lòng tôn trọng quy tắc và nguyên tắc văn hóa địa phương.
(8) Du khách chịu trách nhiệm về tài sản cá nhân của mình trong suốt chuyến đi.
(9) Trong trường hợp khẩn cấp, du khách cần liên hệ ngay với hướng dẫn viên du lịch để được hỗ trợ.
', 4, 'true');

SET IDENTITY_INSERT Tour off;

SET IDENTITY_INSERT Feedback ON;
INSERT INTO Feedback
(id, accId, tourId, versionId, comment, rating)
VALUES
(1, 5, 1, 1, N'Khung cảnh xung quanh rất đẹp và hoang sơ.', 5),
(2, 5, 2, 1, N'Chuyến du lịch này mình cảm thấy rất thú vị vì được đi qua những nơi lịch sử , thiêng liêng và hào hùng làm sao.Được thăm những nơi bác từng đặt chân đến thật thú vị, tự hào làm sao', 5),
(3, 5, 3, 1, N'Tour bắt đầu và thực sự tuyệt vời!', 5),
(4, 6, 4, 1, N'Chuyến đi thú vị và đầy thông tin.', 4),
(5, 6, 5, 1, N'Kinh nghiệm thật tuyệt vời, khám phá những địa điểm lịch sử.', 4),
(6, 6, 6, 1, N'Tour mang đến cái nhìn tuyệt vời về văn hóa.', 4),
(7, 7, 7, 1, N'Tour rất tốt, nhưng vẫn có chỗ có thể cải thiện.', 3),
(8, 7, 8, 1, N'Chuyến đi ở mức là trung bình, có thể tốt hơn.', 3),
(9, 7, 9, 1, N'Tour có những điểm đặc sắc nhưng cũng có nhược điểm.', 3),
(10, 7, 10, 1, N'Tôi rất thích cách tổ chức và lựa chọn điểm đến trong tour. Mọi thứ đều rất hấp dẫn và đem lại cho tôi những trải nghiệm mới mẻ.', 5),
(11, 7, 11, 1, N'Du lịch ở Hà Nội thật sự là một trải nghiệm tuyệt vời.', 4),
(12, 7, 12, 1, N'Tour đã đáp ứng hoặc thậm chí vượt qua mong đợi của tôi. Tôi sẽ giới thiệu cho bạn bè và gia đình về trải nghiệm du lịch này.', 5),
(13, 7, 13, 1, N'Dịch vụ và tiện ích trong tour đều rất tốt. Tôi cảm thấy thoải mái và hài lòng với mọi khía cạnh của chuyến đi.', 4),
(14, 7, 14, 1, N'Chuyến đi đã mang lại cho tôi những trải nghiệm đáng nhớ và ý nghĩa. Tôi đã có cơ hội khám phá và hiểu sâu hơn về văn hóa và lịch sử của Hà Nội', 4),
(15, 7, 15, 1, N'Tôi rất hài lòng với chất lượng của tour. Hướng dẫn viên rất am hiểu và nhiệt tình, các điểm đến đều thú vị và đáng nhớ.', 5),
(16, 5, 15, 1, N'Khung cảnh xung quanh rất đẹp và hoang sơ.', 5),
(17, 5, 14, 1, N'Chuyến du lịch này mình cảm thấy rất thú vị vì được đi qua những nơi lịch sử , thiêng liêng và hào hùng làm sao.Được thăm những nơi bác từng đặt chân đến thật thú vị, tự hào làm sao', 5),
(18, 5, 13, 1, N'Tour bắt đầu và thực sự tuyệt vời!', 5),
(19, 6, 12, 1, N'Chuyến đi thú vị và đầy thông tin.', 4),
(20, 6, 11, 1, N'Kinh nghiệm thật tuyệt vời, khám phá những địa điểm lịch sử.', 4),
(21, 6, 10, 1, N'Tour mang đến cái nhìn tuyệt vời về văn hóa.', 4),
(22, 7, 9, 1, N'Tour rất tốt, nhưng vẫn có chỗ có thể cải thiện.', 3),
(23, 7, 8, 1, N'Chuyến đi ở mức là trung bình, có thể tốt hơn.', 3),
(24, 7, 7, 1, N'Tôi cảm thấy rất ấn tượng với sự chuyên nghiệp của nhân viên và hướng dẫn viên', 5),
(25, 7, 6, 1, N'Chuyến đi đã mang lại cho tôi cái nhìn sâu sắc hơn về văn hóa và con người ở Hà Nội.', 5),
(26, 7, 5, 1, N'Tôi đã được tham gia vào nhiều hoạt động đa dạng và có cơ hội tạo ra những kỷ niệm đáng nhớ cùng gia đình và bạn bè.', 4),
(27, 7, 4, 1, N'Du lịch ở Hà Nội đã làm cho tôi hiểu rõ hơn về nền văn hóa phong phú và lịch sử đa dạng.', 5),
(28, 7, 3, 1, N'ôi cảm thấy thật may mắn khi có cơ hội được trải nghiệm những điều này và sẽ nhớ mãi.', 3),
(29, 7, 2, 1, N'Tour có những điểm đặc sắc nhưng cũng có nhược điểm.', 3),
(30, 7, 1, 1, N'ôi đã được tham gia vào nhiều hoạt động đa dạng và có cơ hội tạo ra những kỷ niệm đáng nhớ cùng gia đình và bạn bè.', 5)
;
SET IDENTITY_INSERT Feedback off;


INSERT INTO Schedule
(tourId, versionId, [location], [date], [description])
VALUES
(1, 1, N'Hoàng Thành Thăng Long', '8:00:00', N'Bắt đầu tham quan hoàng thành Thăng Long'),
(1, 1, N'Phố cổ Hà Nội', '11:00:00', N'Khám phá phố cổ Hà Nội và dừng chân nghỉ trưa tại đây'),
(1, 1, N'Văn Miếu Quốc Tử Giám', '14:00:00', N'Tiếp tục hành trình, di chuyển đến tham quan Văn Miếu Quốc Tử Giám'),
(2, 1, N'Nhà Tù Hỏa Lò', '08:30:00', N'Bắt đầu hành trình tham quan nhà tù Hỏa Lò, nơi mà Bác bị thực dân Pháp giam giữ trong những năm 1942-1943'),
(2, 1, N'Chùa Một Cột', '11:30:00', N'Di chuyển đến tham quan Chùa Một Cột'),
(2, 1, N'Lăng Chủ tịch Hồ Chí Minh', '11:30:00', N'Cuối cùng là hành trình vào thăm Lăng Bác'),
(3, 1, N'Làng cổ Đường Lâm', '8:00:00', N'Bắt đầu hành trình vào làng Đường Lâm'),
(3, 1, N'Chùa Mía', '11:00:00', N'Tiếp tục hành trình là đi tham quan Chùa Mía'),
(3, 1, N'Thành cổ Sơn Tây', '14:00:00', N'Tham quan di tích lịch sử qua thành cổ Sơn Tây'),
(4, 1, N'Làng Gốm Bát Tràng', '8:00:00', N'Bắt đầu hành trình thăm quan, khám phá và trải nghiệm nghề làm gốm tại Làng Gốm Bát Tràng'),
(5, 1, N'Làng Văn Hóa Các Dân Tộc Việt Nam', '08:00:00', N'Thăm quan, cắm trại tại Làng Văn Hóa Các Dân Tộc Việt Nam'),
(6, 1, N'Nhà Hàng Chả Cá Thăng Long', '8:00:00', N'Bắt đầu hành trình khám phá ẩm thực Hà Nội tại nhà hàng chả cá Thăng Long'),
(6, 1, N'Phở 10 Lý Quốc Sư', '8:00:00', N'Trải nghiệm bữa trưa tại phở 10 Lý Quốc Sư - một trong những chuỗi cửa hàng bán phở nổi tiếng ở Hà Nội'),
(6, 1, N'Bún Chả Hàng Than', '11:00:00', N'Khám phá bún chả Hàng Than'),
(6, 1, N'Bún Bò Nam Bộ Hàng Điếu', '13:00:00', N'Và cuối cùng là trải nghiệm quán bún bò Nam Bộ Hàng Điếu'),
(7, 1, N'Miến Lươn Đông Thịnh', '8:00:00', N'Bắt đầu hành trình trải nghiệm ẩm thực tại quán miến lươn Đông Thịnh'),
(7, 1, N' Bún Bò Huế 67', '10:00:00', N'Tiếp đến là trải nghiệm bún bò Huế 67'),
(7, 1, N' Bánh Mì Pate Hàng Cả', '12:00:00', N'Và cuối cùng là món ăn truyền thống của người dân Việt Nam, bánh mì tại cửa hàng bánh mì Pate Hàng Cả'),
(8, 1, N'Melia Ba Vì Resort', '8:00:00', N'Bắt đầu hành trình nghĩ dưỡng, ăn uống tại Melia Ba Vì Resort'),
(8, 1, N'Đỉnh Núi Quốc Gia Ba Vì', '13:00:00', N'Di chuyển đến đỉnh núi Quốc Gia Ba Vì khám phá'),
(9, 1, N'Khu Nghỉ Dưỡng Asean Ba Vì', '8:00:00', N'Di chuyển đến khu nghỉ dưỡng Asean Ba Vì để nghỉ dưỡng, xả stress'),
(10, 1, N' Khu Du lịch sinh thái Đại Lải', '8:00:00', N'Xuất phát từ Hà Nội đến Khu Du lịch sinh thái Đại Lải bằng xe ô tô tiện nghi.
'),
(10, 1, N'Khu Du lịch sinh thái Đại Lải', '9:00:00', N'Đến Đại Lải, khách sạn có thể tham quan khu vườn hoa, hồ cảnh quan và tham gia các hoạt động như chèo thuyền kayak trên hồ, câu cá hoặc dạo bộ trong khu rừng.
'),
(10, 1, N'Khu Du lịch sinh thái Đại Lải', '12:00:00', N'Dùng trưa tại nhà hàng trong khu du lịch với đủ loại món ăn địa phương và quốc tế.'),
(10, 1, N'Khu Du lịch sinh thái Đại Lải', '17:00:00', N'Xuất phát trở về Hà Nội.'),
(11, 1, N' Ecopark', '8:00:00', N' Đón khách tại khách sạn và xuất phát đến Ecopark.'),
(11, 1, N' Ecopark', '10:00:00', N' Đến Ecopark, bạn sẽ được trải nghiệm không gian xanh mát của khu đô thị sinh thái, tham quan các công viên, hồ và khu vườn hoa'),
(11, 1, N' Ecopark', '12:00:00', N'Dùng trưa tại một trong những nhà hàng xinh đẹp của Ecopark, với các món ăn sạch và đa dạng.'),
(11, 1, N' Ecopark', '13:30:00', N'Tham gia các hoạt động thể thao ngoài trời như đi xe đạp, đạp thuyền kayak trên hồ, hoặc tham gia các lớp học yoga hoặc thảo dược.'),
(11, 1, N' Ecopark', '17:00:00', N'Xuất phát trở về Hà Nội.'),

(12, 1, N' Khám Phá Chùa Thầy', '8:00:00', N'Khách hàng sẽ được đón tại khách sạn tại Hà Nội và xuất phát đến Chùa Thầy, một trong những địa điểm tâm linh nổi tiếng ở Hà Nội.'),
(12, 1, N' Khám Phá Chùa Thầy', '9:00:00', N'Đến Chùa Thầy, hướng dẫn viên sẽ giới thiệu về lịch sử và ý nghĩa tâm linh của ngôi chùa. Du khách sẽ được dẫn tham quan các khu di tích lịch sử, như những cột cổ thụ, các đình, chùa con, và đỉnh Thầy. Khám phá kiến trúc độc đáo của ngôi chùa và ngắm nhìn các bức tượng Phật bằng đồng và đá.'),
(12, 1, N' Khám Phá Chùa Thầy', '12:00:00', N'Dùng trưa tại một nhà hàng gần Chùa Thầy, thưởng thức các món ăn truyền thống của vùng miền phía Bắc như phở, bún chả, nem, hoặc các món ăn đặc sản của địa phương. Trong thời gian này, hướng dẫn viên sẽ chia sẻ thêm thông tin về lịch sử và văn hóa của khu vực.
'),
(12, 1, N' Khám Phá Chùa Thầy', '14:00:00', N'Tiếp tục hành trình với việc thăm quan các di tích lịch sử và văn hóa xung quanh Chùa Thầy, bao gồm Đình Phủ Tây, Đình Phủ Đông và Hòn Rùa - một hòn đảo trên hồ Tây được cho là có hình dáng giống con rùa, theo truyền thuyết dân gian.'),
(12, 1, N' Khám Phá Chùa Thầy', '16:00:00', N'ham dự lễ cúng hoặc thực hành tu tập theo nghi thức tôn giáo tại Chùa Thầy (tuỳ vào thời gian diễn ra)'),

(13, 1, N' Chùa Trấn Quốc', '8:00:00', N'Khách hàng sẽ được đón tại khách sạn tại Hà Nội và bắt đầu hành trình tới Chùa Trấn Quốc, một trong những ngôi chùa cổ nhất và quan trọng nhất của Hà Nội, nằm bên bờ Hồ Tây'),
(13, 1, N' Chùa Trấn Quốc', '9:00:00', N'Đến Chùa Trấn Quốc, du khách sẽ được khám phá vẻ đẹp kiến trúc và không gian tâm linh tĩnh lặng của ngôi chùa, cùng với những huyền thoại và truyền thống văn hóa độc đáo.
'),


(14, 1, N'K9 Di tích lịch sử quốc gia', '8:00:00', N'Xuất phát từ khách sạn để bắt đầu hành trình khám phá di sản lịch sử tại K9, một trong những di tích lịch sử nổi tiếng ở ngoại ô Hà Nội.
'),
(14, 1, N'K9 Di tích lịch sử quốc gia', '8:30:00', N'Đến K9, hướng dẫn viên sẽ dẫn dắt du khách khám phá các hang động, hầm trú ẩn và bí mật của Bộ Tổng Tư lệnh Quân đội nhân dân Việt Nam trong thời kỳ kháng chiến chống Mỹ cứu nước. Du khách sẽ được nghe các câu chuyện lịch sử đầy cảm xúc về sự dũng cảm và hy sinh của người lính và nhân dân Việt Nam.
'),
(14, 1, N'K9 Di tích lịch sử quốc gia', '12:00:00', N' Dùng trưa tại một nhà hàng gần khu vực K9, thưởng thức các món ăn địa phương ngon miệng.
'),
(14, 1, N'K9 Di tích lịch sử quốc gia', '14:00:00', N'Tiếp tục hành trình khám phá K9 và thăm quan các điểm lịch sử khác trong khu vực, như đền thờ các anh hùng liệt sĩ và các công trình kiến trúc khác từ thời kỳ chiến tranh.'),
(14, 1, N'K9 Di tích lịch sử quốc gia', '16:00:00', N'Kết thúc hành trình tại K9 và trở về Hà Nội.'),

(15, 1, N'Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam', '8:00:00', N' Khởi hành từ điểm hẹn để bắt đầu hành trình đến Bảo tàng Lịch sử Việt Nam, một trong những di tích lịch sử quốc gia quan trọng của Việt Nam.
'),
(15, 1, N'Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam', '8:30:00', N'Đến Bảo tàng, hướng dẫn viên sẽ giới thiệu về lịch sử, cơ cấu tổ chức và các bộ sưu tập quý giá của Bảo tàng. Du khách sẽ có cơ hội khám phá những di vật, hiện vật và tư liệu lịch sử phong phú, từ thời kỳ tiền sử đến hiện đại.
'),
(15, 1, N'Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam', '12:00:00', N' Dùng trưa tại một nhà hàng gần khu vực Bảo tàng Lịch sử Việt Nam, thưởng thức các món ăn đặc sản địa phương.
'),
(15, 1, N'Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam', '14:00:00', N'Tiếp tục thăm quan các phòng trưng bày, như phòng trưng bày về lịch sử dân tộc, lịch sử chiến tranh, lịch sử văn hóa... Du khách có thể tìm hiểu sâu hơn về những giai đoạn lịch sử quan trọng của Việt Nam và vai trò của dân tộc trong quá trình xây dựng và bảo vệ đất nước.'),
(15, 1, N'Di Tích Lịch Sử Bảo Tàng Lịch Sử Việt Nam', '16:00:00', N'Trở về điểm xuất phát, kết thúc chuyến tham quan..')
;



SET IDENTITY_INSERT Voucher ON;
INSERT INTO [dbo].[Voucher]
           ([id]
		   ,[code]
           ,[discountPercentage]
           ,[status]
           ,[supplierId]
		   ,[idAcc])
     VALUES
           (1, 'HE171065', 5, 1, 2, 6),
		   (2, 'HE171406', 10, 1, 2, 6),
		   (3, 'HE171385', 15, 1, 2, 6),
		   (4, 'HE171013', 15, 1, 6, 6),
		   (6, 'HE171323', 15, 1, 6, 6);
SET IDENTITY_INSERT Voucher off;



INSERT INTO [dbo].[FeedbackWeb]
           ([accId]
           ,[date]
           ,[subject]
           ,[message])
     VALUES
           ( 7 , '11/3/2024',N'Tuyệt vời', N'Hà Nội tour tuyệt vời quá'),
		   ( 8 , '11/3/2024',N'Amazing good chop', N'Trang web thật thú vị'),
		   ( 9 , '11/3/2024',N'Web thật thú vị', N'Hà Nội tour mang lại cho tôi nhiều trải nghiệm tuyệt vời'),
		   ( 10 , '11/3/2024',N'Hà Nội thật đẹp', N'Phong cảnh Hà Nội rất đẹp'),
		   ( 11 , '11/3/2024',N'Hà Nội đẹp quá', N'Đây một trải nghiệm tuyệt vời về du lịch Hà Nội'),
		   ( 12 , '11/3/2024',N'Văn hóa tuyệt đẹp', N'Nền văn hóa ở Hà Nội thật đa màu sắc'),
		   ( 13 , '11/3/2024',N'Lịch sử của Việt Nam thật hào hùng', N'Tour mang cho trải nhiều trải nghiệm về lịch sử ở Hà Nội'),
		   ( 14 , '11/3/2024',N'Bản sắc văn hóa thật đa phong phú', N'Các làng văn hóa ở Hà Nội thật mộc mạc và giản dị'),
		   ( 15 , '11/3/2024',N'Món ăn ở Hà Nội thật tuyệt vời', N'Chuyến đi cho tôi nhiều trải nghiệm về các món ăn mang hương vị của Hà Nội'),
		   ( 16 , '11/3/2024',N'Hình ảnh Lăng Bác', N'Chuyến đi cho tôi biết nhiều hơn về câu chuyện lịch sử của Bác Hồ');




SET IDENTITY_INSERT Blog ON;
INSERT INTO [dbo].[Blog]
           ([id],
		   [title]
           ,[content]
           ,[image]
           ,[publishDate]
           ,[accountId]
           ,[status])
     VALUES
           (1,N'Khám Phá Lăng Bác - Biểu Tượng Lịch Sử và Văn Hóa của Hà Nội',N'Hà Nội, thủ đô nghìn năm văn hiến của Việt Nam, là nơi chứa đựng bao kỷ vật lịch sử và di sản văn hóa quý báu. Trong lòng thành phố nhộn nhịp, một biểu tượng lịch sử và văn hóa nổi bật không thể không kể đến - Lăng Bác. Đây không chỉ là nơi an nghỉ của Người lãnh đạo vĩ đại của dân tộc, mà còn là một địa điểm tham quan văn hóa đầy ý nghĩa và thiêng liêng.

Lăng Bác - Ký Tích của Một Thời Đại
Lăng Bác, hay còn gọi là Lăng Chủ Tịch Hồ Chí Minh, là nơi tưởng nhớ vĩ đại của Chủ tịch Hồ Chí Minh - người đã dẫn dắt dân tộc Việt Nam qua những cuộc đấu tranh lịch sử và chiến thắng lớn, đưa đất nước này vượt qua gian khó, để lại dấu ấn sâu đậm trong lòng mọi người.

Kiến Trúc và Thiết Kế
Lăng Bác được xây dựng tại khu vườn rộng lớn của diện tích cũng như lòng bàn tay của các kiến trúc sư, nghệ nhân hàng đầu thời kỳ. Kiến trúc của Lăng Bác mang dáng vẻ trang trọng, độc đáo và sâu sắc, phản ánh tinh thần vững mạnh, không gian thanh tịnh và lòng kính trọng với người lãnh đạo vĩ đại.

Trải Nghiệm Du Lịch
Khi đặt chân đến Lăng Bác, du khách sẽ được trải nghiệm không gian thanh bình, tĩnh lặng, như một sự tôn trọng và tri ân sâu sắc đối với người lãnh đạo kính yêu của dân tộc. Du khách có thể dạo bước trong khu vườn rộng lớn, ngắm nhìn các công trình kiến trúc lịch sử, hoặc dừng lại bên ngoài Lăng Bác để thắp hương và hiếu kính.

Lưu Ý
Du khách cần tuân thủ các quy định của địa phương khi thăm Lăng Bác.
Mang theo đủ nước uống và đồ ăn nhẹ để du lịch thoải mái hơn.
Lăng Bác là một địa điểm linh thiêng, du khách cần giữ gìn vệ sinh và tôn trọng.
Kết Luận
Lăng Bác không chỉ là một địa điểm du lịch nổi tiếng của Hà Nội, mà còn là biểu tượng văn hóa và lịch sử của Việt Nam. Với kiến trúc độc đáo, ý nghĩa lịch sử sâu sắc và không gian thanh bình, Lăng Bác là một điểm đến không thể bỏ lỡ cho những ai yêu thích khám phá và tôn trọng di sản văn hóa của dân tộc.
Hãy đến và khám phá Lăng Bác - nơi lưu giữ ký ức và tinh thần của một thời đại vĩ đại!','https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/P20230910AS-1839.jpg/1280px-P20230910AS-1839.jpg',GETDATE(),2,1),
(2,N'Khám Phá Nhà Tù Hỏa Lò - Ký Ức Đau Thương và Sức Mạnh Sống Của Dân Tộc',N'Nhà Tù Hỏa Lò, hay còn gọi là "Hanoi Hilton", là một trong những địa điểm lịch sử nổi tiếng của Hà Nội. Đây không chỉ là một di tích lịch sử, mà còn là biểu tượng cho sức mạnh và ý chí sống mãnh liệt của dân tộc Việt Nam trong quá khứ đau thương.

Lịch Sử
Nhà Tù Hỏa Lò được xây dựng vào thế kỷ 19, dưới thời thống nhất của người Pháp tại Đông Dương. Ban đầu, nó được sử dụng để giam giữ các tù nhân chính trị. Tuy nhiên, sau đó, nó trở thành nơi giam giữ và tra tấn các tù nhân chiến tranh trong thời kỳ chiến tranh Đông Dương và chiến tranh Việt Nam.

Kiến Trúc và Thiết Kế
Kiến trúc của Nhà Tù Hỏa Lò phản ánh sự khắc nghiệt, ám ảnh và đau đớn của những người bị giam giữ. Nó gồm các tòa nhà bê tông vững chắc, với các tường dày và các ô cửa sắt. Trong những năm gần đây, một phần của nhà tù đã được bảo tồn và biến thành bảo tàng lịch sử, giữ lại những di vật và hình ảnh về thời kỳ khó khăn của dân tộc.

Trải Nghiệm Du Lịch
Khi đặt chân đến Nhà Tù Hỏa Lò, du khách sẽ được trải nghiệm một không gian đầy cảm xúc và ý nghĩa lịch sử. Bước vào những căn phòng hẹp hòi, ngắm nhìn những điều tra tấn và điều kiện sống khắc nghiệt mà những người tù phải chịu đựng, sẽ giúp du khách hiểu rõ hơn về sự đau đớn và sự hy sinh của dân tộc.

Lưu Ý
Nhớ tuân thủ các quy định và hướng dẫn của nhân viên bảo tồn khi thăm Nhà Tù Hỏa Lò.
Giữ gìn vệ sinh và tránh làm phiền người khác khi thăm bảo tàng.
Mang theo nước uống và đồ ăn nhẹ để du lịch thoải mái hơn.
Kết Luận
Nhà Tù Hỏa Lò không chỉ là một địa điểm du lịch nổi tiếng của Hà Nội, mà còn là một biểu tượng của sức mạnh và ý chí sống của dân tộc Việt Nam. Với lịch sử đau thương và di sản văn hóa đặc biệt, đây là một điểm đến quan trọng để hiểu rõ hơn về quá khứ và tinh thần của dân tộc.

Hãy đến và khám phá Nhà Tù Hỏa Lò - nơi lưu giữ những ký ức đau thương và sức mạnh sống mãnh liệt của dân tộc Việt Nam!','https://images.foody.vn/res/g5/41729/prof/s576x330/foody-mobile-khu-di-tich-nha-tu-hoa-lo-ha-noi-131017014732.jpg',GETDATE(),2,2),
(3,N'Khám Phá Hoàng Thành Thăng Long - Di Sản Văn Hóa Thế Giới của Hà Nội',N'Hoàng Thành Thăng Long, hay còn được biết đến với tên gọi Hoàng Thành Huế, là một trong những điểm du lịch lịch sử nổi tiếng và quan trọng nhất của Hà Nội. Được UNESCO công nhận là Di Sản Văn hóa Thế giới từ năm 2010, Hoàng Thành Thăng Long mang trong mình một lịch sử vô cùng phong phú và những di tích kiến trúc tuyệt vời từ thời kỳ Đại Việt đến triều Nguyễn.

Lịch Sử
Hoàng Thành Thăng Long đã được xây dựng vào thế kỷ thứ 11 dưới thời vua Lý Thái Tổ và từng là trung tâm chính trị và văn hóa của Đại Việt (tên cũ của Việt Nam). Đây là nơi cư trú của các vua và hoàng đế của các triều đại trước khi thủ đô được chuyển đến Huế vào thế kỷ 19.

Kiến Trúc
Hoàng Thành Thăng Long được xây dựng với một hệ thống tường thành và các cấu trúc kiến trúc phức tạp, bao gồm cung điện, đình, điện và các đài quan trọng khác. Những di tích như Đền Vua Lý Thái Tổ, Cột Cờ Quốc gia, Hồng Đức Cung và các di tích khác là minh chứng cho sức mạnh và sự kiêu hãnh của triều đại Lý, Trần và Lê.

Trải Nghiệm Du Lịch
Khi đặt chân vào Hoàng Thành Thăng Long, du khách sẽ được đắm chìm trong không gian lịch sử và kiến trúc hùng vĩ của quá khứ. Tham quan các di tích lịch sử, tưởng tượng về cuộc sống của các vị vua và hoàng đế, và khám phá những bí ẩn đằng sau những tường thành cổ kính.

Lưu Ý
Khi tham quan, du khách cần tuân thủ các quy định của địa phương và giữ gìn vệ sinh môi trường.
Nên mang theo nước uống và đồ ăn nhẹ để du lịch thoải mái hơn.
Nếu có thể, nên tìm hướng dẫn viên để có cái nhìn sâu sắc hơn về lịch sử và văn hóa của Hoàng Thành Thăng Long.
Kết Luận
Hoàng Thành Thăng Long không chỉ là một điểm du lịch nổi tiếng của Hà Nội mà còn là một biểu tượng văn hóa và lịch sử của Việt Nam. Với kiến trúc độc đáo và lịch sử hào hùng, nơi này là một điểm đến không thể bỏ lỡ cho những ai yêu thích khám phá và tìm hiểu về di sản văn hóa của đất nước.','https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2023/5/7/1189286/Anh-Hoang-Thanh-Than-11.jpg',GETDATE(),2,2),
(4,N' Chùa Trấn Quốc - Di Sản Tâm Linh Trên Đảo Kim Giám',N'Nằm bên bờ Hồ Tây thơ mộng của Hà Nội, Chùa Trấn Quốc là một trong những biểu tượng tâm linh quan trọng của thủ đô nước ta. Với lịch sử hơn một thiên niên kỷ và vẻ đẹp huyền bí, chùa Trấn Quốc không chỉ là một điểm đến tâm linh mà còn là một điểm du lịch hấp dẫn thu hút hàng nghìn du khách mỗi năm.

1. Lịch Sử và Nguyên Nhân Hình Thành
Chùa Trấn Quốc được xây dựng vào thế kỷ thứ 6, trong thời kỳ vua Lý Nam Đế triều Ngô Quyền. Ban đầu, chùa được xây dựng trên mảnh đất nổi trên Hồ Tây. Tuy nhiên, với thời gian và sự biến đổi của địa hình, chùa đã được dời sang đảo Kim Giám, nơi mà nó nằm cho đến ngày nay.

2. Kiến Trúc và Kiệt Tác Nghệ Thuật
Chùa Trấn Quốc gây ấn tượng với du khách bởi kiến trúc độc đáo và sự linh thiêng trong từng đường nét. Các tòa tháp và nhà điện được xây dựng theo phong cách kiến trúc Á Đông truyền thống, với những họa tiết hoa văn tinh xảo và sắc màu trầm ấm. Điểm nhấn của chùa là tượng Phật bằng đá màu đen cao 15 mét, tượng Phật lớn nhất tại Việt Nam.

3. Ý Nghĩa Tâm Linh
Chùa Trấn Quốc được coi là một điểm tâm linh quan trọng, nơi mà người dân và du khách đến để cầu bình an, may mắn và sự an lạc. Mỗi ngày, hàng nghìn người tới đây để thắp hương và cầu nguyện, tạo nên một không gian yên bình và tôn nghiêm.

4. Thời Gian Thích Hợp Ghé Thăm
Đặc biệt vào các ngày lễ lớn của Phật giáo như Lễ Vu Lan, Lễ Quan Âm, hay ngày Rằm tháng Bảy âm lịch hàng năm, Chùa Trấn Quốc thu hút một lượng lớn người dân đến viếng thăm và cầu nguyện. Đây cũng là dịp lý tưởng để bạn khám phá và trải nghiệm không khí tâm linh đặc biệt tại chùa.

Với vẻ đẹp và ý nghĩa tâm linh sâu sắc, Chùa Trấn Quốc là một điểm đến không thể bỏ qua khi bạn đặt chân đến thủ đô Hà Nội, đem lại cho bạn những trải nghiệm tâm linh và văn hóa đáng nhớ.','https://ik.imagekit.io/tvlk/blog/2022/08/chua-tran-quoc-3-1024x678.jpg?tr=dpr-2,w-675',GETDATE(),2,2),
(5,N'Bí Mật Tâm Linh Trên Núi Vọng Phục',N'Nằm trong bóng râm của những cây cổ thụ bạt ngàn trên dốc núi Vọng Phục, Chùa Thầy mang đến cho du khách không chỉ là một điểm đến tâm linh thanh bình mà còn là một di sản văn hóa có giá trị lịch sử và kiến trúc độc đáo.

1. Lịch Sử và Nguyên Nhân Hình Thành
Chùa Thầy có một lịch sử lâu đời với hơn một thiên niên kỷ. Theo truyền thuyết, chùa được xây dựng vào thế kỷ 10 dưới triều đại của vị thánh nhân là Đạo Dừa Thiền Sư. Tuy nhiên, những tác động của thời gian và sự phát triển đã làm cho chùa trở nên phát triển và hoàn thiện hơn qua từng thời kỳ.

2. Kiến Trúc và Đặc Điểm Nổi Bật
Chùa Thầy gây ấn tượng với du khách bởi kiến trúc độc đáo và tâm linh thanh bình. Những công trình kiến trúc như chùa Tam Phu, đền Từ Tài, chùa Hương Cảng hay cầu nhị thần đều tạo nên một bức tranh tâm linh hùng vĩ giữa thiên nhiên hùng vĩ của núi rừng Vọng Phục.

3. Ý Nghĩa Tâm Linh và Lễ Hội
Chùa Thầy được coi là một nơi linh thiêng, là nơi tín đồ Phật giáo tìm đến để thực hành và cầu nguyện. Mỗi năm, vào các dịp lễ hội như lễ hội đua thuyền truyền thống hoặc lễ hội chuột đầu năm, chùa Thầy thu hút hàng nghìn lượt khách thập phương đến tham dự và tận hưởng không khí tâm linh đặc biệt.

4. Khung Cảnh Thiên Nhiên Bên Núi Vọng Phục
Không chỉ là một điểm tâm linh, chùa Thầy còn là một nơi để du khách thư giãn và ngắm nhìn cảnh đẹp. Với không gian yên bình bên trong khu rừng núi xanh mướt, du khách có thể tìm thấy sự bình yên và thanh thản giữa những hòn đá và cây cỏ.

Chùa Thầy, với vẻ đẹp tự nhiên và tâm linh huyền bí, là điểm đến lý tưởng cho những ai tìm kiếm sự kết nối với thiên nhiên và tinh thần. Đến với chùa Thầy, du khách sẽ có cơ hội trải nghiệm sự thanh tịnh và tận hưởng vẻ đẹp của văn hóa và thiên nhiên Việt Nam.','https://static-images.vnncdn.net/files/publish/2023/7/25/l1018037-874.jpg',GETDATE(),2,2),
(6,N'Di Tích Lịch Sử Đặc Biệt ở Ngoại Ô Hà Nội',N'Nằm ẩn mình trong dòng sông huyền thoại của thủ đô Hà Nội, K9 là một trong những khu di tích lịch sử quan trọng của Việt Nam. Với những di tích cổ kính và những câu chuyện lịch sử đầy kỳ vị, K9 là điểm đến hấp dẫn cho những ai muốn khám phá và tìm hiểu về quá khứ lịch sử của đất nước.

1. Lịch Sử và Nguyên Nhân Hình Thành
Khu di tích K9 được biết đến với vai trò là một cơ sở quân sự chiến lược quan trọng trong suốt thời kỳ chiến tranh. Nơi đây từng là căn cứ của lực lượng Phòng không và Không quân Việt Nam trong việc phòng thủ thủ đô khỏi các cuộc tấn công của kẻ thù.

2. Kiến Trúc và Công Trình Quân Sự
Trải dài trên một khu đất rộng lớn, K9 bao gồm nhiều công trình quân sự như hang ổ, hầm trú ẩn, bảo tàng chiến tranh, và những hệ thống đài quan sát. Các công trình này là minh chứng cho sức mạnh và sự kiên cường của quân đội Việt Nam trong cuộc chiến bảo vệ đất nước.

3. Ý Nghĩa Lịch Sử và Văn Hóa
K9 không chỉ là một khu di tích lịch sử mà còn là biểu tượng của sự hy sinh và quyết tâm của những người lính Việt Nam trong cuộc chiến tranh. Đến với K9, du khách có cơ hội tưởng niệm và tôn vinh những anh hùng đã hi sinh vì tổ quốc, đồng thời hiểu rõ hơn về sự đau đớn và hy vọng trong lịch sử dân tộc.

4. Trải Nghiệm Du Lịch và Khám Phá
Với một hành trình khám phá K9, du khách sẽ được tham quan các công trình quân sự, nghe kể những câu chuyện lịch sử và tham gia các hoạt động tưởng niệm. Đây là một trải nghiệm tâm linh và lịch sử đầy ý nghĩa, giúp du khách hiểu rõ hơn về quá khứ và hiện tại của đất nước.

Với sự kết hợp giữa lịch sử, văn hóa và tâm linh, K9 là một điểm đến thú vị và ý nghĩa, đem lại cho du khách những trải nghiệm đáng nhớ khi đặt chân đến Hà Nội.','https://ik.imagekit.io/tvlk/blog/2023/09/go-and-share-khu-di-tich-k9-da-chong-5-889x1024.webp?tr=dpr-2,w-675',GETDATE(),2,2),
(7,N' Làng Văn Hóa Bát Tràng - Bảo Tàng Văn Hóa Dân Gian Sống Động',N'Làng Văn Hóa Bát Tràng, nằm dọc theo bờ sông Hồng yên bình, là một điểm đến không thể bỏ qua cho những ai yêu thích nghệ thuật và văn hóa dân gian của Việt Nam. Với hơn một thiên niên kỷ lưu giữ và phát triển, làng văn hóa đã trở thành biểu tượng của sự sáng tạo và tinh hoa văn hóa truyền thống.

1. Di Sản Nghề Gốm Truyền Thống
Làng văn hóa nổi tiếng với nghề gốm Bát Tràng, một nghề thủ công truyền thống đã tồn tại từ thế kỷ 15. Du khách sẽ có cơ hội thăm quan các xưởng gốm và trải nghiệm quy trình sản xuất từ việc trộn đất, tạo hình đến việc nung chảy. Các sản phẩm gốm từ Bát Tràng không chỉ đẹp mắt mà còn mang giá trị văn hóa sâu sắc.

2. Lễ Hội và Nghệ Nhân Địa Phương
Mỗi năm, làng văn hóa tổ chức các lễ hội truyền thống như Lễ Hội Gốm Bát Tràng, thu hút đông đảo du khách đến tham dự và tận hưởng không khí sôi động. Du khách cũng có cơ hội gặp gỡ và giao lưu với các nghệ nhân làng Bát Tràng, từ những người làm gốm cho đến những nghệ nhân điêu khắc đất sét tài ba.

3. Văn Hóa Ăn Uống Đặc Sắc
Ngoài nghề gốm, làng văn hóa cũng là nơi du khách có thể thưởng thức những món ăn đặc sản của vùng đất Bát Tràng. Các quán nhỏ ven đường phục vụ các món ăn truyền thống như bánh chưng, bánh dày, hay chè đậu xanh thơm ngon và đậm đà hương vị quê hương.

4. Trải Nghiệm Văn Hóa Dân Gian
Du khách không chỉ được thưởng thức nghệ thuật gốm truyền thống mà còn được tham gia các hoạt động văn hóa dân gian như học làm gốm, điêu khắc đất sét, hoặc tham gia các trò chơi dân gian vui nhộn cùng địa phương.

Làng Văn Hóa Bát Tràng không chỉ là nơi lưu giữ và phát triển nghệ thuật gốm truyền thống mà còn là một bảo tàng sống động của văn hóa dân gian Việt Nam. Đến với làng văn hóa, du khách sẽ được chìm đắm trong không gian yên bình và tận hưởng vẻ đẹp của nghệ thuật và văn hóa truyền thống.','https://ik.imagekit.io/tvlk/blog/2023/08/bao-tang-gom-bat-trang-1.jpeg?tr=dpr-2,w-675',GETDATE(),2,2),

(8,N'Làng Văn Hóa Cộng Đồng Dân Tộc Việt Nam',N'Làng Văn Hóa Cộng Đồng Dân Tộc Việt Nam là một điểm đến độc đáo, nơi du khách có thể khám phá và tìm hiểu về văn hóa, truyền thống của các dân tộc thiểu số tại Việt Nam. Dưới đây là một bài viết giới thiệu về làng văn hóa này:

Giới Thiệu
Làng Văn Hóa Cộng Đồng Dân Tộc Việt Nam là một không gian văn hóa độc đáo, tọa lạc tại khu vực ngoại ô Hà Nội. Đây là nơi tập trung các cộng đồng dân tộc thiểu số từ khắp các vùng miền của Việt Nam, mang đến cho du khách một cơ hội hiếm có để tìm hiểu và trải nghiệm sâu sắc về văn hóa đa dạng của đất nước.

Khám Phá Văn Hóa Đa Dạng
Trang Phục và Trang Sức Dân Tộc: Du khách sẽ được ngắm nhìn và tìm hiểu về trang phục truyền thống của các dân tộc thiểu số, từ áo dài của người Kinh đến áo tơ của người Tày, áo bà ba của người HMông, và nhiều hơn nữa. Đồng thời, trang sức dân tộc như vòng, dây chuyền, và khuyên tai cũng là điểm đặc biệt thu hút sự chú ý của du khách.

Nghệ Thuật Dân Gian: Làng văn hóa là nơi tập trung của các nghệ nhân dân gian, những người truyền lại và phát triển các nghệ thuật dân gian truyền thống của dân tộc. Du khách có thể thưởng ngoạn các sản phẩm điêu khắc gỗ, dệt may, điêu khắc đồng, và thủ công mỹ nghệ khác.

Âm Nhạc và Nhảy Múa: Các buổi biểu diễn âm nhạc và nhảy múa truyền thống của các dân tộc thiểu số sẽ mang lại cho du khách những trải nghiệm tuyệt vời về văn hóa và tâm hồn dân tộc.

Trải Nghiệm Văn Hóa Sâu Sắc
Du khách không chỉ được ngắm nhìn mà còn có cơ hội tham gia các hoạt động trải nghiệm văn hóa như:

Học Làm Nghề Truyền Thống: Tìm hiểu và tham gia các buổi hướng dẫn làm gốm, dệt thổ cẩm, hoặc điêu khắc theo phong cách của các dân tộc.
Tham Gia Các Hoạt Động Văn Hóa Dân Gian: Cùng tham gia các trò chơi, lễ hội, và nghi lễ truyền thống của các dân tộc thiểu số.
Thưởng Thức Ẩm Thực Dân Tộc: Khám phá và thưởng thức những món ăn truyền thống đặc sản của từng dân tộc.
Kết Luận
Làng Văn Hóa Cộng Đồng Dân Tộc Việt Nam không chỉ là một điểm đến du lịch mà còn là một cửa sổ mở ra để khám phá và tìm hiểu về sự đa dạng văn hóa của Việt Nam. Với sự phong phú và đa dạng của văn hóa dân tộc, mỗi chuyến tham quan đều mang lại cho du khách những trải nghiệm đáng nhớ và ý nghĩa.','https://langvanhoavietnam.vn/Files/image/2019/HD%20THANG%2010/Goc%20chup/Untitled.png',GETDATE(),2,2);


SET IDENTITY_INSERT Blog off;


INSERT INTO [Order] (accId, idInforAcc, [date], totalPrice)
VALUES 
    (20, 1,  '01-15-2024', 1400000),
    (19, 1,  '01-20-2024', 1800000),
    (6, 1,  '02-10-2024', 650000),
    (6, 1,  '02-05-2024', 1500000),
    (6, 1,  '02-12-2024', 500000),
    (6, 1,  '03-20-2024', 700000),
    (7, 1,  '03-10-2024', 400000),
    (8, 1,  '03-05-2024', 12000000),
    (9, 1,  '01-15-2024', 5000000),
    (10, 1,  '01-20-2024', 2100000),
    (11, 1,  '02-15-2024', 800000),
    (12, 1,  '03-10-2024', 950000),
    (13, 1,  '01-05-2024', 2000000),
    (14, 1,  '02-12-2024', 750000),
    (15, 1,  '03-20-2024', 850000),
    (16, 1,  '01-10-2024', 1100000),
    (17, 1,  '02-05-2024', 950000),
    (18, 1,  '03-12-2024', 1300000);



INSERT INTO OrderDetail (orderId, tourId, quantity, price, dateDeparture, [status], versionId, voucherId)
VALUES 
    (1, 1, 2, 1400000,  '04-14-2024', N'Đang xử lý', 1, 0),
    (2, 2, 3, 1800000,  '04-20-2024', N'Đang xử lý', 1, 0),
    (3, 3, 1, 650000,  '04-10-2024', N'Đang xử lý', 1, 0),
    (4, 4, 2, 1500000,  '04-05-2024', N'Hủy đơn hàng', 1, 0),
    (5, 5, 1, 500000,  '04-12-2024', N'Xác nhận đơn hàng', 1, 0),
    (6, 6, 2, 700000,  '04-20-2024', N'Xác nhận đơn hàng', 1, 0),
    (7, 7, 1, 400000,  '04-10-2024', N'Xác nhận đơn hàng', 1, 0),
    (8, 8, 4, 12000000,  '04-05-2024', N'Xác nhận đơn hàng', 1, 0),
    (9, 9, 2, 5000000,  '04-15-2024', N'Xác nhận đơn hàng', 1, 0),
    (10, 1, 3, 2100000,  '04-20-2025', N'Xác nhận đơn hàng', 1, 0),
	 (11, 1, 2, 1400000,  '04-18-2024', N'Xác nhận đơn hàng', 1, 0),
    (12, 2, 1, 600000,  '04-25-2024', N'Xác nhận đơn hàng', 1, 0),
    (13, 5, 2, 1000000,  '04-15-2024', N'Xác nhận đơn hàng', 1, 0),
	 (14, 1, 1, 700000,  '04-22-2024', N'Xác nhận đơn hàng', 1, 0),
    (15, 2, 4, 2400000,  '04-30-2024', N'Xác nhận đơn hàng', 1, 0),
    (16, 5, 3, 1500000,  '04-20-2024', N'Xác nhận đơn hàng', 1, 0),
	(17, 5, 3, 1500000,  '04-20-2024', N'Xác nhận đơn hàng', 1, 0),
	(18, 5, 3, 1500000,  '04-20-2024', N'Xác nhận đơn hàng', 1, 0);





/*-------------------------------------------------------*/
/*-------------------------------------------------------*/