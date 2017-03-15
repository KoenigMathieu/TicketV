<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * SuiviTicket
 *
 * @ORM\Table(name="suivi_ticket", indexes={@ORM\Index(name="fk_suivi_ticket_ticket1_idx", columns={"id_ticket"}), @ORM\Index(name="fk_suivi_ticket_utilisateur1_idx", columns={"id_utilisateur"}), @ORM\Index(name="fk_suivi_ticket_statut1_idx", columns={"id_statut"})})
 * @ORM\Entity
 */
class SuiviTicket
{
    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    private $date;

    /**
     * @var string
     *
     * @ORM\Column(name="remarque", type="string", length=255, nullable=true)
     */
    private $remarque;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_suivi_ticket", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idSuiviTicket;

    /**
     * @var \AppBundle\Entity\Statut
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Statut")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_statut", referencedColumnName="id_statut")
     * })
     */
    private $idStatut;

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
     * Set date
     *
     * @param \DateTime $date
     *
     * @return SuiviTicket
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set remarque
     *
     * @param string $remarque
     *
     * @return SuiviTicket
     */
    public function setRemarque($remarque)
    {
        $this->remarque = $remarque;

        return $this;
    }

    /**
     * Get remarque
     *
     * @return string
     */
    public function getRemarque()
    {
        return $this->remarque;
    }

    /**
     * Get idSuiviTicket
     *
     * @return integer
     */
    public function getIdSuiviTicket()
    {
        return $this->idSuiviTicket;
    }

    /**
     * Set idStatut
     *
     * @param \AppBundle\Entity\Statut $idStatut
     *
     * @return SuiviTicket
     */
    public function setIdStatut(\AppBundle\Entity\Statut $idStatut = null)
    {
        $this->idStatut = $idStatut;

        return $this;
    }

    /**
     * Get idStatut
     *
     * @return \AppBundle\Entity\Statut
     */
    public function getIdStatut()
    {
        return $this->idStatut;
    }

    /**
     * Set idTicket
     *
     * @param \AppBundle\Entity\Ticket $idTicket
     *
     * @return SuiviTicket
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
     * @return SuiviTicket
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
