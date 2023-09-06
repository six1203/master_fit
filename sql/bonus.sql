SELECT t11.销售
     , SUM(IFNULL(IF(t11.`订单类型` = "售卡"
                         AND t11.`订单来源` = "微信小程序", IF(t11.`合计收款` = 319, 15, IF(t11.`合计收款` >= 599
                                                                                                AND c11.`成为会员时间` IS NOT NULL, 30, 0)), 0), 0)) AS 开卡奖金
FROM (
         SELECT *, IF(`商品优惠` = "卡项权益"
                          OR (`商品名称` LIKE '%（CP）%'
                 AND `合计收款` != 0)
                          OR `商品名称` IN (
                 SELECT `商品名称`
                 FROM old_customer_whitelist
             ), "老客", "新客") AS "新老客标识"
         FROM `order`
     ) t11
         LEFT JOIN customer c11
                   ON DATE_FORMAT(c11.`成为会员时间`, '%Y-%m-%d') = DATE_FORMAT(t11.`下单日期`, '%Y-%m-%d')
                       AND c11.`手机号` = t11.`下单人手机号`
GROUP BY t11.销售