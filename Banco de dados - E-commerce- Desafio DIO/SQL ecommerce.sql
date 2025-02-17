-- inserção de dados e queries
use ecommerce;

-- client : fname, adress,contact
insert into client (fname,address,contact,clientType)
values ('Maria M Silva','Rua das Palmeiras, 123, Bairro Centro, São Paulo - SP, 01000-000', '(11) 98765-4321','Jurídica'),
       ('Matheus O Pimentel','Avenida Brasil, 456, Bairro Industrial, Rio de Janeiro - RJ, 20000-000','(21) 97654-3210','Física'),
	   ('Ricardo F Silva','Rua do Sol, 789, Apto 301, Bairro Jardim, Belo Horizonte - MG, 30000-000', '(31) 96543-2109','Física'),
       ('Julia S Franca','Estrada Rural, Km 12, Fazenda Boa Vista, Zona Rural, Curitiba - PR, 80000-000', '(41) 95432-1098','Jurídica'),
       ('Roberta G Assis','Alameda das Rosas, 55, Casa 10, Condomínio Verde, Porto Alegre - RS, 90000-000', '(51) 94321-0987','Jurídica'),
	   ('Isabela M Cruz','Rua dos Comerciantes, 999, Galpão 5, Distrito Industrial, Recife - PE, 50000-000', '(61) 93210-9876','Física');
       
select * from client;

-- LegalPerson : idLegalPerson,idLegalPersonClient,CNPJ,socialName,contact

insert into LegalPerson (idLegalPerson,idLegalPersonClient,CNPJ,socialName,contact)
values (1,1,12345678000190,'Tech eletronics','(11) 98765-4321'),
       (2,2,98765432000155,'Boutique Durgas','(21) 97654-3210'),
       (3,3,45678912000132,'Kids World','(31) 96543-2109');
       
select * from legalperson;

-- PhysicalPerson : idPhysicalPerson,idPhysicalPersonClient,fname,minit,lname,CPF,contact

insert into PhysicalPerson(idPhysicalPerson,idPhysicalPersonClient,fname,minit,lname,CPF,contact)
values (4,4,'Julia', 'S', 'Franca',12345678909,'(41) 95432-1098'),
       (5,5,'Roberta', 'G', 'Assis',98765432100,'(51) 94321-0987'),
       (6,6,'Isabela', 'M', 'Cruz',45678912377,'(61) 93210-9876');

select * from PhysicalPerson;

-- Product : idProduct,pname,classification_kids,category,avaliação,size

insert into Product(pname,classification_kids,category,avaliação,size)
values ('Fone de ouvido',false,'Eletrônico','4',null),
       ('Barbie Elsa',true,'Brinquedos','3',null),
       ('Body Carters',true,'Vestimenta','5',null),
       ('Microfone Vedo - Youtuber',false,'Eletrônico','4',null),
       ('Sofá retrátil',false,'Móveis','3','3x57x80'),
       ('Farinha de arroz',false,'Alimentos','2',null),
       ('Fire stick amazon',false,'Eletrônico','3',null);

-- delete from Product where idProduct in (13,14,15,16,17,18,19);
-- alter table Product auto_increment = 1;
-- show table status like 'Product';
-- select * from Product;

--  Orders: idOrders,idOrderClient,orderStatus,orderDescription,sendValue,orderDate

insert into Orders(idOrderClient,orderStatus,orderDescription,sendValue,orderDate)
values (1,default,'compra via aplicativo',null,'2025-12-31 23:59:59'),
       (2,default,'compra via aplicativo',50,'2020-01-01 00:00:00'),
       (3,'Confirmado',null,null,'2025-01-28 14:45:00'),
       (4,default,'compra via aplicativo',150,'2022-07-15 09:30:00');
       
select * from orders;

-- productOrder: idPOproduct,idPOorder,poQuantity,poStatus

insert into productOrder(idPOproduct,idPOorder,poQuantity,poStatus)
values (1,1,2,null),
       (2,1,1,null),
       (3,2,1,null);
       
select * from productOrder;

-- Stock: idStock,stockLocation

insert into Stock(idStock,stockLocation)
values (1,'Rio de Janeiro'),
       (2,'São Paulo'),
       (3,'Minas Gerais'),
       (4,'Brasilia'),
       (5,'Bahia'),
       (6,'Máceio');
       
	
-- Stock_Product: idstockProduct,idstockStorage,Quantity

insert into Stock_Product(idstockProduct,idstockStorage,Quantity)
values (1,1,1000),
       (2,2,500),
       (3,3,10),
       (4,4,100),
       (5,5,10),
       (6,6,60);

-- Supplier : SocialName,CNPJ,Contact

