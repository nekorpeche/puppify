from django.urls import path


from . import views

app_name = 'puppify'
urlpatterns = [
    path('', views.index, name='index'),
    path('<int:animal_id>/', views.animal, name='animal'),
    path('<int:animal_id>/add', views.add_favorite, name='add_favorite'),
    path('<int:animal_id>/edit_animal', views.edit_animal, name='edit_animal'),
    path('inscription', views.inscription, name='inscription'),
    path('connexion', views.connexion, name='connexion'),
    path('about', views.about, name='about'),
    path('form_adoption', views.form_adoption, name='form_adoption'),
    path('page_utilisateur', views.page_utilisateur, name='page_utilisateur'),
    path('page_admin', views.page_admin, name='page_admin'),
    path('add_animal', views.add_animal, name='add_animal'),
    path('manage_animal', views.manage_animal, name='manage_animal'),
    path('add_animal/chien', views.add_chien, name='add_chien'),
    path('add_animal/chat', views.add_chat, name='add_chat'),
    path('logout', views.logout, name='logout'),
    path('gerer_form', views.gerer_form, name='gerer_form'),
    path('myanimals', views.myanimals, name='myanimals'),
    path('user_details', views.user_details, name='user_details'),
    path('favorite', views.favorite, name='favorite'),
    path('recap_form', views.recap_form, name='recap_form'),
    path('<int:animal_id>/remove', views.retirer_animal, name='remove'),
    path('contact', views.contact, name='contact'),


]