package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name = "b_inspect_scheme")
public class InspectScheme {
    private Integer id;
    private String name;
    private Project project;
    private Byte basement_lev;
    private Byte safety_lev;
    private Integer pile_count;
    private Institution institution;
    private Integer approval_file_id;
    private Integer inspect_file_id;
    private InspectItem inspectItem;
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
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne
    @JoinColumn(name = "inspect_project_id")
    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    @Basic
    @Column(name = "basement_lev")
    public Byte getBasement_lev() {
        return basement_lev;
    }

    public void setBasement_lev(Byte basement_lev) {
        this.basement_lev = basement_lev;
    }

    @Basic
    @Column(name = "safety_lev")
    public Byte getSafety_lev() {
        return safety_lev;
    }

    public void setSafety_lev(Byte safety_lev) {
        this.safety_lev = safety_lev;
    }

    @Basic
    @Column(name = "pile_count")
    public Integer getPile_count() {
        return pile_count;
    }

    public void setPile_count(Integer pile_count) {
        this.pile_count = pile_count;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "institution_id")
    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    @Basic
    @Column(name = "approval_file_id")
    public Integer getApproval_file_id() {
        return approval_file_id;
    }

    public void setApproval_file_id(Integer approval_file_id) {
        this.approval_file_id = approval_file_id;
    }

    @Basic
    @Column(name = "inspect_file_id")
    public Integer getInspect_file_id() {
        return inspect_file_id;
    }

    public void setInspect_file_id(Integer inspect_file_id) {
        this.inspect_file_id = inspect_file_id;
    }

    @ManyToOne
    @JoinTable(name="b_r_inspect_scheme_item",joinColumns = @JoinColumn(name="inspect_scheme_id"),inverseJoinColumns=@JoinColumn(name="inspect_item_id"))
    public InspectItem getInspectItem() {
        return inspectItem;
    }

    public void setInspectItem(InspectItem inspectItem) {
        this.inspectItem = inspectItem;
    }
}
