<?php

namespace AppBundle\Form;

use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class StatutType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('libelle', TextType::class,['label'=>'Libellé du statut : '])
                ->add('actif', CheckboxType::class,['label'=>'Disponible : ','required' => false]);

        $builder->get('actif')
            ->addModelTransformer(new CallbackTransformer(
                function ($actifAsString) {
                    // transform the array to a string
                    return (bool)$actifAsString;
                },
                function ($actifAsBoolean) {
                    // transform the string back to an array
                    return $actifAsBoolean;
                }
            ))
        ;
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Statut'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_statut';
    }


}
