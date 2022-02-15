# Building Singularity image with CellProfiler 4

**Note**: At the time of writing this, the working version of CellProfiler was 4.2.1

## Build singularity image

### Bulding the singularity image

+ Build the singularity image with
```
sudo singularity build cellprofiler4.sif cp4_ubuntu20.def
```

## Sandbox version

### Building the sandbox

+ Build a sandbox version from `.def` file
```
sudo singularity build --sandbox cellprofiler4 cp4_ubuntu20.def
```

### Installing required packages inside the sandbox

+ Enter the sandbox with
```
sudo singularity shell --writable cellprofiler4
```

+ Install necessary packages into the sandbox
```(bash)
apt-get install -y package_name
```

+ Exit the singularity shell mode with
```
exit
```

### Fix sandbox to a singularity image

```
sudo singularity build cellprofiler4.sif cellprofiler4
```

## Run CellProfiler

+ Enter singularity container with

```
singularity shell cellprofiler4.sif
```

+ Inside the singularity shell, check `CellProfiler` version with
```
cellprofiler --version
```

+ Run `CellProfiler` with
```
cellprofiler
```

## Running CellProfiler as native app

+ Create two directories
```
mkdir libexec bin
```

+ Pull the singularity image with
```
singularity pull --arch amd64 libexec/cellprofiler4.sif library://pranjaldhole/cv/cellprofiler4:cellprofiler
```
You can find the image on singularity hub [here](https://cloud.sylabs.io/library/pranjaldhole/cv/cellprofiler4).

+ Create an executable and make it executable and put it in the same folder as `.sif` file:
```
cat >libexec/cellprofiler.sh<<"EOF"
#!/bin/bash
export SINGULARITY_BINDPATH="$HOME/fileservers/chd"
dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
img="cellprofiler4.sif"
cmd=$(basename "$0")
arg="$@"
singularity exec "${dir}/${img}" $cmd $arg
EOF
```
```
chmod 755 libexec/cellprofiler.sh
```
+ Create symlinks in bin directory for apps within image you want to run
```
ln -s ../libexec/cellprofiler.sh bin/cellprofiler
```

+ Here is how the directory structure should look like
```
.
├── bin
│   └── cellprofiler -> ../libexec/cellprofiler.sh
└── libexec
    ├── cellprofiler4.sif
    └── cellprofiler.sh
```
+ Add the following line to your `.bashrc` and source the `.bashrc` file or open a new terminal. Change the path to appropriate `bin` directory.
```
export PATH=$PATH:$HOME/path_to_repo/cellprofiler/bin
```
+ Test the location of the app with
```
$ which cellprofiler
> export /home/user/path_to_cellprofiler_dir/bin/cellprofiler
```
+ Now you can run `cellprofiler` from the image as if its native app. Test `CellProfiler` with
```
$ cellprofiler --version
> 4.2.1
```
or run `CellProfiler` with
```
cellprofiler
```
