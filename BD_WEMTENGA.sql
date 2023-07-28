/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  28/07/2023 11:36:39                      */
/*==============================================================*/


alter table Enseignants 
   drop foreign key FK_ENSEIGNA_ASSOCIATI_JURY;

alter table Jury 
   drop foreign key FK_JURY_ASSOCIATI_SOUTENAN;

alter table Maitres_de_stage 
   drop foreign key FK_MAITRES__ASSOCIATI_ETUDIANT;

alter table Salle_ 
   drop foreign key FK_SALLE__ASSOCIATI_SOUTENAN;

alter table Soutenances 
   drop foreign key FK_SOUTENAN_ASSOCIATI_ETUDIANT;

alter table Utilisateurs 
   drop foreign key FK_UTILISAT_ASSOCIATI_ROLE;


alter table Enseignants 
   drop foreign key FK_ENSEIGNA_ASSOCIATI_JURY;

drop table if exists Enseignants;

drop table if exists Etudiants;


alter table Jury 
   drop foreign key FK_JURY_ASSOCIATI_SOUTENAN;

drop table if exists Jury;


alter table Maitres_de_stage 
   drop foreign key FK_MAITRES__ASSOCIATI_ETUDIANT;

drop table if exists Maitres_de_stage;

drop table if exists Role;


alter table Salle_ 
   drop foreign key FK_SALLE__ASSOCIATI_SOUTENAN;

drop table if exists Salle_;


alter table Soutenances 
   drop foreign key FK_SOUTENAN_ASSOCIATI_ETUDIANT;

drop table if exists Soutenances;


alter table Utilisateurs 
   drop foreign key FK_UTILISAT_ASSOCIATI_ROLE;

drop table if exists Utilisateurs;

/*==============================================================*/
/* Table : Enseignants                                          */
/*==============================================================*/
create table Enseignants
(
   id_enseignants       int not null  comment '',
   id_jury              int not null  comment '',
   nom                  varchar(254)  comment '',
   prenom               varchar(254)  comment '',
   titre                varchar(254)  comment '',
   specialite           varchar(254)  comment '',
   telephone            int  comment '',
   civilite             varchar(254)  comment '',
   primary key (id_enseignants)
);

/*==============================================================*/
/* Table : Etudiants                                            */
/*==============================================================*/
create table Etudiants
(
   id_etudiants         int not null  comment '',
   nom                  varchar(254)  comment '',
   prenom               varchar(254)  comment '',
   classe               varchar(254)  comment '',
   telephone            int  comment '',
   civilite             varchar(254)  comment '',
   matricule            varchar(254)  comment '',
   primary key (id_etudiants)
);

/*==============================================================*/
/* Table : Jury                                                 */
/*==============================================================*/
create table Jury
(
   id_jury              int not null  comment '',
   id_soutenances       int not null  comment '',
   nom                  varchar(254)  comment '',
   prenom               varchar(254)  comment '',
   role_                varchar(254)  comment '',
   telephone            int  comment '',
   primary key (id_jury)
);

/*==============================================================*/
/* Table : Maitres_de_stage                                     */
/*==============================================================*/
create table Maitres_de_stage
(
   id_maitres           int not null  comment '',
   id_etudiants         int not null  comment '',
   nom                  varchar(254)  comment '',
   prenom               varchar(254)  comment '',
   foction              varchar(254)  comment '',
   telephone            int  comment '',
   primary key (id_maitres)
);

/*==============================================================*/
/* Table : Role                                                 */
/*==============================================================*/
create table Role
(
   id_role              int not null  comment '',
   Super_Admin          varchar(254)  comment '',
   DM                   varchar(254)  comment '',
   Surveillant          varchar(254)  comment '',
   Maitre_de_stage      varchar(254)  comment '',
   primary key (id_role)
);

/*==============================================================*/
/* Table : Salle_                                               */
/*==============================================================*/
create table Salle_
(
   id_salle             int not null  comment '',
   id_soutenances       int not null  comment '',
   nom                  varchar(254)  comment '',
   primary key (id_salle)
);

/*==============================================================*/
/* Table : Soutenances                                          */
/*==============================================================*/
create table Soutenances
(
   id_soutenances       int not null  comment '',
   id_etudiants         int  comment '',
   jour                 datetime  comment '',
   heure                int  comment '',
   primary key (id_soutenances)
);

/*==============================================================*/
/* Table : Utilisateurs                                         */
/*==============================================================*/
create table Utilisateurs
(
   id_utilisateur       int not null  comment '',
   id_role              int not null  comment '',
   nom                  varchar(254)  comment '',
   prenom               varchar(254)  comment '',
   foction              varchar(254)  comment '',
   telephone            int  comment '',
   role_                varchar(254)  comment '',
   primary key (id_utilisateur)
);

alter table Enseignants add constraint FK_ENSEIGNA_ASSOCIATI_JURY foreign key (id_jury)
      references Jury (id_jury) on delete restrict on update restrict;

alter table Jury add constraint FK_JURY_ASSOCIATI_SOUTENAN foreign key (id_soutenances)
      references Soutenances (id_soutenances) on delete restrict on update restrict;

alter table Maitres_de_stage add constraint FK_MAITRES__ASSOCIATI_ETUDIANT foreign key (id_etudiants)
      references Etudiants (id_etudiants) on delete restrict on update restrict;

alter table Salle_ add constraint FK_SALLE__ASSOCIATI_SOUTENAN foreign key (id_soutenances)
      references Soutenances (id_soutenances) on delete restrict on update restrict;

alter table Soutenances add constraint FK_SOUTENAN_ASSOCIATI_ETUDIANT foreign key (id_etudiants)
      references Etudiants (id_etudiants) on delete restrict on update restrict;

alter table Utilisateurs add constraint FK_UTILISAT_ASSOCIATI_ROLE foreign key (id_role)
      references Role (id_role) on delete restrict on update restrict;

