LOCK TABLES `zt_config` WRITE;
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','host','{{SMTP_HOST}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','port','{{SMTP_PORT}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','auth','1');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','username','{{SMTP_USER}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','password','{{SMTP_PASS}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','secure','');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','debug','1');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','smtp','charset','utf-8');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','','turnon','{{SMTP_ENABLED}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','','mta','smtp');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','','async','0');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','','fromAddress','{{SMTP_USER}}');
REPLACE INTO `{{TABLE_PREFIX}}config` (`vision`,`owner`,`module`,`section`,`key`,`value`) VALUES ('','system','mail','','domain','{{PROTOCOL_TYPE}}://{{APP_DOMAIN}}:{{APP_DEFAULT_PORT}}');
UNLOCK TABLES;
