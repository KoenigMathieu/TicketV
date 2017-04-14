<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Statut;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Statut controller.
 *
 * @Route("statut")
 */
class StatutController extends Controller
{
    /**
     * Lists all statut entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $route = $this->generateRoute();

        $statuts = $em->getRepository('AppBundle:Statut')->findAll();

        return $this->render('statut/index.html.twig', array(
            'statuts' => $statuts,
            'route' => $route
        ));
    }

    /**
     * Creates a new statut entity.
     *
     */
    public function newAction(Request $request)
    {
        $statut = new Statut();
        $form = $this->createForm('AppBundle\Form\StatutType', $statut);
        $form->handleRequest($request);
        $route = $this->generateRoute($statut);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($statut);
            $em->flush();

            return $this->redirectToRoute('statut_index', array('idStatut' => $statut->getIdstatut()));
        }

        return $this->render('statut/new.html.twig', array(
            'statut' => $statut,
            'form' => $form->createView(),
            'route'=>$route
        ));
    }

    /**
     * Finds and displays a statut entity.
     *
     */
    public function showAction(Statut $statut)
    {
        $deleteForm = $this->createDeleteForm($statut);
        $route = $this->generateRoute($statut);

        return $this->render('statut/show.html.twig', array(
            'statut' => $statut,
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Displays a form to edit an existing statut entity.
     *
     */
    public function editAction(Request $request, Statut $statut)
    {
        $deleteForm = $this->createDeleteForm($statut);
        $editForm = $this->createForm('AppBundle\Form\StatutType', $statut);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($statut);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('statut_show', array('idStatut' => $statut->getIdstatut()));
        }

        return $this->render('statut/edit.html.twig', array(
            'statut' => $statut,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Deletes a statut entity.
     *
     */
    public function deleteAction(Request $request, Statut $statut)
    {
        $form = $this->createDeleteForm($statut);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($statut);
            $em->flush();
        }

        return $this->redirectToRoute('statut_index');
    }

    /**
     * Creates a form to delete a statut entity.
     *
     * @param Statut $statut The statut entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Statut $statut)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('statut_delete', array('idStatut' => $statut->getIdstatut())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }


    /**
     * Generate the route for the Statut
     *
     * @param Statut $statut The Statut entity
     * @return ArrayCollection
     */
    public function generateRoute(Statut $statut=null)
    {
        $returnValue = array();

        if (!empty($statut)) {

            $returnValue["Statuts"] = $this->generateUrl("statut_index");

            if ($statut->getIdStatut() > 0) {
                $returnValue["#" . $statut->getIdStatut()] = "active";
            } else {
                $returnValue["Création d'un nouveau statut"] = "active";
            }
        }else{
            $returnValue["Statuts"] = "active";
        }

        return $returnValue;

    }
}
