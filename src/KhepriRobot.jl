module KhepriRobot
using KhepriBase
using PyCall

# functions that need specialization
include(khepribase_interface_file())

const com = PyNULL()
include("Robot.jl")

function __init__()
  set_backend_family(default_truss_bar_family(),
    robot,
    robot_truss_bar_family(
      E=210e09,         # E (Young's modulus)
      G=81e09,          # G (Kirchoff's or Shear modulus)
      NU=0.3,           # NU (Poisson's ratio)
      LX=1.2e-05,       # LX (Thermal expansion)
      d=7.701e3,        # RO (Density)
      RE=235000000.0,   # RE (Design resistence)
      RT=360000000.0))  # RT (Limit tension resistance)

#  set_backend_family(default_truss_node_family(), frame3dd, acad_layer_family("TrussNode"))
#  set_backend_family(fixed_truss_node_family, frame3dd, acad_layer_family("FixedTrussNode"))
#  set_backend_family(free_truss_node_family, frame3dd, acad_layer_family("FreeTrussNode"))
  #use_family_in_layer(b::ACAD) = true
  add_current_backend(robot)
end

end
