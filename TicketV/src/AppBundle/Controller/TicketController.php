<?php

namespace AppBundle\Controller;

use AppBundle\Entity\SuiviTicket;
use AppBundle\Entity\Ticket;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
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
     * @Route("/", name="ticket_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $tickets = $em->getRepository('AppBundle:Ticket')->findAll();

        return $this->render('ticket/index.html.twig', array(
            'tickets' => $tickets,
        ));
    }

    /**
     * Creates a new ticket entity.
     *
     * @Route("/new", name="ticket_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $ticket = new Ticket();
        $form = $this->createForm('AppBundle\Form\TicketType', $ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->persist($ticket);
            $this->getDoctrine()->getManager()->flush();

            $this->insertSuivi($form,$ticket,"Création du ticket.");

            return $this->redirectToRoute('ticket_index', array('idTicket' => $ticket->getIdticket()));
        }

        return $this->render('ticket/new.html.twig', array(
            'ticket' => $ticket,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ticket entity.
     *
     * @Route("/{idTicket}", name="ticket_show")
     * @Method("GET")
     */
    public function showAction(Ticket $ticket)
    {
        $deleteForm = $this->createDeleteForm($ticket);

        $repository = $this->getDoctrine()
            ->getRepository('AppBundle:SuiviTicket');

        $suivis = $repository->findBy(["idTicket"=>$ticket->getIdTicket()],['idSuiviTicket' => 'DESC']);

        return $this->render('ticket/show.html.twig', array(
            'ticket' => $ticket,
            'delete_form' => $deleteForm->createView(),
            'suivis'=>$suivis
        ));
    }

    /**
     * Displays a form to edit an existing ticket entity.
     *
     * @Route("/{idTicket}/edit", name="ticket_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Ticket $ticket)
    {
        $deleteForm = $this->createDeleteForm($ticket);
        $editForm = $this->createForm('AppBundle\Form\TicketType', $ticket);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            $this->insertSuivi($editForm,$ticket,"Modification du ticket.");

            return $this->redirectToRoute('ticket_show', array('idTicket' => $ticket->getIdticket()));
        }

        return $this->render('ticket/edit.html.twig', array(
            'ticket' => $ticket,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ticket entity.
     *
     * @Route("/{idTicket}", name="ticket_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Ticket $ticket)
    {
        $form = $this->createDeleteForm($ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $em = $this->getDoctrine()->getManager();

            $this->deleteSuiviByTicket($ticket);

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
     * Insert suivi for the ticket
     *
     * @param Form $form
     * @param Ticket $ticket
     * @param String $remarque
     * @return SuiviTicket
     *
     */
    private function insertSuivi(Form $form,Ticket $ticket,$remarque){

        $em =  $this->getDoctrine()->getManager();

        $suivi = new SuiviTicket();
        $suivi->setDate(new \DateTime());
        $suivi->setIdStatut($form["idStatut"]->getData());
        $suivi->setIdTicket($ticket);
        $suivi->setIdUtilisateur($this->getUser());
        $suivi->setRemarque($remarque);

        $em->persist($suivi);
        $em->flush();
    }

    /**
     * Delete Suivi by Ticket
     *
     * @param String $remarque
     * @return Ticket $ticket
     *
     */
    private function deleteSuiviByTicket(Ticket $ticket){

        $em =  $this->getDoctrine()->getManager();

        $repository = $em->getRepository('AppBundle:SuiviTicket');

        $suivis = $repository->findBy(["idTicket"=>$ticket->getIdTicket()]);

        foreach ($suivis as $suivi){
            $em->remove($suivi);
        }


    }
}
