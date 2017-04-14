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
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $route = $this->generateRoute();

        $majs = $em->getRepository('AppBundle:MiseAJour')->findAll();

        return $this->render('miseajour/index.html.twig', array(
            'majs' => $majs,
            'route'=>$route
        ));
    }

    /**
     * Creates a new MiseAJour entity.
     *
     */
    public function newAction(Request $request)
    {
        $maj = new MiseAJour();
        $form = $this->createForm('AppBundle\Form\MiseAJourType', $maj);
        $form->handleRequest($request);
        $route = $this->generateRoute($maj);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($maj);
            $em->flush();

            return $this->redirectToRoute('miseajour_show', array('idMiseAJour' => $maj->getIdMiseAJour()));
        }

        return $this->render('miseajour/new.html.twig', array(
            'maj' => $maj,
            'form' => $form->createView(),
            'route'=>$route
        ));
    }

    /**
     * Finds and displays a MiseAJour entity.
     *
     */
    public function showAction(MiseAJour $miseAJour)
    {
        $deleteForm = $this->createDeleteForm($miseAJour);
        $route = $this->generateRoute($miseAJour);

        return $this->render('miseajour/show.html.twig', array(
            'maj' => $miseAJour,
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Displays a form to edit an existing MiseAJour entity.
     *
     */
    public function editAction(Request $request, MiseAJour $miseAJour)
    {
        $deleteForm = $this->createDeleteForm($miseAJour);
        $editForm = $this->createForm('AppBundle\Form\MiseAJourType', $miseAJour);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($miseAJour);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('miseajour_show', array('idMiseAJour' => $miseAJour->getIdMiseAJour()));
        }

        return $this->render('miseajour/edit.html.twig', array(
            'maj' => $miseAJour,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Deletes a MiseAJour entity.
     *
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


    /**
     * Generate the route for the Mise a jour
     *
     * @param MiseAJour $miseAjour The MiseAJour entity
     * @return ArrayCollection
     */
    public function generateRoute(MiseAJour $miseAJour=null)
    {
        $returnValue = array();

        if (!empty($miseAJour)) {

            if ($miseAJour->getProjet()) {
                $returnValue[$miseAJour->getProjet()->getLibelle()] = $this->generateUrl("projet_show",array('idProjet' => $miseAJour->getProjet()->getIdProjet()));
            }

            $returnValue["Mises à jour"] = $this->generateUrl("miseajour_index");

            if ($miseAJour->getIdMiseAJour() > 0) {
                $returnValue["#" . $miseAJour->getIdMiseAJour()] = "active";
            } else {
                $returnValue["Création d'une nouvelle mise à jour"] = "active";
            }
        }else{
            $returnValue["Mises à jour"] = "active";
        }

        return $returnValue;

    }
}
