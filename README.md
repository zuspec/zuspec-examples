# zuspec-examples
Examples of Zuspec usage and applications

Note: Linux is the only OS currently supported. 

## Setup
This project uses [IVPM](https://fvutils.github.com/ivpm) to fetch 
its dependencies and build a Python virtual environment. The
`bootstrap.sh` script performs the needed steps for environments
that do not have IVPM pre-installed.

```bash
% ./bootstrap.sh
```

Once packages are loaded, activate the PYthon virtal environment
and configure other environment variables.

```bash
% ./packages/python/bin/ivpm activate
```

Confirm that both `zuspec` and `verilator` are present in your path.


## Running Examples
Each example comes with a set of `runit` scripts. Examples that use
a SystemVerilog simulator will be provided with several simulator-specific
run scripts:

- runit_mti.sh - Uses Siemens Questa
- runit_vlt.sh - Uses Verilator
- runit_vcs.sh - Uses Synopsys VCS
- runit_xcm.sh - Uxes Cadence Xcelium

The setup instructions above configure Verilator in the path. The user is
responsible for configuring other tools.