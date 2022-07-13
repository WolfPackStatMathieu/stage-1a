# Tuto : J'apprends à connecter ma base Postgresql à mon Dbeaver ! 

![castors juniors](./img/castors%20juniors.jpg)

Dans ce tuto, j'apprends à travailler sur une base Postgresql à partir du logiciel DBeaver, au sein de la plateforme [Onyxia](https://datalab.sspcloud.fr). (pour une présentation d'Onyxia et la façon de s'y connecter, voir [ici](https://www.example.com))

## **DBeaver** : Qu'est-ce que c'est ?
![Dbeaver logo](./img/castor%20Dbeaver.png)
Les plus anglophones d'entre nous auront peut-être été [surpris](https://github.com/dbeaver/dbeaver/discussions/11422#discussioncomment-743232) par le nom de ce logiciel. :wink: 



**DBeaver** est un logiciel permettant de **gérer plusieurs bases de données différentes** sur une seule et même application, et donc de **manipuler des données de différentes sources très rapidement**. Par exemple, dans le cadre de l'Ensai, autant de bases de données que de TP de SQL, ou dans le cadre de l'Insee une base pour le développement, une base pour la production (! attention fragile !) et une base "bac à sable".

Et pour **Postgresql** : [ici](https://wiki.postgresql.org/wiki/Logo), on apprend l'origine du logo de Postgresql (mais surtout le nom de l'éléphant! :heart_eyes:) 

## Je crée d'abord ma base Postgresql (passer à l'étape suivante si déjà connu)

On lance donc d'abord un service **Postgresql**.  (Rappel: on utilise  [Onyxia](https://datalab.sspcloud.fr))

![Postgresql logo](./img/Capture_Postgresql_logo.PNG)

![Datalab Postgresql](./img/Capture_Datalab_Postgresql_fleche.PNG)

On arrive sur la page de création d'un service Postgresql: 

![Datalab Postgresql lancement](./img/Capture_Postgresql_lancement_fleche.PNG)


![Datalab Postgresql creation](./img/Capture_Postgresql_creation_fleche.PNG)



![Datalab Services en cours](./img/Capture_Datalab-Services_en_cours_fleche.PNG)





Pour utiliser ma base Postgres, je veux utiliser **DBeaver**. Ce logiciel est préinstallé sur le service Ubuntu. Vous l'aurez donc deviné, je vais lancer un service **Ubuntu**

## Je lance ensuite mon service Ubuntu

[**Ubuntu**](https://en.wikipedia.org/wiki/Ubuntu_philosophy), c'est d'abord une philosophie, c'est le monde du libre (:penguin:) et ça veut dire "humanité". On le traduit parfois par "Je suis parce que tu es" et cela représente une philosophie humaniste, qui cherche à relier "soi, les autres, le monde". En plus, c'est juste indispensable de s'y mettre car tous les serveurs fonctionnent aujourd'hui avec un noyau linux. :smiling_imp: C'est donc l'occasion de s'y mettre à tout petit pas.

### J'ouvre un service Ubuntu
![Ubuntu lancement](./img/Capture_Ubuntu_lancement_fleche.PNG)

![Ubuntu config](./img/Capture_Ubuntu_config_fleche.PNG)

![Ubuntu mdp](./img/Capture_Ubuntu_mdp_fleche.PNG)

![Ubuntu ouverture](./img/Capture_Ubuntu_ouverture_fleche.PNG)

![Ubuntu service mdp](./img/Ubuntu_service_mdp_fleche.PNG)

J'obtiens un Ubuntu ! Victoire ! :balloon: :penguin: :balloon:

![Ubuntu accueil](./img/Ubuntu_accueil.PNG)


## Et finalement je lance et connecte DBeaver à ma base Postgresql

### On va ouvrir un terminal, parce que quand j'utilise les lignes de commande je me sens l'âme d'un hacker (et surtout je n'ai pas besoin de bouger la main)

![Ubuntu lancement terminal](./img/Ubuntu_terminal_lancement_fleche.PNG)

Dans mon terminal, je lance la commande de DBeaver :
```
dbeaver
``` 
![Ubuntu terminal](./img/Ubuntu_terminal_fleche.PNG)

![Ubuntu update](./img/Ubuntu_update_fleche.PNG)

![Ubuntu_sample_database](./img/Ubuntu_sample_database_fleche.PNG)
### On va pouvoir relier DBeaver à notre base postgresql

![Ubuntu_choix_database](./img/Ubuntu_choix_DB_fleche.PNG)

![Ubuntu driver](./img/Ubuntu_download_fleche.PNG)

### Youpi ! J'ai de quoi me connecter. Mais comment ça marche ?

![Ubuntu dbeaver setting](./img/Ubuntu_connection_settings_fleche.PNG)


## Maintenant c'est un jeu de "quoi va où" 

### On récupère les informations nécessaires sur la page "**Mes services**" du Datalab
![Datalab mes-services](./img/Datalab_mes_services_fleche.PNG)

### On a besoin de 5 informations

- le **port** :Postgresql écoute par défaut le port **5432**. C'est celui qui est configuré par défaut au lancement du service Postgresql.
- **host** : c'est l'hôte, qui est renseigné avant le port dans le readme du service postgresql. Il est de la forme postgresql-xxxxxxxx
- le **username** : idem, de la forme user-mon_nom_sur_onyxia
-  **database** : le nom de la base, defaultdb par défaut
- le **password** : celui de l'utilisateur et de l'administrateur sont les mêmes au lancement du service postgresql.

Une petite image pour visualiser :
![Postgresql info](./img/Postgresql_readme_fleche.PNG)

### Pour copier-coller le mots de passe et le nom de l'host, il vaut mieux utiliser le presse-papier entre ma fenêtre Datalab et celle du Ubuntu.
![presse-papier](./img/presse-papier%C3%A8_flechePNG.png)

### Je copie-colle chaque information que je ne veux pas reprendre à la main dans le presse-papier : le nom de l'host et le mot de passe par exemple.


![presse-papier mdp](./img/presse-papier_mdp_fleche.PNG)

Ce qui donne :

![Dbeaver connection](./img/Dbeaver_connection_fin_fleche.PNG)

### Je clique sur **Finish** en bas à droite et je peux utiliser ma base

![Dbeaver test base](./img/Dbeaver_operationnel_fleche.PNG)

### Et quand j'ai fini de travailler :

![Datalab arret](./img/Datalab_arret_service_fleche.PNG)


# :blush: