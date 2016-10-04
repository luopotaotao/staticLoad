package tt.util;

public class Constant
{
    public final static String HEAD = "$LRK01$";
    public static final String ADD_SUCCESS = "添加成功!";

    public static final String ADD_FAIL = "添加失败!";

    public static final String EDIT_SUCCESS = "修改成功!";

    public static final String EDIT_FAIL = "修改失败!";

    public static final String DELETE_SUCCESS = "删除成功!";

    public static final String DELETE_FAIL = "删除失败!";

    public static final String ADD_FAIL_CHECK = "添加失败(属性校验失败)!";

    public static final String EDIT_FAIL_CHECK = "修改失败(属性校验失败)!";

    public static final String NO_MESSAGE = "该信息不存在，请刷新页面!";

    public static final String IS_MODIFIED = "该信息已被他人修改，请刷新页面重新修改!";

    public static final String MESSAGE_EXIST = "该信息已存在!";

    public static final int MANAGER = 1; // 平台值 1：管理平台

    public static Byte NO = 0;// 否

    public static Byte YES = 1; // 是

    /**
     * 默认登录剩余次数
     */
    public static final short REMAINING_LOGINS = 3;

    // 用户锁定状态
    public static final short LOCKUSER = 1; // 锁定

    public static final short UNLOCKUSER = 0;// 未锁定

    /**
     * email通知超管:1,开启；0：关闭
     */
    public static final int MAIL_NOTIFICATION_ON = 1;

    public static final int MAIL_NOTIFICATION_OFF = 0;

    // 参数配置修改通知类型

    /**
     * 业务参数变更通知APKP
     */
    public static String BUSINESSCONFIGUPDATE = "1"; // 业务参数变更通知APKP

    /**
     * 参数变更通知USDS
     */
    public static String CONFIGUPDATEUSDS_1 = "1"; // 应用基础信息变更

    public static String CONFIGUPDATEUSDS_2 = "2"; // 应用版本信息变更

    public static String CONFIGUPDATEUSDS_3 = "3"; // 包信息变更

    public static String CONFIGUPDATEUSDS_4 = "4"; // 辅助安全域信息变更

    public static String CONFIGUPDATEUSDS_5 = "5"; // 主安全域信息变更

    public static String CONFIGUPDATEUSDS_6 = "6"; // 合作伙伴平台信息变更

    public static String CONFIGUPDATEUSDS_7 = "7"; // 系统参数配置信息变更

    //
    public static final String KEYVALUE = "LeiSen@2015LLLLL";

    /**
     * 业务操作日志信息管理
     */
    public static Byte ORG_TASK_TYPE_1 = 1;// 开卡

    public static Byte ORG_TASK_TYPE_2 = 2;// 销卡

    public static Byte ORG_TASK_TYPE_3 = 3;// 充值

    public static Byte SUB_TASK_TYPE_1 = 1;// 安全域状态同步通知

    public static Byte SUB_TASK_TYPE_2 = 2;// 应用下载

    public static Byte SUB_TASK_TYPE_3 = 3;// 应用个人化

    public static Byte SUB_TASK_TYPE_4 = 4;// 应用删除

    public static Byte SUB_TASK_TYPE_5 = 5;// 应用下载和个人化

    public static Byte SUB_TASK_TYPE_6 = 6;// 充值

    public static Byte SUB_TASK_TYPE_7 = 7;// 退款

    public static Byte REQ_SRC_1 = 1;// 服务器

    public static Byte REQ_SRC_2 = 2;// 卡包客户端

    /**
     * 应用信息--应用状态
     */
    public static Byte BASIC_STATUS_1 = 1;// 待调测

    public static Byte BASIC_STATUS_2 = 2;// 调测

    public static Byte BASIC_STATUS_3 = 3;// 上线

    public static Byte BASIC_STATUS_4 = 4;// 暂停使用

    public static Byte BASIC_STATUS_5 = 5;// 暂停下载

    public static Byte BASIC_STATUS_6 = 6;// 下线

    /**
     * 应用信息--业务类型
     */
    public static Byte BUSI_TYPE_ID_1 = 1;// 交通一卡通应用

    public static Byte BUSI_TYPE_ID_2 = 2;// 金融应用

    /**
     * 应用版本信息--版本状态
     */
    public static Byte VERSION_STATUS_1 = 1;// 待审核

    public static Byte VERSION_STATUS_2 = 2;// 审核未通过

    public static Byte VERSION_STATUS_3 = 3;// 测试

    public static Byte VERSION_STATUS_4 = 4;// 发布

    public static Byte VERSION_STATUS_5 = 5;// 暂停

    public static Byte VERSION_STATUS_6 = 6;// 下线

    public static Byte VERSION_STATUS_7 = 7;// 测试审批未通过

    /**
     * SE发行方接入信息--业务状态
     */
    public static Byte BUSI_STAUTS_1 = 1;// 正常

    public static Byte BUSI_STAUTS_2 = 2;// 暂停

    /**
     * SE发行方接入信息--接口协议类型
     */
    public static Byte IF_PROTOCAL_TYPE_1 = 1;// TCP

    public static Byte IF_PROTOCAL_TYPE_2 = 2;// WS

    /**
     * 优惠信息--优惠类型
     */
    public static Byte FAVOUABLETYPE_1 = 1;// 立减

