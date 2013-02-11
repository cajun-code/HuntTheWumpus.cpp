require "fileutils"

APP_NAME = "HuntTheWampus"
LIB_PATHS = []
LIBRARIES = []
FLAGS = []
CC = "g++"
HEADERS_DIR = "include"
SOURCE_DIR = "src"
PROJECT_DIR = File.absolute_path(File.dirname(__FILE__))
desc "Clean the Application"
task :clean do
  FileUtils.rm_rf File.join(PROJECT_DIR, "build")
end

desc "Build the Application"
task :build do
  FileUtils.mkdir File.join(PROJECT_DIR, "build") if !Dir.exist?(File.join(PROJECT_DIR, "build"))
  flags = FLAGS.join(" ")
  headers = "-I#{File.join(PROJECT_DIR, HEADERS_DIR)}"
  lib_paths = LIB_PATHS.collect{|x| "-L#{x}"}.join(" ")
  libs = LIBRARIES.collect{|x| "-l#{x}"}.join(" ")
  source_path = File.join(PROJECT_DIR, SOURCE_DIR)
  files = Dir.glob(File.join(SOURCE_DIR,"**", "*.{c,cpp}")).join(" ")
  #puts files
  output = "-o #{File.join(PROJECT_DIR, "build")}/#{APP_NAME}"
  command = "#{CC} #{flags} #{headers} #{lib_paths} #{libs} #{files} #{output}"
  puts command
  system command
end

desc "Run the app"
task :run => [:clean, :build] do
  system "#{File.join(PROJECT_DIR, "build")}/#{APP_NAME}"
endimport "test.rake"