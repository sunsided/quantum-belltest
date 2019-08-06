# Q# - Bell Test Sample

## Installing the SDK / Runtime

The SDK is based on the `dotnet` tooling. Install Q# support (see [here](https://docs.microsoft.com/en-us/quantum/install-guide/command-line?view=qsharp-preview)) using:

```sh
dotnet new -i Microsoft.Quantum.ProjectTemplates
```

You can install the Visual Studio Code extension from [here](https://marketplace.visualstudio.com/items?itemName=quantum.quantum-devkit-vscode) by executing

```sh
ext install quantum.quantum-devkit-vscode
```

within Visual Studio Code.


## Bell Test Example

Following [Writing a Quantum Program](https://docs.microsoft.com/de-de/quantum/quickstart?tabs=tabid-vscode&view=qsharp-preview), to create a new project, run:

```sh
dotnet new console -lang Q# --output Bell
cd Bell 
code . # To open in Visual Studio Code.
```

You can build and run it on the command line using

```sh
dotnet build
dotnet run
```

## Example output

Here's an example of the program output:

```text
Resource estimation
-------------------
Metric         	Sum
CNOT           	1000
QubitClifford  	1000
R              	0
Measure        	4002
T              	0
Depth          	0
Width          	2
BorrowedWidth  	0

Experiment
----------
Init:Zero 0s=495  1s=505  agree=1000
Init:One  0s=499  1s=501  agree=1000
```

As we see, measuring a qubit's state after putting it into
superposition via the Hadamard gate (`H()`) makes it collapse
into either state |0> or |1> with a 50% chance. However,
since both qubits are entangled (as a Bell pair), both
measurements are always identical (1000 out of 1000 times).