<?php

namespace AppBundle\Controller;

use AppBundle\Entity\SuiviTicket;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Suiviticket controller.
 *
 * @Route("suiviticket")
 */
class SuiviTicketController extends Controller
{
    /**
     * Lists all suiviTicket entities.
     *
     * @Route("/", name="suiviticket_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $suiviTickets = $em->getRepository('AppBundle:SuiviTicket')->findAll();

        return $this->render('suiviticket/index.html.twig', array(
            'suiviTickets' => $suiviTickets,
        ));
    }

    /**
     * Creates a new suiviTicket entity.
     *
     * @Route("/new", name="suiviticket_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $suiviTicket = new Suiviticket();
        $form = $this->createForm('AppBundle\Form\SuiviTicketType', $suiviTicket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($suiviTicket);
            $em->flush();

            return $this->redirectToRoute('suiviticket_show', array('idSuiviTicket' => $suiviTicket->getIdsuiviticket()));
        }

        return $this->render('suiviticket/new.html.twig', array(
            'suiviTicket' => $suiviTicket,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a suiviTicket entity.
     *
     * @Route("/{idSuiviTicket}", name="suiviticket_show")
     * @Method("GET")
     */
    public function showAction(SuiviTicket $suiviTicket)
    {
        $deleteForm = $this->createDeleteForm($suiviTicket);

        return $this->render('suiviticket/show.html.twig', array(
            'suiviTicket' => $suiviTicket,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing suiviTicket entity.
     *
     * @Route("/{idSuiviTicket}/edit", name="suiviticket_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, SuiviTicket $suiviTicket)
    {
        $deleteForm = $this->createDeleteForm($suiviTicket);
        $editForm = $this->createForm('AppBundle\Form\SuiviTicketType', $suiviTicket);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('suiviticket_edit', array('idSuiviTicket' => $suiviTicket->getIdsuiviticket()));
        }

        return $this->render('suiviticket/edit.html.twig', array(
            'suiviTicket' => $suiviTicket,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a suiviTicket entity.
     *
     * @Route("/{idSuiviTicket}", name="suiviticket_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, SuiviTicket $suiviTicket)
    {
        $form = $this->createDeleteForm($suiviTicket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($suiviTicket);
            $em->flush();
        }

        return $this->redirectToRoute('suiviticket_index');
    }

    /**
     * Creates a form to delete a suiviTicket entity.
     *
     * @param SuiviTicket $suiviTicket The suiviTicket entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(SuiviTicket $suiviTicket)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('suiviticket_delete', array('idSuiviTicket' => $suiviTicket->getIdsuiviticket())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
