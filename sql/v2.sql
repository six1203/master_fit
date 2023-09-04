CREATE TABLE `project` (
   `商品名称` varchar(255) DEFAULT NULL,
   `课时费` varchar(255) DEFAULT NULL,
   `固定课时费` varchar(255) DEFAULT NULL COMMENT '优先使用固定课时费，没值的情况，按照新老客，取课时费字段计算',
   `课时` varchar(255) DEFAULT NULL,
   `开卡率` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `customer` (
    `序号` varchar(255) DEFAULT NULL,
    `客户姓名` varchar(255) DEFAULT NULL,
    `国家码` varchar(255) DEFAULT NULL,
    `手机号` varchar(255) DEFAULT NULL,
    `备注名` varchar(255) DEFAULT NULL,
    `性别` varchar(255) DEFAULT NULL,
    `生日` varchar(255) DEFAULT NULL,
    `年龄` varchar(255) DEFAULT NULL,
    `客户编号` varchar(255) DEFAULT NULL,
    `成为客户时间` varchar(255) DEFAULT NULL,
    `客户身份` varchar(255) DEFAULT NULL,
    `成为会员时间` varchar(255) DEFAULT NULL,
    `归属门店` varchar(255) DEFAULT NULL,
    `营销顾问` varchar(255) DEFAULT NULL,
    `客户来源` varchar(255) DEFAULT NULL,
    `推广员` varchar(255) DEFAULT NULL,
    `推广员手机号` varchar(255) DEFAULT NULL,
    `绑定时间` varchar(255) DEFAULT NULL,
    `客户标签` varchar(255) DEFAULT NULL,
    `备注` varchar(255) DEFAULT NULL,
    `首次消费时间` varchar(255) DEFAULT NULL,
    `上次消费时间` varchar(255) DEFAULT NULL,
    `累计消费频次` varchar(255) DEFAULT NULL,
    `累计消费金额` varchar(255) DEFAULT NULL,
    `客单价` varchar(255) DEFAULT NULL,
    `可用积分` varchar(255) DEFAULT NULL,
    `有效持卡张数` varchar(255) DEFAULT NULL,
    `本金剩余金额` varchar(255) DEFAULT NULL,
    `赠额剩余金额` varchar(255) DEFAULT NULL,
    `次卡剩余金额` varchar(255) DEFAULT NULL,
    `次卡剩余次数` varchar(255) DEFAULT NULL,
    `卡赠送剩余次数` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `order` (
     `序号` varchar(255) NOT NULL,
     `预约单号` varchar(255) DEFAULT NULL,
     `预约下单时间` varchar(255) DEFAULT NULL,
     `预约到店时间` varchar(255) DEFAULT NULL,
     `订单类型` varchar(255) DEFAULT NULL,
     `订单来源` varchar(255) DEFAULT NULL,
     `核销单标识` varchar(255) DEFAULT NULL,
     `核销码原商城订单号` varchar(255) DEFAULT NULL,
     `欠款单标识` varchar(255) DEFAULT NULL,
     `收银员` varchar(255) DEFAULT NULL,
     `订单号` varchar(255) DEFAULT NULL,
     `下单日期` varchar(255) DEFAULT NULL,
     `收款日期` varchar(255) DEFAULT NULL,
     `完成日期` varchar(255) DEFAULT NULL,
     `订单状态` varchar(255) DEFAULT NULL,
     `退款状态` varchar(255) DEFAULT NULL,
     `商品名称` varchar(255) DEFAULT NULL,
     `商品分类` varchar(255) DEFAULT NULL,
     `商品类型` varchar(255) DEFAULT NULL,
     `充值卡项/定制卡分类` varchar(255) DEFAULT NULL,
     `条形码` varchar(255) DEFAULT NULL,
     `规格` varchar(255) DEFAULT NULL,
     `单价` varchar(20) DEFAULT NULL,
     `积分价` varchar(20) DEFAULT NULL,
     `数量` varchar(20) DEFAULT NULL,
     `商品优惠` varchar(20) DEFAULT NULL,
     `优惠金额` varchar(20) DEFAULT NULL,
     `优惠积分` varchar(20) DEFAULT NULL,
     `小计` varchar(20) DEFAULT NULL,
     `房间` varchar(255) DEFAULT NULL,
     `技师` varchar(255) DEFAULT NULL,
     `点客` varchar(255) DEFAULT NULL,
     `销售` varchar(255) DEFAULT NULL,
     `原价合计金额` varchar(20) DEFAULT NULL,
     `手动改价` varchar(20) DEFAULT NULL,
     `卡项权益折扣` varchar(20) DEFAULT NULL,
     `卡项权益特价` varchar(20) DEFAULT NULL,
     `会员专享折扣` varchar(20) DEFAULT NULL,
     `会员专享价` varchar(20) DEFAULT NULL,
     `次卡抵扣` varchar(20) DEFAULT NULL,
     `耗卡抵扣` varchar(20) DEFAULT NULL,
     `权益抵扣` varchar(20) DEFAULT NULL,
     `兑换券` varchar(255) DEFAULT NULL,
     `体验价优惠` varchar(255) DEFAULT NULL,
     `同行减价优惠` varchar(255) DEFAULT NULL,
     `拼团优惠` varchar(255) DEFAULT NULL,
     `助力砍价` varchar(255) DEFAULT NULL,
     `积分兑换` varchar(255) DEFAULT NULL,
     `美团商家优惠` varchar(255) DEFAULT NULL,
     `合计收款` varchar(20) DEFAULT NULL,
     `现金类支付金额` varchar(20) DEFAULT NULL,
     `会员余额支付金额` varchar(20) DEFAULT NULL,
     `会员余额本金支付金额` varchar(20) DEFAULT NULL,
     `会员余额赠金支付金额` varchar(20) DEFAULT NULL,
     `次卡余额支付金额` varchar(20) DEFAULT NULL,
     `支付方式` varchar(255) DEFAULT NULL,
     `组合支付详情` varchar(255) DEFAULT NULL,
     `下单门店` varchar(255) DEFAULT NULL,
     `核销门店` varchar(255) DEFAULT NULL,
     `订单备注` varchar(255) DEFAULT NULL,
     `买家留言` varchar(255) DEFAULT NULL,
     `下单人姓名` varchar(255) DEFAULT NULL,
     `下单人手机号` varchar(255) DEFAULT NULL,
     `所属门店` varchar(255) DEFAULT NULL,
     `客户编号` varchar(255) DEFAULT NULL,
     `新老客` varchar(255) DEFAULT NULL,
     `是否计客次` varchar(255) DEFAULT NULL,
     `到店人姓名` varchar(255) DEFAULT NULL,
     `到店人手机号` varchar(255) DEFAULT NULL,
     `收货人` varchar(255) DEFAULT NULL,
     `收货电话` varchar(255) DEFAULT NULL,
     `收货地址` varchar(255) DEFAULT NULL,
     `发货时间` varchar(255) DEFAULT NULL,
     `发货人` varchar(255) DEFAULT NULL,
     `物流公司` varchar(255) DEFAULT NULL,
     `物流单号` varchar(255) DEFAULT NULL,
     `分享人` varchar(255) DEFAULT NULL,
     PRIMARY KEY (`序号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `old_customer_whitelist` (
    `商品名称` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci comment "老客白名单";


-- 新老客标识
SELECT IF(`商品优惠` = "卡项权益" OR (`商品名称` LIKE '%（CP）%' AND `合计收款` != 0), "老客", "新客") "新老客标识"
FROM `order`;


-- 有效订单
SELECT * FROM `order`
WHERE `退款状态` = "-"
AND NOT (`商品名称` in ("【压缩裤】20分钟", "【气压裤】20分钟") AND `合计收款` = 0)
AND `支付方式` NOT LIKE "%刷单%"
AND NOT (`订单备注` LIKE "%刷单%" OR `订单备注` LIKE "%作废%");
