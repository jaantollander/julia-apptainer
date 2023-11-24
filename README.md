# Julia Apptainer Example
Example of installing Julia package inside an Apptainer container and running it from the container.


## Usage
Build the base Julia container image.

```sh
./app base
```

Build the container image for the Julia package using the base image.

```sh
./app build
```

Run the Julia package via command line from the container image.

```sh
./app run --help
./app run --input examples/1 examples/2
```

Setting `DEPOT_PATH`

Install dependencies to the default location inside the container.
It will be read-only at run time.

