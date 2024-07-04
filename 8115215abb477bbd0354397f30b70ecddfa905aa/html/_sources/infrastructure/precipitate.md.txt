# precipitate_Ti_Alloys

Compiled in BSCC-scv7f0p.

1. Dependencies
```
module load openmpi/4.1.1_gcc11.1.0_cuda11.8
pip3 install requests --user
```

2. Download and compile *pond* framework:
```
source <(curl -s -S -L -k https://doc.run/pond/static/phpp_deploy.sh)
```

3. Login PD and pull *precipitate_Ti_Alloys*
```
pd login
pd pull precipitate_Ti_Alloys
```