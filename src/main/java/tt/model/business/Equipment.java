package tt.model.business;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;

public class Equipment {
  private Long id;
  private String code;
  private String name;
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
  @Column(name = "institution_id")
  public Long getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Long institution_id) {
    this.institution_id = institution_id;
  }
}
