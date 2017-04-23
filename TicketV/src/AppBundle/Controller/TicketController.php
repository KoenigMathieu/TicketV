<?php

namespace AppBundle\Controller;

use AppBundle\Entity\SuiviTicket;
use AppBundle\Entity\Ticket;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Form;
use Symfony\Component\HttpFoundation\Request;

/**
 * Ticket controller.
 *
 * @Route("ticket")
 */
class TicketController extends Controller
{
    /**
     * Lists all ticket entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $tickets = $em->getRepository('AppBundle:Ticket')->findAll();
        $route = $this->generateRoute();
        return $this->render('ticket/index.html.twig', array(
            'tickets' => $tickets,
            'route' => $route
        ));
    }

    /**
     * Creates a new ticket entity.
     *
     */
    public function newAction(Request $request)
    {
        $ticket = new Ticket();
        $form = $this->createForm('AppBundle\Form\TicketType', $ticket);
        $form->handleRequest($request);
        $route = $this->generateRoute($ticket);
        if ($form->isSubmitted() && $form->isValid()) {

            $ticket->addSuiviTicketWithUserAndRemarque($this->getUser(),"Création du ticket du ticket.");;

            $em = $this->getDoctrine()->getManager();
            $em->persist($ticket);
            $em->flush();

            return $this->redirectToRoute('ticket_index', array('idTicket' => $ticket->getIdticket()));
        }

        return $this->render('ticket/new.html.twig', array(
            'ticket' => $ticket,
            'form' => $form->createView(),
            'route'=>$route
        ));
    }

    /**
     * Finds and displays a ticket entity.
     *
     */
    public function showAction(Ticket $ticket)
    {
        $deleteForm = $this->createDeleteForm($ticket);
        $route = $this->generateRoute($ticket);
        $repository = $this->getDoctrine()
            ->getRepository('AppBundle:SuiviTicket');

        return $this->render('ticket/show.html.twig', array(
            'ticket' => $ticket,
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Displays a form to edit an existing ticket entity.
     *
     */
    public function editAction(Request $request, Ticket $ticket)
    {
        $deleteForm = $this->createDeleteForm($ticket);
        $editForm = $this->createForm('AppBundle\Form\TicketType', $ticket);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($ticket);
        $commentaireForm = $this->createCommentaireForm();
        $commentaireForm->handleRequest($request);

        if ($commentaireForm->isSubmitted() && $commentaireForm->isValid()) {

            $ticket->addCommentairetWithUserAndRemarque($this->getUser(),$commentaireForm["commentaire"]->getData());
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('ticket_show', array('idTicket' => $ticket->getIdticket()));
        }

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            $ticket->addSuiviTicketWithUserAndRemarque($this->getUser(),"Modification du ticket.");
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('ticket_show', array('idTicket' => $ticket->getIdticket()));
        }



        return $this->render('ticket/edit.html.twig', array(
            'ticket' => $ticket,
            'edit_form' => $editForm->createView(),
            'commentaire_form'=>$commentaireForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Deletes a ticket entity.
     *
     */
    public function deleteAction(Request $request, Ticket $ticket)
    {
        $form = $this->createDeleteForm($ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();

            $em->remove($ticket);

            $em->flush();
        }

        return $this->redirectToRoute('ticket_index');
    }

    /**
     * Creates a form to delete a ticket entity.
     *
     * @param Ticket $ticket The ticket entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Ticket $ticket)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('ticket_delete', array('idTicket' => $ticket->getIdticket())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }

    /**
     * Creates a form for commentary
     *
     * @param Ticket $ticket The ticket entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    public function createCommentaireForm() {

        return $form = $this->createFormBuilder(null)
            ->add('commentaire', TextareaType::class, array('label'=>'Ajouter un commentaire :'))
            ->getForm();
    }

    /**
     * Generate the route for the Ticket
     *
     * @param Ticket $ticket The ticket entity
     * @return ArrayCollection
     */
    public function generateRoute(Ticket $ticket=null)
    {
        $returnValue = array();

        if (!empty($ticket)) {
            if ($ticket->getIdProjet()) {
                $returnValue[$ticket->getIdProjet()->getLibelle()] = $this->generateUrl("projet_show",array('idProjet' => $ticket->getIdProjet()->getIdProjet()));
            }

            $returnValue["Tickets"] = $this->generateUrl("ticket_index");

            if ($ticket->getIdTicket() > 0) {
                $returnValue["#" . $ticket->getIdTicket()] = "active";
            } else {
                $returnValue["Création d'un nouveau ticket"] = "active";
            }
        }else{
            $returnValue["Tickets"] = "active";
        }

        return $returnValue;

    }

}
