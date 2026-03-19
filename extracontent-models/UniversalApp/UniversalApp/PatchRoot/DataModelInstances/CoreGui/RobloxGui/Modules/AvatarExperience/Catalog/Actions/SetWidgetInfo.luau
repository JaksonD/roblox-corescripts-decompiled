local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return v1.makeActionCreator(script.Name, function(v4, v5, v6, v7, v8) --[[ Line: 29 ]]
    -- upvalues: v2 (copy)
    v2.isType(v4, "table", "SetWidgetInfo expects widgetInfo");
    return {
        widgetInfo = v4, 
        requestId = v5, 
        query = v6, 
        context = v7, 
        configuration = v8
    };
end);