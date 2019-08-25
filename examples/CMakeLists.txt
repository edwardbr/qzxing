cmake_minimum_required(VERSION 3.13)

project(examples)
message(STATUS "doing ${PROJECT_NAME}")

add_subdirectory(BarcodeEncoder)
#add_subdirectory(QMLBarcodeScanner)
#add_subdirectory(QQrDecoder)
#add_subdirectory(QZXingDragNDropTest)
add_subdirectory(QZXingLive)

enable_testing()