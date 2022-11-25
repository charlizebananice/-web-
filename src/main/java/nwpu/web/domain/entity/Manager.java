package nwpu.web.domain.entity;

import org.springframework.transaction.annotation.Transactional;

public class Manager {
    private Integer id;
    private String managerName;
    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", managerName='" + managerName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
