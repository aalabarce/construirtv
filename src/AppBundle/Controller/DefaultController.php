<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('AppBundle:Default:index.html.php');
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

    public function estadisticasAction()
    {
        $em = $this->getDoctrine()->getRepository('AppBundle:Usuario');

        $qb = $em->createQueryBuilder('u')
              ->select('COUNT(u.username)');

        //$cantidad_suscriptores = array('Cantidad de suscriptores' => $qb->getQuery()->getResult()[0][1]);
        $cantidad_suscriptores = $qb->getQuery()->getResult();
        $cantidad_suscriptores = $cantidad_suscriptores[0][1];

        /*$estadisticas = array();

        array_push($estadisticas, $cantidad_suscriptores);
        
        return $this->render('AppBundle:Default:estadisticas.html.twig', array(
            'estadisticas' => $estadisticas,
        ));
        */
        return $this->render('AppBundle:Default:estadisticas.html.twig', array(
            'cantidad_suscriptores' => $cantidad_suscriptores,
        ));

    }

}
