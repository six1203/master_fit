CREATE TABLE `project` (
   `商品名称` varchar(255) DEFAULT NULL,
   `课时费` varchar(255) DEFAULT NULL,
   `固定课时费` varchar(255) DEFAULT NULL COMMENT '优先使用固定课时费，没值的情况，按照新老客，取课时费字段计算',
   `课时` varchar(255) DEFAULT NULL,
   `开卡率` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

