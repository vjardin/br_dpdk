# Buildroot with External DPDK Package

This guide provides instructions for building a Buildroot system with the `DPDK` package included as an external package.

## Prerequisites

- Familiarity with Buildroot and its build system.
- Access to the necessary repositories and permissions to clone them.

## Setup Instructions

### 1. Clone the Required Repositories

First, clone the `br_dpdk` repository. The `br_dpdk` repository contains the
necessary files to include the `DPDK` package in your Buildroot build.

```bash
git clone git@github.com:vjardin/br_dpdk.git
```

### 2. Configure Buildroot

To include the `DPDK` package, use the `BR2_EXTERNAL` environment variable. This variable allows you
to specify additional external directories that contain custom configurations and packages.

Set the `BR2_EXTERNAL` variable to include other directories if needed:

```bash
export BR2EXT=path/to/br_anypackage:path/to/br_dpdk
```

`BR2EXT` will be used as you `BR2_EXTERNAL` into the following section.

### 3. Set Up an External Output Directory

Define an output directory where Buildroot will store all build artifacts. This directory can be named `br_build1` and should
be writable:

```bash
export BUILDROOT_OUTPUT=~/br_build1
export BUILDROOT_DOWNLOAD=~/br_dlcache
```

Create an alias to simplify build commands, which ensures the use of the specified output directory:

```bash
alias brmake="BR2_DL_DIR=$BUILDROOT_DOWNLOAD make O=$BUILDROOT_OUTPUT"
```

### 4. Build the System

With the external paths set, proceed to build the system. Using the `brmake` alias (which
should be set up to include the `O` option for an external output directory), build the
system with the `-j` flag to utilize all available processors:

```bash
brmake BR2_EXTERNAL=${BR2EXT} -j$(nproc --all)
```

When you build it for any of the Buildroot target, you shall enable:
```
BR2_PACKAGE_DPDK=y
```
for your Buildroot's config.

## Additional Resources

For more detailed information on working with external packages in Buildroot, refer to the official Buildroot documentation:

- [Buildroot External Packages Documentation](https://buildroot.org/downloads/manual/manual.html#outside-br-custom)

# Buildroot upstream

Once DPDK has been fine-tuned as an external package, it should be submitted
upstream to the Buildroot project.

```
 ...
utils/docker-run make check-package
git format-patch -M -n -s -o ../outgoing origin/master
utils/get-developers ../outgoing/*
git send-email --to buildroot@buildroot.org --cc "xyz from get-developers" ../outgoing/00X-filename
```
