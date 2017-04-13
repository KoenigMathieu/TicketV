<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Statut
 *
 * @ORM\Table(name="statut")
 * @ORM\Entity
 */
class Statut
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
     * @var boolean
     *
     * @ORM\Column(name="clos", type="boolean", nullable=false)
     */
    private $clos;

    /**
     * @var string
     *
     * @ORM\Column(name="couleur", type="string", length=255, nullable=false)
     */
    private $couleur;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_statut", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idStatut;


    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Statut
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
     * @param string $actif
     *
     * @return Statut
     */
    public function setActif($actif)
    {
        $this->actif = $actif;

        return $this;
    }

    /**
     * Get actif
     *
     * @return string
     */
    public function getActif()
    {
        return $this->actif;
    }

    /**
     * Get clos
     *
     * @return boolean
     */
    public function getClos()
    {
        return $this->clos;
    }

    /**
     * Set actif
     *
     * @param boolean $actif
     *
     * @return Statut
     */
    public function setClos($clos)
    {
        $this->clos = $clos;

        return $this;
    }


    /**
     * Set couleur
     *
     * @param string $couleur
     *
     * @return Statut
     */
    public function setCouleur($couleur)
    {
        $this->couleur = $couleur;

        return $this;
    }

    /**
     * Get couleur
     *
     * @return string
     */
    public function getCouleur()
    {
        return $this->couleur;
    }


    /**
     * Get idStatut
     *
     * @return integer
     */
    public function getIdStatut()
    {
        return $this->idStatut;
    }


}
