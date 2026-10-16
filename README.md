# ensta_3gele

## Connection

ssh into your IT server

## Installation

```bash
cd $HOME
mkdir workspace
cd workspace
wget https://github.com/ghdl/ghdl/releases/download/v0.37/ghdl-0.37-ubuntu16-mcode.tgz
tar -xvf ghdl-0.37-ubuntu16-mcode.tgz --one-top-level
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gnat-4.9/libgnat-4.9_4.9.3-3ubuntu5_amd64.deb
mkdir -p libgnat && dpkg-deb -x libgnat-4.9_4.9.3-3ubuntu5_amd64.deb libgnat
cp -a libgnat/usr/lib/x86_64-linux-gnu/libgnat-4.9.so* ghdl-0.37-ubuntu16-mcode/lib/
git clone https://github.com/Erickink/ensta_3gele.git
```

## Run

```bash
cd ensta_3gele/tp4
export PATH=$HOME/workspace/ghdl-0.37-ubuntu16-mcode/bin:$PATH
export LD_LIBRARY_PATH=$HOME/workspace/ghdl-0.37-ubuntu16-mcode/lib:$LD_LIBRARY_PATH

make half_adder
make half_adder_simulation

make full_adder
make full_adder_simulation

make adder_8bit
make adder_8bit_simulation
```
