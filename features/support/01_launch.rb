########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

require 'calabash-cucumber/launcher'
require 'find'

#APP_BUNDLE_PATH = "/Volumes/ramdisk/Yolo-dlrlfjpnbibykraquogzuhkwfmyk/Build/Products/Debug-iphonesimulator"
# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH

if File.directory?("/Volumes/ramdisk")
    sdk = ENV['SDK_VERSION'] || SimLauncher::SdkDetector.new().latest_sdk_version
    files = []
    Find.find("/Volumes/ramdisk/") do |path|
        files << path if path =~ /.*Yolo-.*\/Build\/Products\/.*-iphonesimulator\/.*\.app$/
    end
    app_path = files.sort_by { |filename| File.mtime(filename)}.last # get the latest
    puts app_path
    APP_BUNDLE_PATH = app_path if File.directory?(app_path)
end

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  Calabash::Cucumber::SimulatorHelper.stop unless launcher.calabash_no_stop?
end
