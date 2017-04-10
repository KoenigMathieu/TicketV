<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Projet
 *
 * @ORM\Table(name="mise_a_jour")
 * @ORM\Entity
 */
class MiseAJour
{
    /**
     * @var string
     *
     * @ORM\Column(name="remarque", type="string", nullable=true)
     */
    private $remarque;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime", nullable=false)
     */
    private $date;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_mise_a_jour", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idMiseAJour;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Ticket", inversedBy="idTicket")
     * @ORM\JoinTable(name="ticket_has_mise_a_jour",
     *   joinColumns={
     *     @ORM\JoinColumn(name="id_mise_a_jour", referencedColumnName="id_mise_a_jour")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="id_ticket", referencedColumnName="id_ticket")
     *   }
     * )
     */
    private $tickets;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->tickets = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get idMiseAJour
     *
     * @return integer
     */
    public function getIdMiseAJour()
    {
        return $this->idMiseAJour;
    }

    /**
     * Add ticket
     *
     * @param \AppBundle\Entity\Ticket $ticket
     *
     * @return MiseAJour
     */
    public function addTickets(\AppBundle\Entity\Ticket $ticket)
    {
        $this->tickets[] = $ticket;

        return $this;
    }

    /**
     * Remove ticket
     *
     * @param \AppBundle\Entity\Ticket $ticket
     */
    public function removeIdUtilisateur(\AppBundle\Entity\FosUser $ticket)
    {
        $this->tickets->removeElement($ticket);
    }

    /**
     * Get tickets
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTickets()
    {
        return $this->tickets;
    }

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

}
