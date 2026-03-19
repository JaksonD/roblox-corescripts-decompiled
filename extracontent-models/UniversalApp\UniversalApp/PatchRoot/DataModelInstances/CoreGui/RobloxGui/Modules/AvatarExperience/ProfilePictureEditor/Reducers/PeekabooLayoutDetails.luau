local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails);
return v2.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        local v7 = v5[v6.screenName] or {};
        return v3.Dictionary.join(v5, {
            [v6.screenName] = v3.Dictionary.join(v7, {
                screenHeightPix = v6.screenHeightPix, 
                topYPix = v6.topYPix, 
                viewportSizePix = v6.viewportSizePix
            })
        });
    end
});