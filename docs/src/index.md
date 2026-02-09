```@meta
CurrentModule = KhepriRobot
```

# KhepriRobot

A Khepri backend for [Autodesk Robot Structural Analysis](https://www.autodesk.com/products/robot-structural-analysis), interfacing via COM through PyCall.

## Architecture

KhepriRobot is a **LazyBackend** — it accumulates truss nodes and bars during design, then creates a Robot project and solves the structural model when analysis is requested. Communication uses COM automation via PyCall (not TCP sockets).

- **Backend type**: `LazyBackend{ROBOTKey, Any}` (custom `RobotBackend` struct)
- **Connection**: COM interface via `PyCall` to Robot's automation API
- **Node merging**: Duplicate nodes at the same location are automatically merged

## Key Features

- **Extensive COM enumerations**: 50+ Robot API constants for project types, object types, material types, section shapes, and label types
- **Truss node/bar system**: Create structural elements that map to Robot's node and bar objects
- **Bar tube sections**: Circular tube cross-section specification with automatic property calculation
- **Project kind configuration**: Configurable via `project_kind` parameter (2D/3D frames, trusses, plates, shells, etc.)
- **Full structural analysis**: Load cases, supports, displacement queries

## Setup

```julia
using KhepriRobot
using KhepriBase

backend(robot)

# Create truss structure, then analyze
truss_analysis(vz(-1e4))
```

Requires Robot Structural Analysis installed on Windows with COM access enabled.

## Dependencies

- **KhepriBase**: Core Khepri functionality
- **PyCall**: COM interface to Robot Structural Analysis

```@index
```

```@autodocs
Modules = [KhepriRobot]
```
