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