function [subDirFullPaths, subDirNames] = getSubDir(baseDir)

subdir = dir(baseDir);
nsub = length(subdir);
subDirFullPaths = cell(1, nsub);
subDirNames = cell(1, nsub);
for i = 1 : nsub
    if(isequal(subdir(i).name, '.') ||...
       isequal(subdir(i).name, '..') ||...
        ~subdir( i ).isdir)               % 如果不是目录则跳过
        continue;
    end
    subDirFullPaths{i} = fullfile(baseDir, subdir(i).name);
    subDirNames{i} = subdir(i).name;
end
 