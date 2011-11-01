class Driver
  
  require 'Sort'
  require 'PreSort'
  
  @workingDir = "c:\\toconvert"
  @sortedFilesDir = "c:\\sorted"
  
  p = PreSort.new(@workingDir)
  @totalNumberFiles = p.getTotalNumberFiles()
  puts "Total number of files to sort - "+@totalNumberFiles.to_s
  
  s = Sort.new(@workingDir , @sortedFilesDir , @totalNumberFiles)
  s.populateFilenames()
  s.createFolders()
  s.sortFiles()
  
end