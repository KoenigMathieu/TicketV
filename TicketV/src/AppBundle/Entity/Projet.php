<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Projet V6
 *
 * @ORM\Table(name="projet")
 * @ORM\Entity
 */
class Projet
{
    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255, nullable=false)
     */
    private $libelle;

    /**
     * @var boolean
     *
     * @ORM\Column(name="actif", type="boolean", nullable=false)
     */
    private $actif;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_projet", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idProjet;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\FosUser", inversedBy="idProjet")
     * @ORM\JoinTable(name="projet_utilisateur",
     *   joinColumns={
     *     @ORM\JoinColumn(name="id_projet", referencedColumnName="id_projet")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="id_utilisateur", referencedColumnName="id")
     *   }
     * )
     */
    private $idUtilisateur;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->idUtilisateur = new \Doctrine\Common\Collections\ArrayCollection();
    }


    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Projet
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Get libelle
     *
     * @return string
     */
    public function getLibelle()
    {
        return $this->libelle;
    }

    /**
     * Set actif
     *
     * @param boolean $actif
     *
     * @return Projet
     */
    public function setActif($actif)
    {
        $this->actif = $actif;

        return $this;
    }

    /**
     * Get actif
     *
     * @return boolean
     */
    public function getActif()
    {
        return $this->actif;
    }

    /**
     * Get idProjet
     *
     * @return integer
     */
    public function getIdProjet()
    {
        return $this->idProjet;
    }

    /**
     * Add idUtilisateur
     *
     * @param \AppBundle\Entity\FosUser $idUtilisateur
     *
     * @return Projet
     */
    public function addIdUtilisateur(\AppBundle\Entity\FosUser $idUtilisateur)
    {
        $this->idUtilisateur[] = $idUtilisateur;

        return $this;
    }

    /**
     * Remove idUtilisateur
     *
     * @param \AppBundle\Entity\FosUser $idUtilisateur
     */
    public function removeIdUtilisateur(\AppBundle\Entity\FosUser $idUtilisateur)
    {
        $this->idUtilisateur->removeElement($idUtilisateur);
    }

    /**
     * Get idUtilisateur
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getIdUtilisateur()
    {
        return $this->idUtilisateur;
    }
}
