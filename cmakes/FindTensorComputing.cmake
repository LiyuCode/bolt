set(TENSOR_COMPUTING_PROJECT_NAME "tensor_computing")
unset(TENSOR_COMPUTING_ROOT)
find_path(TENSOR_COMPUTING_ROOT NAMES ${TENSOR_COMPUTING_PROJECT_NAME} HINTS ${BOLT_ROOT} $ENV{BOLT_ROOT})
set(TENSOR_COMPUTING_ROOT "${TENSOR_COMPUTING_ROOT}/${TENSOR_COMPUTING_PROJECT_NAME}")

set(TENSOR_COMPUTING_INCLUDE_DIR "${TENSOR_COMPUTING_ROOT}/include")
if (USE_DYNAMIC_LIBRARY)
    set(TENSOR_COMPUTING_LIBRARY "${TENSOR_COMPUTING_ROOT}/lib/lib${TENSOR_COMPUTING_PROJECT_NAME}.so")
else (USE_DYNAMIC_LIBRARY)
    set(TENSOR_COMPUTING_LIBRARY "${TENSOR_COMPUTING_ROOT}/lib/lib${TENSOR_COMPUTING_PROJECT_NAME}.a")
endif (USE_DYNAMIC_LIBRARY)

if (TENSOR_COMPUTING_INCLUDE_DIR AND TENSOR_COMPUTING_LIBRARY)
    set(TENSOR_COMPUTING_FOUND true)
endif (TENSOR_COMPUTING_INCLUDE_DIR AND TENSOR_COMPUTING_LIBRARY)

find_package(BlasEnhance)

if (TENSOR_COMPUTING_FOUND)
    set(TENSOR_COMPUTING_LIBRARIES "${TENSOR_COMPUTING_LIBRARY};${BLAS_ENHANCE_LIBRARY}")
    include_directories(include ${TENSOR_COMPUTING_INCLUDE_DIR})
    message(STATUS "Found ${TENSOR_COMPUTING_PROJECT_NAME}.h: ${TENSOR_COMPUTING_INCLUDE_DIR}")
    message(STATUS "Found ${TENSOR_COMPUTING_PROJECT_NAME}: ${TENSOR_COMPUTING_LIBRARIES}")
else (TENSOR_COMPUTING_FOUND)
    message(FATAL_ERROR "
FATAL: can not find ${TENSOR_COMPUTING_PROJECT_NAME} library in <BOLT_ROOT>/${TENSOR_COMPUTING_PROJECT_NAME}/[include/lib] directory,
       please set shell or cmake environment variable BOLT_ROOT.
    ")
endif (TENSOR_COMPUTING_FOUND)
