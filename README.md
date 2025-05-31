# 学生管理系统

学生管理系统

## 配置条件

- Java JDK 17.0.1
- MySQL 8.3
- Tomcat 10.1.19
- IntelliJ IDEA 2021.2

## 设置说明

2. 创建数据库：
   - 打开 MySQL 命令行或 MySQL Workbench
   - 运行 `src/main/resources/db/init.sql` 中的 SQL 脚本

3. 配置数据库连接：
   - 打开 `src/main/java/config/DBConfig.java`
   - 如有需要，更新数据库凭据：
     ```java
     public static final String URL = "jdbc:mysql://localhost:3306/你的数据库?useSSL=false&serverTimezone=UTC";
     public static final String USERNAME = "数据库账号";
     public static final String PASSWORD = "数据库密码";
     ```

4. 在 IntelliJ IDEA 中配置项目：
   - 在 IntelliJ IDEA 中打开项目
   - 配置 Tomcat 服务器：
     - 转到 Run → Edit Configurations
     - 点击 + 并选择 Tomcat Server → Local
     - 配置 Tomcat 安装目录
     - 将部署 Artifact 设置为 WAR 文件

5. 添加所需依赖：
   - 右键点击项目
   - 选择 "Open Module Settings"
   - 转到 Libraries
   - 添加以下依赖：
     - mysql-connector-java
     - jakarta.servlet-api-5.0.0

## 运行应用

1. 启动 MySQL 服务器
2. 在 IntelliJ IDEA 中运行应用
3. 访问应用程序：`http://localhost:8080/`

## 功能

- 学生登录
- 查看所有学生
- 添加新学生
- 编辑学生信息
- 删除学生

## 默认登录凭据

使用以下任一学号和密码登录：
- 学号：2024001，密码：password123
- 学号：2024002，密码：password123
- 学号：2024003，密码：password123 
