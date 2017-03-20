TicketV
=======

Pour lancer le projet dans le terminal :

composer install

Dans app/parameters.yml, définir la base de donnée 
 
Initialise la base de donnée :
bin/console doctrine:schema:update --force

lancer le server :
bin/console server:run

:-)

---------------


Commande git :

Commiter :
git add .
git commit -m "remarque commit"
git push

recuperer :
git pull

creation d'une branch : 
git branch nom_nouvelle_branch