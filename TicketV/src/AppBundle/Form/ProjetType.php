<?php

namespace AppBundle\Form;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProjetType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $builder
            ->add('libelle', TextType::class,['label'=>'Libellé : '])
            ->add('actif', CheckboxType::class,['label'=>'Actif : ','required' => false])

            ->add('idUtilisateur', EntityType::class, array(
                'class' => 'AppBundle:FosUser',
                'choice_label' => 'username',
                'multiple' => true
            ));

        $builder->get('actif')
            ->addModelTransformer(new CallbackTransformer(
                function ($actifAsString) {
                    // transform the String to a Boolean
                    return (bool)$actifAsString;
                },
                function ($actifAsBoolean) {
                    // transform the Boolean back to a String
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
            'data_class' => 'AppBundle\Entity\Projet'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_projet';
    }




}
