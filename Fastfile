# This file contains the fastlane.tools configuration
# You can find the documentation at https://docs.fastlane.tools
#
# For a list of all available actions, check out
#
#     https://docs.fastlane.tools/actions
#

# Uncomment the line if you want fastlane to automatically update itself
# update_fastlane

default_platform(:ios)

platform :ios do
    desc "fastlane 打包上传到蒲公英"
    sh './build.sh "$FSVINFOPLIST"'
    lane :fsv_pgyer do
    build_app(export_method: "ad-hoc",
        workspace: ENV['FSVWORKSPACE'],
        scheme: ENV['FSVSCHEME'])
    pgyer(api_key: ENV['FSVPGYER_API_KEY'], user_key: ENV['FSVPGYER_USER_KEY'])
end
end
