# Copyright (c) 2017 The Bitcoin developers

cmake_minimum_required(VERSION 3.13)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
set(CMAKE_VERBOSE_MAKEFILE ON)

include(HunterGate)

message(STATUS "[project] CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")

option(HUNTER_STATUS_DEBUG "Hunter debug info" ON)
#option(HUNTER_CONFIGURATION_TYPES "Hunter HUNTER_CONFIGURATION_TYPES" Debug)
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.214.tar.gz"
    SHA1 "e14bc153a7f16d6a5eeec845fb0283c8fad8c358"
    LOCAL
)

set(HUNTER_KEEP_PACKAGE_SOURCES ON)

project(qzxing VERSION 0.1)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

include(CTest)

if(EXISTS ${QT_CMAKE})
set(Qt5Core_DIR "${QT_CMAKE}/Qt5Core")
set(Qt5Gui_DIR "${QT_CMAKE}/Qt5Gui")
set(Qt5_DIR "${QT_CMAKE}/Qt5")
set(Qt5Network_DIR "${QT_CMAKE}/Qt5Network")
set(Qt5Qml_DIR "${QT_CMAKE}/Qt5Qml")
set(Qt5Quick_DIR "${QT_CMAKE}/Qt5Quick")
set(Qt5Widgets_DIR "${QT_CMAKE}/Qt5Widgets")
set(Qt5Multimedia_DIR "${QT_CMAKE}/Qt5Multimedia")

find_package(Qt5 COMPONENTS Core Gui Quick Multimedia Widgets REQUIRED)

else()

hunter_add_package(Qt)
hunter_add_package(Qt COMPONENTS qtmultimedia)
hunter_add_package(Qt COMPONENTS qtdeclarative)

find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5Multimedia REQUIRED)

endif()


add_subdirectory(src/zxing/bigint)
add_subdirectory(src/zxing)


set(headers 
        src/QZXing.h
        src/QZXingFilter.h
        src/QZXing_global.h
        src/CameraImageWrapper.h
        src/ImageHandler.h
        src/QZXingImageProvider.h)

set(source 
    src/CameraImageWrapper.cpp
    src/QZXing.cpp
    src/ImageHandler.cpp
    src/QZXingFilter.cpp
    src/QZXingImageProvider.cpp)

add_library( ${PROJECT_NAME} ${source} ${headers} )


target_include_directories(${PROJECT_NAME} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/zxing>)

#target_compile_features(${PROJECT_NAME} 
#  PRIVATE
#    cxx_std_17
#)

target_compile_definitions(${PROJECT_NAME} PUBLIC 
        QZXING_LIBRARY
        ZXING_ICONV_CONST
        DISABLE_LIBRARY_FEATURES
        QZXING_MULTIMEDIA
        QZXING_QML
        NOFMAXL)


#set_property(${PROJECT_NAME} Qt5::Core PROPERTY INTERFACE_COMPILE_FEATURES cxx_decltype)

target_link_libraries(${PROJECT_NAME}
                PRIVATE 
                    Qt5::Core 
                    Qt5::Quick 
                    Qt5::Gui
                    Qt5::Multimedia
                    Qt5::Widgets
                    zxing
                    bigint
                )


#set(pc_config "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc")
#configure_file(${PROJECT_NAME}.pc.in ${pc_config} @ONLY)

set(config_install_dir "lib/cmake/${PROJECT_NAME}")
set(include_install_dir "include")

set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")

set(version_config "${generated_dir}/${PROJECT_NAME}ConfigVersion.cmake")
set(project_config "${generated_dir}/${PROJECT_NAME}Config.cmake")
set(TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
set(namespace "${PROJECT_NAME}::")

include(CMakePackageConfigHelpers)

# Use:
#   * PROJECT_VERSION
write_basic_package_version_file(
    "${version_config}" COMPATIBILITY SameMajorVersion
)

# Use variables:
#   * TARGETS_EXPORT_NAME
#   * PROJECT_NAME
configure_package_config_file(
    "cmake/Config.cmake.in"
    "${project_config}"
    INSTALL_DESTINATION "${config_install_dir}"
)


#install(FILES ${pc_config} DESTINATION lib/pkgconfig)
#install(FILES ${la_config} DESTINATION lib)

add_subdirectory(examples)
