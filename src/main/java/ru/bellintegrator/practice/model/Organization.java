package ru.bellintegrator.practice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "organization")
public class Organization extends AbstractNamedEntity{

    @Column(name = "full_name", nullable = false)
    @NotBlank
    @Size(min = 2, max = 100)
    private String fullName;

    @Column(name = "inn", nullable = false, length = 11)
    @NotBlank
    private String inn;

    @Column(name = "kpp", nullable = false, length = 11)
    @NotBlank
    private String kpp;

    @Column(name = "address", nullable = false)
    @NotBlank
    @Size(min = 10, max = 200)
    private String address;

    @Column(name = "phone", nullable = false, length = 11)
    @NotBlank
    private String phone;

    private Boolean isActive;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getInn() {
        return inn;
    }

    public void setInn(String inn) {
        this.inn = inn;
    }

    public String getKpp() {
        return kpp;
    }

    public void setKpp(String kpp) {
        this.kpp = kpp;
    }

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
}
