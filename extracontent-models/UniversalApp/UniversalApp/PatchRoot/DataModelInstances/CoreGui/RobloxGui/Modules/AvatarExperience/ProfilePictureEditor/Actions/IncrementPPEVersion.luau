local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3) --[[ Line: 5 ]] --[[ Name: IncrementPPEVersion ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "userdata", "IncrementPPEVersion action expects thumbnailType to be userdata");
    return {
        thumbnailType = v3
    };
end);