.PHONY: compile, run, clean, dut

dut:
	picker export --autobuild=true Adder.sv -w Adder.fst --sname Adder --tdir picker_out_adder --lang java -e --sim verilator
	mv picker_out_adder/example.java ./
	mv picker_out_adder/UT_Adder/*.jar ./

run: compile
	java -cp UT_Adder-java.jar:xspcomm-java.jar:. example

compile: example.java UT_Adder-java.jar xspcomm-java.jar
	javac -cp UT_Adder-java.jar:xspcomm-java.jar:. example.java

clean:
	rm example.class
