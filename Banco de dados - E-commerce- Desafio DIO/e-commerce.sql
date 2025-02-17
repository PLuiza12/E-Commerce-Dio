-- Database E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;


-- Tabela Cliente
create table Client(
   idClient int auto_increment primary key,
   fname varchar(255) not null,
   address varchar(255) not null,
   contact varchar(20),
   clientType ENUM('Física', 'Jurídica') NOT NULL
);   

-- alter table client auto_increment=1
 -- desc Client;

-- alter table client modify column address varchar(255);
-- alter table client modify column contact char(20);
   
-- Tabela Cliente Juridico

create table LegalPerson(
    idLegalPerson int auto_increment primary key,
    idLegalPersonClient int unique,
    CNPJ char(15) not null unique,
    socialName varchar(255) not null, 
    contact varchar(20) not null,
    constraint fk_legal_person foreign key (idLegalPersonClient) references Client(idClient) on delete cascade
);

-- alter table LegalPerson auto_increment=1;

 -- desc LegalPerson;
 -- alter table LegalPerson modify column contact char(20);


-- Tabela Cliente Fisico

create table PhysicalPerson(
    idPhysicalPerson int auto_increment primary key,
    idPhysicalPersonClient int unique,
    fname varchar(10) not null,
    minit char(3) not null,
    lname varchar(20) not null,
    CPF char(11) not null unique, 
    contact varchar(20) not null,
    constraint fk_physical_person foreign key (idPhysicalPersonClient) references Client(idClient) on delete cascade
);

-- alter table PhysicalPerson auto_increment=1;

-- desc PhysicalPerson;

-- alter table PhysicalPerson modify column contact char(20);

-- Tabela Produto

create table Product(
    idProduct int auto_increment primary key,
    pname varchar(255) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);

-- alter table Product auto_increment=1;

-- desc Product;

-- alter table Product modify column pname varchar(45);
    
-- Tabela Tipo do Pagamento

create table TypePayment(
    idTypePayment int auto_increment primary key,
    typePayment enum('Cartão de crédito','Boleto','Pix') not null,
    limitAvailable float
);

-- desc TypePayment;
-- alter table TypePayment auto_increment=1;

-- Tabela  Pedido

create table Orders(
   idOrders int auto_increment primary key,
   idOrderClient int,
   orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
   orderDescription varchar(255),
   sendValue float default 10,
   orderDate datetime not null,
   constraint fk_orders_client foreign key (idOrderClient) references Client(idClient)
);   

-- alter table Orders auto_increment=1;
-- show table status like 'Orders';
-- desc Orders;

-- Tabela Pagamento

create table Payment(
    idPayment int auto_increment primary key,
    idPaymentOrders int,
    idPaymentType int,
    paymentStatus enum('Aprovado','Rejeitado','Pendente') not null,
    paymentDate date not null, 
    constraint fk_payment_orders foreign key (idPaymentOrders) references Orders(idOrders) on delete cascade,
	constraint fk_payment_type foreign key (idPaymentType) references TypePayment(idTypePayment)
    );
    
-- desc Payment;
-- alter table Payment auto_increment=1;

-- Tabela Estoque

create table Stock(
    idStock int auto_increment primary key,
    stockLocation varchar(45) not null
);

-- alter table Stock auto_increment=1;

-- desc Stock;

-- Tabela Produto_Estoque 

create table Stock_Product(
    idstockProduct int,
    idstockStorage int,
    Quantity int not null default 0,
    primary key (idstockProduct, idstockStorage),
    foreign key (idstockProduct) references Product(idProduct) on delete cascade,
	foreign key (idstockStorage) references Stock(idStock) on delete cascade
);

-- desc Stock_Product;

-- Tabela Fornecedor 

create table Supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact varchar(20) not null,
    constraint unique_supplier unique(CNPJ)
);

-- alter table Supplier auto_increment=1;

-- alter table Supplier modify column Contact char(20);

-- desc Supplier;

-- Tabela vendedor 

create table Seller(
    idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact varchar(20) not null,
    constraint unique_cpnj_seller unique (CNPJ),
    constraint unique_CPF_seller unique (CPF)
);

-- alter table Seller auto_increment=1;

-- alter table Seller modify column CPF char(11);

-- desc Seller;

-- Tabela Produto_Vendedor (terceiro)

create table productSeller(
    idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idPseller,idPproduct),
    constraint fk_product_seller foreign key (idPseller) references Seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references Product(idProduct)
);

-- desc productSeller;

-- Tabela Produto_Pedido

create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1, 
    poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
    primary key (idPOproduct,idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references Product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references Orders(idOrders)
);

-- desc productOrder;

-- Tabela Produto_Fornecedor

create table productSupplier(
   idPOsupplier int,
   idPOproduct int,
   quantity int default 1,
   primary key (idPOsupplier,idPOproduct),
   constraint fk_productsupplier_supplier foreign key (idPOsupplier) references Supplier(idSupplier),
   constraint fk_productsupplier_product foreign key (idPOproduct) references Product(idProduct)
);

-- alter table productSupplier add column quantity int not null;

-- alter table productSupplier add column quantity int default 1;

 -- desc productSupplier;

-- Tabela transportadora propria

create table OwnCarrier(
    idOwnCarrier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact varchar(20) not null,
    constraint unique_owncarrier unique(CNPJ)
);

-- desc OwnCarrier;
-- alter table OwnCarrier auto_increment=1;

-- Tabela transportadora terceira 

create table ContractCarrier(
	idContractCarrier int auto_increment primary key,
	SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact varchar(20) not null,
    constraint unique_contractcarrier unique(CNPJ)
);

-- desc ContractCarrier;
-- alter table ContractCarrier auto_increment=1;

-- Tabela pedido / transportadora propria

create table OrdersOwnCarrier(
    idOCorders int,
    idOCownCarrier int,
    OCtrackingcode varchar(50),
    OCorderdate datetime,
    primary key (idOCorders,idOCownCarrier),
    constraint fk_ordersowncarrier_orders foreign key (idOCorders) references Orders(idOrders),
    constraint fk_ordersowncarrier_owncarrier foreign key (idOCownCarrier) references OwnCarrier(idOwnCarrier)
);

-- desc OrdersOwnCarrier;
-- Tabela pedido / transportadora terceira

create table OrdersContractCarrier(
    idCCorders int,
    idCCcontractCarrier int,
    CCtrackingcode varchar(50),
    CCorderdate datetime,
    primary key (idCCorders,idCCcontractCarrier),
    constraint fk_orderscontractcarrier_orders foreign key (idCCorders) references Orders(idOrders),
    constraint fk_orderscontractcarrier_contractcarrier foreign key (idCCcontractCarrier) references ContractCarrier(idContractCarrier)
);

-- desc OrdersContractCarrier;

 -- show tables;




    

    

