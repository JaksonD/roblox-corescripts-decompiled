local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v9 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v12 = {};
local v13 = {
    v8.Closeup, 
    v8.FullBody
};
v12.ConvertThumbnailTypeToInt = function(v14) --[[ Line: 25 ]] --[[ Name: ConvertThumbnailTypeToInt ]]
    -- upvalues: v13 (copy)
    return table.find(v13, v14);
end;
v12.ConvertThumbnailTypeToEnum = function(v15) --[[ Line: 29 ]] --[[ Name: ConvertThumbnailTypeToEnum ]]
    -- upvalues: v8 (copy)
    if v15 == v8.Closeup then
        return Enum.AvatarThumbnailCustomizationType.Closeup;
    else
        return Enum.AvatarThumbnailCustomizationType.FullBody;
    end;
end;
v12.isPPEScreenUsingPeekabooWidget = function(v16) --[[ Line: 37 ]] --[[ Name: isPPEScreenUsingPeekabooWidget ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v17 = true;
    if v16 ~= l_AvatarScreen_0.ProfilePictureEditorCamera then
        v17 = v16 == l_AvatarScreen_0.ProfilePictureEditorFinal;
    end;
    return v17;
end;
v12.getEmotesCategorySubcategoryAndInfo = function() --[[ Line: 41 ]] --[[ Name: getEmotesCategorySubcategoryAndInfo ]]
    -- upvalues: v11 (copy), v9 (copy), v4 (copy), v6 (copy), v5 (copy)
    if v11() then
        return nil, nil, (v9());
    else
        local v18 = v4().AssetTypeToCategorySubcategory[v6.AssetTypeIdStrings.EmoteAnimation];
        local l_category_0 = v18.category;
        local l_subcategory_0 = v18.subcategory;
        return l_category_0, l_subcategory_0, (v5.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0));
    end;
end;
v12.getSliderValueFromYRotDeg = function(v21) --[[ Line: 55 ]] --[[ Name: getSliderValueFromYRotDeg ]]
    -- upvalues: v7 (copy)
    return (math.clamp(v21 * v7.SliderMax / v7.YRotMaxDeg, -v7.SliderMax, v7.SliderMax));
end;
v12.getYRotDegFromSliderValue = function(v22) --[[ Line: 63 ]] --[[ Name: getYRotDegFromSliderValue ]]
    -- upvalues: v7 (copy)
    return (math.clamp(v22 * v7.YRotMaxDeg / v7.SliderMax, -v7.YRotMaxDeg, v7.YRotMaxDeg));
end;
v12.getCameraDistanceScaleFromSliderValue = function(v23) --[[ Line: 71 ]] --[[ Name: getCameraDistanceScaleFromSliderValue ]]
    -- upvalues: v7 (copy)
    local v24 = -v23 / v7.SliderMax + 1;
    return (1 - v7.ZoomMinScale) * v24 * v24 + v7.ZoomMinScale;
end;
v12.getSliderValueFromCameraDistanceScale = function(v25) --[[ Line: 82 ]] --[[ Name: getSliderValueFromCameraDistanceScale ]]
    -- upvalues: v7 (copy)
    return (math.clamp((math.sqrt((v25 - v7.ZoomMinScale) / (1 - v7.ZoomMinScale)) - 1) * -v7.SliderMax, -v7.SliderMax, v7.SliderMax));
end;
return v12;