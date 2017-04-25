<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PlageTravailType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('dateDebut', DateType::class,['label'=>'Date début : ','widget' => 'single_text'])
                ->add('heureDebut', TimeType::class,['label'=>'Heure début : ','widget' => 'single_text'])
                ->add('dateFin', DateType::class,['label'=>'Date fin : ','widget' => 'single_text'])
                ->add('heureFin', TimeType::class,['label'=>'Heure fin : ','widget' => 'single_text'])

            ->add('ticket', EntityType::class, array(
                'class' => 'AppBundle:Ticket',
                'choice_label' => 'libelle',
                'label'=>'Ticket : '
            ))

            ->add('utilisateur', EntityType::class, array(
                'class' => 'AppBundle:FosUser',
                'choice_label' => 'username',
                'label'=>'Ticket : '
            ))

            ->add('remarque', TextareaType::class,['label'=>'Remarque : ']);

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
