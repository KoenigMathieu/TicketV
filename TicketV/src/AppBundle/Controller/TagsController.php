<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Tags;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Tag controller.
 *
 * @Route("tags")
 */
class TagsController extends Controller
{
    /**
     * Lists all tag entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $route = $this->generateRoute();

        $tags = $em->getRepository('AppBundle:Tags')->findAll();

        return $this->render('tags/index.html.twig', array(
            'tags' => $tags,
            'route'=>$route
        ));
    }

    /**
     * Creates a new tag entity.
     *
     */
    public function newAction(Request $request)
    {
        $tag = new Tags();
        $form = $this->createForm('AppBundle\Form\TagsType', $tag);
        $form->handleRequest($request);
        $route = $this->generateRoute($tag);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($tag);
            $em->flush();

            return $this->redirectToRoute('tags_index', array('idTag' => $tag->getIdtag()));
        }

        return $this->render('tags/new.html.twig', array(
            'tag' => $tag,
            'form' => $form->createView(),
            'route'=>$route
        ));
    }

    /**
     * Finds and displays a tag entity.
     *
     */
    public function showAction(Tags $tag)
    {
        $deleteForm = $this->createDeleteForm($tag);
        $route = $this->generateRoute($tag);

        return $this->render('tags/show.html.twig', array(
            'tag' => $tag,
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Displays a form to edit an existing tag entity.
     *
     */
    public function editAction(Request $request, Tags $tag)
    {
        $deleteForm = $this->createDeleteForm($tag);
        $editForm = $this->createForm('AppBundle\Form\TagsType', $tag);
        $editForm->handleRequest($request);
        $route = $this->generateRoute($tag);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('tags_show', array('idTag' => $tag->getIdtag()));
        }

        return $this->render('tags/edit.html.twig', array(
            'tag' => $tag,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            'route'=>$route
        ));
    }

    /**
     * Deletes a tag entity.
     *
     */
    public function deleteAction(Request $request, Tags $tag)
    {
        $form = $this->createDeleteForm($tag);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($tag);
            $em->flush();
        }

        return $this->redirectToRoute('tags_index');
    }

    /**
     * Creates a form to delete a tag entity.
     *
     * @param Tags $tag The tag entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Tags $tag)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('tags_delete', array('idTag' => $tag->getIdtag())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }

    /**
     * Generate the route for the Tags
     *
     * @param Tags $tags The Tags entity
     * @return ArrayCollection
     */
    public function generateRoute(Tags $tags=null)
    {
        $returnValue = array();

        if (!empty($tags)) {

            $returnValue["Tags"] = $this->generateUrl("tags_index");

            if ($tags->getIdTag() > 0) {
                $returnValue["#" . $tags->getIdTag()] = "active";
            } else {
                $returnValue["Création d'un nouveau tag"] = "active";
            }
        }else{
            $returnValue["Tags"] = "active";
        }

        return $returnValue;

    }
}
