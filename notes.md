
# Pourquoi Docker ? 
l'approche la plus standard possible, interopérable. Former à l'informatique, pas l'informatique Insee.
=> insister sur les protocoles et standards sous-jacents. Zoomer sur les choses qu'on peut retrouver ailleurs.
Donc on peut retrouver les formations ailleurs sur le net. 

## A l'origine 
Approche théorique:
architectures qui se sont complexifiées. Il faut comprendre d'où ça vient.
Machines avec des trucs sur lesquelles on veut faire tourner des charges de travail, des processus.
python, java, postgre...
on a des machines avec processeurs, ram, et on a installé un OS pour faire tourner
les applications des gens. 

Mais problèmes de compatibilité, de sécurité. Montées de version, partage de ressources et sécurité.
Ça c’est y a 40 ans. 

## Une première révolution 
Puis, une révolution il y a 20 ans. On peut faire des machines virtuelles : une grosse machine qu’on découpe en sous-machines. Avec à chaque fois un OS


Plus de pb de sécurité car OS isolés, de ressources (les ressources sont réservées). => Densification du système d’information, meilleure rentabilité. Avant c’est dur de faire cohabiter les process. Là on fait tenir plus de choses au même endroit.


Poussons le concept jusqu’au bout : micro/macro.
Micro : j’ai une machine, comment sur cette machine je m’arrange. Là on coupe la machine en plusieurs. Moteurs de machines virtuelles (ce qu’on veut, par exemple virtualbox dans le grand public, QMU ou autre…). Mais on veut faire ça à l’échelle d’un système d’information, à l’échelle de l’Insee, une centaine de machines, avec 1000 applications. On reproduit


## Le début des problèmes

Sauf que… il faut une technique d’orchestration. Avec le concept d’orchestrateur de machine virtuelle, capable dynamiquement d’allouer ou supprimer des machines virtuelles sur des machines. C’est un cerveau central qui fait ça : donne ressources avec tel OS. Capable de sauver les VM, de les déplacer. 
Au niveau micro : utiliser VirtualBox, QMU
Au niveau macro : libre et gratuit OpenStack,  + l’idée du Cloud : du libre service où on paye à la consommation. OVH, Azure, AWS, OpenCLoud qui mettent à disposition des offres de service. 

Exemple d’OVH.
Interface graphique = API en dessous
OpenStack = un système d’orchestration de machines virtuelles.
Un concurrent : Vsphere. Comme OpenStack mais payant. A l’insee on file la thune à Vmware, qui reprennent les concepts standards et les vendent. 

Actuellement, à l’Insee, tout ce qui tourne tourne sur du Vsphere. Si demain on demande une base de données au CEI à Metz, ils prennent 3 semaines pour envoyer une requete à l’API Vsphere. On maintient donc un certain nombre de machines virtuelles, qui tournent avec Debian. On n’est pas les seuls à en être là. Les plus malignes sont sur OpenStack, celles qui aiment payer sont sur Vsphere. 

## Une deuxième révolution : la containerisation
Pourquoi on a arrêté de faire ça ? 
Une nouvelle révolution ?
Chaque chose est isolé, vit sa vie et je suis tranquille. A un instant t, dans le SI, il y a des milliers de VM qui tournent (10 000 à l’Insee). Même le dimanche matin, y compris pour un truc qui reçoit 0 trafic. Du coup, chaque VM est autonome et a besoin de ce qu’il faut pour l’être. Coûte de l’énergie, du CPU, de la mémoire et de la maintenance. Chaque applicatif demande à être monté e nversion.
+ le coût marginal d’une machine virtuelle n’est pas si faible que ça. (30 secondes à 1 minutes + l’entretien de l’OS).

On ne jette pas tout. On n’aime pas le combo : 1 VM par applicatif. Les applicatifs sont assez petits pour être regroupés. On garde le système de VM à la demande et d’orchestrateur. Et au sein d’une VM, on va regrouper les applicatifs. Mais comment ? Pas comme au tout début. 
Du coup est arrivé il ya 10 ans la contenairisation. Au lieu de l’isolation au niveau de l’OS, on la fait au niveau du processus. On isole les processus. Postgre11 tourne dans son bac à sable et postgre12 a aussi le sien. C’est comme pour les bateaux. Si il y en a un qui pourrit ça pourrit tout.

