<?php

namespace AppBundle\Controller;

use AppBundle\Entity\PlageTravail;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Plagetravail controller.
 *
 * @Route("plagetravail")
 */
class PlageTravailController extends Controller
{
    /**
     * Lists all plageTravail entities.
     *
     * @Route("/", name="plagetravail_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $plageTravails = $em->getRepository('AppBundle:PlageTravail')->findAll();

        return $this->render('plagetravail/index.html.twig', array(
            'plageTravails' => $plageTravails,
        ));
    }

    /**
     * Creates a new plageTravail entity.
     *
     * @Route("/new", name="plagetravail_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $plageTravail = new Plagetravail();
        $form = $this->createForm('AppBundle\Form\PlageTravailType', $plageTravail);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($plageTravail);
            $em->flush();

            return $this->redirectToRoute('plagetravail_show', array('idPlage' => $plageTravail->getIdplage()));
        }

        return $this->render('plagetravail/new.html.twig', array(
            'plageTravail' => $plageTravail,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a plageTravail entity.
     *
     * @Route("/{idPlage}", name="plagetravail_show")
     * @Method("GET")
     */
    public function showAction(PlageTravail $plageTravail)
    {
        $deleteForm = $this->createDeleteForm($plageTravail);

        return $this->render('plagetravail/show.html.twig', array(
            'plageTravail' => $plageTravail,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing plageTravail entity.
     *
     * @Route("/{idPlage}/edit", name="plagetravail_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, PlageTravail $plageTravail)
    {
        $deleteForm = $this->createDeleteForm($plageTravail);
        $editForm = $this->createForm('AppBundle\Form\PlageTravailType', $plageTravail);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('plagetravail_edit', array('idPlage' => $plageTravail->getIdplage()));
        }

        return $this->render('plagetravail/edit.html.twig', array(
            'plageTravail' => $plageTravail,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a plageTravail entity.
     *
     * @Route("/{idPlage}", name="plagetravail_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, PlageTravail $plageTravail)
    {
        $form = $this->createDeleteForm($plageTravail);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($plageTravail);
            $em->flush();
        }

        return $this->redirectToRoute('plagetravail_index');
    }

    /**
     * Creates a form to delete a plageTravail entity.
     *
     * @param PlageTravail $plageTravail The plageTravail entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(PlageTravail $plageTravail)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('plagetravail_delete', array('idPlage' => $plageTravail->getIdplage())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
