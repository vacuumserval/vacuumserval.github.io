<head>
    <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            tex2jax: {
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
            inlineMath: [['$','$']]
            }
        });
    </script>
</head>

# ENV: Environment Setup

## Conda Setup

Conda is an open-source, cross-platform, language-agnostic package manager and environment management system. It was originally developed to solve difficult package management challenges faced by Python data scientists, and today is a popular package manager for Python and R. To (efficiently) use Python, the first thing we need to do is to install [(mini)conda]((https://docs.conda.io/projects/miniconda/en/latest)), by simply downloading the [latest miniconda installer](https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe), clicking "next", until you see and check the "Register Miniconda3 as my default Python 3.11" option in the "Advanced Installation Options" step.

![miniconda](./images/minicondaadvanceinstall.png "miniconda")

## Mamba Setup

Mamba is a fast(er), robust(er), and cross-platform package manager, (compared to conda), we use mamba to solve the strange dependency problems in our Maching Learning system: 

To setup and use Conda/Mamba, the "Anaconda prompt" app should be called.

![condaapp](./images/app.png "condaapp")

1. Update conda
```
conda update conda
```

![condaupdate](./images/condaupdate.png "condaupdate")

2. Install and setup Mamba-solver
```
conda install -n base conda-libmamba-solver
conda config --set solver libmamba
conda install mamba -n base -c conda-forge
```

![condamamba](./images/condamamba.png "condamamba")

in the last step you may wait a long time and see a lot updates, that's normal.

![condamamba2](./images/condamamba2.png "condamamba2")

## New Environment Setup

To create an isolated environment, with a name, say, "mge" (for materials genome engineering) based on python version 3.10, the command is
```
mamba create -n mge python=3.10
```

![mambaenv](./images/mambaenv.png "mambaenv")

Then we need to activate the "mge" environment
```
mamba activate mge
```

![mambamge](./images/mambamge.png "mambamge")

Noticed that the prefix braket has been changed to "(mge)".

Then we just need to follow the [matminer](https://hackingmaterials.lbl.gov/matminer/installation.html), [pymatgen](https://pymatgen.org/installation.html), [scikit-learn](https://scikit-learn.org/stable/install.html), [pytorch](https://pytorch.org/get-started/locally/) instructions to install them. 

Since pytorch has the most complex dependencies and is not in the same repository, we postpone the setup for pytorch at this moment.
<!-- ```
mamba install pytorch torchvision torchaudio cpuonly -c pytorch
```

![mambatorch](./images/mambatorch.png "mambatorch") -->

The other packages can be installed together (BTW, the `mamba install package_name -c blahblah` command means from 'blahblah' repository we install the package.):
```
mamba install scikit-learn pymatgen matminer numpy scipy matplotlib -c conda-forge
```
![mambamge2](./images/mambamge2.png "mambamge2")

during the installation you may see alerts in red, that's package "conflict" and mamba is solving it.

![mambaconflict](./images/mambaconflict.png "mambaconflict")

You may want to check your package is working properly by input some test command, e.g., the [十分钟|通过sklearn上手你的第一个机器学习实例](https://zhuanlan.zhihu.com/p/80186372),

```
import sklearn.datasets as sk_datasets
from sklearn.datasets import load_iris
iris = sk_datasets.load_iris()
iris_X = iris.data
iris_y = iris.target
dir(load_iris())
```

And you may see the "iris-database":

![irisdata](./images/irisdata.png "irisdata")