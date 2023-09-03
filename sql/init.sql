CREATE TABLE `allowance` (
    `工时津贴` varchar(255) DEFAULT NULL,
    `方案一` varchar(255) DEFAULT NULL,
    `方案二` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `basics` (
    `项目名称` varchar(255) DEFAULT NULL,
    `入门` varchar(255) DEFAULT NULL,
    `进阶` varchar(255) DEFAULT NULL,
    `资深` varchar(255) DEFAULT NULL,
    `大师` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `group_buying` (
    `商品信息` varchar(255) DEFAULT NULL,
    `商品类型` varchar(255) DEFAULT NULL,
    `券号` varchar(255) DEFAULT NULL,
    `金额` varchar(255) DEFAULT NULL,
    `消费时间` varchar(255) DEFAULT NULL,
    `备注` varchar(255) DEFAULT NULL,
    `验证门店` varchar(255) DEFAULT NULL,
    `验券帐号` varchar(255) DEFAULT NULL,
    `商户ID` varchar(255) DEFAULT NULL,
    `分店城市` varchar(255) DEFAULT NULL,
    `手机号` varchar(255) DEFAULT NULL
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


CREATE TABLE `project` (
    `商品名称` varchar(255) DEFAULT NULL,
    `项目` varchar(255) DEFAULT NULL,
    `课时费` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `salary` (
    `技师` varchar(255) DEFAULT NULL,
    `拉伸基数` varchar(255) DEFAULT NULL,
    `筋膜刀基数` varchar(255) DEFAULT NULL,
    `保底费用` varchar(255) DEFAULT NULL,
    `保底最后月份` varchar(255) DEFAULT NULL,
    `工时津贴` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
