# toffee-java 探索记录
本文档旨在记录java版本的toffee尝试过程中遇到的问题

## 环境配置
前置条件：[picker](https://github.com/XS-MLVP/picker)。

按照仓库的方式下载安装，会自动安装相关的依赖。

注意，需要在命令中开启java语言支持：

```bash
    BUILD_XSPCOMM_SWIG=python,java,scala,golang make wheel
```

## demo

### 简单加法器

```verilog
module Adder #(
    parameter WIDTH = 64
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input cin,
    output [WIDTH-1:0] sum,
    output cout
);

assign {cout, sum}  = a + b + cin;

endmodule

```
我们创建了一个简单加法器，存储在了adder.sv中。需要对其进行编译

```bash
picker export --autobuild=true Adder.sv -w Adder.fst --sname Adder --tdir picker_out_adder --lang java -e --sim verilator
```

得到的路径形如
```plainText
Adder
|-- Adder.sv
|-- Adder.fst
|-- picker_out_adder
|   |-- example.java
|   |-- signals.json
|   |-- UT_Adder
        |-- UT_Adder-java.jar
        |-- xspcomm-java.jar
```
其中，example\.jar是\-e选项提供的例子，UT\_Adder\-java\.jar是打包的待测用例（DUT），xspcomm\-java.jar则是java语言的统一接口支持。

可以通过lib的方式引入依赖