Puis Un bateau par transport. Pratique, mais beaucoup trop de bateau. Un bateau avec trois bananes c’est pas top.

Là, on va mettre des containers, et on ne se pose pas la question de ce qu’on met dedans.
Pour nous, sur une même machine, on fait cohabiter les processus.

L’approche poste de travail : on fournit le PC et les gens se démer… En entreprise, ils fournissent un windows et le verrouillent. Approche dans beaucoup d’organisations. On ne peut rien installer et internet est bien verrouillé. Bcp de freins pour travailler sur les techno qu’on veut. 
Version : poste de travail non verrouillé. Pour certains usages, on a filé des pc de datascience. Mais même ça : on installe ce qu’on veut mais limité par les capacités du poste de travail personnel. Limitation de puissance ET limitation de mise en prod.  On veut un environnement reproductible. Le code produit sur un poste spécifique est non reproductible : package, versions, chemins en dur.

Du coup, on s’est mis à donner accès à des serveurs. Sauf que : il faut un moyen de mettre à disposition des serveurs et structurer l’accès. Bcp d’organisations où la solution est d’installer des serveurs avec du linux. Puis accès SSH, (pleins pouvoir sur le serveur) mais problèmes de ce matin : on a juste l’isolation du système d’exploitation. (si l’un installe une version de python, ce sera pour tout le monde). 
Moins de problème de performance mais plus de problèmes d’isolation/cohabitation.

Parallèlement, il y a l’approche de l’INSEE : AUS. Même chose mais avec des machines Windows servers. (payant). Pas SSH mais RDP. L’isolation et la cohabitation est pas bonne. On bouffe la ram des autres, la version de python est la même pour tous. 

## Résumé des modèles :
poste de travail : limitation puissance, reproductibilité, passage en prod + bonus des versions utilisées à l’Insee
serveurs partagés (approche centralisée): linux avec ssh, ou windows avec rdp. Limitations : mauvvaise cohabitation logiciel (même version de python) et mauvaise cohabitation ressources. (on bouffe les ressources du voisin). 

Plus moderne : faire travailler dans une bulle : isolation au niveau du processus. Isolation des ressources (chaque bulle va consommer ce dont elle a besoin sans empiétrer sur les uatres). + reproductibilité. Tourne dans différents contexte. Que ce soit des processus (batch) ou bien un jupyter notebook. 

## Pourquoi Onyxia ? 
Car pas convaincu par l’approche poste de travail et approche centralisée. On a vu la contenairisation et on s’est dit ok. 
Les technos : contenairisation et orchestration de container. 
Création d’Onyxia : interface graphique pour que les utilisateurs puissent lancer facilement des bulles.




10000 machines virtuelles : très cher. Un OS entier pour chaque processus, et la machine vit longtemps et s’encrasse. 
On reprend tout. On met une machine, un OS (linux, debian par défaut) et une couche container engine. Moteur de conteneurisation. = Docker. 
L’idée de Docker : au lieu d’isoler des systèmes (=virtualisation) entiers, il isole des processus (= un logiciel qui tourne). Chaque processus vit sa vie dans un bac à sable (sandbox : espace isolé créé spécifiquement pour ce processus. = le container dans un bateau). 
Containerisation = création de bac à sable isolant des processus. Ensemble de techno qui permettent de créer des bacs à sable isolé. Virtualisations des système de fichier, réseaux, numéro de processsus, nom d’utilisateur. Techno très profondes dans le noyau linux (Windows s’y est mis à force). Parmi toutes ces technos il y a de quoi isoler le système de fichiers (chaque processus voit ses fichiers et pas ceux des autres), le réseau (si un postgre écoute sur le port 5432, l’autre peut aussi écouter sur 5432) et c’est pareil pour tous les aspects d’un OS. Le mâitre de tout ça c’est le container engine, qui passe son temps à mentir à tout le monde. 

