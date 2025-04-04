## Electromechanical Dynamic Code

**ElectroM: Electromechanical Dynamic Code** is a Matlab code designed to simulate the nonlinear dynamics of typical electromechanical systems. This package includes two physical-mathematical models:
- **Full-order model:** Considers the mutual interaction between electrical and mechanical sub-systems, resulting in a coupled system of ODEs.
- **Reduced-order model:** Considers only the influence of the mechanical sub-systems on the electrical one, resulting in a decoupled system of ODEs.

<p align="center">
<img src="logo/CartMotorCircuit.png" width="60%">
</p>

### Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Documentation](#documentation)
- [Reproducibility](#reproducibility)
- [Authors](#authors)
- [Citing ElectroM](#citing-electrom)
- [License](#license)
- [Institutional support](#institutional-support)
- [Funding](#funding)

### Overview
**ElectroM** was used to generate the results reported in the following works:
- **A. Cunha Jr, M. Pereira, R. Avanço, A. M. Tusset, and J. M. Balthazar**, *ElectroM: ElectroMechanical dynamic code*, Software Impacts, 17:100533, 2023. <a href="https://doi.org/10.1016/j.simpa.2023.100533" target="_blank">DOI</a>
- **A. Cunha Jr, M. Pereira, R. Avanço, A. M. Tusset, and J. M. Balthazar**, *On the modeling of nonlinear electromechanical systems*, Meccanica, 57:2679-2697, 2022. <a href="https://doi.org/10.1007/s11012-022-01542-4" target="_blank">DOI</a>
- **R. H. Avanço, D. A. Zanella, A. Cunha Jr, A. M. Tusset, J. M. Balthazar**, *A Tutorial on the Simplification of Electromechanical Dynamic Models*, In: Balthazar, JM (eds), Nonlinear Vibrations Excited by Limited Power Sources. Mechanisms and Machine Science, vol 116. Springer, Cham, 2022. <a href="https://doi.org/10.1007/978-3-030-96603-4_1" target="_blank">DOI</a> 

Preprint available <a href="https://hal.archives-ouvertes.fr/hal-03648813" target="_blank">here</a>. 

### Features
- Simulates nonlinear dynamics of electromechanical systems
- Includes full-order and reduced-order models
- Considers mutual interaction between electrical and mechanical sub-systems in the full-order model
- Decouples electrical and mechanical sub-systems in the reduced-order model
- Calculates dimensionless groups for electromechanical systems
- Provides easy-to-understand, well-commented code
- Offers educational style code implementation for intuitive use

### Usage
To started with **ElectroM**, follow these steps:
1. Clone the repository:
   ```bash
   git clone https://github.com/americocunhajr/ElectroM.git
   ```
2. Navigate to the code directory:
   ```bash
   cd ElectroM/ElectroM-1.0
   ```
3. To simulate both dynamical systems, execute:
   ```bash
   main_ElectroM_ivp
   ```
4. To perform Fourier analysis, execute:
   ```bash
   main_ElectroM_fourier
   ```
5. To compute dimensionless parameters value, execute:
   ```bash
   main_ElectroM_dimensionless
   ```
6. To compute dimensionless groups, execute:
   ```bash
   main_ElectroM_pi_groups
   ```

### Documentation
**ElectroM** routines are thoroughly commented to explain their functionality to the user. Each routine includes a short description of its purpose and a list of inputs and outputs.

### Reproducibility
Simulations done with **ElectroM** are fully reproducible. You can access a reproducible capsule of the simulations on <a href="https://codeocean.com/capsule/2532343/tree/v1" target="_blank">CodeOcean</a>.

### Authors
- Americo Cunha Jr
- Marcelo Pereira
- Rafael Avanço
- Angelo Marcelo Tusset
- José Manoel Balthazar

### Citing ElectroM
If you use **ElectroM** in your research, please cite the following publications:
- *A. Cunha Jr, M. Pereira, R. Avanço, A. M. Tusset, and J. M. Balthazar, ElectroM: ElectroMechanical dynamic code, Software Impacts, 17:100533, 2023 https://doi.org/10.1016/j.simpa.2023.100533*
- *A. Cunha Jr, M. Pereira, R. Avanço, A. M. Tusset, and J. M. Balthazar, On the modeling of nonlinear electromechanical systems, Meccanica, 57:2679-2697, 2022 https://doi.org/10.1007/s11012-022-01542-4*
- *R. H. Avanço, D. A. Zanella, A. Cunha Jr, A. M. Tusset, J. M. Balthazar, A Tutorial on the Simplification of Electromechanical Dynamic Models, In: Balthazar, JM (eds), Nonlinear Vibrations Excited by Limited Power Sources. Mechanisms and Machine Science, vol 116. Springer, Cham, 2022 https://doi.org/10.1007/978-3-030-96603-4_1*

```
@article{CunhaJr2023ElectroM,
   author  = {A. Cunha Jr and M. Pereira and R. Avanço and A. M. Tusset and J. M. Balthazar},
   title   = "{ElectroM: Electromechanical Dynamic Code}",
   journal = {Software Impacts},
   year    = {2023},
   volume  = {17},
   pages   = {100533},
   doi     = {10.1016/j.simpa.2023.100533},
}
```

```
@article{CunhaJr2022p2679,
   author  = {A. Cunha Jr and M. Pereira and R. Avanço and A. M. Tusset and J. M. Balthazar},
   title   = {On the reduction of nonlinear electromechanical systems},
   journal = {Meccanica},
   year    = {2022},
   volume  = {57},
   pages   = {2679-2697},
   doi     = {10.1007/s11012-022-01542-4},
}
```

```
@Inbook{Avanço2022bookchap,
author    = {Avan{\c{c}}o, Rafael Henrique and Zanella, Danilo Antonio and Cunha, Americo and Tusset, Angelo Marcelo and Balthazar, Jose Manoel},
editor    = {Balthazar, Jose Manoel},
title     = "{A Tutorial on the Simplification of Electromechanical Dynamic Models}",
bookTitle = {Nonlinear Vibrations Excited by Limited Power Sources},
year      = {2022},
publisher = {Springer International Publishing},
address   = {Cham},
pages.    = {3--14},
doi       = {10.1007/978-3-030-96603-4_1},
}
```

### License
**ElectroM** is released under the MIT license. See the LICENSE file for details. All new contributions must be made under the MIT license.

<img src="logo/mit_license_red.png" width="10%"> 

### Institutional support

<img src="logo/logo_uerj.png" width="13%"> &nbsp; &nbsp; <img src="logo/logo_senai_color.png" width="25%"> &nbsp; &nbsp; <img src="logo/logo_ufma.png" width="10%"> &nbsp; &nbsp;  <img src="logo/logo_utfpr_color.png" width="20%"> &nbsp; &nbsp; <img src="logo/logo_unesp_color.png" width="25%">

### Funding

<img src="logo/faperj.png" width="20%"> &nbsp; &nbsp; <img src="logo/cnpq.png" width="20%"> &nbsp; &nbsp; <img src="logo/capes.png" width="10%">
