# KhepriRobot tests — Robot Structural Analysis via COM/PyCall
#
# Tests cover module loading, type system, backend struct fields,
# family types, and configuration parameters. Actual Robot operations
# require Robot Structural Analysis with COM access via PyCall.

using KhepriRobot
using KhepriBase
using Test

@testset "KhepriRobot.jl" begin

  @testset "Type system" begin
    @test isdefined(KhepriRobot, :ROBOTKey)
    @test KhepriRobot.ROBOTId === Any
    @test isdefined(KhepriRobot, :ROBOTRef)
    @test isdefined(KhepriRobot, :ROBOTNativeRef)
    @test KhepriRobot.ROBOT === KhepriRobot.RobotBackend{KhepriRobot.ROBOTKey, Any}
  end

  @testset "Backend initialization" begin
    @test robot isa KhepriBase.Backend
    @test KhepriBase.backend_name(robot) == "Robot"
    @test KhepriBase.void_ref(robot) == -1
  end

  @testset "Backend struct fields" begin
    T = KhepriRobot.ROBOT
    @test hasfield(T, :realized)
    @test hasfield(T, :com)
    @test hasfield(T, :truss_nodes)
    @test hasfield(T, :truss_bars)
    @test hasfield(T, :shapes)
    @test hasfield(T, :truss_node_data)
    @test hasfield(T, :truss_bar_data)
    @test hasfield(T, :refs)
  end

  @testset "Family types" begin
    @test isdefined(KhepriRobot, :RobotFamily)
    @test KhepriRobot.RobotFamily <: KhepriBase.Family
    @test isdefined(KhepriRobot, :RobotTrussBarFamily)
    @test KhepriRobot.RobotTrussBarFamily <: KhepriRobot.RobotFamily
  end

  @testset "Configuration" begin
    @test project_kind isa KhepriBase.Parameter
    @test KhepriRobot.bar_tube_section_label == "KhepriTube"
  end

  @testset "Enumerations" begin
    # Spot-check a few Robot COM enumerations
    @test isdefined(KhepriRobot, :I_PT_FRAME_3D)
    @test isdefined(KhepriRobot, :I_OT_NODE)
    @test isdefined(KhepriRobot, :I_OT_BAR)
    @test isdefined(KhepriRobot, :I_MT_STEEL)
  end
end
