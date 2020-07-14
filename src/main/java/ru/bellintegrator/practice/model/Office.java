package ru.bellintegrator.practice.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "office")
public class Office extends AbstractNamedEntity {

    @Column(name = "address", nullable = false)
    @NotBlank
    @Size(min = 10, max = 200)
    private String address;

    @Column(name = "phone", nullable = false, length = 11)
    @NotBlank
    private String phone;

    @Column(name = "is_active", columnDefinition = "false")
    private Boolean isActive;

    @ManyToOne
    @JoinColumn(name = "org_id")
    private Organization organization;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }
}
