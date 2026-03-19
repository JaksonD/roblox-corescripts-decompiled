local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.AvatarExperience.ColorPicker.ColorPickerUtils);
return v2.makeActionCreator(script.Name, function(v7, v8, v9, v10) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    v3.isType(v7, "string", "rangeId");
    v3.isType(v8, "string", "bodyPartForSkinColoringId");
    v3.isType(v9, "number", "sliderValue");
    local v11, v12 = v6.clampBetween0And1(v9);
    if v12 then
        v5(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v9))));
    end;
    v9 = v11;
    v3.isType(v10, "Color3", "color3");
    return {
        rangeId = v7, 
        bodyPartForSkinColoringId = v8, 
        sliderValue = v9, 
        color3 = v10
    };
end);