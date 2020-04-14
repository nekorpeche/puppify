from django.forms import ModelForm
from puppify.models import Personne,Reponse,Question,Formulaire,Questionform,Animal
from django import forms


class PersonneForm(ModelForm):
    mdp = forms.CharField(max_length=32, widget=forms.PasswordInput)
    mdp2 =forms.CharField(max_length=32, widget=forms.PasswordInput)
    class Meta:
        model = Personne
        exclude = ['isadmin','idimage']

        def clean(self):
            cleaned_data = super().clean()
            mdp= cleaned_data.get("mdp")
            mdp2 = cleaned_data.get("mdp2")
            mail = cleaned_data.get("mail")
            if mail :
                x = Personne.objects.filter(mail = mail).count()
                if x == 1:
                    raise forms.ValidationError(
                        "Ce mail est déjà utilisé !  "
                    )


            if mdp and mdp2:
                # Only do something if both fields are valid so far.
                if mdp2 != mdp:
                    raise forms.ValidationError(
                        "Les mots de passes ne correspondent pas ! "
                    )

class ConnexionForm(forms.Form):
    mail = forms.EmailField(label='Email', max_length=100)
    mdp = forms.CharField(max_length=32,label='Mot de passe', widget=forms.PasswordInput)

class ModifForm(ModelForm):
    class Meta:
        model = Personne
        exclude = ['isadmin','idimage','mdp']


class ModifAnimalForm(ModelForm):
    sexe_CHOICES = [('F', 'Female'),
                    ('M', 'Male')]

    sexe = forms.ChoiceField(choices=sexe_CHOICES, widget=forms.RadioSelect)
    age_CHOICES = [('Baby', 'Baby'), ('Adult', 'Adult'),
                   ('Senior', 'Senior')]
    age = forms.ChoiceField(choices=age_CHOICES, required=True)

    race_CHOICES = [
    ('Chien', (
        ('Husky', 'Husky'),
        ('Chihuahua', 'Chihuahua'),
        ('Yorkshire', 'Yorkshire'),
        ('Dalmatien', 'Dalmatien'),
        ('Boxer', 'Boxer'),
        )
    ),
    ('Chat', (
        ('European', 'European'),
        ('Scottish Fold', 'Scottish Fold'),
        ('Ragdoll', 'Ragdoll'),
        ('Siamois', 'Siamois'),
        )
    ),
    ]
    race = forms.ChoiceField(choices=race_CHOICES, required=True)
    class Meta:
        model = Animal
        exclude = ['idanimal','isanimalajoute','idpersonne','race']

class Form_adoption(ModelForm):
    class Meta:
        model = Reponse
        fields = ('idquestion','idpersonne','reponse')

class ChienForm(ModelForm):
    sexe_CHOICES = [('F', 'Female'),
               ('M', 'Male')]

    sexe = forms.ChoiceField(choices=sexe_CHOICES, widget=forms.RadioSelect)
    age_CHOICES =[('Baby', 'Baby'), ('Adult', 'Adult'),
                   ('Senior', 'Senior')]
    age = forms.ChoiceField(choices=age_CHOICES, required=True)
    race_CHOICES =[('Husky', 'Husky'), ('Chihuahua', 'Chihuahua'),
     ('Yorkshire', 'Yorkshire'), ('Dalmatien', 'Dalmatien'), ('Boxer', 'Boxer')]

    race = forms.ChoiceField(choices=race_CHOICES, required=True)
    class Meta:
        model = Animal
        exclude = ['idpersonne','isanimalajoute','idanimal','sexe','age','race','type']

class ChatForm(ModelForm):
    sexe_CHOICES = [('F', 'Female'),
               ('M', 'Male')]

    sexe = forms.ChoiceField(choices=sexe_CHOICES, widget=forms.RadioSelect)
    age_CHOICES = [('Baby', 'Baby'),('Adult', 'Adult'),
               ('Senior', 'Senior')]
    age = forms.ChoiceField(choices=age_CHOICES, required=True)
    race_CHOICES = [('European', 'European'), ('Scottish Fold', 'Scottish Fold'),
                    ('Ragdoll', 'Ragdoll'),('Siamois', 'Siamois')]
    race = forms.ChoiceField(choices=race_CHOICES, required=True)

    class Meta:
        model = Animal
        exclude = ['idpersonne','isanimalajoute','idanimal','sexe','age','race','type']