Image : point de départ d’un container. On crée une image que les gens peuvent réutiliser n fois.
container : le processus qui vit sa vie. Processus isolé du monde
Chaque container est isolé. Quand il écoute sur un port, c’est sur son propre port. Il faut faire une redirection de port. Au fait, le port 8080 du système hote, je veux le connecter au port 8080 du container. 

L’image c’est le package, le container c’est l’instance. Il faut charger l’image. 

Lancer un processus isolé c’est le niveau micro. On va voir le niveau macro. 
Lancer des bulles isolées et tout contenairiser amène à repenser la façon de travailler. Beaucoup de legacy, et force à changer de méthode de travail. Le but du container, comme tout est léger et reproductible, on relance l’environnement de travail tous les matins. L’environnement de développement et d’exécution, on ne va avoir que des environnements éphémères. Devops. Toute la  datascience moderne est basée sur ces technologies de processus isolés. 

# Les 4 séparations fondamentales
Forte séparation entre :
- Env de traitement
- code
- configuration
- données

car cycle de vie différents. 

Chacune des 4 choses doit être séparée. Il y aura des façons de s’en occuper différentes. Docker est une solution essentiellement au point environnement de traitement. Le code sera stocké sur git, car historisation, outils de connection, c’est du texte brut. La spécification c’est Git. Après que ce soit gitlab ou gitinsee.
Les données : actuellement on sait pas trop. On va bouffer du stockage objet avec le standard S3. C’est un standard de stockage objet. Stockage et partage de fichiers sous forme objet.  
Pour la configuration, elle va dépendre d’un environnement à un autre. Le code doit être prêt à s’adapter et c’est au moment où on l’exécute qu’on va lui apporter la configuration dont il a besoin. (surcharge de configuration cf. exemple password de postgre = toto). 


Poste de travail insee : pas de docker. 
Sur pc perso, on peut utiliser docker. 
Le moteur de contenairisation a besoin de créer des processus isolés, donc a besoin de mentir sur tout, donc a besoin de tous les pouvoirs sur la machine. Donc pas de docker sur la machine insee. 
Il y a les environnements grands publics : 
- https://labs.play-with-docker.com/

- https://lab.dev.insee.io/ 

objectif :
comprendre la containerisation à un niveau micro. Puis à un iveau macro : comment orchestrer plein de containers. 

Voir la vidéo :
https://levitt.fr/docker.mp4 https://levitt.fr/kub.mp4

# J2
## lancement de supermario à partir d'une image
```console
docker pull pengbai/docker-supermario
docker run -d -p 8600:8080 pengbai/docker-supermario
```
Puis lancer dans le navigateur:
```console
localhost:8600
```


# J3
## Tuto PgAdmin et Postgresql pour les 1A
voir mail Rémi

## Explications Olivier
on s'en fout du multiconteneur. On va faire directement avec Kubernetes. On laisse tomber Docker compose car son équivalent c'est Kubernetes. On peut lancer individuellement des conteneurs, et puis les faire parler entre eux. Mais assez vite, on les orchestre en une seule ligne. Pour faire ça, les premières solutions c'était avec Docker compose où on décrit toute la stack. ON écrit docker compose, puis docker compose up.
Mais ça reste mono-machine. On a d'autres ambitions. 

on peut aussi créer ses propres images. Les enjeux: 
- la syntaxe du dockerfile
- la publication d'image. Notion de registre docker et de push d'image. 

=> quête secondaire : construire ma propre image et la publier. 

## L'orchestration
on fait une session l'après-midi, et on généralise: au lieu de faire tourner sur une machine, on fait tourner sur plusieurs. 
### le concept de volume

le conteneur a un système de fichier qui est lui ets propre. (à voir avec docker exec)
Le conteneur repartira toujours du même état. Mais il y a des moments où on a envie de sauvegarder des données.

