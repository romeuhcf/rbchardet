require "mkmf-rice"
#have_library( 'stdc++' );
#$CFLAGS = " -Wall"
#

globs = [".", "LangModels"].map do |directory|
	  File.join(File.dirname(__FILE__), directory)
end.join(",")

$objs = Dir.glob("{#{globs}}/*.cpp").map do |file|
	puts file
	  File.join(File.dirname(file), "#{File.basename(file, ".cpp")}.o")
end
create_makefile("rbchardet/rbchardet")
