# Tuto : J'apprends à utiliser Vscode sur le Datalab en sauvegardant mon code sur Github
**OBJECTIF** Obtenir un environnement de développement standard (Vscode + python) pour les TP d'algorithmique, de programmation orientée objet et de projet informatique en 1A. 

## Je lance un service Vscode

### Je me rends sur le Datalab => https://datalab.sspcloud.fr/home et j'arrive sur cette page :
![Datalab_accueil](./img/Datalab_accueil.PNG)

Je sélectionne "Catalogue de services" et je cherche Vscode :

![Datalab catalogue](./img/Datalab_catalogue_fleche.PNG)

### Je lance un VsCode
![Datalab Vscode](./img/Datalab_Vscode_fleche.PNG)


![Vscode mdp](./img/Vscode_lancement_fleche.PNG)


![Vscode ouverture](./img/Vscode_ouverture_fleche.PNG)

![Vscode token](./img/Vscode_welcome_fleche.PNG)

Et voilà le travail  ! Un beau Vscode tout neuf (avec python). 

![Vscode accueil](./img/Vscode_acceuil.PNG)

Mais, Onyxia fonctionne avec la technologie des conteneurs, ce qui pour nous signifie qu'on ne peut pas enregistrer de données dans notre Vscode. Nous allons donc faire comme font tous les informaticiens : **découpler le code des données**. Et pour cela, nous allons utiliser **GitHub**. 

## Je clone mon projet github sur mon Vscode

### Je me rends sur mon compte Github

=> https://github.com/
![GitHub](./img/GitHub_fleche.PNG)

### Je crée un nouveau repository 

![GitHub new repository](./img/GitHub_accueil_fleche.PNG)
![itHub new repository 2](./img/GitHub_repositories_fleche.PNG)

Je donne un nom à mon dépôt, par exemple "depot_de_toto"
![GitHub repo](./img/GitHub_creation_repo_fleche.PNG)

Pour le moment, je ne modifie pas les options, et je déroule la page pour cliquer sur "create repository".

![GitHub repo fin](./img/GitHub_create_repo_fin_fleche.PNG)

Voilà, j'ai un beau repository tout neuf sur mon compte GitHub. Mais moi, je veux pouvoir travailler dessus à partir de Vscode.

Pour pouvoir faire ça, je vais cloner ce dépôt sur mon poste local, puis je synchroniserai les modifications du code entre mon poste local et mon dépôt GitHub.



## Je clone mon projet sur Vscode avec un token personnel 

![GitHub clone1](./img/GitHub_toto_fleche.PNG)

### Je génère un token (="jeton mot de passe") qui me permettra d'accéder à mon compte GitHub depuis un terminal :

![GitHub settings1](./img/GitHub_settings_fleche.PNG)

![GitHub settings1](./img/GitHub_settings2_fleche.PNG)


![Developper settings](./img/Developper_settings_fleche.PNG)


![Developper settings](./img/Developper_settings2_fleche.PNG)


![token](./img/Token_fleche.PNG)


![token settings](./img/Token_settings_fleche.png)


![generate token](./img/Generate_token_fleche.PNG)




Je vais dans Vscode, et j'ouvre un terminal.



# Je relance un Vscode, mais avec ma configuration git personnelle



# Je m'entraîne à manipuler Git avec un super tuto déjà existant

[une présentation Git](https://hackmd.io/AOSXJAJiR4q7GKdbiKcKsw)
et le [tuto](https://hackmd.io/BdGZF6qOTk2qvzAlvrz_WA) qui va avec. Pour ces tutos, il faudra créer un compte sur Gitlab $\neq$ Github. Mais les deux permettent d'utiliser Git. Il faudra donc modifier vos paramètres d'utilisateurs.