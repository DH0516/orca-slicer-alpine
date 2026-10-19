# SPDX-License-Identifier: MIT
# Copyright (c) 2026 DH0516
# Provide OpenGL::EGL when FindOpenGL cannot create it without GLVND.
if (NOT TARGET OpenGL::EGL)
    find_path(EGL_INCLUDE_DIR EGL/egl.h REQUIRED)
    find_library(EGL_LIBRARY NAMES EGL REQUIRED)
    add_library(OpenGL::EGL UNKNOWN IMPORTED)
    set_target_properties(OpenGL::EGL PROPERTIES
        IMPORTED_LOCATION "${EGL_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${EGL_INCLUDE_DIR}")
endif ()
