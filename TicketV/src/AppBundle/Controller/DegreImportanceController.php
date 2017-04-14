<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DegreImportance;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\Form\ChoiceList\ArrayChoiceList;
use Symfony\Component\HttpFoundation\Request;

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
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $route = $this->generateRoute();
        $degreImportances = $em->getRepository('AppBundle:DegreImportance')->findAll();

        return $this->render('degreimportance/index.html.twig', array(
            'degreImportances' => $degreImportances,
            'route' => $route
        ));
    }

    /**
     * Creates a new degreImportance entity.
     *
     */
    public function newAction(Request $request)
    {
        $degreImportance = new Degreimportance();
        $form = $this->createForm('AppBundle\Form\DegreImportanceType', $degreImportance);
        $form->handleRequest($request);
        $route = $this->generateRoute($degreImportance);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($degreImportance);
            $em->flush();

            return $this->redirectToRoute('degreimportance_index', array('idDegreImportance' => $degreImportance->getIddegreimportance()));
        }

        return $this->render('degreimportance/new.html.twig', array(
            'degreImportance' => $degreImportance,
            'form' => $form->createView(),
            'route' => $route
        ));
    }

    /**
     * Finds and displays a degreImportance entity.
     *
     */
    public function showAction(DegreImportance $degreImportance)
    {
        $deleteForm = $this->createDeleteForm($degreImportance);
        $route = $this->generateRoute($degreImportance);

        return $this->render('degreimportance/show.html.twig', array(
            'degreImportance' => $degreImportance,
            'delete_form' => $deleteForm->createView(),
            'route' => $route
        ));
    }

    /**
     * Displays a form to edit an existing degreImportance entity.
     *
     */
    public function editAction(Request $request, DegreImportance $degreImportance)
    {
        $deleteForm = $this->createDeleteForm($degreImportance);
        $editForm = $this->createForm('AppBundle\Form\DegreImportanceType', $degreImportance);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($degreImportance);
        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('degreimportance_show', array('idDegreImportance' => $degreImportance->getIddegreimportance()));
        }

        return $this->render('degreimportance/edit.html.twig', array(
            'degreImportance' => $degreImportance,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route' => $route
        ));
    }

    /**
     * Deletes a degreImportance entity.
     *
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

    /**
     * Generate the route for the DegreImportance
     *
     * @param DegreImportance $degreImportance The degreImportance entity
     * @return ArrayCollection
     */
    public function generateRoute(DegreImportance $degreImportance=null)
    {
        $returnValue = array();

        if (!empty($degreImportance)) {

            $returnValue["Importances"] = $this->generateUrl("degreimportance_index");

            if ($degreImportance->getIdDegreImportance() > 0) {
                $returnValue["#" . $degreImportance->getIdDegreImportance()] = "active";
            } else {
                $returnValue["Création d'un nouveau degré d'importance"] = "active";
            }
        }else{
            $returnValue["lmportances"] = "active";
        }

        return $returnValue;

    }

}
