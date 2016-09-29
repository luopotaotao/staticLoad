package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name = "b_project")
public class Project {
    private Integer id;
    private String code;
    private String name;
    private Area province;
    private Area city;
    private String address;
    private Float lat;
    private Float lng;
    private Company constructor;
    private Company builder;
    private Company inspector;
    private String note;

    @Id
    @GeneratedValue
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
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "lat")
    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    @Basic
    @Column(name = "lng")
    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "province_id")
    public Area getProvince() {
        return province;
    }

    public void setProvince(Area province) {
        this.province = province;
    }
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "city_id")
    public Area getCity() {
        return city;
    }

    public void setCity(Area city) {
        this.city = city;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "constructor_id")
    public Company getConstructor() {
        return constructor;
    }

    public void setConstructor(Company constructor) {
        this.constructor = constructor;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "builder_id")
    public Company getBuilder() {
        return builder;
    }

    public void setBuilder(Company builder) {
        this.builder = builder;
    }
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "inspector_id")
    public Company getInspector() {
        return inspector;
    }

    public void setInspector(Company inspector) {
        this.inspector = inspector;
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
