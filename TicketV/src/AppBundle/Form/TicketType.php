<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TicketType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('libelle',TextType::class,['label'=>'Libellé : '])
            ->add('description',TextareaType::class,['label'=>'Description : '])

            ->add('idDegreImportance', EntityType::class, array(
                'class' => 'AppBundle:DegreImportance',
                'choice_label' => 'libelle',
                'label'=>'Importance : '
            ))

            ->add('idProjet', EntityType::class, array(
                'class' => 'AppBundle:Projet',
                'choice_label' => 'libelle',
                'label'=>'Projet : '
            ))

            ->add('idStatut', EntityType::class, array(
                'class' => 'AppBundle:Statut',
                'choice_label' => 'libelle',
                'label'=>'Statut : '
            ))


            ->add('tagsTag', EntityType::class, array(
                'class' => 'AppBundle:Tags',
                'choice_label' => 'libelle',
                'label'=>'Tags : ',
                'multiple'=>true
            ));


    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Ticket'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_ticket';
    }


}
