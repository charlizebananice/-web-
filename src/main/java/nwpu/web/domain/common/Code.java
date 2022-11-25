package nwpu.web.domain.common;

/**
 * 对manager操作定义的状态码
 */
public class Code {
    public static final Integer SAVE_OK = 10011;
    public static final Integer DELETE_OK = 10021;
    public static final Integer UPDATE_OK = 10031;
    public static final Integer GET_OK = 10041;

    public static final Integer SAVE_ERR = 10010;
    public static final Integer DELETE_ERR = 10020;
    public static final Integer UPDATE_ERR = 10030;
    public static final Integer GET_ERR = 10040;
    public static final Integer SYSTEM_ERR = 50001;
    public static final Integer SYSTEM_TIMEOUT_ERR = 50002;
    public static final Integer SYSTEM_UNKNOWN_ERR = 59999;
    public static final Integer BUSINESS_ERR = 60002;
}
