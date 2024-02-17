#!/bin/bash -e
# xcodebuild -project OmniGroup/Tools/FixStringsFile/FixStringsFile.xcodeproj -configuration $1
# xcodebuild -project OmniGroup/Frameworks/OmniBase/OmniBase.xcodeproj -configuration $1
# xcodebuild -project OmniGroup/Frameworks/OmniFoundation/OmniFoundation.xcodeproj -configuration $1
# xcodebuild -project OmniGroup/Frameworks/OmniAppKit/OmniAppKit.xcodeproj -configuration $1

build_dep(){
	xcodebuild -project treemapview-framework/TreeMapView.xcodeproj -configuration $1
	xcodebuild -workspace OmniGroup/Workspaces/OmniFrameworks.xcworkspace -scheme "Mac Frameworks" -configuration $1
	mkdir -p "build/${1}_frameworks"
	old_dir=$(pwd)
	pushd "build/${1}_frameworks" >/dev/null
	ls -d ~/Library/Developer/Xcode/DerivedData/OmniFrameworks-*/Build/Products/$1/OmniAppKit.framework | xargs -I XX rsync -a XX .
	ls -d ~/Library/Developer/Xcode/DerivedData/OmniFrameworks-*/Build/Products/$1/OmniFoundation.framework | xargs -I XX rsync -a XX .
	ls -d ~/Library/Developer/Xcode/DerivedData/OmniFrameworks-*/Build/Products/$1/OmniBase.framework | xargs -I XX rsync -a XX .
	ls -d $old_dir/treemapview-framework/build/$1/TreeMapView.framework | xargs -I XX rsync -a XX .
	popd >/dev/null
}

if [ "$1" != "" ] ; then
	build_dep "$1"
else
	build_dep Debug
	build_dep Release
fi
