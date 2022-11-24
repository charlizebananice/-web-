package nwpu.web.domain;

public class Order {

    private Integer orderId;

    private Integer state;

    private Integer fee;

    private String shippingAddress;

    private String receiveAddress;

    private Integer managerId;

    private Integer deliverymanId;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getFee() {
        return fee;
    }

    public void setFee(Integer fee) {
        this.fee = fee;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public Integer getDeliverymanId() {
        return deliverymanId;
    }

    public void setDeliverymanId(Integer deliverymanId) {
        this.deliverymanId = deliverymanId;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", state=" + state +
                ", fee=" + fee +
                ", shippingAddress='" + shippingAddress + '\'' +
                ", receiveAddress='" + receiveAddress + '\'' +
                ", managerId=" + managerId +
                ", deliverymanId=" + deliverymanId +
                '}';
    }
}