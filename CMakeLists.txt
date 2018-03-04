# ROOT PROJECT FILE

cmake_minimum_required(VERSION 3.10)

# Declare project
project(Inline-Engine)


# Project uses C and C++
enable_language(C)
enable_language(CXX)
set(CMAKE_CXX_STANDARD 17)


# Configurations
set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE TYPE INTERNAL FORCE)
set(DEBUG_CONFIGURATIONS Debug)


# Set platform-specific properties
include(GetPlatform.cmake)
include(Paths.cmake)
include(CopyRuntime.cmake)

if (TARGET_COMPILER_MSVC)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /bigobj /MP")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4638") # Ignore XML doc not found reference
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd5033") # Register keyword is now deprecated but retarded Bullet uses it	
endif()


# Enable filter grouping of projects inside solution
set_property(GLOBAL PROPERTY USE_FOLDERS ON)


# Properties applied to all targets
include_directories("${CMAKE_CURRENT_LIST_DIR}/Engine")
include_directories("${EXTERNALS_INCLUDE}/Bullet") # because Bullet is retarded...


# Add additional folders
add_subdirectory(Engine)
add_subdirectory(Test)
add_subdirectory(Executables)


# Add custom target containing global files
add_custom_target(Files SOURCES 
	CMakeLists.txt
	Paths.cmake
	GetPlatform.cmake
	CopyRuntime.cmake
	"${EXTERNALS_INCLUDE}/Mathter/Mathter.natvis")
set_target_properties(Files PROPERTIES FOLDER Files)


# Put projects in their folders
set_target_properties(BaseLibrary PROPERTIES FOLDER Modules)
set_target_properties(GraphicsApi_D3D12 PROPERTIES FOLDER Modules)
set_target_properties(GraphicsEngine_LL PROPERTIES FOLDER Modules)
set_target_properties(AssetLibrary PROPERTIES FOLDER Modules)
set_target_properties(GuiEngine PROPERTIES FOLDER Modules)
set_target_properties(Core PROPERTIES FOLDER Modules)
set_target_properties(NetworkEngine PROPERTIES FOLDER Modules)
set_target_properties(NetworkApi PROPERTIES FOLDER Modules)
set_target_properties(PhysicsEngineBullet PROPERTIES FOLDER Modules)

set_target_properties(Test_General PROPERTIES FOLDER Test)
set_target_properties(QC_Simulator PROPERTIES FOLDER Test)
set_target_properties(Test_Unit PROPERTIES FOLDER Test)

set_target_properties(Editor PROPERTIES FOLDER Executables)

