# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Animal(models.Model):
    idanimal = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=25, blank=True, null=True)
    sexe = models.CharField(max_length=1, blank=True, null=True)
    description = models.CharField(max_length=200, blank=True, null=True)
    race = models.CharField(max_length=25, blank=True, null=True)
    age = models.CharField(max_length=7, blank=True, null=True)
    isanimalajoute = models.BooleanField(blank=True, null=True)
    idpersonne = models.ForeignKey('Personne', models.DO_NOTHING, db_column='idpersonne', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'animal'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Chat(models.Model):
    idanimal = models.OneToOneField(Animal, models.DO_NOTHING, db_column='idanimal', primary_key=True)
    racechat = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'chat'


class Chien(models.Model):
    idanimal = models.OneToOneField(Animal, models.DO_NOTHING, db_column='idanimal', primary_key=True)
    racechien = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'chien'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Favoris(models.Model):
    idpersonne = models.OneToOneField('Personne', models.DO_NOTHING, db_column='idpersonne', primary_key=True)
    idanimal = models.ForeignKey(Animal, models.DO_NOTHING, db_column='idanimal')

    class Meta:
        managed = False
        db_table = 'favoris'
        unique_together = (('idpersonne', 'idanimal'),)


class Formulaire(models.Model):
    idform = models.AutoField(primary_key=True)
    libelle_form = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'formulaire'


class Image(models.Model):
    idimage = models.AutoField(primary_key=True)
    url = models.CharField(max_length=50, blank=True, null=True)
    libelle = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'image'


class Personne(models.Model):
    idpersonne = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=25, blank=True, null=True)
    prenom = models.CharField(max_length=25, blank=True, null=True)
    numero = models.IntegerField(blank=True, null=True)
    mail = models.CharField(max_length=50, blank=True, null=True)
    mdp = models.CharField(max_length=50, blank=True, null=True)
    isadmin = models.BooleanField(blank=True, null=True)
    idimage = models.ForeignKey(Image, models.DO_NOTHING, db_column='idimage', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'personne'


class Question(models.Model):
    idquestion = models.AutoField(primary_key=True)
    libelle_question = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'question'


class Questionform(models.Model):
    idqf = models.AutoField(primary_key=True)
    idquestion = models.ForeignKey(Question, models.DO_NOTHING, db_column='idquestion', blank=True, null=True)
    idform = models.ForeignKey(Formulaire, models.DO_NOTHING, db_column='idform', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'questionform'


class Reponse(models.Model):
    idreponse = models.AutoField(primary_key=True)
    idquestion = models.ForeignKey(Question, models.DO_NOTHING, db_column='idquestion', blank=True, null=True)
    idpersonne = models.ForeignKey('Utilisateur', models.DO_NOTHING, db_column='idpersonne', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reponse'


class Utilisateur(models.Model):
    idpersonne = models.OneToOneField(Personne, models.DO_NOTHING, db_column='idpersonne', primary_key=True)
    isformaccepted = models.BooleanField(blank=True, null=True)
    isformfilled = models.BooleanField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'utilisateur'
