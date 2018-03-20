# 工程名
APP_NAME="Jenkins"
# 证书
# CODE_SIGN_DISTRIBUTION="iPhone Distribution: SunEee Weilian Technology Development Co., Ltd."
# info.plist路径
project_infoplist_path="./${APP_NAME}/Info.plist"

#取版本号
bundleShortVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${project_infoplist_path}")

#取build值
bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")

DATE="$(date +%Y%m%d)"
IPANAME="${APP_NAME}_V${bundleShortVersion}_${DATE}.ipa"

#要上传的ipa文件路径
IPA_PATH="$HOME/${IPANAME}"
echo ${IPA_PATH}
echo "${IPA_PATH}">> text.txt

echo "=================clean================="
xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration 'Debug' clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration 'Debug' CODE_SIGN_IDENTITY="${CODE_SIGN_DISTRIBUTION}" SYMROOT='$(PWD)'
