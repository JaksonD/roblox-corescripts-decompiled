local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom);
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate);
local v6 = {
    zoomSliderValue = 0, 
    rotateSliderValue = 0
};
return v2.createReducer(v6, {
    [v4.name] = function(v7, v8) --[[ Line: 29 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v7, {
            zoomSliderValue = v8.zoomSliderValue
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 34 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v9, {
            rotateSliderValue = v10.rotateSliderValue
        });
    end
});