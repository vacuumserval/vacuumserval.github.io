## Finite Displacement

### 1. Relaxation

```
vaspkit -task 103
vaspkit 1 101 LR 
vaspkit 1 102 1 0.03
```

in INCAR, set
```
EDIFF = 1E-8
```

### 