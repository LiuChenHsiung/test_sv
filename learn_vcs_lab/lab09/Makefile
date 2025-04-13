SRC     = -f src.f
#SRC    += +define+CORRECT
COMPOPT = -sverilog -cm line+tgl+fsm+cond+branch+assert -cm_report noinitial -debug_acc
SIMOPT  = -l simulation.log -cm line+cond+fsm+tgl+branch+assert +dump +fsdb+sva_success

all: comp sim

clean:
	rm -rf comp_dir/csrc comp_dir/simv comp_dir/simv.daidir
	rm -rf sim_dir/csrc sim_dir/simv sim_dir/simv.daidir sim_dir/ucli.key
	rm -rf sim_dir/verdiLog sim_dir/novas*

cleanall: clean
	rm -rf comp_dir sim_dir

comp:
	mkdir -p comp_dir
	cd comp_dir	; \
	ln -s ../bcd_counter.v . ;\
	ln -s ../bcd_2digit.v . ;\
	ln -s ../tb.sv . ;\
	ln -s ../sva_checker.sv . ;\
	ln -s ../src.f . ;\
	vcs $(COMPOPT) $(SRC)

sim:
	mkdir -p sim_dir
	cd sim_dir ;\
	ln -s ../comp_dir/* .	;\
	./simv $(SIMOPT) -cm_name test1

covrpt:
	cd comp_dir ;\
	urg -dir simv.vdb ;\
	firefox urgReport/dashboard.html &

verdi:
	cd sim_dir ;\
	verdi -sv $(SRC) &

