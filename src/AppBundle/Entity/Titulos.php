<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Titulos
 */
class Titulos
{
    /**
     * @var string
     */
    private $nombre;

    /**
     * @var integer
     */
    private $nroCapitulo;

    /**
     * @var integer
     */
    private $duracion;

    /**
     * @var integer
     */
    private $temporada;

    /**
     * @var boolean
     */
    private $subtitulado;

    /**
     * @var string
     */
    private $sinopsis;

    /**
     * @var string
     */
    private $urlVimeo;

    /**
     * @var boolean
     */
    private $destacado;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var \AppBundle\Entity\Generos
     */
    private $genero;

    /**
     * @var \AppBundle\Entity\Series
     */
    private $serie;


    /**
     * Set nombre
     *
     * @param string $nombre
     * @return Titulos
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
     * Set nroCapitulo
     *
     * @param integer $nroCapitulo
     * @return Titulos
     */
    public function setNroCapitulo($nroCapitulo)
    {
        $this->nroCapitulo = $nroCapitulo;

        return $this;
    }

    /**
     * Get nroCapitulo
     *
     * @return integer 
     */
    public function getNroCapitulo()
    {
        return $this->nroCapitulo;
    }

    /**
     * Set duracion
     *
     * @param integer $duracion
     * @return Titulos
     */
    public function setDuracion($duracion)
    {
        $this->duracion = $duracion;

        return $this;
    }

    /**
     * Get duracion
     *
     * @return integer 
     */
    public function getDuracion()
    {
        return $this->duracion;
    }

    /**
     * Set temporada
     *
     * @param integer $temporada
     * @return Titulos
     */
    public function setTemporada($temporada)
    {
        $this->temporada = $temporada;

        return $this;
    }

    /**
     * Get temporada
     *
     * @return integer 
     */
    public function getTemporada()
    {
        return $this->temporada;
    }

    /**
     * Set subtitulado
     *
     * @param boolean $subtitulado
     * @return Titulos
     */
    public function setSubtitulado($subtitulado)
    {
        $this->subtitulado = $subtitulado;

        return $this;
    }

    /**
     * Get subtitulado
     *
     * @return boolean 
     */
    public function getSubtitulado()
    {
        return $this->subtitulado;
    }

    /**
     * Set sinopsis
     *
     * @param string $sinopsis
     * @return Titulos
     */
    public function setSinopsis($sinopsis)
    {
        $this->sinopsis = $sinopsis;

        return $this;
    }

    /**
     * Get sinopsis
     *
     * @return string 
     */
    public function getSinopsis()
    {
        return $this->sinopsis;
    }

    /**
     * Set urlVimeo
     *
     * @param string $urlVimeo
     * @return Titulos
     */
    public function setUrlVimeo($urlVimeo)
    {
        $this->urlVimeo = $urlVimeo;

        return $this;
    }

    /**
     * Get urlVimeo
     *
     * @return string 
     */
    public function getUrlVimeo()
    {
        return $this->urlVimeo;
    }

    /**
     * Set destacado
     *
     * @param boolean $destacado
     * @return Titulos
     */
    public function setDestacado($destacado)
    {
        $this->destacado = $destacado;

        return $this;
    }

    /**
     * Get destacado
     *
     * @return boolean 
     */
    public function getDestacado()
    {
        return $this->destacado;
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

    /**
     * Set genero
     *
     * @param \AppBundle\Entity\Generos $genero
     * @return Titulos
     */
    public function setGenero(\AppBundle\Entity\Generos $genero = null)
    {
        $this->genero = $genero;

        return $this;
    }

    /**
     * Get genero
     *
     * @return \AppBundle\Entity\Generos 
     */
    public function getGenero()
    {
        return $this->genero;
    }

    /**
     * Set serie
     *
     * @param \AppBundle\Entity\Series $serie
     * @return Titulos
     */
    public function setSerie(\AppBundle\Entity\Series $serie = null)
    {
        $this->serie = $serie;

        return $this;
    }

    /**
     * Get serie
     *
     * @return \AppBundle\Entity\Series 
     */
    public function getSerie()
    {
        return $this->serie;
    }
}
