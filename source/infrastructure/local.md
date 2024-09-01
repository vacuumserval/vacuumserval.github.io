# Local Server

19th Aug 2024, NVIDIA RTX A3000 (cc=8.6)

## Linux Mint 22

```
sudo apt-get install build-essential gfortran git cmake wget vim
sudo apt-get install libfftw3-mpi-dev libhdf5-openmpi-dev
sudo apt-get install libfftw3-dev libhdf5-dev
sudo apt-get install rsync voro++-dev libatomic-ops-dev environment-modules
sudo apt-get install libblas-dev liblapack-dev libxcb-cursor-dev
sudo apt-get install imagemagick ffmpeg python3-dev python3-pip
sudo apt-get install python3-numpy python3-scipy python3-matplotlib
sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev python3-gi gir1.2-appindicator3-0.1 autoconf libtool pkg-config
```

## MAMBA

[Mamba](https://mamba.readthedocs.io/en/latest/index.html) is a fast, robust, and cross-platform package manager. [Miniforge](https://github.com/conda-forge/miniforge) is installed in BSCC servers.

1. Retrieve miniforge installer and install
```
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
(PATH=~/run/.miniforge3)
conda config --set auto_activate_base false
```

2. Create environment and config
```
mamba create -n microTi python=3.12
mamba activate microTi
mamba install numpy scipy matplotlib pymatgen matminer sphinx sphinx_rtd_theme nbsphinx myst-parser sphinx-material -c conda-forge
```

## Node.js & slidev

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
nvm install 20
npm i -g @slidev/cli
```

## VASP

modulefile

### NVHPC

```
#%Module1.0

conflict vasp
module load nvhpc/24.7
set apphome /opt/vasp-6.4.3/nvhpc
prepend-path PATH            $apphome/bin
prepend-path LD_LIBRARY_PATH $apphome/lib64
prepend-path LD_LIBRARY_PATH $apphome/lib
prepend-path CPATH           $apphome/include
```

### INTEL

```
#%Module1.0

conflict vasp
module load compiler/2024.2.1 ifort/2024.2.1 mkl/2024.2 mpi/2021.13
set apphome /opt/vasp-6.4.3/intel
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

modulefile

### CUDA

```
#%Module1.0

conflict vasp
module load nvhpc/24.7
set apphome /opt/lammps-27Jun2024/cuda
prepend-path PATH            $apphome/bin
prepend-path LD_LIBRARY_PATH $apphome/lib64
prepend-path LD_LIBRARY_PATH $apphome/lib
prepend-path CPATH           $apphome/include
```

### INTEL

```
#%Module1.0

conflict vasp
module load compiler/2024.2.1 mkl/2024.2 mpi/2021.13
set apphome /opt/lammps-27Jun2024/intel
prepend-path PATH            $apphome/bin
prepend-path LD_LIBRARY_PATH $apphome/lib64
prepend-path LD_LIBRARY_PATH $apphome/lib
prepend-path CPATH           $apphome/include
```

compile job
```
cmake ../cmake -DCMAKE_INSTALL_PREFIX=/opt/lammps-27Jun2024/intel -DCMAKE_C_COMPILER=mpiicx -DCMAKE_CXX_COMPILER=mpiicpx -DBUILD_MPI=yes -DFFT=MKL -DPKG_AMOEBA=yes -DPKG_ASPHERE=yes -DPKG_BODY=yes -DPKG_BPM=yes -DPKG_BROWNIAN=yes -DPKG_CLASS2=yes -DPKG_COLLOID=yes -DPKG_COMPRESS=yes -DPKG_DIELECTRIC=yes -DPKG_DIFFRACTION=yes -DPKG_DIPOLE=yes -DPKG_DRUDE=yes -DPKG_EXTRA-PAIR=yes -DPKG_GRANULAR=yes -DPKG_H5MD=yes -DPKG_INTERLAYER=yes -DPKG_KOKKOS=yes -DPKG_KSPACE=yes -DPKG_LATBOLTZ=yes -DPKG_MANIFOLD=yes -DPKG_MANYBODY=yes -DPKG_MC=yes -DPKG_MEAM=yes -DPKG_MOLECULE=yes -DPKG_MOLFILE=yes -DPKG_MPIIO=yes -DPKG_OPENMP=yes -DPKG_OPT=yes -DPKG_ORIENT=yes -DPKG_PHONON=yes -DPKG_POEMS=yes -DPKG_REACTION=yes -DPKG_REAXFF=yes -DPKG_REPLICA=yes -DPKG_RIGID=yes -DPKG_SHOCK=yes -DPKG_SPH=yes -DPKG_VORONOI=yes  -DWITH_FFMPEG=yes
cmake ../cmake -DCMAKE_INSTALL_PREFIX=/opt/lammps-27Jun2024/cuda -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DBUILD_MPI=yes -DFFT=FFTW3 -DPKG_AMOEBA=yes -DPKG_ASPHERE=yes -DPKG_BODY=yes -DPKG_BPM=yes -DPKG_BROWNIAN=yes -DPKG_CLASS2=yes -DPKG_COLLOID=yes -DPKG_COMPRESS=yes -DPKG_DIELECTRIC=yes -DPKG_DIFFRACTION=yes -DPKG_DIPOLE=yes -DPKG_DRUDE=yes -DPKG_EXTRA-PAIR=yes -DPKG_GRANULAR=yes -DPKG_H5MD=yes -DPKG_INTERLAYER=yes -DPKG_KOKKOS=yes -DPKG_KSPACE=yes -DPKG_LATBOLTZ=yes -DPKG_MANIFOLD=yes -DPKG_MANYBODY=yes -DPKG_MC=yes -DPKG_MEAM=yes -DPKG_MOLECULE=yes -DPKG_MOLFILE=yes -DPKG_MPIIO=yes -DPKG_OPENMP=yes -DPKG_OPT=yes -DPKG_ORIENT=yes -DPKG_PHONON=yes -DPKG_POEMS=yes -DPKG_REACTION=yes -DPKG_REAXFF=yes -DPKG_REPLICA=yes -DPKG_RIGID=yes -DPKG_SHOCK=yes -DPKG_SPH=yes -DPKG_VORONOI=yes  -DWITH_FFMPEG=yes -DPKG_GPU=yes -DGPU_API=cuda -DGPU_ARCH=sm_86
```
