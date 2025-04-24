#!/bin/bash

script_dir=$(dirname $(realpath $0))

share_dir=$(zuspec synth.sv.share)

#PYTHONMALLOC=malloc valgrind --tool=memcheck python3 -m zuspec.cli synth.sv.actor -d ${script_dir}/hello_world.pss -action pss_top::Hello
#PYTHONMALLOC=malloc gdb --args python3 -m zuspec.cli synth.sv.actor -d ${script_dir}/hello_world.pss -action pss_top::Hello
zuspec synth.sv.actor ${script_dir}/hello_world.pss -action pss_top::Hello
#PYTHONMALLOC=malloc valgrind --tool=memcheck python3 -m zuspec.cli synth.sv.actor ${script_dir}/hello_world.pss -action pss_top::Hello
if test $? -ne 0; then exit 1; fi

verilator --binary -o simv -Wno-fatal -j $(nproc) \
	+incdir+${share_dir}/include/zsp/sv/zsp_sv \
	${share_dir}/include/zsp/sv/zsp_sv/zsp_sv.sv \
	pss_top_sv.sv \
	${script_dir}/top.sv
if test $? -ne 0; then exit 1; fi

(set -o pipefail ; ./obj_dir/simv 2>&1 | tee sim.log)
if test $? -ne 0; then exit 1; fi

c=$(grep 'Hello World!' sim.log | wc -l)
if test $c -eq 1; then 
  echo "PASS hello_world[vlt]: found expected output"
else
  echo "FAIL hello_world[vlt]: missing expected output"
  exit 1; 
fi
