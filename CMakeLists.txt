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

set(headers 
        src/QZXing.h
        src/QZXingFilter.h
        src/QZXing_global.h
        src/CameraImageWrapper.h
        src/ImageHandler.h
        src/QZXingImageProvider.h
        src/zxing/zxing/ZXing.h
        src/zxing/zxing/IllegalStateException.h
        src/zxing/zxing/InvertedLuminanceSource.h
        src/zxing/zxing/ChecksumException.h
        src/zxing/zxing/ResultPointCallback.h
        src/zxing/zxing/ResultPoint.h
        src/zxing/zxing/Result.h
        src/zxing/zxing/ResultMetadata.h
        src/zxing/zxing/ReaderException.h
        src/zxing/zxing/Reader.h
        src/zxing/zxing/NotFoundException.h
        src/zxing/zxing/MultiFormatReader.h
        src/zxing/zxing/LuminanceSource.h
        src/zxing/zxing/FormatException.h
        src/zxing/zxing/Exception.h
        src/zxing/zxing/DecodeHints.h
        src/zxing/zxing/BinaryBitmap.h
        src/zxing/zxing/Binarizer.h
        src/zxing/zxing/BarcodeFormat.h
        src/zxing/zxing/aztec/AztecReader.h
        src/zxing/zxing/aztec/AztecDetectorResult.h
        src/zxing/zxing/aztec/decoder/Decoder.h
        src/zxing/zxing/aztec/detector/Detector.h
        src/zxing/zxing/common/StringUtils.h
        src/zxing/zxing/common/Str.h
        src/zxing/zxing/common/Point.h
        src/zxing/zxing/common/PerspectiveTransform.h
        src/zxing/zxing/common/IllegalArgumentException.h
        src/zxing/zxing/common/HybridBinarizer.h
        src/zxing/zxing/common/GridSampler.h
        src/zxing/zxing/common/GreyscaleRotatedLuminanceSource.h
        src/zxing/zxing/common/GreyscaleLuminanceSource.h
        src/zxing/zxing/common/GlobalHistogramBinarizer.h
        src/zxing/zxing/common/DetectorResult.h
        src/zxing/zxing/common/DecoderResult.h
        src/zxing/zxing/common/Counted.h
        src/zxing/zxing/common/CharacterSetECI.h
        src/zxing/zxing/common/BitSource.h
        src/zxing/zxing/common/BitMatrix.h
        src/zxing/zxing/common/BitArray.h
        src/zxing/zxing/common/Array.h
        src/zxing/zxing/common/detector/MathUtils.h
        src/zxing/zxing/common/detector/JavaMath.h
        src/zxing/zxing/common/detector/WhiteRectangleDetector.h
        src/zxing/zxing/common/detector/MonochromeRectangleDetector.h
        src/zxing/zxing/common/reedsolomon/ReedSolomonException.h
        src/zxing/zxing/common/reedsolomon/ReedSolomonDecoder.h
        src/zxing/zxing/common/reedsolomon/GenericGFPoly.h
        src/zxing/zxing/common/reedsolomon/GenericGF.h
        src/zxing/zxing/common/ByteArray.h
        src/zxing/zxing/datamatrix/Version.h
        src/zxing/zxing/datamatrix/DataMatrixReader.h
        src/zxing/zxing/datamatrix/decoder/Decoder.h
        src/zxing/zxing/datamatrix/decoder/DecodedBitStreamParser.h
        src/zxing/zxing/datamatrix/decoder/DataBlock.h
        src/zxing/zxing/datamatrix/decoder/BitMatrixParser.h
        src/zxing/zxing/datamatrix/detector/DetectorException.h
        src/zxing/zxing/datamatrix/detector/Detector.h
        src/zxing/zxing/datamatrix/detector/CornerPoint.h
        src/zxing/zxing/oned/UPCEReader.h
        src/zxing/zxing/oned/UPCEANReader.h
        src/zxing/zxing/oned/UPCEANExtensionSupport.h
        src/zxing/zxing/oned/UPCEANExtension2Support.h
        src/zxing/zxing/oned/UPCEANExtension5Support.h
        src/zxing/zxing/oned/UPCAReader.h
        src/zxing/zxing/oned/OneDResultPoint.h
        src/zxing/zxing/oned/OneDReader.h
        src/zxing/zxing/oned/MultiFormatUPCEANReader.h
        src/zxing/zxing/oned/MultiFormatOneDReader.h
        src/zxing/zxing/oned/ITFReader.h
        src/zxing/zxing/oned/EAN13Reader.h
        src/zxing/zxing/oned/EAN8Reader.h
        src/zxing/zxing/oned/EANManufacturerOrgSupport.h
        src/zxing/zxing/oned/Code128Reader.h
        src/zxing/zxing/oned/Code39Reader.h
        src/zxing/zxing/oned/CodaBarReader.h
        src/zxing/zxing/oned/Code93Reader.h
        src/zxing/zxing/oned/rss/AbstractRSSReader.h
        src/zxing/zxing/oned/rss/DataCharacter.h
        src/zxing/zxing/oned/rss/FinderPattern.h
        src/zxing/zxing/oned/rss/Pair.h
        src/zxing/zxing/oned/rss/RSS14Reader.h
        src/zxing/zxing/oned/rss/RSSUtils.h
        src/zxing/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI013103decoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01320xDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01392xDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01393xDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI013x0xDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01decoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AI01weightDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/AnyAIDecoder.h
        src/zxing/zxing/oned/rss/expanded/decoders/BlockParsedResult.h
        src/zxing/zxing/oned/rss/expanded/decoders/CurrentParsingState.h
        src/zxing/zxing/oned/rss/expanded/decoders/DecodedChar.h
        src/zxing/zxing/oned/rss/expanded/decoders/DecodedInformation.h
        src/zxing/zxing/oned/rss/expanded/decoders/DecodedNumeric.h
        src/zxing/zxing/oned/rss/expanded/decoders/DecodedObject.h
        src/zxing/zxing/oned/rss/expanded/decoders/FieldParser.h
        src/zxing/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder.h
        src/zxing/zxing/oned/rss/expanded/BitArrayBuilder.h
        src/zxing/zxing/oned/rss/expanded/ExpandedPair.h
        src/zxing/zxing/oned/rss/expanded/ExpandedRow.h
        src/zxing/zxing/oned/rss/expanded/RSSExpandedReader.h
        src/zxing/zxing/qrcode/Version.h
        src/zxing/zxing/qrcode/QRCodeReader.h
        src/zxing/zxing/qrcode/FormatInformation.h
        src/zxing/zxing/qrcode/ErrorCorrectionLevel.h
        src/zxing/zxing/qrcode/decoder/Mode.h
        src/zxing/zxing/qrcode/decoder/Decoder.h
        src/zxing/zxing/qrcode/decoder/DecodedBitStreamParser.h
        src/zxing/zxing/qrcode/decoder/DataMask.h
        src/zxing/zxing/qrcode/decoder/DataBlock.h
        src/zxing/zxing/qrcode/decoder/BitMatrixParser.h
        src/zxing/zxing/qrcode/detector/FinderPatternInfo.h
        src/zxing/zxing/qrcode/detector/FinderPatternFinder.h
        src/zxing/zxing/qrcode/detector/FinderPattern.h
        src/zxing/zxing/qrcode/detector/Detector.h
        src/zxing/zxing/qrcode/detector/AlignmentPatternFinder.h
        src/zxing/zxing/qrcode/detector/AlignmentPattern.h
        src/zxing/zxing/multi/MultipleBarcodeReader.h
        src/zxing/zxing/multi/GenericMultipleBarcodeReader.h
        src/zxing/zxing/multi/ByQuadrantReader.h
        src/zxing/zxing/multi/qrcode/QRCodeMultiReader.h
        src/zxing/zxing/multi/qrcode/detector/MultiFinderPatternFinder.h
        src/zxing/zxing/multi/qrcode/detector/MultiDetector.h
        src/zxing/zxing/pdf417/decoder/ec/ErrorCorrection.h
        src/zxing/zxing/pdf417/decoder/ec/ModulusGF.h
        src/zxing/zxing/pdf417/decoder/ec/ModulusPoly.h
        src/zxing/zxing/pdf417/decoder/BitMatrixParser.h
        src/zxing/zxing/pdf417/decoder/DecodedBitStreamParser.h
        src/zxing/zxing/pdf417/decoder/Decoder.h
        src/zxing/zxing/pdf417/detector/Detector.h
        src/zxing/zxing/pdf417/detector/LinesSampler.h
        src/zxing/zxing/pdf417/PDF417Reader.h
        src/zxing/bigint/NumberlikeArray.hh
        src/zxing/bigint/BigUnsignedInABase.hh
        src/zxing/bigint/BigUnsigned.hh
        src/zxing/bigint/BigIntegerUtils.hh
        src/zxing/bigint/BigIntegerLibrary.hh
        src/zxing/bigint/BigIntegerAlgorithms.hh
        src/zxing/bigint/BigInteger.hh
        src/zxing/zxing/qrcode/encoder/BlockPair.h
        src/zxing/zxing/qrcode/encoder/ByteMatrix.h
        src/zxing/zxing/qrcode/encoder/Encoder.h
        src/zxing/zxing/qrcode/encoder/MaskUtil.h
        src/zxing/zxing/qrcode/encoder/MatrixUtil.h
        src/zxing/zxing/qrcode/encoder/QRCode.h
        src/zxing/zxing/WriterException.h
        src/zxing/zxing/EncodeHint.h
        src/zxing/zxing/UnsupportedEncodingException.h
        src/zxing/zxing/common/reedsolomon/ReedSolomonEncoder.h
        src/zxing/zxing/common/Types.h)

