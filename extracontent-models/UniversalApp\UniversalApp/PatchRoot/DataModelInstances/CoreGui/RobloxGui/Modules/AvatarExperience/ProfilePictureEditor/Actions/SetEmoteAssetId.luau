local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return (v1.makeActionCreator(script.Name, function(v3) --[[ Line: 5 ]] --[[ Name: SetEmoteAssetId ]]
    -- upvalues: v2 (copy)
    v2.isTypeOrNil(v3, "string", "SetEmoteAssetId action expects emoteAssetId to be a string or nil");
    return {
        emoteAssetId = v3
    };
end));