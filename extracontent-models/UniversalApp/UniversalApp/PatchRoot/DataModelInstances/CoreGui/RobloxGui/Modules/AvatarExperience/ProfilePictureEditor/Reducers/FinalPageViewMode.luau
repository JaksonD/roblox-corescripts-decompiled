local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode);
local v5 = {
    finalPageViewMode = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType).Closeup
};
return v2.createReducer(v5, {
    [v4.name] = function(v6, v7) --[[ Line: 24 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v6, {
            finalPageViewMode = v7.finalPageViewMode
        });
    end
});