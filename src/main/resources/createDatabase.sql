DROP TABLE tbl_manager CASCADE;

CREATE TABLE tbl_manager(
	managerID serial,
	managerName VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
    deleteState int NOT NULL default 0,
	PRIMARY KEY(managerID)
);
DROP TABLE tbl_order CASCADE;

CREATE TABLE tbl_order(
	orderID serial,
	state INTEGER NOT NULL,
	fee int NOT NULL,
    deleteState int NOT NULL default 0,
	shippingAddress VARCHAR(50) NOT NULL,
	receiveAddress VARCHAR(50) NOT NULL,
	managerID INTEGER,
	deliveryManID INTEGER,
	PRIMARY KEY(orderID),
	FOREIGN KEY (managerID) REFERENCES tbl_manager(managerID),
	FOREIGN KEY (deliveryManID) REFERENCES tbl_deliveryMan(deliveryManID)
);
DROP TABLE tbl_deliveryMan CASCADE;
CREATE TABLE tbl_deliveryMan(
	deliveryManID serial,
	deliveryManName VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
    deleteState int NOT NULL default 0,
	phoneNo CHAR(11) UNIQUE,
	email VARCHAR(30) UNIQUE,
	PRIMARY KEY(deliveryManID)
);

INSERT INTO tbl_manager(managerName,password) VALUES('root','root');
INSERT INTO tbl_manager(managerName,password) VALUES('zmy','zmy');
INSERT INTO tbl_manager(managerName,password) VALUES('test','test');
select * from tbl_manager;
delete from tbl_manager where managerID = 1;

INSERT INTO tbl_deliveryMan(deliveryManName,password) VALUES('deliveryMan1','deliveryMan1');
INSERT INTO tbl_deliveryMan(deliveryManName,password) VALUES('deliveryMan2','deliveryMan2');
select * from tbl_deliveryMan;

INSERT INTO tbl_order(state,fee,shippingAddress,receiveAddress,managerID,deliveryManID)
VALUES('0',100, '西工大东大村', '西工大海天苑2号楼', 2,1);
INSERT INTO tbl_order(state,fee,shippingAddress,receiveAddress,managerID)
VALUES('0',100, '西工大东大村', '西工大海天苑2号楼', 2);
select * from tbl_order;