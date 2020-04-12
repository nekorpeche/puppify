from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from .models import Animal,Utilisateur,Personne, Favoris,Question,Formulaire,Questionform,Reponse,Chien,Chat
from django.template.response import TemplateResponse
from puppify import forms
from django.core.mail import send_mail
from puppify import filters



def index(request):
     animals = Animal.objects.filter(isanimalajoute = True)

     filter = filters.AnimalFilter(request.GET, queryset=Animal.objects.filter(isanimalajoute = True))
     #ProductFilter(request.GET, queryset=Product.objects.all())
     if request.POST == True:
         pass
     context = { 'animals':animals,'filter':filter,}
     return render(request, 'puppify/index.html', context)

def animal(request,animal_id):
     context = {}
     context['msg'] = "Animal"
     animal= get_object_or_404(Animal, idanimal=animal_id)
     template =  'puppify/animal.html'
     if request.session.get('utilisateur_id'):
        personne = get_object_or_404(Personne,idpersonne=request.session['utilisateur_id'])
        user = get_object_or_404(Utilisateur, idpersonne=request.session['utilisateur_id'])
        if user.isformaccepted == True:
            context['form_true'] = True
        f = Favoris.objects.filter(idanimal = animal,idpersonne= personne).count()
        connecte = True
        if f:
             bool = True
        else :
             bool = False
     else:
        connecte = False
        bool = False
     if request.method == 'POST':
         if request.POST.get('animal'):
             a = request.POST.get('animal')
             choice = request.POST.get('subject')
             if choice == 'accepter':
                context['msg'] = "Animal ajouté !"
                animal.isanimalajoute = True
                animal.save()
             elif choice == 'refuser':
                 context['msg'] = "Animal refusé !"
                 animal.delete()
             else:
                 pass

     else:
        pass
     context['bool'] = bool
     context['animal'] = animal
     context['connecte'] = connecte
     return render(request,template, context)

def inscription(request):
    form = forms.PersonneForm()
    context = {'form': form, }
    response = TemplateResponse(request, 'puppify/inscription.html', context)
    return response

def connexion(request):
    context = {}
    form = forms.PersonneForm(request.POST)
    if form.is_valid():
        form.save()
        x = Personne.objects.latest('idpersonne')
        user = Utilisateur.objects.get_or_create(idpersonne=x)
    form = forms.ConnexionForm()
    context = {'form': form, }
    response = TemplateResponse(request, 'puppify/connexion.html', context)
    return response

def about(request):
     response = TemplateResponse(request, 'puppify/about.html', {})
     return response


def form_adoption(request):
    context = {}
    questions = []
    reponses=[]
    form = forms.Form_adoption()
    formulaire = Formulaire.objects.get(libelle_form="Formulaire d'adoption")
    pers = Personne.objects.get(idpersonne=request.session['utilisateur_id'])
    user = Utilisateur.objects.get(idpersonne=request.session['utilisateur_id'])
    qf = Questionform.objects.filter(idform = formulaire.idform)
    for f in qf:
        questions.append(Question.objects.get(libelle_question= f.idquestion))
    if user.isformfilled:
        for q in questions:
            reponses.append(Reponse.objects.get(idpersonne =request.session['utilisateur_id'],idquestion = q.idquestion ))
            context['qr'] = zip(questions,reponses)
            context['form_filled'] = True
    else:
        context['questions'] = questions
        context['form_filled'] = False
    context['form'] = form
    context['pers'] = pers
    context['user'] = user

    return render(request, "puppify/form_adoption.html", context)


