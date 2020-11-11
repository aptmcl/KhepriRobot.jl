module KhepriRobot
using KhepriBase
using PyCall

# functions that need specialization
include(khepribase_interface_file())

const com = PyNULL()
include("Robot.jl")

function __init__()

#=  set_backend_family(default_wall_family(), autocad, acad_layer_family("Wall"))
  set_backend_family(default_slab_family(), autocad, acad_layer_family("Slab"))
  set_backend_family(default_roof_family(), autocad, acad_layer_family("Roof"))
  set_backend_family(default_beam_family(), autocad, acad_layer_family("Beam"))
  set_backend_family(default_column_family(), autocad, acad_layer_family("Column"))
  set_backend_family(default_door_family(), autocad, acad_layer_family("Door"))
  set_backend_family(default_panel_family(), autocad, acad_layer_family("Panel"))

  set_backend_family(default_table_family(), autocad, acad_layer_family("Table"))
  set_backend_family(default_chair_family(), autocad, acad_layer_family("Chair"))
  set_backend_family(default_table_chair_family(), autocad, acad_layer_family("TableChairs"))

  set_backend_family(default_curtain_wall_family(), autocad, acad_layer_family("CurtainWall"))
  set_backend_family(default_curtain_wall_family().panel, autocad, acad_layer_family("CurtainWall-Panel"))
  set_backend_family(default_curtain_wall_family().boundary_frame, autocad, acad_layer_family("CurtainWall-Boundary"))
  set_backend_family(default_curtain_wall_family().transom_frame, autocad, acad_layer_family("CurtainWall-Transom"))
  set_backend_family(default_curtain_wall_family().mullion_frame, autocad, acad_layer_family("CurtainWall-Mullion"))
  =#

  set_backend_family(default_truss_bar_family(),
    robot,
    robot_truss_bar_family(
    material=[
      "ElasticIsotropic",   # name
      I_MT_STEEL,           # Type
      "Steel",              # Name
      "I'm really steel",   # Nuance
      210000000000.0,       # E (Young's modulus)
      0.3,                  # NU (Poisson's ratio)
      81000000000.0,        # G (Kirchoff's or Shear modulus)
      77010.0,              # RO (Density)
      1.2e-05,              # LX (Thermal expansion)
      0.04,                 # DUMPCOEF (Damping coefficient)
      235000000.0,          # RE (Design resistence)
      360000000.0],         # RT (Limit tension resistance)
    section=[
      "Tube",               #name
      "ElasticIsotropic",   #material_name
      false,                #iswood
      [(true,               #solid?
        0.0213,             #diameter
        0.0026)]]))         #thickness

#  set_backend_family(default_truss_node_family(), frame3dd, acad_layer_family("TrussNode"))
#  set_backend_family(fixed_truss_node_family, frame3dd, acad_layer_family("FixedTrussNode"))
#  set_backend_family(free_truss_node_family, frame3dd, acad_layer_family("FreeTrussNode"))
  #use_family_in_layer(b::ACAD) = true
end

end