set(source 
    src/CameraImageWrapper.cpp
    src/QZXing.cpp
    src/ImageHandler.cpp
    src/QZXingFilter.cpp
    src/QZXingImageProvider.cpp
    src/zxing/zxing/ResultIO.cpp
    src/zxing/zxing/InvertedLuminanceSource.cpp
    src/zxing/zxing/ChecksumException.cpp
    src/zxing/zxing/ResultPointCallback.cpp
    src/zxing/zxing/ResultPoint.cpp
    src/zxing/zxing/Result.cpp
    src/zxing/zxing/ResultMetadata.cpp
    src/zxing/zxing/Reader.cpp
    src/zxing/zxing/MultiFormatReader.cpp
    src/zxing/zxing/LuminanceSource.cpp
    src/zxing/zxing/FormatException.cpp
    src/zxing/zxing/Exception.cpp
    src/zxing/zxing/DecodeHints.cpp
    src/zxing/zxing/BinaryBitmap.cpp
    src/zxing/zxing/Binarizer.cpp
    src/zxing/zxing/BarcodeFormat.cpp
    src/zxing/zxing/ReaderException.cpp
    src/zxing/zxing/IllegalStateException.cpp
    src/zxing/zxing/NotFoundException.cpp
    src/zxing/zxing/UnsupportedEncodingException.cpp
    src/zxing/zxing/WriterException.cpp
    src/zxing/zxing/aztec/AztecReader.cpp
    src/zxing/zxing/aztec/AztecDetectorResult.cpp
    src/zxing/zxing/common/Counted.cpp
    src/zxing/zxing/common/StringUtils.cpp
    src/zxing/zxing/common/Str.cpp
    src/zxing/zxing/common/PerspectiveTransform.cpp
    src/zxing/zxing/common/IllegalArgumentException.cpp
    src/zxing/zxing/common/HybridBinarizer.cpp
    src/zxing/zxing/common/GridSampler.cpp
    src/zxing/zxing/common/GreyscaleRotatedLuminanceSource.cpp
    src/zxing/zxing/common/GreyscaleLuminanceSource.cpp
    src/zxing/zxing/common/GlobalHistogramBinarizer.cpp
    src/zxing/zxing/common/DetectorResult.cpp
    src/zxing/zxing/common/DecoderResult.cpp
    src/zxing/zxing/common/CharacterSetECI.cpp
    src/zxing/zxing/common/BitSource.cpp
    src/zxing/zxing/common/BitMatrix.cpp
    src/zxing/zxing/common/BitArray.cpp
    src/zxing/zxing/common/BitArrayIO.cpp
    src/zxing/zxing/common/detector/WhiteRectangleDetector.cpp
    src/zxing/zxing/common/detector/MonochromeRectangleDetector.cpp
    src/zxing/zxing/common/reedsolomon/ReedSolomonException.cpp
    src/zxing/zxing/common/reedsolomon/ReedSolomonDecoder.cpp
    src/zxing/zxing/common/reedsolomon/GenericGFPoly.cpp
    src/zxing/zxing/common/reedsolomon/GenericGF.cpp
    src/zxing/zxing/datamatrix/DataMatrixReader.cpp
    src/zxing/zxing/oned/UPCEReader.cpp
    src/zxing/zxing/oned/UPCEANReader.cpp
    src/zxing/zxing/oned/UPCEANExtensionSupport.cpp
    src/zxing/zxing/oned/UPCEANExtension2Support.cpp
    src/zxing/zxing/oned/UPCEANExtension5Support.cpp
    src/zxing/zxing/oned/UPCAReader.cpp
    src/zxing/zxing/oned/OneDResultPoint.cpp
    src/zxing/zxing/oned/OneDReader.cpp
    src/zxing/zxing/oned/MultiFormatUPCEANReader.cpp
    src/zxing/zxing/oned/MultiFormatOneDReader.cpp
    src/zxing/zxing/oned/ITFReader.cpp
    src/zxing/zxing/oned/EAN13Reader.cpp
    src/zxing/zxing/oned/EAN8Reader.cpp
    src/zxing/zxing/oned/EANManufacturerOrgSupport.cpp
    src/zxing/zxing/oned/Code128Reader.cpp
    src/zxing/zxing/oned/Code39Reader.cpp
    src/zxing/zxing/oned/CodaBarReader.cpp
    src/zxing/zxing/oned/Code93Reader.cpp
    src/zxing/zxing/oned/rss/AbstractRSSReader.cpp
    src/zxing/zxing/oned/rss/DataCharacter.cpp
    src/zxing/zxing/oned/rss/FinderPattern.cpp
    src/zxing/zxing/oned/rss/Pair.cpp
    src/zxing/zxing/oned/rss/RSS14Reader.cpp
    src/zxing/zxing/oned/rss/RSSUtils.cpp
    src/zxing/zxing/oned/rss/expanded/BitArrayBuilder.cpp
    src/zxing/zxing/oned/rss/expanded/ExpandedPair.cpp
    src/zxing/zxing/oned/rss/expanded/ExpandedRow.cpp
    src/zxing/zxing/oned/rss/expanded/RSSExpandedReader.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01AndOtherAIs.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01decoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01weightDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI013x0x1xDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI013x0xDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01320xDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01392xDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI01393xDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AI013103decoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/AnyAIDecoder.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/BlockParsedResult.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/CurrentParsingState.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/DecodedChar.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/DecodedInformation.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/DecodedNumeric.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/DecodedObject.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/FieldParser.cpp
    src/zxing/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder.cpp
    src/zxing/zxing/qrcode/QRCodeReader.cpp
    src/zxing/zxing/multi/MultipleBarcodeReader.cpp
    src/zxing/zxing/multi/GenericMultipleBarcodeReader.cpp
    src/zxing/zxing/multi/ByQuadrantReader.cpp
    src/zxing/zxing/multi/qrcode/QRCodeMultiReader.cpp
    src/zxing/zxing/multi/qrcode/detector/MultiFinderPatternFinder.cpp
    src/zxing/zxing/multi/qrcode/detector/MultiDetector.cpp
    src/zxing/zxing/aztec/decoder/AztecDecoder.cpp
    src/zxing/zxing/aztec/detector/AztecDetector.cpp
    src/zxing/zxing/datamatrix/DataMatrixVersion.cpp
    src/zxing/zxing/datamatrix/decoder/DataMatrixDecoder.cpp
    src/zxing/zxing/datamatrix/decoder/DataMatrixBitMatrixParser.cpp
    src/zxing/zxing/datamatrix/decoder/DataMatrixDataBlock.cpp
    src/zxing/zxing/datamatrix/decoder/DataMatrixDecodedBitStreamParser.cpp
    src/zxing/zxing/datamatrix/detector/DataMatrixCornerPoint.cpp
    src/zxing/zxing/datamatrix/detector/DataMatrixDetector.cpp
    src/zxing/zxing/datamatrix/detector/DataMatrixDetectorException.cpp
    src/zxing/zxing/qrcode/decoder/QRBitMatrixParser.cpp
    src/zxing/zxing/qrcode/decoder/QRDataBlock.cpp
    src/zxing/zxing/qrcode/decoder/QRDataMask.cpp
    src/zxing/zxing/qrcode/decoder/QRDecodedBitStreamParser.cpp
    src/zxing/zxing/qrcode/decoder/QRDecoder.cpp
    src/zxing/zxing/qrcode/decoder/QRMode.cpp
    src/zxing/zxing/qrcode/detector/QRAlignmentPattern.cpp
    src/zxing/zxing/qrcode/detector/QRAlignmentPatternFinder.cpp
    src/zxing/zxing/qrcode/detector/QRDetector.cpp
    src/zxing/zxing/qrcode/detector/QRFinderPattern.cpp
    src/zxing/zxing/qrcode/detector/QRFinderPatternFinder.cpp
    src/zxing/zxing/qrcode/detector/QRFinderPatternInfo.cpp
    src/zxing/zxing/qrcode/QRVersion.cpp
    src/zxing/zxing/qrcode/QRFormatInformation.cpp
    src/zxing/zxing/qrcode/QRErrorCorrectionLevel.cpp
    src/zxing/zxing/pdf417/decoder/ec/ErrorCorrection.cpp
    src/zxing/zxing/pdf417/decoder/ec/ModulusGF.cpp
    src/zxing/zxing/pdf417/decoder/ec/ModulusPoly.cpp
    src/zxing/zxing/pdf417/decoder/PDF417BitMatrixParser.cpp
    src/zxing/zxing/pdf417/decoder/PDF417DecodedBitStreamParser.cpp
    src/zxing/zxing/pdf417/decoder/PDF417Decoder.cpp
    src/zxing/zxing/pdf417/detector/PDF417Detector.cpp
    src/zxing/zxing/pdf417/detector/LinesSampler.cpp
    src/zxing/zxing/pdf417/PDF417Reader.cpp
    src/zxing/bigint/BigUnsignedInABase.cc
    src/zxing/bigint/BigUnsigned.cc
    src/zxing/bigint/BigIntegerUtils.cc
    src/zxing/bigint/BigIntegerAlgorithms.cc
    src/zxing/bigint/BigInteger.cc
    src/zxing/zxing/qrcode/encoder/ByteMatrix.cpp
    src/zxing/zxing/qrcode/encoder/QREncoder.cpp
    src/zxing/zxing/qrcode/encoder/MaskUtil.cpp
    src/zxing/zxing/qrcode/encoder/MatrixUtil.cpp
    src/zxing/zxing/qrcode/encoder/QRCode.cpp
    src/zxing/zxing/EncodeHint.cpp
    src/zxing/zxing/common/reedsolomon/ReedSolomonEncoder.cpp)

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

install(
    TARGETS ${PROJECT_NAME}
    EXPORT "${TARGETS_EXPORT_NAME}"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib"
    RUNTIME DESTINATION "bin"
    INCLUDES DESTINATION "${include_install_dir}"
)

install(DIRECTORY src/ DESTINATION include/qzxing
        FILES_MATCHING PATTERN "QZXing.h")


install(
    FILES "${project_config}" "${version_config}"
    DESTINATION "${config_install_dir}"
)

install(
    EXPORT "${TARGETS_EXPORT_NAME}"
    NAMESPACE "${namespace}"
    DESTINATION "${config_install_dir}"
)

#install(FILES ${pc_config} DESTINATION lib/pkgconfig)
#install(FILES ${la_config} DESTINATION lib)

add_subdirectory(examples)
