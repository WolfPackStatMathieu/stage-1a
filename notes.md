videos:
https://levitt.fr/docker.mp4 https://levitt.fr/kub.mp4

l'approche la plus standard possible, interopérable. Former à l'informatique, pas l'informatique Insee.
=> insister sur les protocoles et standards sous-jacents. Zoomer sur les choses qu'on peut retrouver ailleurs.
Donc on peut retrouver les formations ailleurs sur le net. 


Approche théorique:
architectures qui se sont complexifiées. Il faut comprendre d'où ça vient.
Machines avec des trucs sur lesquelles on veut faire tourner des charges de travail, des processus.
python, java, postgre...
on a des machines avec processeurs, ram, et on a installé un OS pour faire tourner
les applications des gens. 

Mais problèmes de compatibilité, de sécurité. Montées de version, partage de ressources et sécurité.
Ça c’est y a 40 ans. 
Puis, une révolution il y a 20 ans. On peut faire des machines virtuelles : une grosse machine qu’on découpe en sous-machines. Avec à chaque fois un OS


Plus de pb de sécurité car OS isolés, de ressources (les ressources sont réservées). => Densification du système d’information, meilleure rentabilité. Avant c’est dur de faire cohabiter les process. Là on fait tenir plus de choses au même endroit.


Poussons le concept jusqu’au bout : micro/macro.
Micro : j’ai une machine, comment sur cette machine je m’arrange. Là on coupe la machine en plusieurs. Moteurs de machines virtuelles (ce qu’on veut, par exemple virtualbox dans le grand public, QMU ou autre…). Mais on veut faire ça à l’échelle d’un système d’information, à l’échelle de l’Insee, une centaine de machines, avec 1000 applications. On reproduit








Sauf que… il faut une technique d’orchestration. Avec le concept d’orchestrateur de machine virtuelle, capable dynamiquement d’allouer ou supprimer des machines virtuelles sur des machines. C’est un cerveau central qui fait ça : donne ressources avec tel OS. Capable de sauver les VM, de les déplacer. 
Au niveau micro : utiliser VirtualBox, QMU
Au niveau macro : libre et gratuit OpenStack,  + l’idée du Cloud : du libre service où on paye à la consommation. OVH, Azure, AWS, OpenCLoud qui mettent à disposition des offres de service. 

Exemple d’OVH.
Interface graphique = API en dessous
OpenStack = un système d’orchestration de machines virtuelles.
Un concurrent : Vsphere. Comme OpenStack mais payant. A l’insee on file la thune à Vmware, qui reprennent les concepts standards et les vendent. 

Actuellement, à l’Insee, tout ce qui tourne tourne sur du Vsphere. Si demain on demande une base de données au CEI à Metz, ils prennent 3 semaines pour envoyer une requete à l’API Vsphere. On maintient donc un certain nombre de machines virtuelles, qui tournent avec Debian. On n’est pas les seuls à en être là. Les plus malignes sont sur OpenStack, celles qui aiment payer sont sur Vsphere. 

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

Résumé des modèles :
poste de travail : limitation puissance, reproductibilité, passage en prod + bonus des versions utilisées à l’Insee
serveurs partagés (approche centralisée): linux avec ssh, ou windows avec rdp. Limitations : mauvvaise cohabitation logiciel (même version de python) et mauvaise cohabitation ressources. (on bouffe les ressources du voisin). 

Plus moderne : faire travailler dans une bulle : isolation au niveau du processus. Isolation des ressources (chaque bulle va consommer ce dont elle a besoin sans empiétrer sur les uatres). + reproductibilité. Tourne dans différents contexte. Que ce soit des processus (batch) ou bien un jupyter notebook. 

Pourquoi Onyxia ? Car pas convaincu par l’approche poste de travail et approche centralisée. On a vu la contenairisation et on s’est dit ok. 
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


Forte séparation entre :
Env de traitement
code
configuration
données
car cycle de vie différents. Chacune des 4 choses doit être séparée. Il y aura des façons de s’en occuper différentes. Docker est une solution essentiellement au point environnement de traitement. Le code sera stocké sur git, car historisation, outils de connection, c’est du texte brut. La spécification c’est Git. Après que ce soit gitlab ou gitinsee.
Les données : actuellement on sait pas trop. On va bouffer du stockage objet avec le standard S3. C’est un standard de stockage objet. Stockage et partage de fichiers sous forme objet.  
Pour la configuration, elle va dépendre d’un environnement à un autre. Le code doit être prêt à s’adapter et c’est au moment où on l’exécute qu’on va lui apporter la configuration dont il a besoin. (surcharge de configuration cf. exemple password de postgre = toto). 


Poste de travail insee : pas de docker. 
Sur pc perso, on peut utiliser docker. 
Le moteur de contenairisation a beosin de crééer des processus isolé, donc a besoin de mentir sur tout, donc a besoin de tous les pouvoirs sur la machine. Donc pas de docker sur la machine insee. 
Il y a les environnements grands publics : https://labs.play-with-docker.com/

https://lab.dev.insee.io/ 

objectif :
comprendre la containerisation à un niveau micro. Puis aun iveau macro : comment orchestrer plein de containers. 

Voir la vidéo. 



