function deleteDirAndFiles( dir )
if exist( dir,'dir' )
    rmdir( dir ,'s');
else if exist( dir,'file' )
           delete( dir );
    end
end