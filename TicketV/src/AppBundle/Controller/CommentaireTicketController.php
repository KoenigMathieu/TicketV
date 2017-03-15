<?php

namespace AppBundle\Controller;

use AppBundle\Entity\CommentaireTicket;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Commentaireticket controller.
 *
 * @Route("commentaireticket")
 */
class CommentaireTicketController extends Controller
{
    /**
     * Lists all commentaireTicket entities.
     *
     * @Route("/", name="commentaireticket_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $commentaireTickets = $em->getRepository('AppBundle:CommentaireTicket')->findAll();

        return $this->render('commentaireticket/index.html.twig', array(
            'commentaireTickets' => $commentaireTickets,
        ));
    }

    /**
     * Creates a new commentaireTicket entity.
     *
     * @Route("/new", name="commentaireticket_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $commentaireTicket = new Commentaireticket();
        $form = $this->createForm('AppBundle\Form\CommentaireTicketType', $commentaireTicket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($commentaireTicket);
            $em->flush();

            return $this->redirectToRoute('commentaireticket_show', array('idCommentaireTicket' => $commentaireTicket->getIdcommentaireticket()));
        }

        return $this->render('commentaireticket/new.html.twig', array(
            'commentaireTicket' => $commentaireTicket,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a commentaireTicket entity.
     *
     * @Route("/{idCommentaireTicket}", name="commentaireticket_show")
     * @Method("GET")
     */
    public function showAction(CommentaireTicket $commentaireTicket)
    {
        $deleteForm = $this->createDeleteForm($commentaireTicket);

        return $this->render('commentaireticket/show.html.twig', array(
            'commentaireTicket' => $commentaireTicket,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing commentaireTicket entity.
     *
     * @Route("/{idCommentaireTicket}/edit", name="commentaireticket_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, CommentaireTicket $commentaireTicket)
    {
        $deleteForm = $this->createDeleteForm($commentaireTicket);
        $editForm = $this->createForm('AppBundle\Form\CommentaireTicketType', $commentaireTicket);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('commentaireticket_edit', array('idCommentaireTicket' => $commentaireTicket->getIdcommentaireticket()));
        }

        return $this->render('commentaireticket/edit.html.twig', array(
            'commentaireTicket' => $commentaireTicket,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a commentaireTicket entity.
     *
     * @Route("/{idCommentaireTicket}", name="commentaireticket_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, CommentaireTicket $commentaireTicket)
    {
        $form = $this->createDeleteForm($commentaireTicket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($commentaireTicket);
            $em->flush();
        }

        return $this->redirectToRoute('commentaireticket_index');
    }

    /**
     * Creates a form to delete a commentaireTicket entity.
     *
     * @param CommentaireTicket $commentaireTicket The commentaireTicket entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(CommentaireTicket $commentaireTicket)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('commentaireticket_delete', array('idCommentaireTicket' => $commentaireTicket->getIdcommentaireticket())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
