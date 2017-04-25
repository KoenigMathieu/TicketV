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
     * @var string
     *
     * @ORM\Column(name="date_debut", type="date")
     */
    private $dateDebut;

    /**
     * @var string
     *
     * @ORM\Column(name="heure_debut", type="time")
     */
    private $heureDebut;

    /**
     * @var string
     *
     * @ORM\Column(name="date_fin", type="date")
     */
    private $dateFin;

    /**
     * @var string
     *
     * @ORM\Column(name="heure_fin", type="time")
     */
    private $heureFin;

    /**
     * @var string
     *
     * @ORM\Column(name="remarque", type="text",nullable=true)
     */
    private $remarque;

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
    private $ticket;

    /**
     * @var \AppBundle\Entity\FosUser
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\FosUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_utilisateur", referencedColumnName="id")
     * })
     */
    private $utilisateur;



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
     * Set heureDebut
     *
     * @param String $heureDebut
     *
     * @return PlageTravail
     */
    public function setHeureDebut($heureDebut)
    {
        $this->heureDebut = $heureDebut;

        return $this;
    }

    /**
     * Get heureDebut
     *
     * @return string
     */
    public function getHeureDebut()
    {
        return $this->heureDebut;
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
     * Set heureFin
     *
     * @param string $heureFin
     *
     * @return PlageTravail
     */
    public function setHeureFin($heureFin)
    {
        $this->heureFin = $heureFin;

        return $this;
    }

    /**
     * Get heureFin
     *
     * @return string
     */
    public function getHeureFin()
    {
        return $this->heureFin;
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
     * Set ticket
     *
     * @param \AppBundle\Entity\Ticket $ticket
     *
     * @return PlageTravail
     */
    public function setTicket(\AppBundle\Entity\Ticket $ticket = null)
    {
        $this->ticket = $ticket;

        return $this;
    }

    /**
     * Get ticket
     *
     * @return \AppBundle\Entity\Ticket
     */
    public function getTicket()
    {
        return $this->ticket;
    }

    /**
     * Set utilisateur
     *
     * @param \AppBundle\Entity\FosUser $utilisateur
     *
     * @return PlageTravail
     */
    public function setUtilisateur(\AppBundle\Entity\FosUser $utilisateur = null)
    {
        $this->utilisateur = $utilisateur;

        return $this;
    }

    /**
     * Get utilisateur
     *
     * @return \AppBundle\Entity\FosUser
     */
    public function getUtilisateur()
    {
        return $this->utilisateur;
    }


    /**
     * Set remarque
     *
     * @param string $remarque
     *
     * @return PlageTravail
     */
    public function setRemarque($remarque)
    {
        $this->remarque = $remarque;

        return $this;
    }

    /**
     * Get remarque
     *
     * @return \AppBundle\Entity\FosUser
     */
    public function getRemarque()
    {
        return $this->remarque;
    }

}
