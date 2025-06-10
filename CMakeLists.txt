# Modern DELPHI Analysis Examples
#
# example01/CMakeLists.txt
#
# Dietrich Liko <Dietrich.Liko@oeaw.ac.at>

cmake_minimum_required(VERSION 3.26)

project(TAUPLUS VERSION 0.1 LANGUAGES Fortran)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
find_package(DELPHI REQUIRED)

configure_file(tauplus.cra.in tauplus.cra)
ypatchy(tauplus.f tauplus.cra)

add_executable(tauplus ${CMAKE_CURRENT_BINARY_DIR}/tauplus.f)
target_link_dellibs(tauplus phdst)
target_link_cernlibs(tauplus packlib)

configure_file(taumin_good.cra.in taumin_good.cra)
ypatchy(taumin_good.f taumin_good.cra)

add_executable(taumin_good ${CMAKE_CURRENT_BINARY_DIR}/taumin_good.f)
target_link_dellibs(taumin_good dstanaxx pxdstxx vdclapxx dstanaxx ufield phdst) 
target_link_cernlibs(taumin_good jetset74 mathlib packlib)