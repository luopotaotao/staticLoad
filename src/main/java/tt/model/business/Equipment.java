package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name = "b_equipment")
public class Equipment {
  private Integer id;
  private String code;
  private String name;
  private Integer institution_id;

  @Id
  @Column(name = "id")
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
  @Column(name = "institution_id")
  public Integer getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Integer institution_id) {
    this.institution_id = institution_id;
  }
}
