cmake_minimum_required(VERSION 3.13)

project(BarcodeEncoder)
message(STATUS "doing ${PROJECT_NAME}")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

if(QUICK_COMPILER)
	qtquick_compiler_add_resources(RCC_SOURCES "qml.qrc")
else()
	qt5_add_resources(RCC_SOURCES "qml.qrc")
endif()
 
file(GLOB_RECURSE _HDRS "*.hpp")
file(GLOB_RECURSE _SRCS "*.cpp")

add_executable(${PROJECT_NAME} ${_SRCS} ${RCC_SOURCES} ${_HDRS})

target_include_directories(${PROJECT_NAME} PUBLIC include)

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${PROJECT_NAME} 
                        PRIVATE 
                          Qt5::Core 
                          Qt5::Quick 
                          Qt5::Multimedia
                          zxing::zxing
                          qzxing
                    )

message(STATUS "end doing ${PROJECT_NAME}")

