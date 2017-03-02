function checkDir( filePath )
% if 'filePath' is a dir , then make the dir. 
% if 'filePath' is a file,  then make the dir of the file.
[soursePathstr, NAME, EXT ] = fileparts(filePath);
if isempty(EXT) % not a file, but a dir path
    soursePathstr = filePath;
end
if ( ~exist(soursePathstr,'dir' ) )
    mkdir( soursePathstr );
end
end