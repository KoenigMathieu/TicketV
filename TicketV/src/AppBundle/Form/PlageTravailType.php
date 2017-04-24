<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PlageTravailType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('dateDebut', DateTimeType::class,['label'=>'Date début: ','widget' => 'single_text'])
            ->add('dateFin', DateTimeType::class,['label'=>'Date fin: ','widget' => 'single_text'])

            ->add('ticket', EntityType::class, array(
                'class' => 'AppBundle:Ticket',
                'choice_label' => 'libelle',
                'label'=>'Ticket : '
            ))

            ->add('utilisateur', EntityType::class, array(
                'class' => 'AppBundle:FosUser',
                'choice_label' => 'username',
                'label'=>'Ticket : '
            ));

    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\PlageTravail'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_plagetravail';
    }


}
