<?php

namespace AppBundle\Controller;

use AppBundle\Entity\PlageTravail;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\DateTime;

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

        $repository = $this->getDoctrine()
                           ->getRepository('AppBundle:PlageTravail');

        $plageTravails = $repository->findBy(["utilisateur"=>$this->getUser()->getId()]);

        $route = $this->generateRoute();

        $aujourdhui = new \DateTime();
        $aujourdhui =  $aujourdhui->format('Y-m-d');
        $debut_semaine = new \DateTime();
        $debut_semaine->setTimestamp(strtotime("last monday"));
        $debut_semaine = $debut_semaine->format('Y-m-d');
        $debut_mois = new \DateTime();
        $debut_mois = $debut_mois->format('Y-m-01');
        $debut_annee = new \DateTime();
        $debut_annee = $debut_annee->format('Y-01-01');

        $plage_travails_jour = array();
        $plageTravails_semaine = array();
        $plageTravails_mois = array();
        $plageTravails_annee = array();

        foreach ($plageTravails as $plage){
            if ($plage->getDateDebut()->format("Y-m-d") == $aujourdhui){
                $plage_travails_jour[] = $plage;
            }
            if ($plage->getDateDebut()->format("Y-m-d") >= $debut_semaine){
                $plageTravails_semaine[] = $plage;
            }
            if ($plage->getDateDebut()->format("Y-m-d") >= $debut_mois){
                $plageTravails_mois[] = $plage;
            }
            if ($plage->getDateDebut()->format("Y-m-d") >= $debut_annee){
                $plageTravails_annee[] = $plage;
            }
        }

        return $this->render('plagetravail/index.html.twig', array(
            'plageTravails' => $plageTravails,
            'plageTravails_jour'=>$plage_travails_jour,
            'plageTravails_semaine'=> $plageTravails_semaine,
            'plageTravails_mois'=> $plageTravails_mois,
            'plageTravails_annee'=> $plageTravails_annee,
            'route'=>$route
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
        $route = $this->generateRoute($plageTravail);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($plageTravail);
            $em->flush();

            return $this->redirectToRoute('plagetravail_show', array('idPlage' => $plageTravail->getIdplage()));
        }

        return $this->render('plagetravail/new.html.twig', array(
            'plageTravail' => $plageTravail,
            'form' => $form->createView(),
            'route'=>$route
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
        $route = $this->generateRoute($plageTravail);

        return $this->render('plagetravail/show.html.twig', array(
            'plageTravail' => $plageTravail,
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
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
        $route = $this->generateRoute($plageTravail);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('plagetravail_show', array('idPlage' => $plageTravail->getIdplage()));
        }

        return $this->render('plagetravail/edit.html.twig', array(
            'plageTravail' => $plageTravail,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
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


    /**
     * Generate the route for the PlageTravail
     *
     * @param PlageTravail $plageTravail The PlageTravail entity
     * @return ArrayCollection
     */
    public function generateRoute(PlageTravail $plage=null)
    {
        $returnValue = array();

        if (!empty($plage)) {

            $returnValue["Plages de travail"] = $this->generateUrl("plagetravail_index");

            if ($plage->getIdPlage() > 0) {

                $returnValue[$plage->getTicket()->getIdProjet()->getLibelle()] = $this->generateUrl("projet_show", array('idProjet' => $plage->getTicket()->getIdProjet()->getIdProjet()));

                $returnValue["Ticket #" . $plage->getTicket()->getIdTicket()] = $this->generateUrl("ticket_show", array('idTicket' => $plage->getTicket()->getIdTicket()));

                $returnValue["#" . $plage->getIdPlage()] = "active";
            } else {
                $returnValue["Création d'une nouvelle plage de travail"] = "active";
            }

        }else{
            $returnValue["Plages de travail"] = "active";
        }

        return $returnValue;

    }

}
