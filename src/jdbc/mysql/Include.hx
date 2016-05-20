package jdbc.mysql;


import haxe.io.Path;
import haxe.macro.Compiler;
import haxe.macro.Context;

class Include {
  static function library() 
    if (Context.defined('java')) {
      var here = Context.getPosInfos((macro null).pos).file;
      var root = here.substr(0, here.lastIndexOf('src'));
      var jar = 
        #if debug 
          'jars/mysql-debug.jar'
        #else
          'jars/mysql.jar'
        #end
      ;
      Compiler.addNativeLib(Path.join([root, jar]));
    }
}