package tt.model.business;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "b_inspect_plan")
public class InspectPlan {
    private Integer id;
    private InspectScheme inspectScheme;
//    private List<InspectMethod> inspectMethods;
    private Inspector inspector;
    private Equipment equipment;
    private Date start_time;
    private Date end_time;
    private Inspector majorInspector;
    private Inspector assistantInspector;
    private String note;

    @Id
    @Column(name = "id")
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "inspect_scheme_id")
    public InspectScheme getInspectScheme() {
        return inspectScheme;
    }

    public void setInspectScheme(InspectScheme inspectScheme) {
        this.inspectScheme = inspectScheme;
    }

//    @ManyToMany
//    @JoinTable(name = "b_r_inspect_plan_method", joinColumns = @JoinColumn(name = "plan_id"), inverseJoinColumns = @JoinColumn(name = "method_id"))
//    public List<InspectMethod> getInspectMethods() {
//        return inspectMethods;
//    }
//
//    public void setInspectMethods(List<InspectMethod> inspectMethods) {
//        this.inspectMethods = inspectMethods;
//    }

    @ManyToOne
    @JoinColumn(name = "inspector_id")
    public Inspector getInspector() {
        return inspector;
    }

    public void setInspector(Inspector inspector) {
        this.inspector = inspector;
    }

    @ManyToOne
    @JoinColumn(name = "equipment_id")
    public Equipment getEquipment() {
        return equipment;
    }

    public void setEquipment(Equipment equipment) {
        this.equipment = equipment;
    }

    @Basic
    @Column(name = "start_time")
    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    @Basic
    @Column(name = "end_time")
    public Date getEnd_time() {
        return end_time;
    }


    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    @ManyToOne
    @JoinColumn(name = "major_inspector_id")
    public Inspector getMajorInspector() {
        return majorInspector;
    }

    public void setMajorInspector(Inspector majorInspector) {
        this.majorInspector = majorInspector;
    }

    @ManyToOne
    @JoinColumn(name = "assistant_inspector_id")
    public Inspector getAssistantInspector() {
        return assistantInspector;
    }

    public void setAssistantInspector(Inspector assistantInspector) {
        this.assistantInspector = assistantInspector;
    }

    @Basic
    @Column(name = "note")
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
