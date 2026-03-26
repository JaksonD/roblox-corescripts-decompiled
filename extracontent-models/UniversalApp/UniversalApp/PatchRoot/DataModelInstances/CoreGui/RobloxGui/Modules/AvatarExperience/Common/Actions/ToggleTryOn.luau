local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v5.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v5.FFlagAXDurablesForMIS;
return v1.makeActionCreator(script.Name, function(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 38 ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXDurablesForMIS_0 (copy)
    return {
        itemType = v8, 
        itemSubType = v9, 
        itemId = v10, 
        selectedInTryOnManager = v11, 
        overrideOrder = v12, 
        bundleInfo = v13, 
        widgetInfo = v14, 
        receivedBundleInfo = v15, 
        isRecolorable = v16, 
        bundleItems = if l_FFlagAXMISEnableMultiShopping_0 then v17 else nil, 
        resetTryOnsBeforeToggleOn = if l_FFlagAXMISEnableMultiShopping_0 then v18 else nil, 
        selectedTimedOptionIndex = if l_FFlagAXDurablesForMIS_0 then v19 else nil
    };
end);