# A fork of Disk Inventory X

Forked from https://gitlab.com/tderlien/disk-inventory-x

Fix building problems.
Add build script.

# build steps.
1. git submodule update --init
2. open `OmniGroup/Configurations/Omni-Global-Settings.xcconfig`, set team id for `OMNI_DEVELOPMENT_TEAM`
3. check if `treemapview-framework/TreeMapView.xcodeproj` can be built. 
4. ./build.sh
5. ./buildRelease.sh