On va identifier de façon explicite les donneés qu'on veut sauvegarder et on va sauvegarder ces données et uniquement ces données. 
ex: sur un jeu, j'installe le jeu, je sauvegarde. Je désinstalle mais je garde la svg. Si je réinstalle le jeu je peux repartir d'où j'étais. 
ça prouve bien que le cycle de vie du conteneur et de la donnée est différent.

En conteneur on va utiliser des points de montage c'est-à-dire des dossiers qui persistent. 
Chaque dossier de point de montage est associé à un dossier de ma machine. 

volume =  persistance + point de montage. 
Pour l'instant de type HOST, en docker y a que ça qui existe. Mais en généralisant on aura d'autres types de point de montage. 
on lit le point de montage intéressant pour les volumes dans la documentation de hub.docker.com

Quand y a pas de volume, y a pas de point de montage, donc tous les fichiers sont dans le virtuel, et ne seront pas persistées.


Individuellement, on est capable de lancer des conteneurs un par un. Comment on le fait pour n machines ? Et réussir à répartir dynamiquement. On veut: ne jamais être lié à une seule machine 
augmenter le nombre d'instances (scalabilité horizontale)

On va répartir les machines en 2 catégories : 
workers et master/control plane

les workers vont faire le taf : exécuter les charges de travail. En général, ce sont les machines les plus puissantes. 
Les masters/control : ils vont donner le boulot aux worker. Sur un cluster, on peut avoir autant de master physiquement que l'on veut pour être résilient en cas de panne, mais ils se comportent comme si ils étaient qu'un. 

