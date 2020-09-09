# Puppify
Projet chef_doeuvre

Puppify est une application Web d’adoption animale développé avec le Framework Django et une base de données PostgreSQL. Pour l’instant le site ne propose que des chiens et des chats.

## Introduction

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.
Ces instructions vont vous permettre d'avoir une copie du projet afin de tester l'application sur votre machine locale. Veuillez lire les notes de déploiement pour savoir comment déployer l'application sur un système.


### Pré-requis

Il vous faudra : 
 - Un serveur PostgreSQL 10.12
 - Le framework Django 3.0.4,
 - Django-Rest-Framework 3.11.0
 - Appareil W10


### Installation

Veuillez suivre les étapes d'installation

Installer virtualenv :

  py -m pip install --user virtualenv
  
Créer un environnement virtuel :

  py -m venv env
  
Activer l'environnement virtuel :
  
  .\env\Scripts\activate

Aller dans l'emplacement ou l'on veut créer le projet :

  cd/home/my-project/

Il faudra cloner l'application :

  git clone git@github.com:nekorpeche/puppify.git.
  
Il faudra se déplacer vers le répertoire : 
 
  cd puppify
  
Télécharger les packages avec la commande :

  pip install -r requirements.txt
  
Lancez le serveur Postgres et lancer la commande suivante pour créer une base de données :

  CREATE DATABASE databasename;
  
Intégrer la base de données :

  psql databasename < puppify_shema.sql

Peupler la base de données : 
  
  psql databasename < puppify_data.sql
  
Modifier les identifiants d'accès à la base de données dans le fichier settings.py :

  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.postgresql',

          'NAME': 'databasename',
          'USER': '',
          'PASSWORD': '',
          'HOST': 'localhost'
      }
  }
  
  Lancer la commande :
  
    python manage.py makemigrations
    
  Et pour finaliser lancez la commande :
  
    python manage.py migrate
    
 Lancez l'application : 
 
    python manage.py runserver



## Les tests

Il faut lancer les tests avec la commande :

  python manage.py test




## Auteur

* **Mathusha Thirulogasingam** 