    public static Byte FAVOUABLETYPE_2 = 2;// 折扣

    public static Byte PASTFLG_0 = 0;// 未过期

    public static Byte PASTFLG_1 = 1;// 过期

    /**
     * 用户信息--设备类型
     */
    public static Byte DEVICE_TYPE_1 = 1;// 手机终端

    public static Byte DEVICE_TYPE_2 = 2;// 手环

    public static Byte DEVICE_TYPE_3 = 3;// 手表

    public static Byte DEVICE_TYPE_4 = 4;// SIM_SWP

    /**
     * 用户信息--手机类型
     */
    public static Byte PHONE_TYPE_1 = 1;// ANDROID

    public static Byte PHONE_TYPE_2 = 2;// IOS

    /**
     * 用户信息--是否换卡
     */
    public static Byte IS_CHANAGE_CARD_0 = 0;// 正常

    public static Byte IS_CHANAGE_CARD_1 = 1;// 已换卡

    /**
     * 用户应用信息--应用类型
     */
    public static Byte APP_TYPE_1 = 1;// 应用

    public static Byte APP_TYPE_2 = 2;// 安全域

    /**
     * 用户应用信息--应用/安全域状态
     */
    public static Byte APPLET_STATUS_1 = 1;

    public static Byte APPLET_STATUS_2 = 2;

    public static Byte APPLET_STATUS_3 = 3;

    public static Byte APPLET_STATUS_4 = 4;

    /**
     * 系统类型
     */
    public static Byte PHONE_OSTYPE_1 = 1;

    public static Byte PHONE_OSTYPE_2 = 2;

    /**
     * 业务优惠关联--用户对象标识
     */
    public static Byte TARGET_USER_FALG_1 = 1;// 部分用户

    public static Byte TARGET_USER_FALG_2 = 2;// 全网用户

    /**
     * 业务优惠关联--业务优惠类型
     */
    public static Byte BUSI_FAVOUABLE_TYPE_1 = 1;// 开卡

    public static Byte BUSI_FAVOUABLE_TYPE_2 = 2;// 充值

    /**
     * 订单信息--订单类型
     */
    public static Byte ORDER_TYPE_1 = 1;// 开卡

    public static Byte ORDER_TYPE_2 = 2;// 充值

    /**
     * 订单信息--订单状态
     */
    public static Byte ORDER_STATUS_1 = 1;// 未支付

    public static Byte ORDER_STATUS_2 = 2;// 支付完成

    public static Byte ORDER_STATUS_3 = 3;// 充值成功

    public static Byte ORDER_STATUS_4 = 4;// 充值失败

    public static Byte ORDER_STATUS_5 = 5;// 充值异常

    public static Byte ORDER_STATUS_11 = 11;// 充值异常

    public static Byte ORDER_STATUS_12 = 12;// 充值异常

    public static Byte ORDER_STATUS_13 = 13;// 充值异常

    /**
     * 订单信息--支付渠道类型
     */
    public static Byte PAY_WAY_1 = 1;// 支付宝

    public static Byte PAY_WAY_2 = 2;// 百度支付

    public static Byte PAY_WAY_3 = 3;// 微信支付

    public static Byte PAY_WAY_4 = 4;// 银联

    public static Byte PAY_WAY_5 = 5;// 第三方自有支付渠道

    /**
     * 优惠信息--最低金额类型
     */
    public static Byte MONEYTYPE_1 = 1;// 充值金额

    public static Byte MONEYTYPE_2 = 2;// 消费金额

    // 业务类型
    public static final Short BUSINESS_TYPE_0001 = 0x0001;// 用户注册

    public static final Short BUSINESS_TYPE_0002 = 0x0002;// 应用列表获取

    public static final Short BUSINESS_TYPE_0003 = 0x0003;// 应用详细信息获取

    public static final Short BUSINESS_TYPE_0004 = 0x0004;// 应用管理

    public static final Short BUSINESS_TYPE_0005 = 0x0005;// 交通卡业务圈存请求

    public static final Short BUSINESS_TYPE_0006 = 0x0006;// 脚本执行结果通知

    public static final Short BUSINESS_TYPE_1001 = 0x1001;// 客户端版本更新

    public static final Short BUSINESS_TYPE_1002 = 0x1002;// 官方公告

    public static final Short BUSINESS_TYPE_1003 = 0x1003;// 优惠消息

    public static final Short BUSINESS_TYPE_1004 = 0x1004;// 意见回复

    public static final Short BUSINESS_TYPE_2001 = 0x2001;// 意见反馈

    public static final Short BUSINESS_TYPE_2002 = 0x2002;// 常见问题列表获取

    public static final Short BUSINESS_TYPE_3001 = 0x3001;// 订单/支付渠道报文获取

    public static final Short BUSINESS_TYPE_3002 = 0x3002;// 订单计算信息获取

    public static final Short BUSINESS_TYPE_4001 = 0x4001;// IC卡现金圈存请求

    public static final Short BUSINESS_TYPE_4002 = 0x4002;// IC卡先进圈存确认请求

    public static final Short BUSINESS_TYPE_5001 = 0x5001;// 异常订单列表

    public static final Short BUSINESS_TYPE_5002 = 0x5002;// 异常订单详情

}
