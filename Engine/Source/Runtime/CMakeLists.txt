# Copyright (C) 2019-2020, Cardinal
# Vincent STEHLY--CALISTO, vincentstehly@hotmail.fr

# Adds all runtime header
INCLUDE_DIRECTORIES(
        ${CARDINAL_ENGINE_HEADER_DIR}
        ${CARDINAL_THIRD_PARTY_DIR})

# Gets all source files
FILE(GLOB_RECURSE ENGINE_SOURCES
        Core/*.cpp
        Platform/*.cpp)

FILE(GLOB_RECURSE ENGINE_HEADERS
        ${CARDINAL_ENGINE_HEADER_DIR}/*.hpp
        ${CARDINAL_ENGINE_HEADER_DIR}/*.inl
        ${CARDINAL_ENGINE_HEADER_DIR}/*.hh
        ${CARDINAL_ENGINE_HEADER_DIR}/*.tcc)

# Builds engine test executable
ADD_EXECUTABLE(${CARDINAL_RUNTIME}
        Main.cpp
        ${ENGINE_SOURCES}
        ${ENGINE_HEADERS})

# _d is already set
set(CMAKE_DEBUG_POSTFIX "")

# Builds engine library
ADD_LIBRARY(${CARDINAL_RUNTIME_LIBRARY}
        ${ENGINE_SOURCES}
        ${ENGINE_HEADERS})

ADD_CUSTOM_TARGET(ResourcesCopy)
ADD_DEPENDENCIES (${CARDINAL_RUNTIME} ResourcesCopy)

# Linking ...
TARGET_LINK_LIBRARIES(${CARDINAL_RUNTIME}
        ${COMPILER_DEPENDENCIES}
        ${PLATFORM_DEPENDENCIES})

# Copy all resources on engine build
ADD_CUSTOM_COMMAND(TARGET ResourcesCopy PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CARDINAL_ENGINE_RESOURCE_DIR} ${CARDINAL_BIN_OUTPUT}/Resources
        COMMENT "[INFO] Copying shared files ...")
