<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


use AppBundle\Entity\Statut;

class TicketType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        //$builder->add('libelle')->add('description')->add('lien')->add('projet')->add('statut')        ;

        $builder
        ->add('libelle', TextType::class,['label'=>'Lib du ticket'])
        ->add('description', TextType::class,['label'=>'Description du ticket'])
        ->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {

            $form = $event->getForm();

            $data= $event->getData();
            //$form->add('ordre', TextType::class);

            $data = $event->getData();
            //var_dump($data);

            $form->add('statut', EntityType::class, array(
                'class'       => 'AppBundle:Statut',
                'label' => 'Statut du ticket',
                'placeholder' => '',
                'choices'     => $data->getStatut(),
                'choice_label' => 'libelle'
            ));
            $form->add('projet', EntityType::class, array(
                'class'       => 'AppBundle:Projet',
                'label' => 'Projet du ticket',
                'placeholder' => '',
                'choices'     => $data->getProjet(),
                'choice_label' => 'libelle'
            ));
        }



        );



    }
    
     public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults([
            'attr' => [
                'novalidate' => 'novalidate',
            ],
        ]);
    }


}
