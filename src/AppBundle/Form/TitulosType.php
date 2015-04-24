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
            ->add('sinopsis')
            ->add('urlVimeo')
            ->add('destacado')
            ->add('genero')
            ->add('serie')
            ->add('upload_photo', new UploadPhotoType())

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
