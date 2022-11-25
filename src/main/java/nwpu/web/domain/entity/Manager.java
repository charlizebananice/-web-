package nwpu.web.domain.entity;

import org.springframework.transaction.annotation.Transactional;

public class Manager {
    private Integer managerId;
    private String managerName;
    private String password;

    public int getDeleteState() {
        return deleteState;
    }

    public void setDeleteState(int deleteState) {
        this.deleteState = deleteState;
    }

    private int deleteState;

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
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
                "managerId=" + managerId +
                ", managerName='" + managerName + '\'' +
                ", password='" + password + '\'' +
                ", deleteState=" + deleteState +
                '}';
    }
}
