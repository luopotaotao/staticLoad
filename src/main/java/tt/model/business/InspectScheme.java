package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name="b_inspect_scheme")
public class InspectScheme {
  private Long id;
  private Long inspect_project_id;
  private Long basement_lev;
  private Long safety_lev;
  private Long pile_count;
  private Long institution_id;
  private Long approval_file_id;
  private Long inspect_file_id;

  @Basic
  @Column(name="id")
  @GeneratedValue
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  @Basic
  @Column(name="inspect_project_id")
  public Long getInspect_project_id() {
    return inspect_project_id;
  }

  public void setInspect_project_id(Long inspect_project_id) {
    this.inspect_project_id = inspect_project_id;
  }

  @Basic
  @Column(name="basement_lev")
  public Long getBasement_lev() {
    return basement_lev;
  }

  public void setBasement_lev(Long basement_lev) {
    this.basement_lev = basement_lev;
  }

  @Basic
  @Column(name="safety_lev")
  public Long getSafety_lev() {
    return safety_lev;
  }

  public void setSafety_lev(Long safety_lev) {
    this.safety_lev = safety_lev;
  }

  @Basic
  @Column(name="pile_count")
  public Long getPile_count() {
    return pile_count;
  }

  public void setPile_count(Long pile_count) {
    this.pile_count = pile_count;
  }

  @Basic
  @Column(name="institution_id")
  public Long getInstitution_id() {
    return institution_id;
  }

  public void setInstitution_id(Long institution_id) {
    this.institution_id = institution_id;
  }

  @Basic
  @Column(name="approval_file_id")
  public Long getApproval_file_id() {
    return approval_file_id;
  }

  public void setApproval_file_id(Long approval_file_id) {
    this.approval_file_id = approval_file_id;
  }

  @Basic
  @Column(name="inspect_file_id")
  public Long getInspect_file_id() {
    return inspect_file_id;
  }

  public void setInspect_file_id(Long inspect_file_id) {
    this.inspect_file_id = inspect_file_id;
  }
}
