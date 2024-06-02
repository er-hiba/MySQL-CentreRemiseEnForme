mysql> create database centreRemiseEnForme ;
Query OK, 1 row affected (0.11 sec)

mysql> use centreRemiseEnForme;
Database changed
mysql> create table Adherent (
    -> ID_Adherent int primary key,
    -> nom_Ad varchar(15),
    -> prenom_Ad varchar(15),
    -> adresse varchar(50),
    -> date_abonnement date,
    -> type_abonnement enum ('mensuel', 'trimestriel', 'annuel'),
    -> ID_Coach int,
    -> ID_Parrain int,
    -> foreign key (ID_Parrain) references Adherent(ID_Adherent));
Query OK, 0 rows affected (0.65 sec)

mysql> create table Coach (
    -> ID_Coach int primary key,
    -> prenom_C varchar(15),
    -> nom_C varchar(15));
Query OK, 0 rows affected (0.04 sec)

mysql> alter table Adherent
    -> add foreign key (ID_Coach) references Coach(ID_Coach);
Query OK, 0 rows affected (0.57 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table Seance (
    -> ID_Seance int primary key,
    -> nom_Seance varchar(45),
    -> date_S date,
    -> nbrParticipants int);
Query OK, 0 rows affected (0.05 sec)

mysql> create table Evolution(
    -> ID_Ev int primary key,
    -> poids int,
    -> taille int,
    -> tour_taille int,
    -> tour_poitrine int,
    -> date_Ev date,
    -> ID_Adherent int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent));
Query OK, 0 rows affected (0.06 sec)

mysql> create table Adherent_Seance (
    -> ID_Adherent int,
    -> ID_Seance int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent));
Query OK, 0 rows affected (0.10 sec)

mysql> create table Competition (
    -> ID_Comp int primary key,
    -> nom_Comp varchar(45));
Query OK, 0 rows affected (0.04 sec)

mysql> create table Adherent_Comp (
    -> ID_Adherent int,
    -> ID_Comp int,
    -> place int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5

mysql> create table Adherent_Comp (
    -> ID_Adherent int,
    -> ID_Comp int,
    -> place int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent),
    -> foreign key (ID_Comp) references Competition(ID_Comp),
    -> primary key(ID_Adherent, ID_Comp));
Query OK, 0 rows affected (0.10 sec)

mysql> create table Resiliation(
    -> ID_R int primary key,
    -> details varchar(70),
    -> motif varchar(70),
    -> ID_Adherent int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent));
Query OK, 0 rows affected (0.08 sec)

mysql> create table Produit (
    -> ID_Produit int primary key,
    -> nom_P varchar(15),
    -> prix float);
Query OK, 0 rows affected (0.04 sec)

mysql> create table Transaction (
    -> ID_T int primary key,
    -> montant float,
    -> date_T date,
    -> ID_Adherent int,
    -> foreign key (ID_Adherent) references Adherent(ID_Adherent));
Query OK, 0 rows affected (0.08 sec)

mysql> create table Prod_Transaction (
    -> ID_Produit int,
    -> ID_T int,
    -> foreign key(ID_Produit) references Produit(ID_Produit),
    -> foreign key(ID_T) references Transaction(ID_T),
    -> primary key(ID_Produit, ID_T));
Query OK, 0 rows affected (0.09 sec)

mysql> show tables;
+-------------------------------+
| Tables_in_centreremiseenforme |
+-------------------------------+
| adherent                      |
| adherent_comp                 |
| adherent_seance               |
| coach                         |
| competition                   |
| evolution                     |
| prod_transaction              |
| produit                       |
| resiliation                   |
| seance                        |
| transaction                   |
+-------------------------------+
11 rows in set (0.02 sec)

mysql> desc adherent;
+-----------------+----------------------------------------+------+-----+---------+-------+
| Field           | Type                                   | Null | Key | Default | Extra |
+-----------------+----------------------------------------+------+-----+---------+-------+
| ID_Adherent     | int                                    | NO   | PRI | NULL    |       |
| nom_Ad          | varchar(15)                            | YES  |     | NULL    |       |
| prenom_Ad       | varchar(15)                            | YES  |     | NULL    |       |
| adresse         | varchar(50)                            | YES  |     | NULL    |       |
| date_abonnement | date                                   | YES  |     | NULL    |       |
| type_abonnement | enum('mensuel','trimestriel','annuel') | YES  |     | NULL    |       |
| ID_Coach        | int                                    | YES  | MUL | NULL    |       |
| ID_Parrain      | int                                    | YES  | MUL | NULL    |       |
+-----------------+----------------------------------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> desc adherent_comp;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| ID_Adherent | int  | NO   | PRI | NULL    |       |
| ID_Comp     | int  | NO   | PRI | NULL    |       |
| place       | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc adherent_seance;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| ID_Adherent | int  | YES  | MUL | NULL    |       |
| ID_Seance   | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc coach;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ID_Coach | int         | NO   | PRI | NULL    |       |
| prenom_C | varchar(15) | YES  |     | NULL    |       |
| nom_C    | varchar(15) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc competition;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ID_Comp  | int         | NO   | PRI | NULL    |       |
| nom_Comp | varchar(45) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc evolution;
+---------------+------+------+-----+---------+-------+
| Field         | Type | Null | Key | Default | Extra |
+---------------+------+------+-----+---------+-------+
| ID_Ev         | int  | NO   | PRI | NULL    |       |
| poids         | int  | YES  |     | NULL    |       |
| taille        | int  | YES  |     | NULL    |       |
| tour_taille   | int  | YES  |     | NULL    |       |
| tour_poitrine | int  | YES  |     | NULL    |       |
| date_Ev       | date | YES  |     | NULL    |       |
| ID_Adherent   | int  | YES  | MUL | NULL    |       |
+---------------+------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> desc prod_transaction;
+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| ID_Produit | int  | NO   | PRI | NULL    |       |
| ID_T       | int  | NO   | PRI | NULL    |       |
+------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc produit;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| ID_Produit | int         | NO   | PRI | NULL    |       |
| nom_P      | varchar(15) | YES  |     | NULL    |       |
| prix       | float       | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc resiliation;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| ID_R        | int         | NO   | PRI | NULL    |       |
| details     | varchar(70) | YES  |     | NULL    |       |
| motif       | varchar(70) | YES  |     | NULL    |       |
| ID_Adherent | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc seance;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| ID_Seance       | int         | NO   | PRI | NULL    |       |
| nom_Seance      | varchar(45) | YES  |     | NULL    |       |
| date_S          | date        | YES  |     | NULL    |       |
| nbrParticipants | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc transaction;
+-------------+-------+------+-----+---------+-------+
| Field       | Type  | Null | Key | Default | Extra |
+-------------+-------+------+-----+---------+-------+
| ID_T        | int   | NO   | PRI | NULL    |       |
| montant     | float | YES  |     | NULL    |       |
| date_T      | date  | YES  |     | NULL    |       |
| ID_Adherent | int   | YES  | MUL | NULL    |       |
+-------------+-------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql>
