#!/bin/bash

script_dir=$(dirname $(realpath $0))

share_dir=$(zuspec synth.sv.share)

#PYTHONMALLOC=malloc valgrind --tool=memcheck python3 -m zuspec.cli synth.sv.actor ${script_dir}/hello_world.pss -action pss_top::Hello
#PYTHONMALLOC=malloc gdb --args python3 -m zuspec.cli synth.sv.actor ${script_dir}/hello_world.pss -action pss_top::Hello
zuspec synth.sv.actor ${script_dir}/hello_world.pss -action pss_top::Hello
if test $? -ne 0; then exit 1; fi

vlib work
vlog -sv \
	+incdir+${share_dir}/include/zsp/sv/zsp_sv \
	${share_dir}/include/zsp/sv/zsp_sv/zsp_sv.sv \
	pss_top_sv.sv \
	top.sv
if test $? -ne 0; then exit 1; fi

vopt -o top_opt top
if test $? -ne 0; then exit 1; fi

(set -o pipefail ; vsim -batch -do "run -a; quit -f" top_opt 2>&1 | tee sim.log)
if test $? -ne 0; then exit 1; fi

c=$(grep 'Hello World!' sim.log | wc -l)
if test $c -eq 1; then 
  echo "PASS hello_world: found expected output"
else
  echo "FAIL hello_world: missing expected output"
  exit 1; 
fi