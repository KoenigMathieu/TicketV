<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Projet;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Projet controller.
 *
 * @Route("projet")
 */
class ProjetController extends Controller
{
    /**
     * Lists all projet entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $route = $this->generateRoute();

        $projets = $em->getRepository('AppBundle:Projet')->findAll();

        return $this->render('projet/index.html.twig', array(
            'projets' => $projets,
            'route'=>$route
        ));
    }

    /**
     * Creates a new projet entity.
     *
     */
    public function newAction(Request $request)
    {
        $projet = new Projet();
        $form = $this->createForm('AppBundle\Form\ProjetType', $projet);
        $form->handleRequest($request);
        $route = $this->generateRoute($projet);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($projet);
            $em->flush();

            return $this->redirectToRoute('projet_index', array('idProjet' => $projet->getIdprojet()));
        }

        return $this->render('projet/new.html.twig', array(
            'projet' => $projet,
            'form' => $form->createView(),
            'route'=>$route
        ));
    }

    /**
     * Finds and displays a projet entity.
     *
     */
    public function showAction(Projet $projet)
    {
        $deleteForm = $this->createDeleteForm($projet);
        $route = $this->generateRoute($projet);

        $repository = $this->getDoctrine()
            ->getRepository('AppBundle:Ticket');

        $tickets = $repository->findBy(["idProjet"=>$projet->getIdProjet()]);

        return $this->render('projet/show.html.twig', array(
            'projet' => $projet,
            'delete_form' => $deleteForm->createView(),
            'tickets'=>$tickets,
            'route'=>$route
        ));
    }

    /**
     * Displays a form to edit an existing projet entity.
     *
     */
    public function editAction(Request $request, Projet $projet)
    {
        $deleteForm = $this->createDeleteForm($projet);
        $editForm = $this->createForm('AppBundle\Form\ProjetType', $projet);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($projet);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('projet_show', array('idProjet' => $projet->getIdprojet()));
        }

        return $this->render('projet/edit.html.twig', array(
            'projet' => $projet,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Deletes a projet entity.
     *
     */
    public function deleteAction(Request $request, Projet $projet)
    {
        $form = $this->createDeleteForm($projet);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($projet);
            $em->flush();
        }

        return $this->redirectToRoute('projet_index');
    }

    /**
     * Creates a form to delete a projet entity.
     *
     * @param Projet $projet The projet entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Projet $projet)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('projet_delete', array('idProjet' => $projet->getIdprojet())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }


    /**
     * Generate the route for the Projet
     *
     * @param Projet$ $projet The Projet entity
     * @return ArrayCollection
     */
    public function generateRoute(Projet $projet=null)
    {
        $returnValue = array();

        if (!empty($projet)) {

            $returnValue["Projets"] = $this->generateUrl("projet_index");

            if ($projet->getIdProjet() > 0) {
                $returnValue["#" . $projet->getIdProjet()] = "active";
            } else {
                $returnValue["Création d'un nouveau projet"] = "active";
            }
        }else{
            $returnValue["Projets"] = "active";
        }

        return $returnValue;

    }

}
