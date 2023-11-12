SELECT
    销售,
    新客开卡人数,
    新客人数,
    新客开卡人数 / 新客人数 * 100  "开卡率%"

FROM (
         SELECT
             `销售`,
             count(if (订单类型 = "售卡" AND 开卡新老客标识 = "新客", 1, NULL)) 新客开卡人数
         FROM
             (
                 SELECT
                     IF
                     ((o.新老客 = "散客" OR (c.`首次消费时间` IS NOT NULL AND TIMESTAMPDIFF(DAY, o.`下单日期`, c.`首次消费时间` ) <= 2 )), "新客", "老客" ) 开卡新老客标识,
                     o.`销售`,
                     o.订单类型

                 FROM
                     `order` o
                         LEFT JOIN customer c ON c.`手机号` = o.`下单人手机号`
             ) tmp
         GROUP BY
             o.`销售`
     ) t1 LEFT JOIN (
    SELECT 技师, count(DISTINCT(if (开卡新老客标识 = "新客", 下单人手机号, NULL))) 新客人数
    FROM (
             SELECT
                 IF
                 ( o.新老客 = "散客" OR ( c.`首次消费时间` IS NOT NULL AND TIMESTAMPDIFF(DAY, o.`下单日期`, c.`首次消费时间` ) <= 2), "新客", "老客" ) 开卡新老客标识,
                 o.`技师`,
                 o.`下单人手机号`
             FROM
                 `order` o
                     LEFT JOIN customer c ON c.`手机号` = o.`下单人手机号` ) tmp GROUP BY `技师`

) t2 on  t1.销售 = t2.技师