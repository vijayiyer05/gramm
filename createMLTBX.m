function createMLTBX(prjFile, toolboxVersion)
% Package the toolbox as MLTBX.
%   createMLTBX(prjFile, toolboxVersion) builds the MLTBX file and saves it
%   in the working directory. The prjFile is the path to the toolbox packaging
%   PRJ file and toolboxVersion is a string of the form Major.Minor.Bug.Build.
%
%   Example
%       createMLTBX("gramm.prj", "1.0.1.3")

if ~isfile(prjFile)
    error("Unable to find \'%s\'.", prjFile);
end

export("doc/GettingStarted.mlx","html/GettingStarted.html")
export("doc/gramm_landing.mlx","html/gramm_landing.html")
export("doc/gramm_functions.mlx","html/gramm_functions.html")
export("doc/gramm_advanced.mlx","html/gramm_advanced.html")
export("doc/functions/gramm_doc.mlx","html/functions/gramm_doc.html")
export("doc/functions/facet_wrap_doc.mlx","html/functions/facet_wrap_doc.html")
export("doc/functions/facet_grid_doc.mlx","html/functions/facet_grid_doc.html")


packagingData = matlab.addons.toolbox.ToolboxOptions(prjFile);

% Update the version number
packagingData.ToolboxVersion = toolboxVersion;
outputFileName = packagingData.ToolboxName + "_" + toolboxVersion + ".mltbx";
packagingData.OutputFile =outputFileName;

% Create toolbox MLTBX
matlab.addons.toolbox.packageToolbox(packagingData);


fprintf("Created %s.\n", outputFileName);
end