package tt.model.business;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Id;

public class Project {
  private Long id;
  private String code;
  private String name;
  private Long province_id;
  private Long city_id;
  private String address;
  private Double la;
  private Double lo;
  private Long constructor_id;
  private Long builder_id;
  private Long inspector_id;
  private String note;

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
  @Column(name = "province_id")
  public Long getProvince_id() {
    return province_id;
  }

  public void setProvince_id(Long province_id) {
    this.province_id = province_id;
  }

  @Basic
  @Column(name = "city_id")
  public Long getCity_id() {
    return city_id;
  }

  public void setCity_id(Long city_id) {
    this.city_id = city_id;
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
  @Column(name = "la")
  public Double getLa() {
    return la;
  }

  public void setLa(Double la) {
    this.la = la;
  }

  @Basic
  @Column(name = "lo")
  public Double getLo() {
    return lo;
  }

  public void setLo(Double lo) {
    this.lo = lo;
  }

  @Basic
  @Column(name = "constructor_id")
  public Long getConstructor_id() {
    return constructor_id;
  }

  public void setConstructor_id(Long constructor_id) {
    this.constructor_id = constructor_id;
  }

  @Basic
  @Column(name = "builder_id")
  public Long getBuilder_id() {
    return builder_id;
  }

  public void setBuilder_id(Long builder_id) {
    this.builder_id = builder_id;
  }

  @Basic
  @Column(name = "inspector_id")
  public Long getInspector_id() {
    return inspector_id;
  }

  public void setInspector_id(Long inspector_id) {
    this.inspector_id = inspector_id;
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
