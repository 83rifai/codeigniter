CREATE TABLE `m_user_types` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`code` varchar(5) NOT NULL,
`name` varchar(150) NULL,
`is_active` tinyint(1) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `m_users` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`m_user_type_id` int(11) NULL,
`identity_no` varchar(150) NOT NULL,
`name` varchar(150) NULL,
`is_active` tinyint(1) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `m_user_logins` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`m_user_id` int(11) NULL,
`username` varchar(150) NOT NULL,
`password` varchar(150) NOT NULL,
`is_active` tinyint(1) NOT NULL DEFAULT 1,
PRIMARY KEY (`id`, `username`, `password`) 
);

CREATE TABLE `m_menu` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`parent_id` int(11) NOT NULL DEFAULT 0,
`name` varchar(150) NOT NULL,
`url` varchar(255) NULL,
`icon` varchar(150) NULL,
`is_active` tinyint(1) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `m_menu_akses` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`m_user_type_id` int(11) NULL,
`m_menu_id` int(11) NULL,
`create` tinyint(1) NOT NULL DEFAULT 0,
`edit` tinyint(1) NOT NULL DEFAULT 0,
`delete` tinyint(1) NOT NULL DEFAULT 0,
`print` tinyint(1) NULL,
`pdf` tinyint(1) NULL,
`excel` tinyint(1) NULL,
`is_active` tinyint(1) NULL DEFAULT 1,
PRIMARY KEY (`id`) 
);

CREATE TABLE `m_type_pembayaran` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`code` varchar(10) NULL,
`name` varchar(150) NULL,
`desc` text NULL,
`is_active` tinyint(1) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `t_tagihan_header` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`code` varchar(50) NOT NULL,
`expired` date NOT NULL,
`is_active` tinyint(1) NULL
);

CREATE TABLE `t_tagihan_detail` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`m_payment_type_id` int(11) NOT NULL,
`ammount` int(11) NOT NULL,
`is_active` tinyint(1) NULL,
`t_inovice_header_id` int(11) NOT NULL
);

CREATE TABLE `t_bayar_tagihan` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`t_invoice_header_id` int(11) NULL,
`date` date NULL,
`code` varchar(50) NULL,
`paid` int(11) NOT NULL,
`is_active` tinyint(1) NULL
);


ALTER TABLE `m_user_types` ADD CONSTRAINT `fk_m_user_types_m_user_1` FOREIGN KEY (`id`) REFERENCES `m_users` (`m_user_type_id`);
ALTER TABLE `m_users` ADD CONSTRAINT `fk_m_users_m_user_logins_1` FOREIGN KEY (`id`) REFERENCES `m_user_logins` (`m_user_id`);
ALTER TABLE `m_menu` ADD CONSTRAINT `fk_m_menus_m_menu_accesses_1` FOREIGN KEY (`id`) REFERENCES `m_menu_akses` (`m_menu_id`);
ALTER TABLE `m_user_types` ADD CONSTRAINT `fk_m_user_types_m_menu_accesses_1` FOREIGN KEY (`id`) REFERENCES `m_menu_akses` (`m_user_type_id`);
ALTER TABLE `t_tagihan_header` ADD CONSTRAINT `fk_t_invoice_headers_t_invoice_details_1` FOREIGN KEY (`id`) REFERENCES `t_tagihan_detail` (`t_inovice_header_id`);
ALTER TABLE `m_type_pembayaran` ADD CONSTRAINT `fk_m_payment_types_t_invoice_details_1` FOREIGN KEY (`id`) REFERENCES `t_tagihan_detail` (`m_payment_type_id`);
ALTER TABLE `t_tagihan_header` ADD CONSTRAINT `fk_t_invoice_headers_t_paid_invoices_1` FOREIGN KEY (`id`) REFERENCES `t_bayar_tagihan` (`t_invoice_header_id`);

