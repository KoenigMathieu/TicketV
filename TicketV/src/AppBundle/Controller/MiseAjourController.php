<?php

namespace AppBundle\Controller;

use AppBundle\Entity\MiseAjour;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Miseajour controller.
 *
 * @Route("miseajour")
 */
class MiseAjourController extends Controller
{
    /**
     * Lists all miseAjour entities.
     *
     * @Route("/", name="miseajour_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $miseAjours = $em->getRepository('AppBundle:MiseAjour')->findAll();

        return $this->render('miseajour/index.html.twig', array(
            'miseAjours' => $miseAjours,
        ));
    }

    /**
     * Creates a new miseAjour entity.
     *
     * @Route("/new", name="miseajour_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $miseAjour = new Miseajour();
        $form = $this->createForm('AppBundle\Form\MiseAjourType', $miseAjour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($miseAjour);
            $em->flush($miseAjour);

            return $this->redirectToRoute('miseajour_show', array('id' => $miseAjour->getId()));
        }

        return $this->render('miseajour/new.html.twig', array(
            'miseAjour' => $miseAjour,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a miseAjour entity.
     *
     * @Route("/{id}", name="miseajour_show")
     * @Method("GET")
     */
    public function showAction(MiseAjour $miseAjour)
    {
        $deleteForm = $this->createDeleteForm($miseAjour);

        return $this->render('miseajour/show.html.twig', array(
            'miseAjour' => $miseAjour,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing miseAjour entity.
     *
     * @Route("/{id}/edit", name="miseajour_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, MiseAjour $miseAjour)
    {
        $deleteForm = $this->createDeleteForm($miseAjour);
        $editForm = $this->createForm('AppBundle\Form\MiseAjourType', $miseAjour);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('miseajour_edit', array('id' => $miseAjour->getId()));
        }

        return $this->render('miseajour/edit.html.twig', array(
            'miseAjour' => $miseAjour,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a miseAjour entity.
     *
     * @Route("/{id}", name="miseajour_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, MiseAjour $miseAjour)
    {
        $form = $this->createDeleteForm($miseAjour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($miseAjour);
            $em->flush($miseAjour);
        }

        return $this->redirectToRoute('miseajour_index');
    }

    /**
     * Creates a form to delete a miseAjour entity.
     *
     * @param MiseAjour $miseAjour The miseAjour entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(MiseAjour $miseAjour)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('miseajour_delete', array('id' => $miseAjour->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