def page_utilisateur(request):
    context = {}
    form = forms.ConnexionForm(request.POST)
    if form.is_valid():
        mail = form.cleaned_data['mail']
        mdp = form.cleaned_data['mdp']
        utilisateur = Personne.objects.get(mail=mail, mdp=mdp)
        if utilisateur.mdp == mdp:
            request.session['utilisateur_id'] = utilisateur.idpersonne
            request.session['utilisateur_nom'] = utilisateur.nom
            request.session['utilisateur_prenom'] = utilisateur.prenom
            request.session['utilisateur_admin'] = False
            if utilisateur.isadmin:
                request.session['utilisateur_admin'] = utilisateur.isadmin
            context['msg']="Vous êtes connectés"
        else:
            context['msg']="L'utilisateur n'a pas été reconnu !"
            template = 'puppify/connexion.html'
    if request.session['utilisateur_id']:
        pers = Utilisateur.objects.get(idpersonne = request.session['utilisateur_id'])

        if  request.session['utilisateur_admin']:
            template = 'puppify/page_admin.html'
        else:
            template = 'puppify/page_utilisateur.html'
        if pers.isformfilled == True:
            context['form_filled'] = True
        else:
            context['form_filled'] = False
    formChien = forms.ChienForm(request.POST)
    if formChien.is_valid():
        n = formChien.cleaned_data['nom']
        s= formChien.cleaned_data['sexe']
        d= formChien.cleaned_data['description']
        ag= formChien.cleaned_data['age']
        r= formChien.cleaned_data['race']
        id = request.session['utilisateur_id']
        pers = Personne.objects.get(idpersonne = id)


        animal_ajoute = False
        a = Animal(nom = n,sexe = s,description = d,age=ag,idpersonne=pers,race=r,isanimalajoute = animal_ajoute,type="CHIEN")
        a.save()
        x = Animal.objects.latest('idanimal')
        race = Chien(idanimal = x,racechien=r)
        race.save()

    formChat = forms.ChatForm(request.POST)
    if formChat.is_valid():
        n = formChat.cleaned_data['nom']
        s= formChat.cleaned_data['sexe']
        d= formChat.cleaned_data['description']
        ag= formChat.cleaned_data['age']
        r= formChat.cleaned_data['race']
        id = request.session['utilisateur_id']
        pers = Personne.objects.get(idpersonne = id)
        animal_ajoute = False
        a = Animal(nom = n,sexe = s,description = d,age=ag,idpersonne=pers,race=r,isanimalajoute = animal_ajoute,type="CHAT")
        a.save()
        x = Animal.objects.latest('idanimal')
        race = Chat(idanimal = x,racechat=r)
        race.save()

    return render(request, template, context)

def page_admin(request):
    context = {}
    template = 'puppify/page_admin.html'
    return render(request, template, context)

def logout(request):
    utilisateur = Personne.objects.get(idpersonne=request.session['utilisateur_id'])
    if utilisateur.isadmin:
        del request.session['utilisateur_admin']
    del request.session['utilisateur_id']
    del request.session['utilisateur_nom']
    del request.session['utilisateur_prenom']
    response = TemplateResponse(request, 'puppify/logout.html', {})
    return response

def add_animal(request):
    context = {}
    template = 'puppify/add_animal.html'
    return render(request, template, context)

def add_chien(request):
    context = {}
    form = forms.ChienForm()
    context['form']= form
    template = 'puppify/add_chien.html'
    return render(request, template, context)

def add_chat(request):
    context = {}
    form = forms.ChatForm()
    context['form'] = form
    template = 'puppify/add_chat.html'
    return render(request, template, context)


# def user_details(request):
#     response = TemplateResponse(request, 'puppify/user_details.html', {})
#     return response

def user_details(request):
    instance = get_object_or_404(Personne, idpersonne=request.session['utilisateur_id'])
    form = forms.ModifForm(request.POST or None, instance=instance)
    template = 'puppify/user_details.html'
    if form.is_valid():
        utilisateur = Personne.objects.get(idpersonne = request.session['utilisateur_id'])
        request.session['utilisateur_nom'] = utilisateur.nom
        request.session['utilisateur_prenom'] = utilisateur.prenom
        form.save()
        if request.session['utilisateur_admin']:
            template  = 'puppify/page_admin.html'
        else:
            template = 'puppify/page_utilisateur.html'
    return render(request, template, {'form': form})

def edit_animal(request,animal_id):
    instance = get_object_or_404(Animal, idanimal=animal_id)

    form = forms.ModifAnimalForm(request.POST or None, instance=instance,initial={'race': instance.race})
    template = 'puppify/edit_animal.html'
    if form.is_valid():
        form.save()
        template = 'puppify/'+animal_id
        response = TemplateResponse(request, template, {})
        return response
    return render(request, template, {'form': form})

def favorite(request):
    #favorites = Favoris.objects.get(idpersonne=request.session['utilisateur_id'])
    animals = []
    favorites = Favoris.objects.filter(idpersonne=request.session['utilisateur_id'])
    for f in favorites:
        #instance = get_object_or_404(Personne, idpersonne=request.session['utilisateur_id'])
        a = get_object_or_404(Animal,nom=f.idanimal)
        animals.append(a)
    context = {'animals':animals, }
    return render(request, 'puppify/favorite.html', context)


def myanimals(request):
    template = 'puppify/myanimals.html'
    user = Personne.objects.get(idpersonne = request.session['utilisateur_id'])
    if request.session['utilisateur_admin']:
        animals = Animal.objects.filter(isanimalajoute=True)
    else:
        animals = Animal.objects.filter(idpersonne =user )
    context = {'animals': animals, }
    return render(request, template,context)

