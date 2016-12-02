package tt.model.business;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "b_equipment")
public class Equipment  extends BaseModel{
  private Integer id;
  private String code;
  private String name;
  private String note;
  private Integer institution_id;
  private Date expiredDate;

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
  @Column(name = "note")
  public String getNote() {
    return note;
  }

  public void setNote(String note) {
    this.note = note;
  }

  @Basic
  @Column(name = "institution_id")
  public Integer getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Integer institution_id) {
    this.institution_id = institution_id;
  }

  @Basic
  @Column(name = "expired_date")
  public Date getExpiredDate() {
    return expiredDate;
  }

  public void setExpiredDate(Date expiredDate) {
    this.expiredDate = expiredDate;
  }
}
