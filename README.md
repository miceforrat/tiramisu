本项目灵感来自于[toffee框架](https://github.com/XS-MLVP/toffee)，旨在对java参与验证的可能性进行探索。

当前仅支持java11，未来考虑向前支持java8以及向后支持java17等

## 项目构建

```bash
cd jxbinder && mvn clean install
```

执行上述命令后，会将本框架的内容安装到本地的maven仓。

## 添加依赖

目前本项目绑定aspectj，因此需要在`<dependencies></dependencies>`中添加本项目和aspectj的依赖：

```xml
    <dependency>
        <groupId>org.xaspect</groupId>
        <artifactId>binders</artifactId>
        <version>1.0.0</version>
    </dependency>

    <dependency>
        <groupId>org.aspectj</groupId>
        <artifactId>aspectjrt</artifactId>
        <version>1.9.7</version>
    </dependency>
```

类似地，需要在`<plugin></plugin>`中添加：

```xml
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>aspectj-maven-plugin</artifactId>
    <version>1.14.0</version>
    <configuration>
        <complianceLevel>11</complianceLevel>
        <source>11</source>
        <target>11</target>

        <aspectLibraries>
            <aspectLibrary>
                <groupId>org.xaspect</groupId>
                <artifactId>binders</artifactId>
            </aspectLibrary>
        </aspectLibraries>
        <verbose>true</verbose>
        <showWeaveInfo>true</showWeaveInfo>

    </configuration>
    <executions>
        <execution>
            <goals>
                <goal>compile</goal>
                <goal>test-compile</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

从而，可以引入我们的执行切面。

## DUT打包并集成到项目中

本框架目前依赖于picker工具对DUT进行打包：

```bash
picker export --autobuild=true $(VSRC_DIR)/$(NAME).v \
    -w $(NAME).$(WAVE_FORMAT) \
    --sname $(NAME) \
    --tdir picker_out_$(NAME_L) \
    --lang $(TARGET_LANG) \
    --sim $(SIM) \
    -e -c
```

找到对应模块名的jar包，放入lib目录下，或者通过maven安装到本地仓库。

如果放入lib目录下，可以在**pom.xml**中添加以下内容