def retirer_animal(request,animal_id):
    context={}
    user = Personne.objects.get(idpersonne=request.session['utilisateur_id'])
    animals = Animal.objects.filter(idpersonne=user)
    context = {'animals': animals, }
    animal = Animal.objects.get(idanimal=animal_id).delete()
    template = 'puppify/myanimals.html'
    return render(request, template, context)


def add_favorite(request,animal_id):
    context = {}
    animal = Animal.objects.get(idanimal=animal_id)
    context['animal'] = animal
    if request.session['utilisateur_id']:
        context['connecte'] = True
        instance = Personne.objects.get(idpersonne=request.session['utilisateur_id'])
        fav = Favoris.objects.filter(idpersonne=instance, idanimal=animal)
        if fav :
            fav.delete()
            context['bool']=False
        else:
            favoris = Favoris.objects.get_or_create(idpersonne=instance, idanimal=animal)
            context['bool'] = True
        template = 'puppify/animal.html'
    else:
        context['connecte'] = False
        template = 'puppify/connexion.html'
    return render(request, template, context)


def recap_form(request):
    context = {}
    answer = []
    questions = []
    reponses = []
    liste = []
    if request.method == 'POST':
        formulaire = Formulaire.objects.get(libelle_form="Formulaire d'adoption")
        if request.session['utilisateur_admin']:
            user = request.POST.get('user')
            pers = Utilisateur.objects.get(idpersonne=user)
            choice = request.POST.get('subject')
            if choice =="accepter":
                context['msg'] = "Formulaire accepté !"
                pers.isformaccepted = True
                pers.save()
            elif choice=="refuser":
                context['msg'] = "Le formulaire refusé ! "
                pers.isformfilled = False
                x = Reponse.objects.filter(idpersonne = pers)
                x.delete()

                pers.save()
            else:
                context['msg'] = "Formulaire d'adoption de "+str(pers.idpersonne.nom+ " "+ pers.idpersonne.prenom)
        else:
            pers = Utilisateur.objects.get(idpersonne=request.session['utilisateur_id'])
            context['msg'] = "Formulaire d'adoption"
        qf = Questionform.objects.filter(idform=formulaire.idform)
        for f in qf:
            questions.append(Question.objects.get(libelle_question=f.idquestion))
        for q in questions:
            a = 'answer'+str(q.idquestion)
            res = request.POST.get(a)
            answer.append(res)
            rep,created = Reponse.objects.get_or_create(idquestion=q,idpersonne = pers)
            if request.session['utilisateur_admin']:
                pass
            else:
                rep.reponse = res
                rep.save()
            reponses.append(rep)
        context['liste'] = zip(questions,reponses)
        context['pers'] = pers
        if request.session['utilisateur_admin']:
            pass
        else:
            pers.isformfilled = True
            pers.save()
    template = 'puppify/recap_form.html'
    return render(request, template,  context)

def manage_animal(request):
    context={}
    animals = Animal.objects.filter(isanimalajoute=False)
    animals_list=[]
    pers_list=[]
    for a in animals:
        user = Utilisateur.objects.get(idpersonne=a.idpersonne)
        pers = Personne.objects.get(idpersonne = user.idpersonne.idpersonne)
        animals_list.append(a)
        pers_list.append(pers)
    liste = zip(animals_list,pers_list)
    context['liste'] = liste
    template = 'puppify/manage_animal.html'
    return render(request,template,context)

def gerer_form(request):
    users = Utilisateur.objects.filter(isformaccepted="",isformfilled=True)
    context={}
    context['users'] = users
    template = 'puppify/gerer_form.html'
    return render(request,template,context)

def contact(request):
    context = {}
    template = 'puppify/contact.html'

    if request.method == 'POST':
        if 'animal' in request.POST:
            a = request.POST.get('animal')
            animal = Animal.objects.get(idanimal = a)
            context['animal'] = animal

        if 'animal_contact' in request.POST:
            context['msg'] = "Message envoyé !"
            a = request.POST.get('animal_contact')
            animal = get_object_or_404(Animal, idanimal=a)
            pers = Personne.objects.get(idpersonne=request.session['utilisateur_id'])

            context['animal'] = animal
            titre = request.POST.get('titre')
            texte = request.POST.get('texte')
            message = "Bonjour, merci de ne pas répondre à ce mail ! " \
                     "Suite à votre annonce concernant l'animal "+ animal.nom+" sur Puppify "\
                      +pers.mail+" vous as laissé un message :) : "+texte
            send_mail(titre, message, 'noreply.puppify@gmail.com', [str(animal.idpersonne.mail)])

    return render(request, template, context)