insert into Supplier(SocialName,CNPJ,Contact)
values ('Almeida e filhos',22345678000123,'(11) 98765-4321'),
       ('Eletrônicos Silva',89765432000187,'(21) 91234-5678'),
       ('Eletrônicos Valma',56123456000194,'(31) 99876-5432');
       
-- productSupplier: idPOsupplier,idPOproduct,quantity

insert into productSupplier(idPOsupplier,idPOproduct,quantity)
values (1,1,500),
       (1,2,400),
	   (2,4,633),
       (3,3,5),
       (2,5,10);
       
-- Seller : socialName,abstName,CNPJ,CPF,location,contact

insert into Seller(socialName,abstName,CNPJ,CPF,location,contact)
values ('TechNova Solutions',null,1231465625852,null,'Rio de Janeiro',2154785220),
       ('NeoByte Systems',null,null,12345678911,'Rio de Janeiro',3625466362),
	   ('InovaWeb Digital',null,1542558792236,null,'São Paulo',4520213524);
       
-- delete from Seller where idSeller in (16,17,18);
-- alter table Seller auto_increment = 1;	
-- select * from Seller;

-- productSeller: idPseller,idPproduct,prodQuantity

insert into productSeller(idPseller,idPproduct,prodQuantity)
values (1,6,80),
       (2,7,10);

select * from productSeller;

-- TypePayment: typePayment, limitAvailable

insert into TypePayment(typePayment, limitAvailable)
values ('Cartão de crédito',1.000),
       ('Boleto',2.500),
       ('Cartão de crédito',3.900),
       ('Pix',1.650);

select * from TypePayment;


-- Tabela Payment:idPaymentOrders,idPaymentType,paymentStatus,paymentDate

insert into Payment(idPaymentOrders,idPaymentType,paymentStatus,paymentDate)
values (1,1,'Aprovado','2025-12-31'),
       (2,2,'Rejeitado','2020-01-01'),
       (3,3,'Pendente','2025-01-28'),
       (4,4,'Aprovado','2022-07-15');
       
select * from Payment;

-- Tabela OwnCarrier :SocialName,CNPJ,Contact

insert into OwnCarrier(SocialName,CNPJ,Contact)
values ('LogiFast Transportes',2546525879552,3654216987),
       ('TransGlobal Express',25465821564666,3025413689),
       ('CargoWay Soluções Logísticas',2524562544885,4563695258),
       ('SpeedTrack Distribuição',2548795622325,8123256954);
       
select * from OwnCarrier;

-- Tabela OrdersOwnCarrier:idOCorders,idOCownCarrier,OCtrackingcode,OCorderdate

insert into OrdersOwnCarrier(idOCorders,idOCownCarrier,OCtrackingcode,OCorderdate)
values (1,1,'LX123456789BR','2025-12-31 23:59:59'),
       (2,2,'BR987654321US','2020-01-01 00:00:00');
       
select * from OrdersOwnCarrier;
delete from OrdersOwnCarrier where idOCorders in (3,4);

-- Tabela ContractCarrier: SocialName,CNPJ,Contact

insert into ContractCarrier(SocialName,CNPJ,Contact)
values ('RápidoCargo Express ',25361474859600,7452416396),
       ('GlobeTrack Logística ',63524196857403,8041526385),
       ('MegaFrete Transportes',96362541784501,2263987845),
       ('AtlasLog Distribuição',78451253514556,5521303654);

-- Tabela OrdersContractCarrier: idCCorders,idCCcontractCarrier,CCtrackingcode,CCorderdate

insert into OrdersContractCarrier(idCCorders,idCCcontractCarrier,CCtrackingcode,CCorderdate)
values (3,3,'AB456789123DE','2025-01-28 14:45:00'),
       (4,4,'XY789123456CN','2022-07-15 09:30:00');
       

select count(*) from client; -- numero de clientes existentes
select * from client c, orders o where c.idClient = idOrderClient;

select * from client c, physicalperson p where c.idClient = idPhysicalPersonClient;

select * from client c, orders o 
              where c.idClient = idOrderClient
              group by idOrders;

-- recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, fname, count(*) as Number_of_orders from client c
                  inner join orders o on c.idClient = o.idOrderClient
                  -- inner join productOrder p on p.idPOorder = o.idOrders
                  group by idClient;

SELECT 
    o.idOrders, 
    c.idClient, 
    c.fname AS NomeCliente, 
    c.clientType AS TipoCliente, 
    o.orderDate, 
    o.orderStatus
FROM Orders o
JOIN Client c ON o.idOrderClient = c.idClient
WHERE c.clientType = 'Física';  

SELECT clientType, COUNT(*) AS totalClientes
FROM Client
GROUP BY clientType
HAVING totalClientes > 2;

SELECT idOCorders, COUNT(*) AS totalPedidos
FROM OrdersOwnCarrier
GROUP BY idOCorders
HAVING  totalPedidos > 0
ORDER BY idOCorders;

