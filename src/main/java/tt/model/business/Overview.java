package tt.model.business;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "b_overview")
public class Overview {
    private Integer id;
    private String text;
    private Byte level;
    private Overview parent;
    private String note;
    private Long count;
    private List<Overview> children;

    @Id
    @Basic
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Basic
    @Column(name = "level")
    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }

    @ManyToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "pid")
    public Overview getParent() {
        return parent;
    }

    public void setParent(Overview parent) {
        this.parent = parent;
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
    @Column(name = "count")
    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "parent")
    public List<Overview> getChildren() {
        return children;
    }

    public void setChildren(List<Overview> children) {
        this.children = children;
    }
}
