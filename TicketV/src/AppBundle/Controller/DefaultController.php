<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {

        $em = $this->getDoctrine()->getManager();
        $id_current_user = $this->getUser()->getId();

        $query = $em->createQuery(
            'SELECT t FROM AppBundle:Ticket t, AppBundle:SuiviTicket st 
            WHERE t.idTicket = st.idTicket
            AND st.idUtilisateur = '.$id_current_user.'
            AND st.idSuiviTicket = (SELECT MAX(st2.idSuiviTicket) FROM AppBundle:SuiviTicket st2 WHERE st2.idTicket = t.idTicket)'
        );

        $tickets = $query->getResult();

        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..').DIRECTORY_SEPARATOR,
            'tickets' => $tickets
        ]);
    }
}
