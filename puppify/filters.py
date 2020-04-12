import django_filters

from puppify.models import Animal

class AnimalFilter(django_filters.FilterSet):


    SEX_CHOICES = (
        ('F', 'Femelle'),
        ('M', 'Mâle'),
    )
    sexe = django_filters.ChoiceFilter(choices=SEX_CHOICES)

    AGE_CHOICES = (
        ('Baby', 'Bébé'),
        ('Adult', 'Adulte'),
        ('Senior', 'Senior'),
    )
    age = django_filters.ChoiceFilter(choices=AGE_CHOICES)

    TYPE_CHOICES = (
        ('CHIEN', 'Chien'),
        ('CHAT', 'Chat'),

    )
    type = django_filters.ChoiceFilter(choices=TYPE_CHOICES)
    class Meta:
        model = Animal
        fields = ('nom','race','age','sexe','type')