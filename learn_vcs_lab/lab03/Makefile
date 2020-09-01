SRC     = -f src.f
COMPOPT = -sverilog
SIMOPT  = +testdata="New World"

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
	./simv -l simulation.log +testdata="1st World" >& term.log &

sim2:
	mkdir -p sim_dir/sim2
	cd sim_dir/sim2 ;\
	ln -s ../../comp_dir/simv* .	;\
	./simv -l simulation.log +testdata="2nd World" >& term.log &

