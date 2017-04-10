<?php

namespace AppBundle\Controller;

use AppBundle\Entity\MiseAJour;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;

/**
 * MiseAJour controller.
 *
 * @Route("miseajour")
 */
class MiseAJourController extends Controller
{
    /**
     * Lists all MiseAJour entities.
     *
     * @Route("/", name="miseajour_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $majs = $em->getRepository('AppBundle:MiseAJour')->findAll();

        return $this->render('miseajour/index.html.twig', array(
            'majs' => $majs,
        ));
    }

    /**
     * Creates a new MiseAJour entity.
     *
     * @Route("/new", name="miseajour_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $maj = new MiseAJour();
        $form = $this->createForm('AppBundle\Form\MiseAJourType', $maj);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($maj);
            $em->flush();

            return $this->redirectToRoute('miseajour_show', array('idMiseAJour' => $maj->getIdMiseAJour()));
        }

        return $this->render('miseajour/new.html.twig', array(
            'maj' => $maj,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a MiseAJour entity.
     *
     * @Route("/{idMiseAJour}", name="miseajour_show")
     * @Method("GET")
     */
    public function showAction(MiseAJour $miseAJour)
    {
        $deleteForm = $this->createDeleteForm($miseAJour);

        return $this->render('miseajour/show.html.twig', array(
            'maj' => $miseAJour,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing MiseAJour entity.
     *
     * @Route("/{idMiseAJour}/edit", name="miseajour_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, MiseAJour $miseAJour)
    {
        $deleteForm = $this->createDeleteForm($miseAJour);
        $editForm = $this->createForm('AppBundle\Form\MiseAJourType', $miseAJour);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('miseajour_edit', array('idMiseAJour' => $miseAJour->getIdMiseAJour()));
        }

        return $this->render('miseajour/edit.html.twig', array(
            'maj' => $miseAJour,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a MiseAJour entity.
     *
     * @Route("/{idMiseAJour}", name="miseajour_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, MiseAJour $miseAJour)
    {
        $form = $this->createDeleteForm($miseAJour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($miseAJour);
            $em->flush();
        }

        return $this->redirectToRoute('miseajour_index');
    }

    /**
     * Creates a form to delete a MiseAJour entity.
     *
     * @param MiseAJour $miseAJour The MiseAJour entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(MiseAJour $miseAJour)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('miseajour_delete', array('idMiseAJour' => $miseAJour->getIdMiseAJour())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
