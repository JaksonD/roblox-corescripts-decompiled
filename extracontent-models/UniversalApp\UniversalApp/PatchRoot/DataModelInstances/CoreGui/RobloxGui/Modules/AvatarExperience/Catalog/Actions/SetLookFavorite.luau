local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "string", "SetLookFavorite expects lookId");
    v2.isType(v4, "boolean", "SetLookFavorite expects isFavorited");
    return {
        lookId = v3, 
        isFavorited = v4
    };
end);