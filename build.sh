# plist路径
infoPlist=$1

# 获取当前build号
buildCurrentNum=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" ${infoPlist})

lastVersion='01'
currentData=$(date +%y%m%d)
lastBuildNumber=""
if [ ${#buildCurrentNum} -lt 8 ];then
    lastBuildNumber=${currentData}$lastVersion
else
    # 截取时间 18051701 -> 180517 来个今天的时间做比较
    currentDate=${buildCurrentNum:0:6}
    lastVersion=${buildCurrentNum:6}

    # 判断xcode的日期是否和当前日期相同
    if [ $currentDate == $currentData ];then
        # 相同的话build + 1
        versionI=$((10#${lastVersion}+1))
        lastVersion=$(printf "%02d" $versionI)
    else
        # 不相同的话build为1
        lastVersion="01"
    fi

    lastBuildNumber=${currentData}$lastVersion
fi

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $lastBuildNumber" ${infoPlist}
