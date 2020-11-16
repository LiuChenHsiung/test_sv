SRC     = -f src.f
COMPOPT = -sverilog -cm line+tgl+fsm+cond+branch -cm_report noinitial
SIMOPT  = -l simulation.log -cm line+cond+fsm+tgl+branch +dump

all: comp sim

clean:
	rm -rf comp_dir/csrc comp_dir/simv comp_dir/simv.daidir
	rm -rf sim_dir/csrc sim_dir/simv sim_dir/simv.daidir sim_dir/ucli.key
	rm -rf sim_dir/verdiLog sim_dir/novas*

cleanall: clean
	rm -rf comp_dir sim_dir final_cov

comp:
	mkdir -p comp_dir
	cd comp_dir	; \
	ln -s ../bcd_counter.v . ;\
	ln -s ../bcd_2digit.v . ;\
	ln -s ../tb.sv . ;\
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

covmerge:
	mkdir -p final_cov ;\
	cd final_cov ;\
	cp -r ../../lab06/comp_dir/simv.vdb ./bcd_counter.vdb ;\
	cp -r ../comp_dir/simv.vdb ./bcd_2digit.vdb ;\
	urg -dir bcd_2digit.vdb -dir bcd_counter.vdb -map bcd_counter -dbname merged.vdb ;\
	firefox urgReport/dashboard.html &

verdi:
	cd sim_dir ;\
	verdi -sv $(SRC) &

