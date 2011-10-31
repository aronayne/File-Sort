
require 'find'
require 'fileutils'

=begin
Class which sorts files of any type alphabetically into various folders.
=end

class Sort
  

  def initialize(workingDir, sortedFilesDir, totalNumberFiles)
     @fileArray = Array.new()
     @workingDir = workingDir
     @sortedFilesDir = sortedFilesDir
     @totalNumberFiles = totalNumberFiles
   end

  def createFolders()
    
    begin
      FileUtils.remove_dir(@sortedFilesDir, true)
      rescue Exception=>e
      puts e
    end
    
    Dir.mkdir(@sortedFilesDir)
    dirToCreateArray = Array.new(('A'..'Z').to_a)
    dirToCreateArray.each() {
      |x|
      Dir.mkdir(@sortedFilesDir+"\\"+x)
    }
  end
  
  def populateFilenames()
  Find.find(@workingDir) do |path|
       if FileTest.directory?(path)
         if File.basename(path)[0] == ?.
           Find.prune       # Don't look any further into this directory.
         else
         Dir.foreach(path) do
         |f|
         # do whatever you want with f, which is a filename within the
         # given directory (not fully-qualified)
           if !FileTest.directory? path + File::SEPARATOR + f
             @fileArray.push(path + File::SEPARATOR + f)
          # print "\n"+f
           end
         end
           next
         end
       else
       end
     end
end

def sortFiles()
  
  @fileNumber = 0;
  directory_names = Dir.foreach(@sortedFilesDir)
  matching_directory_names = @fileArray.map do |filename|
    directory_names.find do |directory_name|
     # puts directory_name+","+filename
     # puts filename.upcase().to_a[3]
      if(filename.upcase().start_with?(directory_name.upcase()))
        
        begin
          
          @fileNumber = @fileNumber + 1
          dirToCopyInto = @sortedFilesDir+"\\"+filename[/\/(.)(?!.*\/)/][1,1].upcase()
          puts "Copying file ("+@fileNumber.to_s+" of "+
          @totalNumberFiles.to_s+ ")" +filename+" To "+dirToCopyInto
          FileUtils.cp filename, dirToCopyInto

          rescue Exception=>e
          puts e
        end
        

      end
    end
  end
end

end



