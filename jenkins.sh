# 工程名
APP_NAME="Jenkins"
# 证书
# CODE_SIGN_DEVELOPMENT="iPhone Distribution: SunEee Weilian Technology Development Co., Ltd."
# info.plist路径
# project_infoplist_path="./${APP_NAME}/Info.plist"

# echo ${project_infoplist_path}

#取版本号
#bundleShortVersion=$(/usr/libexec/PlistBuddy -c "-----> print CFBundleShortVersionString" "${project_infoplist_path}")
# bundleShortVersion = 1.0
#取build值
#bundleVersion=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${project_infoplist_path}")
# bundleVersion = 2.0
echo "anderson log ==========> "

DATE="$(date +%Y%m%d)"
IPANAME="${APP_NAME}_${DATE}.ipa"

#要上传的ipa文件路径
# IPA_PATH="$HOME/${IPANAME}"
# echo ${IPA_PATH}
# echo "${IPA_PATH}">> text.txt

echo "=================clean================="
xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration 'Debug' clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration 'Debug'

#CODE_SIGN_IDENTITY="${CODE_SIGN_DEVELOPMENT}" SYMROOT='$(PWD)'
# xcodebuild -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}" -sdk iphoneos -configuration 'Debug' CODE_SIGN_IDENTITY="${CODE_SIGN_DEVELOPMENT}" SYMROOT='$(PWD)'
