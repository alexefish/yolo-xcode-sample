require 'rubygems'
require 'yolo'

#
# Build Task
#
Yolo::Tasks::Ios::Build.new do |t|
  t.workspace = "Yolo.xcworkspace"
  t.scheme = "Yolo"
end

#
# Release Task
#
Yolo::Tasks::Ios::Release.new do |t|
  t.workspace = "Yolo.xcworkspace"
  t.scheme = "Yolo"
  t.configuration = "Release"
end

#
# OCUnit task
#
Yolo::Tasks::Ios::OCUnit.new do |t|
  t.workspace = "Yolo.xcworkspace"
  t.scheme = "YoloTests"
  t.test_output = :junit
end

#
# Calabash task
#
Yolo::Tasks::Ios::Calabash.new do |t|
  t.workspace = "Yolo.xcworkspace"
  t.scheme = "Yolo-cal"
  t.format = :junit
  t.output_dir = "example-tests"
end

#
# Coverage task
# !!Alpha!!
#
# Yolo::Tasks::Ios::Coverage.new do |t|
#   t.scheme = "MyProject"
# end
