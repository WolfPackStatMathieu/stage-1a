# Tuto : J'apprends à réviser mon TP de Base de Données à la maison :sweat_smile:

Aujourd'hui, c'était TP de SQL. J'ai fait des super requêtes, mais maintenant, je voudrais bien réviser un peu depuis chez moi. Voyons voyons... Comment c'était déjà ? 
D'abord, aller sur l'**E**space **N**umérique de **T**ravail de l'école. Mince, j'ai oublié le lien !


Repartons du site de l'Ensai: https://ensai.fr/ . Il suffit de cliquer sur **ENT**, en haut à droite de la page d'accueil. 

![A test image](./img/Capture%20site%20ensai%20fl%C3%A8che.png)

J'arrive sur l'ENT :

![A test image](./img/Capture_ENT_accueil_fleche.PNG)

Puis sur le service d'authentification. J'y rentre mon identifiant et mon mot de passe (:zipper_mouth_face:). 

![ENT connexion](./img/Capture_ENT_connexion_fleche.png)

Et j'arrive sur la page d'accueil de mon espace personnel. 

![ENT accueil perso](./img/Capture_ENT_accueil_user_fleche.PNG)

Normalement, je devrais pouvoir retrouver de quoi travailler mon TP bientôt... 

![ENT Mes Applications](./img/Capture_Mes_Applications_fleche.PNG)

Malheur ! L'application est disponible uniquement en se connectant depuis l'Ensai. Faudra-t-il que je révise mes TP à l'école ?  Mais moi j'aime l'odeur du SQL au petit matin, le son de Postgres le soir du fond de mon lit. Et puis, j'ai vraiment besoin de valider l'UE. :sob:

# Heureusement, le Datalab est là ! :partying_face:

Disposant d'un compte Ensai/Ensae, je peux utiliser le Datalab fourni par la division Innovation de l'Insee :

![logo Insee](./img/INSEE_1.2_SIGNATURE.png)

==> https://datalab.sspcloud.fr/home, 
et ceci que je sois en cursus ingénieur ou fonctionnaire ! 

Bref, j'arrive ici :
![Onyxia accueil](./img/Capture_Onyxia_accueil_fleche.PNG)
**Onyxia - SSP Cloud Datalab** : Qu'est-ce que c'est que ce truc ? On va expliquer tout ça mot par mot.
D'abord, pourquoi **Onyxia** ? Selon Frédéric, le concepteur initial de la plateforme :
>*A la base, ça vient du nom de World of Warcraft, c'est une créature qui a la forme d'un dragon et qui est la mère de tous les dragons. Nous, on jouait à Battleground, et dedans, quand tu joues cette carte, elle remplit ton board de plein de petits dragons qui arrivent avec elle. L'idée d'Onyxia, c'est quand un administrateur choisit de mettre Onyxia dans son système d'information, tous ses utilisateurs vont pouvoir utiliser plein de petits services pour faire de la data science. Là ils vont utiliser leur premier petit dragon de l'Insee.* 
>

![Onyxia mere des dragons](./img/Onyxia_mere_des_dragons.png)


Ok, et pourquoi **SSP Cloud Datalab** ?
- **S**ystème **S**tatistique **P**ublique
- Cloud Datalab : parce que c'est un endroit, un laboratoire où on manipule des données dans le cloud (dont les serveurs sont situés dans les locaux de l'Insee)

Voilà, maintenant que c'est plus clair, il suffit de cliquer sur **Connexion**, puis de créer un compte si c'est la première fois (avec une adresse mail d'un nom de domaine autorisé, comme ensai par exemple).

![Datalab connexion](./img/Capture_Datalab_connexion_fleche.PNG)

Une fois connecté, apparaît la page d'accueil de l'utilisateur.

![Datalab page d'accueil utilisateur](./img/Capture_Datala_home_fleche.PNG)

C'est dans le **Catalogue de services** qu'on trouvera de quoi faire le TP de SQL facilement. Il faut trouver Postgresql puis Pgadmin et les lancer dans cet ordre pour avoir la configuration automatique. On verra une deuxième façon de faire en configurant manuellement.

On lance donc d'abord un service **Postgresql**. 

![Postgresql logo](./img/Capture_Postgresql_logo.PNG)

![Datalab Postgresql](./img/Capture_Datalab_Postgresql_fleche.PNG)

On arrive sur la page de création d'un service Postgresql: 

![Datalab Postgresql lancement](./img/Capture_Postgresql_lancement_fleche.PNG)


![Datalab Postgresql creation](./img/Capture_Postgresql_creation_fleche.PNG)



![Datalab Services en cours](./img/Capture_Datalab-Services_en_cours_fleche.PNG)





Pour utiliser ma base Postgres, je ne vais pas utiliser un terminal et des lignes de commande, mais une interface graphique un peu plus conviviale :

![Pgadmin](./img/Pgadmin.PNG). Je lance donc un service **Pgadmin** en cliquant sur **Catalogue de services**.

**Indice :** Passés les services les plus courants, les autres sont rangés par ordre alphabétique.

![Datalab Catalog](./img/Capture_Datala_catalog_fleche.PNG)


![Datalab Pgadmin](./img/Capture._Datalab_Catalog_Pgadmin_fleche.PNG)


![Datalab Pgadmin configuation](./img/Capture_Datalab_Pgadmin_config_fleche.PNG)

Bon, j'aime bien apprendre des petites choses. Et le pourquoi d'une configuration automatique vient de l'option **Enable postgres discovery**. Les deux services ont été préconfigurés pour se parler ensemble au sein du Datalab.

![Datalab Pgadmin config Discovery](./img/Capture_Pgadmin_config_fleche.PNG)

![Datalab Pgadmin lancement](./img/Capture_Pgadmin_lancement_fleche.PNG)

![Datalab Pgadmin ouverture](./img/Capture_Pgadmin_ouverture_fleche.PNG)


Je tombe sur la page de connexion à Pgadmin:
Si j'ai oublié mes informations de connexion, je peux consulter le **README** du service correspondant.

![Pgadmin connexion](./img/Pgadmin_connexion_fleche.PNG)

Pgadmin s'ouvre, et m'offre ainsi une interface graphique pour me connecter à ma base Postgresql.

![Pgadmin autodiscovery](./img/Pgadmin_autodiscovery_fleche.PNG)

Pour pouvoir se connecter à la base Postgresql, Pgadmin a besoin de l'identifiant et du mot de passe fournis lors de la création de la base Postgresql.

![Pgadmin identification](./img/Pgadmin_identification_fleche.PNG)

=> Le mot de passe de la base SQL est dans le **README** de la base Postgresql créée (c'est d'ailleurs le même qui est utilisé pour Pgadmin)

![Pgadmin base](./img/Pgadmin_base_fleche.PNG)

![Pgadmin requetes](./img/Pgadmin_requete_fleche.PNG)


![Pgadmin_scrip](./img/Pgadmin_script_fleche.PNG)

![Pgadmin tables](./img/Pgadmin_tables_fleche.PNG)


Voilà, maintenant je peux travailler dans une belle base Postgresql toute neuve !
Cependant, si je veux conserver mes requêtes, je dois les copier-coller dans un fichier sur mon espace de travail. Pourquoi ? Parce que la base Postgresql et Pgadmin ont été créés sur un cluster de service (Onyxia), et qu'il faudrait faire une autre manipulation. Mais cela est une autre histoire.