<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use AppBundle\Entity\Titulos;
use AppBundle\Form\TitulosType;

/**
 * Titulos controller.
 *
 */
class TitulosController extends Controller
{

    /**
     * Lists all Titulos entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:Titulos')->findAll();

        return $this->render('AppBundle:Titulos:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new Titulos entity.
     *
     */
    public function createAction(Request $request)
    {
        // Recibo el nombre de las imagenes subidas
        $nombreArchivo = $request->request->get('nombreArchivo');
        $nombreArchivoCarousel = $request->request->get('nombreArchivoCarousel');

        $entity = new Titulos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            if (!empty($nombreArchivo))
            {
                $pathTemporal = $_SERVER['DOCUMENT_ROOT'] . "/uploads/temp/" . $nombreArchivo;
                $path = $_SERVER['DOCUMENT_ROOT'] . "/uploads/" . $entity->getId() . ".jpg";

                // Renombro y muevo la imagen (Le pongo de nombre el id, y de extension jpg)
                rename($pathTemporal, $path);
            }

            if(!empty($nombreArchivoCarousel))
            {
                $pathTemporal = $_SERVER['DOCUMENT_ROOT'] . "/uploads/carousel/temp/" . $nombreArchivoCarousel;
                $path = $_SERVER['DOCUMENT_ROOT'] . "/uploads/carousel/" . $entity->getId() . ".jpg";

                // Renombro y muevo la imagen (Le pongo de nombre el id, y de extension jpg)
                rename($pathTemporal, $path);
            }

            return $this->redirect($this->generateUrl('titulos_show', array('id' => $entity->getId())));
        }

        return $this->render('AppBundle:Titulos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Titulos entity.
     *
     * @param Titulos $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Titulos $entity)
    {
        $form = $this->createForm(new TitulosType(), $entity, array(
            'action' => $this->generateUrl('titulos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Titulos entity.
     *
     */
    public function newAction()
    {
        $entity = new Titulos();
        $form   = $this->createCreateForm($entity);

        return $this->render('AppBundle:Titulos:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Titulos entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Titulos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Titulos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Titulos:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Titulos entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Titulos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Titulos entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('AppBundle:Titulos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Titulos entity.
    *
    * @param Titulos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Titulos $entity)
    {
        $form = $this->createForm(new TitulosType(), $entity, array(
            'action' => $this->generateUrl('titulos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Titulos entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Titulos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Titulos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('titulos_edit', array('id' => $id)));
        }

        return $this->render('AppBundle:Titulos:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Titulos entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:Titulos')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Titulos entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('titulos'));
    }

    public function toggleDestacadoAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $titulo = $em->getRepository('AppBundle:Titulos')->find($id);

        if (!$titulo) {
            $jsonContent = '{ "result": "failure" }';
            $response = new Response($jsonContent);
            $response->headers->set('Content-Type', 'application/json');
        }

        if ($titulo->getDestacado())
        {
            $destacado = 0;
        }
        else 
        {
            $destacado = 1;
        }

        $product->setDestacado($destacado);
        $em->flush();

        $jsonContent = '{ "result": "success" }';
        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');
    }

    /**
    *   Sube una imagen de un corto a la carpeta temporal, para despues cuando es confirmado el cambio
    *   es movida a la ruta definitiva
    **/
    public function subirImagenAction()
    {

        // outputdir: C:\wamp\www\bw\uploads\\temp\\
        $output_dir = $_SERVER['DOCUMENT_ROOT'] . "/uploads/temp/";
        if(isset($_FILES["myfile"]))
        {
            $ret = array();

            $error =$_FILES["myfile"]["error"];
            //You need to handle  both cases
            //If Any browser does not support serializing of multiple files using FormData() 
            if(!is_array($_FILES["myfile"]["name"])) //single file
            {
                $fileName = $_FILES["myfile"]["name"];
                move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir.$fileName);
                $ret[]= $fileName;
            }
            else  //Multiple files, file[]
            {
              $fileCount = count($_FILES["myfile"]["name"]);
              for($i=0; $i < $fileCount; $i++)
              {
                $fileName = $_FILES["myfile"]["name"][$i];
                move_uploaded_file($_FILES["myfile"]["tmp_name"][$i],$output_dir.$fileName);
                $ret[]= $fileName;
              }
            
            }
            $response = new Response(json_encode($ret));
            $response->headers->set('Content-Type', 'application/json'); 

            return $response;
         }
    }

    /**
     * Creates a form to delete a Titulos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('titulos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
