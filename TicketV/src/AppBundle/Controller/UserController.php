<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use AppBundle\Entity\User;
use AppBundle\Form\UserType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class UserController extends Controller
{
    /**
     * @Route("/login", name="login")
     * @Method({"GET","POST"})
     */
    public function loginAction(Request $request)
    {
      $authenticationUtils = $this->get('security.authentication_utils');

      // get the login error if there is one
      $error = $authenticationUtils->getLastAuthenticationError();

      // last username entered by the user
      $lastUsername = $authenticationUtils->getLastUsername();

      return $this->render('user/login.html.twig', array(
          'last_username' => $lastUsername,
          'error'         => $error,
      ));

    }

    /**
     * @Route("/signup", name="signup")
     * @Method({ "GET", "POST" })
     */
    public function signupAction(Request $request)
    {
        $user = new User();
        $user->setIsAdmin(false);
        $user->setRegisteredAt(new \DateTime());

        $form = $this->createForm(UserType::class,$user);
        $form->add( "register",SubmitType::class);

        $form->handleRequest($request);

        if($form->isValid()){

          $password = $this
                        ->get('security.password_encoder')
                        ->encodePassword($user,$user->getPlainPassword());

          $user->setPassword($password);
          $user->eraseCredentials();
          $em = $this->get('doctrine.orm.entity_manager');
          $em->persist($user);
          $em->flush();
        //  $user->
          // dump($user);

           //dump($em);
           //die();
          return $this->redirectToRoute('game_play');
        }


        return $this->render('ticket/show.html.twig',['form' => $form->createView()]);
    }

    /**
     * @Route("/logout", name="logout")
     * @Method("GET")
     */
    public function logoutAction()
    {

    }

    /**
     * @Route("/login-check", name="login_check")
     * @Method("POST")
     */
    public function loginCheckAction(Request $request)
    {
        return $this->redirectToRoute('ticket_index');
    }

    public function lastPlayersAction()
    {
        usleep(80000);

        $this->get('debug.stopwatch')->start('lent');
        for ($i = 0; $i<20000; $i++) {
            $users = [
                [ 'username' => 'saro0h' ],
                [ 'username' => 'stof' ],
                [ 'username' => 'nicolasgrekas' ],
                [ 'username' => 'hhamon' ],
                [ 'username' => 'fabpot' ],
            ];
        }
        $this->get('debug.stopwatch')->stop('lent');

        usleep(30000);

        return $this->render('user/players.html.twig', [
            'users' => $users,
        ]);
    }

}
