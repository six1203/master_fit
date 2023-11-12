SELECT t3.`技师` AS 教练, ROUND(课时费, 2) AS 课时费
     , ROUND(课时 / 60, 2) AS "课时(/h)"
     , ROUND(开卡奖金, 2) AS 开卡奖金
     , ROUND(销售总额, 2) AS 销售总额
     , ROUND(销售提成, 2) AS 销售提成
     , ROUND(课时费 + 开卡奖金 + 销售提成, 2) AS 总计
FROM (
         SELECT `技师`, SUM(`有效课时费`) AS 课时费, SUM(课时) AS 课时
         FROM (
                  SELECT tmp.*, IF((tmp.`商品名称` IN ("【压缩裤】20分钟", "【气压裤】20分钟")
                      AND tmp.`合计收款` = 0)
                                       OR (tmp.`支付方式` LIKE "%刷单%")
                                       OR (tmp.`订单备注` LIKE '%刷单%'
                          OR tmp.`订单备注` LIKE '%返现%'
                          OR tmp.`订单备注` LIKE '%作废%'
                          OR tmp.`订单备注` LIKE '%教练赠送%')
                                       OR `退款状态` NOT LIKE '%-%', 0, `课时费`) AS `有效课时费`
                  FROM (
                           SELECT t1.*, IFNULL(p.`课时`, w.`课时`) * IFNULL(t1.数量, 1) AS 课时
                                , IFNULL(p.`系数`, c2.`系数`) AS 系数
                                , IFNULL(IF(p.`固定课时费` IS NULL, IF(t1.`新老客标识` = "老客", IFNULL(p.`课时`, w.`课时`) * IFNULL(p.`系数`, c2.`系数`) * t1.数量, p.`课时费`), p.`固定课时费`), 0) AS 课时费
                           FROM (
                                    SELECT *, IF(`商品优惠` = "卡项权益"
                                                     OR (`商品名称` LIKE '%（CP）%'
                                            AND `合计收款` != 0)
                                                     OR `商品名称` IN (
                                            SELECT `商品名称`
                                            FROM old_customer_whitelist
                                        ), "老客", "新客") AS "新老客标识"
                                    FROM `order`
                                ) t1
                                    LEFT JOIN (
                               SELECT `序号`, p.`课时` AS 课时, p.`固定课时费` AS 固定课时费, p.`课时费` AS 课时费, c.`系数` AS 系数
                               FROM `order` o
                                        LEFT JOIN coach c ON c.`技师` = o.`技师`
                                        LEFT JOIN project p ON p.`商品名称` = o.`商品名称`
                               WHERE p.`开卡率` = c.`开卡率`
                           ) p
                                              ON p.`序号` = t1.`序号`
                                    LEFT JOIN old_customer_whitelist w ON w.`商品名称` = t1.`商品名称`
                                    LEFT JOIN coach c2 ON c2.`技师` = t1.`技师`
                           ORDER BY CAST(t1.`序号` AS SIGNED) ASC
                       ) tmp
              ) t2
         GROUP BY `技师`
     ) t3
         LEFT JOIN (
    SELECT `销售`
         , SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) AS 销售总额
         , CASE
               WHEN 10000 > SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) THEN 0
               WHEN 10000 <= SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0))
                   AND SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) < 20000 THEN SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) * 0.03
               WHEN 20000 <= SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0))
                   AND SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) < 40000 THEN SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) * 0.04
               WHEN 40000 <= SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) THEN SUM(IF(`订单类型` = "售卡", IFNULL(`合计收款`, 0), 0)) * 0.05
        END AS "销售提成"
    FROM `order`
    GROUP BY `销售`
) t4
                   ON t4.`销售` = t3.`技师`
         LEFT JOIN (
    SELECT t11.销售
         , SUM(IFNULL(IF(t11.`订单类型` = "售卡"
                             AND t11.`订单来源` = "微信小程序", IF(t11.`合计收款` = 319, 15, IF(t11.`合计收款` >= 599
                                                                                                    AND c11.`成为会员时间` IS NOT NULL AND TIMESTAMPDIFF(DAY, t11.`下单日期`, c11.`首次消费时间` ) <= 2, 30, 0)), 0), 0)) AS 开卡奖金
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
) t5
                   ON t5.`销售` = t3.`技师`
WHERE 技师 IS NOT NULL
ORDER BY ROUND(课时费 + 开卡奖金 + 销售提成, 2) DESC