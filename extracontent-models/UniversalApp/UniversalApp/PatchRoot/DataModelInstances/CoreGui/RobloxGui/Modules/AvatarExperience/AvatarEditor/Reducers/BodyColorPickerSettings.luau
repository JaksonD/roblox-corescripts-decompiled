local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = {
    viewSetting = "Standard", 
    rangeIdToBodyPartsToSliderAndColor3Values = {}, 
    selectedBodyPartIndex = 1
};
return v2.createReducer(v9, {
    [v6.name] = function(v10, v11) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        local l_rangeIdToBodyPartsToSliderAndColor3Values_0 = v10.rangeIdToBodyPartsToSliderAndColor3Values;
        local v13 = l_rangeIdToBodyPartsToSliderAndColor3Values_0[v11.rangeId] or {};
        v13 = v3.Dictionary.join(v13, {
            [v11.bodyPartForSkinColoringId] = {
                color3 = v11.color3, 
                sliderValue = v11.sliderValue
            }
        });
        return v3.Dictionary.join(v10, {
            rangeIdToBodyPartsToSliderAndColor3Values = v3.Dictionary.join(l_rangeIdToBodyPartsToSliderAndColor3Values_0, {
                [v11.rangeId] = v13
            })
        });
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 49 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v14, {
            selectedBodyPartIndex = v15.selectedBodyPartIndex
        });
    end, 
    [v5.name] = function(v16, v17) --[[ Line: 58 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v16, {
            viewSetting = v17.bodyColorViewSetting
        });
    end
});