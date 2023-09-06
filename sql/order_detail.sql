SELECT tmp.*,
       IF
           (
               (
                       (tmp.`商品名称` IN ("【压缩裤】20分钟", "【气压裤】20分钟") AND tmp.`合计收款` = 0)
                       OR (tmp.`支付方式` LIKE "%刷单%")
                       OR
                       (tmp.`订单备注` LIKE '%刷单%' OR tmp.`订单备注` LIKE '%返现%' OR tmp.`订单备注` LIKE '%作废%' OR
                        tmp.`订单备注` LIKE '%教练赠送%')
                       OR `退款状态` NOT LIKE '%-%'
                   ),
               0,
               `课时费`
           ) `有效课时费`
FROM (SELECT t1.*,
             IFNULL(p.`课时`, w.`课时`)  课时,
             IFNULL(p.`系数`, c2.`系数`) 系数,
             IFNULL(
                     IF
                         (
                             p.`固定课时费` IS NULL,
                             (IF(t1.`新老客标识` = "老客",
                                 IFNULL(p.`课时`, w.`课时`) * IFNULL(p.`系数`, c2.`系数`) * t1.数量, p.`课时费`)),
                             p.`固定课时费`
                         ),
                     0
                 )                       课时费,
             IFNULL(
                     IF
                         (
                                     t1.`订单类型` = "售卡"
                                 AND t1.`订单来源` = "微信小程序",
                                     IF
                                         (
                                                 t1.`合计收款` = 319,
                                                 15,
                                                 IF
                                                     (t1.`合计收款` >= 599 AND c1.`成为会员时间` IS NOT NULL, 30, 0)),
                                     0
                         ),
                     0
                 )                       开卡奖金
      FROM (SELECT *,
                   IF
                       (`商品优惠` = "卡项权益" OR (`商品名称` LIKE '%（CP）%' AND `合计收款` != 0) OR
                        (`商品名称` IN (SELECT `商品名称` FROM old_customer_whitelist)), "老客", "新客") "新老客标识"
            FROM `order`) t1
               LEFT JOIN (SELECT `序号`,
                                 p.`课时`       课时,
                                 p.`固定课时费` 固定课时费,
                                 p.`课时费`     课时费,
                                 c.`系数`       系数
                          FROM `order` o
                                   LEFT JOIN coach c ON c.`技师` = o.`技师`
                                   LEFT JOIN project p ON p.`商品名称` = o.`商品名称`
                          WHERE p.`开卡率` = c.`开卡率`) p ON p.`序号` = t1.`序号`
               LEFT JOIN customer c1
                         ON (DATE_FORMAT(c1.`成为会员时间`, '%Y-%m-%d') = DATE_FORMAT(t1.`下单日期`, '%Y-%m-%d') AND
                             c1.`手机号` = t1.`下单人手机号`)
               LEFT JOIN old_customer_whitelist w on w.`商品名称` = t1.`商品名称`
               LEFT JOIN coach c2 on c2.`技师` = t1.`技师`
      ORDER BY CAST(t1.`序号` AS SIGNED) ASC) tmp