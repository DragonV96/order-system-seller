DROP DATABASE  IF EXISTS `order_sys_seller`;
CREATE DATABASE `order_sys_seller`;

USE `order_sys_seller`;

DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`(
    `product_id` bigint(20) NOT NULL COMMENT '商品id',
    `product_name` varchar(64) NOT NULL COMMENT '商品名称',
    `product_price` decimal(8,2) NOT NULL COMMENT '单价',
    `product_stock` int(11) NOT NULL COMMENT '库存',
    `product_description` varchar(64) COMMENT '描述',
    `product_icon` varchar(512) COMMENT '小图',
    `category_type` int(11) NOT NULL COMMENT '类目编号',
    `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
    `update_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
    PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '商品表';


DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`(
    `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目id',
    `category_name` varchar(64) NOT NULL COMMENT '类目名称',
    `category_type` int(11) NOT NULL COMMENT '类目编号',
    `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
    `update_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
    PRIMARY KEY (`category_id`),
    UNIQUE KEY `u_category_type` (`category_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '类目表';


DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master`(
    `order_id` bigint(20) NOT NULL COMMENT '类目id',
    `buyer_name` varchar(32) NOT NULL COMMENT '买家姓名',
    `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
    `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
    `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信openid',
    `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
    `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态，默认0新下单',
    `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态，默认0未支付',
    `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
    `update_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
    PRIMARY KEY (`order_id`),
    KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '订单表';


DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`(
    `detail_id` bigint(20) NOT NULL COMMENT '订单详情id',
    `order_id` bigint(20) NOT NULL COMMENT '订单id',
    `product_id` bigint(20) NOT NULL COMMENT '商品id',
    `product_name` varchar(64) NOT NULL COMMENT '商品名称',
    `product_price` decimal(8,2) NOT NULL COMMENT '单价',
    `product_quantity` int(11) NOT NULL COMMENT '商品数量',
    `product_description` varchar(64) COMMENT '描述',
    `product_icon` varchar(512) COMMENT '商品小图',
    `create_time` timestamp NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
    `update_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
    PRIMARY KEY (`detail_id`),
    KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '订单详情表';