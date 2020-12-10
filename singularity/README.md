# Building Singularity image with CellProfiler 4.0.7

## Build a sandbox version from def file

```
sudo singularity build --sandbox cp4 cp4_ubuntu16.def
```

## Install Xorg and CellProfiler in sandbox

+ Enter the sandbox with
```
sudo singularity shell --writable cp4
```

+ Install `Xorg` and `CellProfiler` into the sandbox
```
apt-get install -y xorg
```
Enter the keyboard layout of your preference during installation.

+ Install `CellProfiler` via `pip`
```
python3.8 -m pip install cellprofiler
```

## Fix sandbox to a singularity image

```
sudo singularity build cp4.sif cp4
```
