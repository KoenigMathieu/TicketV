<?php

namespace AppBundle\Form;

use AppBundle\Entity\MiseAJour;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MiseAJourType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('version', TextType::class,['label'=>'Version : '])

                ->add('projet', EntityType::class, array(
                    'class' => 'AppBundle:Projet',
                    'choice_label' => 'libelle',
                    'label'=>'Projet : '
                ))

                ->add('date', DateType::class,['label'=>'Date : ','widget' => 'single_text'])
                ->add('effectue',CheckboxType::class,['label'=>'Effectuée','required' => false])
                ->add('remarque', TextareaType::class,['label'=>'Remarque : ','required' => false]);
        ;

    }


    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\MiseAJour'
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
