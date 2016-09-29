package tt.model.business;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "b_area")
public class Area {
    private Integer id;
    private String text;
    private Byte level;
    private Area parent;
    private String note;
    private Set<Area> children = new LinkedHashSet<>();
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


    @ManyToOne(fetch = FetchType.EAGER,optional = true)
    @JoinColumn(name = "pid")
    public Area getParent() {
        return parent;
    }

    public void setParent(Area parent) {
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

    /**
     *
     * @return
     */
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "parent",cascade = {CascadeType.ALL})  // TODO 需要加上mappedBy,否则报错，为啥不知道，待查
    public Set<Area> getChildren() {
        return children;
    }

    public void setChildren(Set<Area> children) {
        this.children = children;
    }
}
