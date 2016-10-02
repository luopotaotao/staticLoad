package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name="b_inspect_project")
public class InspectProject {
  private Long id;
  private Long project_id;

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
  @Column(name="project_id")
  public Long getProject_id() {
    return project_id;
  }

  public void setProject_id(Long project_id) {
    this.project_id = project_id;
  }
}
