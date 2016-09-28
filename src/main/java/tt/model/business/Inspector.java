package tt.model.business;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;

public class Inspector {
  private Long id;

  private String name;
  private Long gender;
  private String note;
  private Long institution_id;

  @Id
  @Column(name = "id")
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
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
  @Column(name = "gender")
  public Long getGender() {
    return gender;
  }

  public void setGender(Long gender) {
    this.gender = gender;
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
  public Long getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Long institution_id) {
    this.institution_id = institution_id;
  }
}
