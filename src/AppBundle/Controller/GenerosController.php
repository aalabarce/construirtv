<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use AppBundle\Entity\Generos;
use AppBundle\Form\GenerosType;

/**
 * Generos controller.
 *
 */
class GenerosController extends Controller
{

    /**
     * Lists all Generos entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:Generos')->findAll();

        return $this->render('AppBundle:Generos:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Generos entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Generos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('generos_show', array('id' => $entity->getId())));
        }

        return $this->render('AppBundle:Generos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Generos entity.
     *
     * @param Generos $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Generos $entity)
    {
        $form = $this->createForm(new GenerosType(), $entity, array(
            'action' => $this->generateUrl('generos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Generos entity.
     *
     */
    public function newAction()
    {
        $entity = new Generos();
        $form   = $this->createCreateForm($entity);

        return $this->render('AppBundle:Generos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Generos entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Generos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Generos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Generos:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Generos entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Generos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Generos entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Generos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Generos entity.
    *
    * @param Generos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Generos $entity)
    {
        $form = $this->createForm(new GenerosType(), $entity, array(
            'action' => $this->generateUrl('generos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Generos entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Generos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Generos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('generos_edit', array('id' => $id)));
        }

        return $this->render('AppBundle:Generos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Generos entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:Generos')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Generos entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('generos'));
    }

    /**
     * Creates a form to delete a Generos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('generos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
