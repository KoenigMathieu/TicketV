<?php

// src/AppBundle/Repository/UserRepository.php
namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;

class UserRepository extends EntityRepository implements  UserLoaderInterface
{
    public function loadUserByUsername($username)
    {

var_dump('UserRepository loadUserByUsername');

        $q = $this->createQueryBuilder('u')
            ->where('u.username = :username')
            ->setParameter('username', $username)
            ->getQuery()
            ->getOneOrNullResult();

        return $q;
    }
}
