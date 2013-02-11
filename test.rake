INCLUDES = [HEADERS_DIR]
TEST_DIR = "spec"


desc "Build the Test Application"
task :build_test do
  FileUtils.mkdir File.join(PROJECT_DIR, "build") if !Dir.exist?(File.join(PROJECT_DIR, "build"))
  flags = FLAGS.join(" ")
  INCLUDES << "lib/igloo-master"
  headers = INCLUDES.collect{|x| "-I#{File.join(PROJECT_DIR, x)}" }.join(" ")
  lib_paths = LIB_PATHS.collect{|x| "-L#{x}"}.join(" ")
  libs = LIBRARIES.collect{|x| "-l#{x}"}.join(" ")
  source_path = File.join(PROJECT_DIR, SOURCE_DIR)
  files_array = Dir.glob(File.join(SOURCE_DIR,"**", "*.{c,cpp}"))
  files_array.delete "src/main.cpp"
  files_array += Dir.glob(File.join(TEST_DIR,"**", "*.{c,cpp}"))
  files = files_array.join(" ")
  
  puts files
  output = "-o #{File.join(PROJECT_DIR, "build")}/#{APP_NAME}_test"
  command = "#{CC} #{flags} #{headers} #{lib_paths} #{libs} #{files} #{output}"
  puts command
  system command
end

desc "Run the test"
task :test => [:clean, :build_test] do
  system "#{File.join(PROJECT_DIR, "build")}/#{APP_NAME}_test"
end
