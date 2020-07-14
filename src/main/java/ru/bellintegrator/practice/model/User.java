package ru.bellintegrator.practice.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users", uniqueConstraints = {@UniqueConstraint(columnNames = "doc_id", name = "IX_User_doc_id")})
public class User extends AbstractBaseEntity {
    //id in abstract;

    @NotBlank
    @Size(min = 2, max = 100)
    @Column(name = "first_name", nullable = false)
    protected String firstName;

    @Column(name = "second_name", nullable = false)
    @NotBlank
    @Size(min = 2, max = 100)
    private String secondName;

    @Column(name = "middle_name", nullable = false)
    @NotBlank
    @Size(min = 2, max = 100)
    private String middleName;

    @Column(name = "position", nullable = false)
    @NotBlank
    @Size(min = 2, max = 100)
    private String position;

    @Column(name = "phone", nullable = false, length = 11)
    @NotBlank
    private String phone;

    @OneToOne
    @JoinColumn(name = "doc_id")
    private Document document;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    private Boolean isIdentified;

    @ManyToOne
    @JoinColumn(name = "office_id")
    private Office office;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSecondName() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName = secondName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Boolean getIdentified() {
        return isIdentified;
    }

    public void setIdentified(Boolean identified) {
        isIdentified = identified;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }
}
