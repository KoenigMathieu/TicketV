<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CommentaireTicket
 *
 * @ORM\Table(name="commentaire_ticket", indexes={@ORM\Index(name="fk_commentaire_ticket_ticket1_idx", columns={"ticket_id_ticket"}), @ORM\Index(name="fk_commentaire_ticket_utilisateur1_idx", columns={"id_utilisateur"})})
 * @ORM\Entity
 */
class CommentaireTicket
{
    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=45, nullable=true)
     */
    private $type;

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
     * @ORM\Column(name="id_commentaire_ticket", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCommentaireTicket;

    /**
     * @var \AppBundle\Entity\Ticket
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Ticket")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="ticket_id_ticket", referencedColumnName="id_ticket")
     * })
     */
    private $ticketTicket;

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
     * Set type
     *
     * @param string $type
     *
     * @return CommentaireTicket
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return CommentaireTicket
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
     * @return CommentaireTicket
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
     * Get idCommentaireTicket
     *
     * @return integer
     */
    public function getIdCommentaireTicket()
    {
        return $this->idCommentaireTicket;
    }

    /**
     * Set ticketTicket
     *
     * @param \AppBundle\Entity\Ticket $ticketTicket
     *
     * @return CommentaireTicket
     */
    public function setTicketTicket(\AppBundle\Entity\Ticket $ticketTicket = null)
    {
        $this->ticketTicket = $ticketTicket;

        return $this;
    }

    /**
     * Get ticketTicket
     *
     * @return \AppBundle\Entity\Ticket
     */
    public function getTicketTicket()
    {
        return $this->ticketTicket;
    }

    /**
     * Set idUtilisateur
     *
     * @param \AppBundle\Entity\FosUser $idUtilisateur
     *
     * @return CommentaireTicket
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
