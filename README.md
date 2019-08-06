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
