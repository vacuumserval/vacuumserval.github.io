# BSCC

4th July 2024, N26 Region, Nvidia V100

## Python (mamba)

[Mamba](https://mamba.readthedocs.io/en/latest/index.html) is a fast, robust, and cross-platform package manager. [Miniforge](https://github.com/conda-forge/miniforge) is installed in BSCC servers.

1. SSH login to BSCC
```
ssh scv7f0p@BSCC-N26@ssh.cn-zhongwei-1.paracloud.com -p 22
```

2. Retrieve miniforge installer and install
```
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
(PATH=~/run/.miniforge3)
conda config --set auto_activate_base false
```

3. Create environment and config
```
mamba create -n microTi python=3.12
mamba activate microTi
mamba install numpy scipy matplotlib pymatgen matminer -c conda-forge
```

## VASP

modulefile

```
#%Module1.0

conflict vasp
module load gcc/11.1.0 fftw/3.3.8 nvhpc/nvhpc/23.7
set apphome   /data/home/scv7f0p/run/.vasp/6.4.3
prepend-path PATH            $apphome/bin
prepend-path LD_LIBRARY_PATH $apphome/lib64
prepend-path LD_LIBRARY_PATH $apphome/lib
prepend-path CPATH           $apphome/include
```

compile job
```
#!/bin/bash
module load vasp/6.4.3
make DEPS=1 all -j20
```

### VASPKIT


## LAMMPS

Just `module load lammps/blahblah`