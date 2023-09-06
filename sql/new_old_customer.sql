SELECT
    *,
    IF
        ( `商品优惠` = "卡项权益" OR ( `商品名称` LIKE '%（CP）%' AND `合计收款` != 0 ) OR `商品名称` IN ( SELECT `商品名称` FROM old_customer_whitelist ), "老客", "新客" ) AS "新老客标识"
FROM
    `order`