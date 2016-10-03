package tt.model.business;

import javax.persistence.*;

@Entity
@Table(name="b_inspect_data")
public class InspectData {
  private Long id;
  private String prg;
  private String stzh;
  private String devnb;
  private String prs;
  private String hzjc;
  private String wyjc;
  private String gps;
  private String devstr;
  private String time;
  private String qjx;
  private String ndsj;
  private Long devst;

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
  @Column(name="prg")
  public String getPrg() {
    return prg;
  }

  public void setPrg(String prg) {
    this.prg = prg;
  }

  @Basic
  @Column(name="stzh")
  public String getStzh() {
    return stzh;
  }

  public void setStzh(String stzh) {
    this.stzh = stzh;
  }

  @Basic
  @Column(name="devnb")
  public String getDevnb() {
    return devnb;
  }

  public void setDevnb(String devnb) {
    this.devnb = devnb;
  }

  @Basic
  @Column(name="prs")
  public String getPrs() {
    return prs;
  }

  public void setPrs(String prs) {
    this.prs = prs;
  }

  @Basic
  @Column(name="hzjc")
  public String getHzjc() {
    return hzjc;
  }

  public void setHzjc(String hzjc) {
    this.hzjc = hzjc;
  }

  @Basic
  @Column(name="wyjc")
  public String getWyjc() {
    return wyjc;
  }

  public void setWyjc(String wyjc) {
    this.wyjc = wyjc;
  }

  @Basic
  @Column(name="gps")
  public String getGps() {
    return gps;
  }

  public void setGps(String gps) {
    this.gps = gps;
  }

  @Basic
  @Column(name="devstr")
  public String getDevstr() {
    return devstr;
  }

  public void setDevstr(String devstr) {
    this.devstr = devstr;
  }

  @Basic
  @Column(name="time")
  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }

  @Basic
  @Column(name="qjx")
  public String getQjx() {
    return qjx;
  }

  public void setQjx(String qjx) {
    this.qjx = qjx;
  }

  @Basic
  @Column(name="ndsj")
  public String getNdsj() {
    return ndsj;
  }

  public void setNdsj(String ndsj) {
    this.ndsj = ndsj;
  }

  @Basic
  @Column(name="devst")
  public Long getDevst() {
    return devst;
  }

  public void setDevst(Long devst) {
    this.devst = devst;
  }
}
