<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DegreImportance;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Degreimportance controller.
 *
 * @Route("degreimportance")
 */
class DegreImportanceController extends Controller
{
    /**
     * Lists all degreImportance entities.
     *
     * @Route("/", name="degreimportance_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $degreImportances = $em->getRepository('AppBundle:DegreImportance')->findAll();

        return $this->render('degreimportance/index.html.twig', array(
            'degreImportances' => $degreImportances,
        ));
    }

    /**
     * Creates a new degreImportance entity.
     *
     * @Route("/new", name="degreimportance_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $degreImportance = new Degreimportance();
        $form = $this->createForm('AppBundle\Form\DegreImportanceType', $degreImportance);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($degreImportance);
            $em->flush();

            return $this->redirectToRoute('degreimportance_show', array('idDegreImportance' => $degreImportance->getIddegreimportance()));
        }

        return $this->render('degreimportance/new.html.twig', array(
            'degreImportance' => $degreImportance,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a degreImportance entity.
     *
     * @Route("/{idDegreImportance}", name="degreimportance_show")
     * @Method("GET")
     */
    public function showAction(DegreImportance $degreImportance)
    {
        $deleteForm = $this->createDeleteForm($degreImportance);

        return $this->render('degreimportance/show.html.twig', array(
            'degreImportance' => $degreImportance,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing degreImportance entity.
     *
     * @Route("/{idDegreImportance}/edit", name="degreimportance_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, DegreImportance $degreImportance)
    {
        $deleteForm = $this->createDeleteForm($degreImportance);
        $editForm = $this->createForm('AppBundle\Form\DegreImportanceType', $degreImportance);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('degreimportance_edit', array('idDegreImportance' => $degreImportance->getIddegreimportance()));
        }

        return $this->render('degreimportance/edit.html.twig', array(
            'degreImportance' => $degreImportance,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a degreImportance entity.
     *
     * @Route("/{idDegreImportance}", name="degreimportance_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, DegreImportance $degreImportance)
    {
        $form = $this->createDeleteForm($degreImportance);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($degreImportance);
            $em->flush();
        }

        return $this->redirectToRoute('degreimportance_index');
    }

    /**
     * Creates a form to delete a degreImportance entity.
     *
     * @param DegreImportance $degreImportance The degreImportance entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(DegreImportance $degreImportance)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('degreimportance_delete', array('idDegreImportance' => $degreImportance->getIddegreimportance())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
