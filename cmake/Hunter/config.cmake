hunter_config(Qt VERSION "5.12.3"
    CMAKE_ARGS 
        ANDROID_STL=${ANDROID_STL}
        ANDROID_ABI=${ANDROID_ABI}
        ANDROID_PLATFORM=${ANDROID_PLATFORM}
        CMAKE_ANDROID_ARCH=${CMAKE_ANDROID_ARCH}
    )

        
hunter_config(bigint
    URL https://github.com/edwardbr/bigint/archive/master.tar.gz
    SHA1 7b7af0a373c42bc3a0537e7af673892af31bec12
    CMAKE_ARGS
        ANDROID_STL=${ANDROID_STL}
        ANDROID_ABI=${ANDROID_ABI}
        ANDROID_PLATFORM=${ANDROID_PLATFORM}
        CMAKE_ANDROID_ARCH=${CMAKE_ANDROID_ARCH}
        QT_CMAKE=${QT_CMAKE}
        )

hunter_config(zxing
    URL https://github.com/edwardbr/zxing/archive/master.tar.gz
    SHA1 f343bb34b00e723eb28a4b8d115b5b646a7ae449
    CMAKE_ARGS
        ANDROID_STL=${ANDROID_STL}
        ANDROID_ABI=${ANDROID_ABI}
        ANDROID_PLATFORM=${ANDROID_PLATFORM}
        CMAKE_ANDROID_ARCH=${CMAKE_ANDROID_ARCH}
        QT_CMAKE=${QT_CMAKE}
        )
