package tt.model.business;

import javax.persistence.*;

import com.alibaba.fastjson.annotation.JSONField;

@Entity
@Table(name = "b_inspect_data")
public class InspectData {

    private Integer id;

    @JSONField(name = "PRG")
    private String prg;

    @JSONField(name = "STZH")
    private String stzh;

    @JSONField(name = "DevNB")
    private String devnb;

    @JSONField(name = "PRS")
    private String prs_str;

    @JSONField(name = "HZJC")
    private String hzjc_str;

    @JSONField(name = "WYJC")
    private String wyjc_str;

    @JSONField(name = "lat")
    private Float lat;

    @JSONField(name = "lng")
    private Float lng;

    @JSONField(name = "Devstr")
    private String devstr;

    @JSONField(name = "Time")
    private String time;

    @JSONField(name = "QJX")
    private String qjx_str;

    @JSONField(name = "NDSJ")
    private String ndsj_str;

    @JSONField(name = "DevST")
    private Byte devst;

    @JSONField(name = "SETprs")
    private String setprs;

    @JSONField(name = "LoadFlag")
    private Boolean loadFlag;

    private Integer plan_id;

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
    @Column(name = "prg")
    public String getPrg() {
        return prg;
    }


    public void setPrg(String prg) {
        this.prg = prg;
    }

    @Basic
    @Column(name = "stzh")
    public String getStzh() {
        return stzh;
    }

    public void setStzh(String stzh) {
        this.stzh = stzh;
    }

    @Basic
    @Column(name = "devnb")
    public String getDevnb() {
        return devnb;
    }

    public void setDevnb(String devnb) {
        this.devnb = devnb;
    }

    @Basic
    @Column(name = "prs")
    public String getPrs_str() {
        return prs_str;
    }

    @Transient
    public String[] getPrs() {
        if (prs_str != null && prs_str.length() > 0) {
            return prs_str.split(",");
        }
        return null;
    }

    public void setPrs_str(String prs_str) {
        this.prs_str = prs_str;
    }

    @Basic
    @Column(name = "hzjc")
    public String getHzjc_str() {
        return hzjc_str;
    }

    @Transient
    public String[] getHzjc() {
        if (hzjc_str != null && hzjc_str.length() > 0) {
            return hzjc_str.split(",");
        }
        return null;
    }

    public void setHzjc_str(String hzjc_str) {
        this.hzjc_str = hzjc_str;
    }

    @Basic
    @Column(name = "wyjc")
    public String getWyjc_str() {
        return wyjc_str;
    }

    @Transient
    public String[] getWyjc() {
        if (wyjc_str != null && wyjc_str.length() > 0) {
            return wyjc_str.split(",");
        }
        return null;
    }

    public void setWyjc_str(String wyjc_str) {
        this.wyjc_str = wyjc_str;
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

    @Basic
    @Column(name = "devstr")
    public String getDevstr() {
        return devstr;
    }

    public void setDevstr(String devstr) {
        this.devstr = devstr;
    }

    @Basic
    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Basic
    @Column(name = "qjx")
    public String getQjx_str() {
        return qjx_str;
    }

    @Transient
    public String[] getQjx() {
        if (qjx_str != null && qjx_str.length() > 0) {
            return qjx_str.split(",");
        }
        return null;
    }

    public void setQjx_str(String qjx_str) {
        this.qjx_str = qjx_str;
    }

    @Basic
    @Column(name = "ndsj")
    public String getNdsj_str() {
        return ndsj_str;
    }

    @Transient
    public String[] getNdsj() {
        if (ndsj_str != null && ndsj_str.length() > 0) {
            return ndsj_str.split(",");
        }
        return null;
    }

    public void setNdsj_str(String ndsj_str) {
        this.ndsj_str = ndsj_str;
    }

    @Basic
    @Column(name = "devst")
    public Byte getDevst() {
        return devst;
    }

    public void setDevst(Byte devst) {
        this.devst = devst;
    }

    @Basic
    @Column(name = "Setprs")
    public String getSetprs() {
        return setprs;
    }

    public void setSetprs(String setprs) {
        this.setprs = setprs;
    }

    @Basic
    @Column(name = "LoadFlag")
    public Boolean getLoadFlag() {
        return loadFlag;
    }

    public void setLoadFlag(Boolean loadFlag) {
        this.loadFlag = loadFlag;
    }

    @Basic
    @Column(name = "plan_id")
    public Integer getPlan_id() {
        return plan_id;
    }

    public void setPlan_id(Integer plan_id) {
        this.plan_id = plan_id;
    }
}
