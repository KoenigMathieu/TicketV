<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PlageTravail
 *
 * @ORM\Table(name="plage_travail", indexes={@ORM\Index(name="fk_plage_travail_ticket1_idx", columns={"id_ticket"}), @ORM\Index(name="fk_plage_travail_utilisateur1_idx", columns={"id_utilisateur"})})
 * @ORM\Entity
 */
class PlageTravail
{
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_debut", type="datetime", nullable=true)
     */
    private $dateDebut;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_fin", type="datetime", nullable=true)
     */
    private $dateFin;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_plage", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idPlage;

    /**
     * @var \AppBundle\Entity\Ticket
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Ticket")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_ticket", referencedColumnName="id_ticket")
     * })
     */
    private $idTicket;

    /**
     * @var \AppBundle\Entity\FosUser
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\FosUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_utilisateur", referencedColumnName="id")
     * })
     */
    private $idUtilisateur;



    /**
     * Set dateDebut
     *
     * @param \DateTime $dateDebut
     *
     * @return PlageTravail
     */
    public function setDateDebut($dateDebut)
    {
        $this->dateDebut = $dateDebut;

        return $this;
    }

    /**
     * Get dateDebut
     *
     * @return \DateTime
     */
    public function getDateDebut()
    {
        return $this->dateDebut;
    }

    /**
     * Set dateFin
     *
     * @param \DateTime $dateFin
     *
     * @return PlageTravail
     */
    public function setDateFin($dateFin)
    {
        $this->dateFin = $dateFin;

        return $this;
    }

    /**
     * Get dateFin
     *
     * @return \DateTime
     */
    public function getDateFin()
    {
        return $this->dateFin;
    }

    /**
     * Get idPlage
     *
     * @return integer
     */
    public function getIdPlage()
    {
        return $this->idPlage;
    }

    /**
     * Set idTicket
     *
     * @param \AppBundle\Entity\Ticket $idTicket
     *
     * @return PlageTravail
     */
    public function setIdTicket(\AppBundle\Entity\Ticket $idTicket = null)
    {
        $this->idTicket = $idTicket;

        return $this;
    }

    /**
     * Get idTicket
     *
     * @return \AppBundle\Entity\Ticket
     */
    public function getIdTicket()
    {
        return $this->idTicket;
    }

    /**
     * Set idUtilisateur
     *
     * @param \AppBundle\Entity\FosUser $idUtilisateur
     *
     * @return PlageTravail
     */
    public function setIdUtilisateur(\AppBundle\Entity\FosUser $idUtilisateur = null)
    {
        $this->idUtilisateur = $idUtilisateur;

        return $this;
    }

    /**
     * Get idUtilisateur
     *
     * @return \AppBundle\Entity\FosUser
     */
    public function getIdUtilisateur()
    {
        return $this->idUtilisateur;
    }
}
