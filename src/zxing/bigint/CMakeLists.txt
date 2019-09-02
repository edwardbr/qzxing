# Copyright (c) 2017 The Bitcoin developers

cmake_minimum_required(VERSION 3.13)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
set(CMAKE_VERBOSE_MAKEFILE ON)

project(bigint VERSION 0.1)
include(CTest)

set(bigint_headers 
        NumberlikeArray.hh
        BigUnsignedInABase.hh
        BigUnsigned.hh
        BigIntegerUtils.hh
        BigIntegerLibrary.hh
        BigIntegerAlgorithms.hh
        BigInteger.hh
)

set(bigint_source 
    BigUnsignedInABase.cc
    BigUnsigned.cc
    BigIntegerUtils.cc
    BigIntegerAlgorithms.cc
    BigInteger.cc)

add_library( ${PROJECT_NAME} ${bigint_source} ${bigint_headers} )
#target_include_directories(bigint $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

target_compile_definitions(${PROJECT_NAME} PUBLIC 
        QZXING_LIBRARY
        ZXING_ICONV_CONST
        DISABLE_LIBRARY_FEATURES
        QZXING_MULTIMEDIA
        QZXING_QML
        NOFMAXL)
