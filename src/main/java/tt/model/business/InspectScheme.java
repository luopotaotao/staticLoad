package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name="b_inspect_scheme")
public class InspectScheme {
  private Integer id;
  private Integer inspect_project_id;
  private Byte basement_lev;
  private Byte safety_lev;
  private Integer pile_count;
  private Integer institution_id;
  private Integer approval_file_id;
  private Integer inspect_file_id;

  @Id
  @Column(name="id")
  @GeneratedValue
  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  @Basic
  @Column(name="inspect_project_id")
  public Integer getInspect_project_id() {
    return inspect_project_id;
  }

  public void setInspect_project_id(Integer inspect_project_id) {
    this.inspect_project_id = inspect_project_id;
  }

  @Basic
  @Column(name="basement_lev")
  public Byte getBasement_lev() {
    return basement_lev;
  }

  public void setBasement_lev(Byte basement_lev) {
    this.basement_lev = basement_lev;
  }

  @Basic
  @Column(name="safety_lev")
  public Byte getSafety_lev() {
    return safety_lev;
  }

  public void setSafety_lev(Byte safety_lev) {
    this.safety_lev = safety_lev;
  }

  @Basic
  @Column(name="pile_count")
  public Integer getPile_count() {
    return pile_count;
  }

  public void setPile_count(Integer pile_count) {
    this.pile_count = pile_count;
  }

  @Basic
  @Column(name="institution_id")
  public Integer getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Integer institution_id) {
    this.institution_id = institution_id;
  }

  @Basic
  @Column(name="approval_file_id")
  public Integer getApproval_file_id() {
    return approval_file_id;
  }

  public void setApproval_file_id(Integer approval_file_id) {
    this.approval_file_id = approval_file_id;
  }

  @Basic
  @Column(name="inspect_file_id")
  public Integer getInspect_file_id() {
    return inspect_file_id;
  }

  public void setInspect_file_id(Integer inspect_file_id) {
    this.inspect_file_id = inspect_file_id;
  }
}
