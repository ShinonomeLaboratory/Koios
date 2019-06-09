CREATE SCHEMA `koios` DEFAULT CHARACTER SET utf8 ;

--- 创建元数据表
CREATE TABLE `koios`.`T_META` (
  `F_ID` INT UNSIGNED NOT NULL COMMENT 'ID of the table',
  `F_NAME` VARCHAR(45) NOT NULL COMMENT 'Name of the table',
  `F_DIM` INT NOT NULL COMMENT 'Dimension of the data',
  `F_PCA_MAT` JSON NOT NULL COMMENT 'PCA matrix of the data',
  `F_DIST_STAT` JSON NULL COMMENT 'Distance statistics information',
  `F_COMMENT` JSON NULL COMMENT 'Other information of this table',
  PRIMARY KEY (`F_ID`),
  UNIQUE INDEX `F_ID_UNIQUE` (`F_ID` ASC) VISIBLE,
  UNIQUE INDEX `F_NAME_UNIQUE` (`F_NAME` ASC) VISIBLE
);

--- 创建数据表的模版
CREATE TABLE `koios`.`T_DATA_{{ table_name }}` (
    `F_ID` INT UNSIGNED NOT NULL COMMENT 'ID of the table',
    {% for dim in dimensions %}
    `F_INDEX_{{ dim }}` BIGINT NOT NULL COMMENT 'Index {{ dim }} of this data',
    {% endfor %}
    `F_DATA` JSON NULL COMMENT 'Vector data',
    `F_COMMENT` JSON NULL COMMENT 'Other information of this data',
    PRIMARY KEY (`F_ID`)
);

