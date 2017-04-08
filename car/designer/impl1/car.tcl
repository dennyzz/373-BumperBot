# Created by Microsemi Libero Software 11.7.1.14
# Fri Apr 07 20:38:02 2017

# (OPEN DESIGN)

open_design "car.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "car_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\WYZ\Documents\GitHub\373_Repo\373-BumperBot\car\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/car.edn} \
-format "pdc"  {..\..\component\work\car\car.pdc} -merge_physical "yes" -merge_timing "yes"
compile
report -type "status" {car_compile_report.txt}
report -type "pin" -listby "name" {car_report_pin_byname.txt}
report -type "pin" -listby "number" {car_report_pin_bynumber.txt}

save_design
