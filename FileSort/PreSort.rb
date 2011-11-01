class PreSort
  
  
  def initialize(workingDir)
     @workingDir = workingDir
   end
   
  def getTotalNumberFiles()
    
  @totalNumberFiles = 0
  Find.find(@workingDir) do |path|
       if FileTest.directory?(path)
         if File.basename(path)[0] == ?.
           Find.prune       # Don't look any further into this directory.
         else
         Dir.foreach(path) do
         |f|
           if !FileTest.directory? path + File::SEPARATOR + f
             puts "Filename is "+f
             @totalNumberFiles = @totalNumberFiles + 1
           end
         end
           next
         end
       else
       end
       
     end
     
  return @totalNumberFiles
  end


end