Dans le master, on va avoir le composant le plus important : l'API server. Application Programming Interface. ou web service rest, on peut les appeler en http pour obtenir des informations. 
Cette APIserver sert, en discutant avec, à donner des ordres en lecture ou en écriture: exécute ce traitement python en 3 exemplaires, quels sont les processus qui tournent  ?
On peut la consommer librement, discuter avec en http (donc avec n'importe quel clien). La façon la plus classique c'est d'utiliser le client de référence kubectl. Outil en ligne de commande qui permet d'envoyer des ordres à l'APIserver.

chaque machine du cluster est un "node" ou un "noeud".
```
kubectl get nodes
```

# Quete secondaire : Comprendre HTTP.
l'idée d'http : protocole simple déconnecté en mode client-serveur. Le client envoie une requête à un serveur. Le serveur traite la requête et répond. 
une question/une réponse . FIN
requête qu'on peut suivre dans les outils de développement du navigateur. 

# quete secondaire : comprendre l'authentificatio net le système de jeton


Une api exposée e n http, en utilisant le client de référence kubectl, en connaissant l'adresse et le jeton d'authentification. C'est ce qu'on appelle le kubeconfig.
(on retrouve la notion de séparation entre environnement d'exécution et configuration)

préoccupation :pas le déploiement du cluster, mais comment j'interagis avec. 

les machines worker sont en interaction avec le master, grâce au kubelet. Les kubelet vont passer leur temps à reporter à l'API serveur du master. Ils font docker ps, prennent la sortie et l'envoie à l'API server. "voilà ce qui tourne chez moi". 
Les agents bossent et les chefs sont censés répartir le boulot, et font des points réguliers. (docker ps  et ```docker info```)

Il reste plus qu'à dire à l'API server (je veux faire tel truc) et l'API server fait pluf plouf ce sera toi qui le fera. 

architecture simplified kubernetes
chaque pod c'est l'équivalent d'un docker run. un pod il est sur 1 worker. 

théorie finie:
l'enjeu est maintenant dans le lien entre développeur et api server. Il faut avoir kubectl et le configurer pour interagir avec l'API server. 

# Reproduction chez soi
Comment accéder à l'API server ? Ca dépend du type de cluster qu'on fait. 

datalab > vscode
kubernetes : role=admin + enable
security : enlever ip protection

lancer : Onyxia a discuté avec l'API server et a dit déploie moi un vscode avec telle configuration. Ca a donné naissance à un conteneur quelque part. 
Puis on se connecte dessus via une interface web. 

kubectl get pods
on demande à l'api server : donne moi la liste des pods en train de tourner. Il répond une ligne par pod qui tourne actuellement dans mon espace à moi. (isolé des autres utilisateurs). 

kubectl pour kube control

On a accès à un morceau de cluster : kubectl déjà installé avec les droits suffisants pour travailler dans mon espace. => déblocage de tous les tutos internet sur kubernetes kubectl et kubernetes déjà installés. Avec un espace où on ne peut rien casser. Donc pas d'hésitation à tester des trucs. 

# Objectif : déployer une application accessible au monde entier sur internet. 

10 lignes de code.

1. choisir une image docker
nginx: server web qui écoute sur un port 
un serveur écoute un port. Il attend que des connexions arrivent sur un certain port. Nginx est un serveur, qui écoute sur le port 80, et attend qu'on lui envoie des requête http (serveur web) et il répond le fichier qui est demandé. = server web statique.

port 80 pour http
port 5432 pour postgres
d'autres conventions...

L'applicatif qu'on veut faire tourner : l'image docker d'nginx. 
on va demander au cluster de le faire pour nous.

écrire des fichiers de déploiements, les envoyer au cluster qui va les prendre en compte et agir en conséquence. 

On va utiliser le .yaml
(superset de json = même fonctionnalité, au lieu d'accolade on a des retour à la ligne et des tabulations)
```
kubectl apply -f pod.yaml
```

le pod peut mourir: on veut pas. Du coup on va faire des deployments qui vont créer des pods


scalabilité verticale : problème de rendements décroissants.
horizontale : meilleur rendement, mais il faut gérer la flotte 

historiquement : mécanismes d'affinité = on garde le plouf plouf mais ensuite on remet le client sur la même instance/machine, donc on stockait localement sur la machine. C'est nul. Ca casse le principe. 

On veut garder la scalabilité horizontale. D'où les interfaces REST. Si l'application est sans état STATE LESS, alors pas de problème de scalabilité. tout le monde répond la même chose. 
C'est pour ça qu'on arrête de tout mettre au même endroit. Processus applicatifs qui s'appuieront sur une base de données plus difficile à scaler. le goulot d'étranglement se fait sur la bdd. 
Le front end et l'api se font à l'infini, mais ils discutent toujours avec la bdd. 
Est-ce que je peux scaler la bdd ? oui mais juste en lecture, moins bien en écriture. 


3 cas d'utilisation :
- la résilience. tu pars du principe que tous tes pods peuvent mourir pour des raisons valables ou non, et sont donc éphémères.
- la gestion des performances/ Tu bosses pour le recensement et c'est le premier jour du recensement. ou amazon à Noel.
- les concepts de calcul distribué. Si on fait tourner un traitement python à un endroit, on sera limité par la machine. => Déploie toi en 50 exemplaires, sur 50 machines et recentralisez l'information.

Maintenant, on préfère avoir un truc qui fait popper plein de truc pendant pas longtemps plutôt qu'un gros truc très longtemps/ C'est le principe de Spark. C'est un framework de calcul distribué. 


Il manque encore l'exposition et les notions réseaux. 

faire des pods et des deployments.
spoiler: les trucs 
concept de service (exposition à l'intérieur du cluster) et de ingress (exposition à l'extérieur).

# Quête principale : déployer un nginx sur internet.

# J4 jeudi
## Questions
- Est-ce que deux applications dans un cluster peuvent communiquer entre elles (si elles ne sont pas dans un même container) ?
- Pourquoi les images sont-elles portables entre les différents OS ? 
- à quel niveau se situe Kubernetes ? au dessus de l'OS ? 
- qu'est-ce qu'il se passe quand on crée un volume ? Est-ce que c'est rattaché à un conteneur ? est-ce que ça a une existence propre ?
- comment tu t'assures que ton cluster ne pète pas ? 
- à quoi ça sert un namespace ? est-ce que sur le datalab, chaque utilisateur a le sien ? est-ce que c'est étanche ?
- est-ce qu'on peut être un service et autre chose à la fois ?
- qu'est-ce qui se passe quand on a un seul node mais qu'il est défaillant et qu'on dépasse le temps d'attente maximum ? Les pods sont ils éteints ?
test