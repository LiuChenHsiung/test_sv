SRC     = -f src.f
COMPOPT = -sverilog
SIMOPT  = +testdata="New World" +dump

all: comp sim

clean:
	rm -rf csrc simv* ucli.key verdiLog novas.conf novas.rc

cleanall: clean
	rm -rf *.log waveform.fsdb

comp:
	vcs $(COMPOPT) $(SRC)

sim:
	./simv -l simulation.log $(SIMOPT)

verdi:
	verdi -sv $(SRC) &

