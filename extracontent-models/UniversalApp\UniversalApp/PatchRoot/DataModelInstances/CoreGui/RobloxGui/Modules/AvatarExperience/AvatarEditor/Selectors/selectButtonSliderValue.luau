local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AvatarExperience);
return function(v3, v4) --[[ Line: 12 ]] --[[ Name: selectButtonSliderValue ]]
    -- upvalues: v1 (copy)
    local l_selectedBodyPartIndex_0 = v3.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
    local l_rangeIdToBodyPartsToSliderAndColor3Values_0 = v3.AvatarEditor.BodyColorPickerSettings.rangeIdToBodyPartsToSliderAndColor3Values;
    return v1.getSliderValueForRangeIdAndBodyPartIndex(v4, l_selectedBodyPartIndex_0, l_rangeIdToBodyPartsToSliderAndColor3Values_0);
end;