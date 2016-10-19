project_root = File.dirname(File.absolute_path(__FILE__))
$LOAD_PATH << File.expand_path(File.join(project_root))

Dir.glob(project_root + '/**/*.rb', &method(:require))
