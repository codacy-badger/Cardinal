# Copyright (C) 2019-2020 Cardinal
# Vincent STEHLY--CALISTO, vincentstehly@hotmail.fr

# Create the given directory
# param directory : The directory to create
function(CREATE_DIRECTORY directory)
    FILE(MAKE_DIRECTORY ${directory})
    MESSAGE(STATUS "[Cardinal] Created : ${directory}")
endfunction()

# Check the architecture(32 or 64 bits)
# param architecture : Will contains 32 or 64
function(CHECK_ARCHITECTURE architecture)
    # 64 bits compiler
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        SET(${architecture} 64 PARENT_SCOPE)
    # 32 bits compiler
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        SET(${architecture} 32 PARENT_SCOPE)
    endif()
endfunction()