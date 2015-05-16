<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;

use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\GetSetMethodNormalizer;
use Symfony\Component\HttpFoundation\Response;
//use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class ApiController extends Controller
{

    public function articlesAction()
    {
        $articles = array('article1', 'article2', 'article3');
        return new JsonResponse($articles);
    }

    public function userAction()
    {
        $user = $this->container->get('security.context')->getToken()->getUser();
        if($user) {
            return new JsonResponse(array(
                'id' => $user->getId(),
                'username' => $user->getUsername()
            ));
        }

        return new JsonResponse(array(
            'message' => 'User is not identified'
        ));

    }

    public function obtenerSeriesAction()
    {
        $series = $this->getDoctrine()->getRepository('AppBundle:Series')->findAll();
        
        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($series, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response;   

    }

    public function obtenerGenerosAction()
    {
        $generos = $this->getDoctrine()->getRepository('AppBundle:Generos')->findAll();
        
        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($generos, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }

    public function obtenerTitulosAction()
    {
        $titulos = $this->getDoctrine()->getRepository('AppBundle:Titulos')->findAll();
        
        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($titulos, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }

    public function obtenerTitulosPorSerieAction($serie_id)
    {
        $titulos = $this->getDoctrine()->getRepository('AppBundle:Titulos')->findBy(array('serie' => $serie_id));

        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($titulos, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }

    public function obtenerTitulosPorGeneroAction($genero_id)
    {
        $titulos = $this->getDoctrine()->getRepository('AppBundle:Titulos')->findBy(array('genero' => $genero_id));

        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($titulos, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response; 
    }

    public function obtenerDetalleTituloAction($id)
    {
        /*if (false === $this->get('security.context')->isGranted('IS_AUTHENTICATED_FULLY')) 
        {
            //echo '{"error": "401 - Not Authorized"}';die;
            throw new AccessDeniedException();
        }
        else
        {*/
            $titulo = $this->getDoctrine()->getRepository('AppBundle:Titulos')->find($id);

            $encoders = array(new JsonEncoder());
            $normalizers = array(new GetSetMethodNormalizer());
            $serializer = new Serializer($normalizers, $encoders);

            $jsonContent = $serializer->serialize($titulo, 'json');

            $response = new Response($jsonContent);
            $response->headers->set('Content-Type', 'application/json');

            return $response;  
        //}
    }

    public function obtenerTitulosDestacadosAction()
    {
        $titulos = $this->getDoctrine()->getRepository('AppBundle:Titulos')->findBy(array('destacado' => 1));

        $encoders = array(new JsonEncoder());
        $normalizers = array(new GetSetMethodNormalizer());
        $serializer = new Serializer($normalizers, $encoders);

        $jsonContent = $serializer->serialize($titulos, 'json');

        $response = new Response($jsonContent);
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }

    public function buscadorAction($query)
    {
        // set doctrine

        $titulosHome = $this->getDoctrine()->getManager()->getConnection();

        // prepare statement

        $sql = "SELECT t.id, t.nombre, t.sinopsis, s.nombre as serie, g.nombre as genero
                    FROM titulos t
                    LEFT JOIN series s ON t.serie_id = s.id
                    JOIN generos g ON t.genero_id = g.id
                WHERE 
                t.nombre LIKE '%" . $query . "%'
                OR t.sinopsis LIKE '%" . $query . "%'
                OR s.nombre LIKE '%" . $query . "%'
                OR s.sinopsis LIKE '%" . $query . "%'
                OR g.nombre LIKE '%" . $query . "%';";
       
        $sth = $titulosHome->prepare($sql);

        // execute and fetch
        $sth->execute();
        $result = $sth->fetchAll();    

        $response = new Response(json_encode($result));
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }
}
