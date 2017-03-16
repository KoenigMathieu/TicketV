TicketV
=======

Pour lancer le projet dans le terminal :

composer install

Dans app/parameters.yml, définir la base de donnée 
 
Initialise la base de donnée :
php bin/console doctrine:schema:update --force

lancer le server :
bin/console server:run

