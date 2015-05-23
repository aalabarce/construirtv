<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class TitulosType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre')
            ->add('nroCapitulo')
            ->add('duracion')
            ->add('temporada')
            ->add('subtitulado')
            ->add('sinopsis', 'textarea')
            ->add('urlVimeo',null,array('label' => 'URL Vimeo: Ejemplo: para la URL vimeo.com/20611693 ingresar 20611693. (Únicamente se deben copiar los números despues de la barra)'))
            ->add('destacado')
            ->add('genero')
            ->add('serie')
            ->add('upload_photo', new UploadPhotoType(), array('label' => "Imagen: (medidas recomendadas: 930x620 px)"))

        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Titulos'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'appbundle_titulos';
    }
}
