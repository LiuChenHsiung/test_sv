SRC     = -f src.f
COMPOPT = -sverilog -cm line+tgl+fsm+cond+branch
SIMOPT  = -l simulation.log -cm line+cond+fsm+tgl+branch

all: comp sim1 sim2

clean:
	rm -rf comp_dir sim_dir/sim*/simv* sim_dir/sim*/ucli.key

cleanall: clean
	rm -rf sim_dir

comp:
	mkdir -p comp_dir
	cd comp_dir	; \
	ln -s ../dut.v . ;\
	ln -s ../tb.sv . ;\
	ln -s ../src.f . ;\
	vcs $(COMPOPT) $(SRC)

sim1:
	mkdir -p sim_dir/sim1
	cd sim_dir/sim1 ;\
	ln -s ../../comp_dir/simv* .	;\
	./simv $(SIMOPT) -cm_name test1 +testdata="1st World" >& term.log &

sim2:
	mkdir -p sim_dir/sim2
	cd sim_dir/sim2 ;\
	ln -s ../../comp_dir/simv* .	;\
	./simv $(SIMOPT) -cm_name test2 +testdata="2nd World" >& term.log &

sim3:
	mkdir -p sim_dir/sim3
	cd sim_dir/sim3 ;\
	ln -s ../../comp_dir/simv* .	;\
	./simv $(SIMOPT) -cm_name test3 >& term.log &

covrpt:
	cd comp_dir ;\
	urg -dir simv.vdb ;\
	firefox urgReport/dashboard.html &

