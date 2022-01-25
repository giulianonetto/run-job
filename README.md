# Run simulations

Standard script for running simulations using instructions from an `yaml` file. Depends on packages:

* [docopt](https://cran.r-project.org/web/packages/docopt/) (v. 0.7.1)
* [yaml](https://cran.r-project.org/web/packages/yaml/index.html) (v. 2.2.1)
* [logger](https://daroczig.github.io/logger/) (v. 0.2.2)

## Usage:

Assuming you are in the same path as the `run_simulation.R` script:

```
./run_simulation.R --instructions example-instructions.yaml --log my_useful_log_file.log
```


Not necessary, but I use [this docker image](https://hub.docker.com/r/giulianocruz/rstudio) (source files stored [here](https://github.com/giulianonetto/rstudio)).
