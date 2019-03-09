# Copyright (C) 2019-2020, Cardinal
# Vincent STEHLY--CALISTO, vincentstehly@hotmail.fr

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++0x")

INCLUDE_DIRECTORIES(
        ${CARDINAL_ENGINE_HEADER_DIR}
        ${CARDINAL_THIRD_PARTY_DIR}/GoogleTest/include)

# Gets engine runtime sources
FILE(GLOB_RECURSE ENGINE_RUNTIME_SOURCES
        ${CARDINAL_ENGINE_SOURCE_DIR}/Runtime/Core/*.cpp
        ${CARDINAL_ENGINE_SOURCE_DIR}/Runtime/Platform/*.cpp)

# Get engine runtime headers
FILE(GLOB_RECURSE ENGINE_RUNTIME_HEADERS
        ${CARDINAL_ENGINE_HEADER_DIR}/Runtime/*.hpp
        ${CARDINAL_ENGINE_HEADER_DIR}/Runtime/*.inl
        ${CARDINAL_ENGINE_HEADER_DIR}/Runtime/*.hh)

# Getting sources
SET(TEST_FILES
        # Test
        FooTest.cpp)

# Linking
ADD_EXECUTABLE       (${CARDINAL_RUNTIME_UNIT_TEST} ${ENGINE_RUNTIME_SOURCES} ${ENGINE_RUNTIME_HEADERS} ${TEST_FILES})
TARGET_LINK_LIBRARIES(${CARDINAL_RUNTIME_UNIT_TEST} ${COMPILER_DEPENDENCIES}  ${PLATFORM_DEPENDENCIES}  gtest gtest_main)