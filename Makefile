SHELL := /bin/bash

ROOT_DIR := $(shell pwd)
#本地数据库连接,主要用于生成model和query
MYSQL_DSN := root:root@tcp(127.0.0.1:3306)/mf02

gen_orm_model:
	@gentool -dsn "${MYSQL_DSN}?charset=utf8mb4&parseTime=True&loc=Local" -outPath=${ROOT_DIR}/internal/data/mysql/model/ -onlyModel -fieldWithIndexTag -fieldNullable


.PHONY: gen_orm_model
