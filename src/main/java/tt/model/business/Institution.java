package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name = "b_institution")
public class Institution implements java.io.Serializable {
    private Integer id;
    private String code;
    private String name;
    private Byte economy_typ;
    private String certificate_code;
    private Byte regist_typ;

    @Id
    @Column(name = "id")
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "economy_typ")
    public Byte getEconomy_typ() {
        return economy_typ;
    }

    public void setEconomy_typ(Byte economy_typ) {
        this.economy_typ = economy_typ;
    }

    @Basic
    @Column(name = "certificate_code")
    public String getCertificate_code() {
        return certificate_code;
    }

    public void setCertificate_code(String certificate_code) {
        this.certificate_code = certificate_code;
    }

    @Basic
    @Column(name = "regist_typ")
    public Byte getRegist_typ() {
        return regist_typ;
    }

    public void setRegist_typ(Byte regist_typ) {
        this.regist_typ = regist_typ;
    }
}
