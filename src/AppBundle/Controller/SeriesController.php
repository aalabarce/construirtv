<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use AppBundle\Entity\Series;
use AppBundle\Form\SeriesType;

/**
 * Series controller.
 *
 */
class SeriesController extends Controller
{

    public function obtenerSeriesAction()
    {
       
    }

    
    /**
     * Lists all Series entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:Series')->findAll();

        return $this->render('AppBundle:Series:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Series entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Series();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('series_show', array('id' => $entity->getId())));
        }

        return $this->render('AppBundle:Series:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Series entity.
     *
     * @param Series $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Series $entity)
    {
        $form = $this->createForm(new SeriesType(), $entity, array(
            'action' => $this->generateUrl('series_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Series entity.
     *
     */
    public function newAction()
    {
        $entity = new Series();
        $form   = $this->createCreateForm($entity);

        return $this->render('AppBundle:Series:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Series entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Series')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Series entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Series:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Series entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Series')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Series entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Series:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Series entity.
    *
    * @param Series $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Series $entity)
    {
        $form = $this->createForm(new SeriesType(), $entity, array(
            'action' => $this->generateUrl('series_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Series entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Series')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Series entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('series_edit', array('id' => $id)));
        }

        return $this->render('AppBundle:Series:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Series entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:Series')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Series entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('series'));
    }

    /**
     * Creates a form to delete a Series entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('series_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar'))
            ->getForm()
        ;
    }
}
