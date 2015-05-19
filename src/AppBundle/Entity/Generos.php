<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Generos
 */
class Generos
{
    /**
     * @var string
     */
    private $nombre;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $image;


    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Generos
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get nombre
     *
     * @return string 
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    public function __toString()
    {
        return $this->nombre;
    }

    /**
     * Set image
     *
     * @return integer 
     */
    public function setUploadPhoto($image)
    {
        $this->image = $image;
    }

    /**
     * Get image
     *
     * @return integer 
     */
    public function getUploadPhoto()
    {
        return $this->image;
    }
}
