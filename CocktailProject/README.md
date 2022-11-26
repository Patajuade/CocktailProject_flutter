# B3-Flutter

https://docs.flutter.dev/get-started/install

Ne pas oublier de sélectionner chrome en bas à droite de la fenêtre

EX : faire comme le dernier exo d'android mais en dur
on crée des crimes etc

# Pour le projet
* DB Sqlite
    * table : cocktail
        * colonne : id
        * colonne : nom
        * colonne : image
        * colonne : description
    * table : ingrédients
        * colonne : id
        * colonne : nom
        * colonne : image
        * colonne : catégorieId
    * table : catégories
        * colonne : id
        * colonne : nom
    * table : tags
        * colonne : id
        * colonne : nom
        * colonne : couleur
    * table intermédiaire : cocktailIngrédient : lien entre un cocktail et ses ingrédients
        * colonne : cocktailId 
        * colonne : ingrédientId
        * colonne : quantités
    * table intermédiaire : cocktailTags
        * colonne : cocktailId
        * colonne : tagId
________

## Routes pour Cocktail

### Rest API express/nodejs

> GET:cocktail/all
>* Description : récupère la liste de tous les cocktails avec leur id/nom/image/description.

> GET:cocktail/{id}
>* Description : récupère un cocktail via son id.
>* join : ingrédient
>* join : tag

> POST:cocktail
>* Description : ajouter un cocktail
>* body:id/nom/image/description en json

> POST:cocktail/{Id}
>* Description : ajouter un ingrédient au cocktail
>* body : ingredientId en json

> DELETE:cocktail/{id}
>* Description : retirer un cocktail
>* ATTENTION : retirer les entrées de cocktailingrédient mais pas des autres

> DELETE:cocktail/{cocktailId}/ingredient/{ingredientId}
>* Description : retirer un ingrédient du cocktail

> PUT:cocktail
>* Description : ajouter un cocktail
>* body:id/nom/image/description en json

## Routes pour Ingrédient 

> GET:ingrédient/all
>* Description : récupère la liste de tous les ingrédients avec leur id/nom/image/catégorieId.

> GET:ingrédient/{id}
>* Description : récupère un ingrédient via son id.
>* join : catégorie

> POST:ingrédient
>* Description : ajouter un ingrédient
>* body:id/nom/image/catégorieId en json

> DELETE:ingrédient/{id}
>* Description : retirer un ingrédient

> PUT:ingrédient
>* Description : ajouter un ingrédient
>* body:id/nom/image/catégorieId en json

## Routes pour Catégorie

> GET:catégorie/all
>* Description : récupère la liste de tous les catégorie avec leur id/nom

> GET:catégorie/{id}
>* Description : récupère un catégorie via son id.

> POST:catégorie
>* Description : ajouter un catégorie
>* body:id/nom en json

> DELETE:catégorie/{id}
>* Description : retirer un catégorie
>* ATTENTION : on peut pas delete une catégorie qui a un ingrédient lié

> PUT:catégorie
>* Description : ajouter un catégorie
>* body:id/nom en json

## Routes pour Tag 

> GET:tag/all
>* Description : récupère la liste de tous les tag avec leur id/nom/color

> GET:tag/{id}
>* Description : récupère un tag via son id.

> POST:tag
>* Description : ajouter un tag
>* body:id/nom/color en json

> DELETE:tag/{id}
>* Description : retirer un tag
>* ATTENTION : on peut pas delete une catégorie qui a un ingrédient lié

> PUT:tag/{id}
>* Description : ajouter un tag
>* body:id/nom/color en json

_____



* Vue 1 : Liste des coktails
    * Cliquer sur un cocktail : redirige vers ce cocktail (Vue2)
    * Bouton : Ajouter cocktail (Vue3)

* Vue 2 : Affichage d'un cocktail
    * Bouton : modifier cocktail (redirige vers Vue3)
    * Bouton : Retourner à la Vue 1

* Vue 3 : Ajout/modif cocktail
    * Bouton : Ajouter un ingrédient au cocktail
    * Bouton : Retirer un ingrédient au cocktail
    * Bouton : Modifier les informations du cocktail
    * Bouton : Retourner à la Vue 2


On ouvre l'app sur la liste des cocktails (ou des cocktails random)
en bas, un menu de navigation  