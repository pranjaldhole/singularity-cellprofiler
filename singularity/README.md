# Building Singularity image with CellProfiler 4

**Note**: At the time of writing this, the working version of CellProfiler was 4.0.7

## Build singularity image

### Bulding the singularity image

+ Build the singularity image with
```
sudo singularity build cp4.sif cp4_ubuntu16.def
```

## Sandbox version

### Building the sandbox

+ Build a sandbox version from `.def` file
```
sudo singularity build --sandbox cp4 cp4_ubuntu16.def
```

### Installing required packages inside the sandbox

+ Enter the sandbox with
```
sudo singularity shell --writable cp4
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
sudo singularity build cp4.sif cp4
```

## Run CellProfiler

+ Enter singularity container with

```
singularity shell --writable cp4.sif
```

+ Inside the singularity shell, check `CellProfiler` version with
```
cellprofiler --version
```

+ Run `CellProfiler` with
```
cellprofiler
```
