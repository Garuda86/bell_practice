package ru.bellintegrator.practice.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "organization")
public class Document extends AbstractBaseEntity {

    @ManyToOne
    @JoinColumn(name = "doc_type_id", nullable = false)
    @NotNull
    private DocType docType;

    @Column(name = "doc_number", nullable = false, length = 11)
    @NotBlank
    private String number;

    @Column(name = "doc_date", nullable = false, length = 11)
    @NotBlank
    private Date date;

    public DocType getDocType() {
        return docType;
    }

    public void setDocType(DocType docType) {
        this.docType = docType;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
