# Serialist Max

This repo contains Max externals for every `Generative` in [Serialist](https://github.com/jobor019/serialist/). 


## Project Status

The project is currently in development and does not have a stable API. Expect breaking changes. 

Documentation is incomplete for certain externals, but maxhelps are provided for every external.


## Installation

The project should ideally be installed (or symlinked) in the `~/Documents/Max 9/Packages/`.

```bash
git clone --recursive git@github.com:jobor019/serialist-max.git
cd serialist-max
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release --target all_externals
```

## License

Once the first official release (1.0.0) is released, the library will be distributed under the MIT license.