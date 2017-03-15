<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Tags
 *
 * @ORM\Table(name="tags")
 * @ORM\Entity
 */
class Tags
{
    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255, nullable=false)
     */
    private $libelle;

    /**
     * @var string
     *
     * @ORM\Column(name="actif", type="string", nullable=false)
     */
    private $actif;

    /**
     * @var integer
     *
     * @ORM\Column(name="id_tag", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTag;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Ticket", mappedBy="tagsTag")
     */
    private $ticketTicket;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->ticketTicket = new \Doctrine\Common\Collections\ArrayCollection();
    }


    /**
     * Set libelle
     *
     * @param string $libelle
     *
     * @return Tags
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
     * @return Tags
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
     * Get idTag
     *
     * @return integer
     */
    public function getIdTag()
    {
        return $this->idTag;
    }

    /**
     * Add ticketTicket
     *
     * @param \AppBundle\Entity\Ticket $ticketTicket
     *
     * @return Tags
     */
    public function addTicketTicket(\AppBundle\Entity\Ticket $ticketTicket)
    {
        $this->ticketTicket[] = $ticketTicket;

        return $this;
    }

    /**
     * Remove ticketTicket
     *
     * @param \AppBundle\Entity\Ticket $ticketTicket
     */
    public function removeTicketTicket(\AppBundle\Entity\Ticket $ticketTicket)
    {
        $this->ticketTicket->removeElement($ticketTicket);
    }

    /**
     * Get ticketTicket
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTicketTicket()
    {
        return $this->ticketTicket;
    }
}
