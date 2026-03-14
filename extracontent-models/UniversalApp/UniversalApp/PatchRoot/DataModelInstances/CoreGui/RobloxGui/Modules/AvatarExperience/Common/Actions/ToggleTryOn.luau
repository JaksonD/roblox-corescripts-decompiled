local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
return v1.makeActionCreator(script.Name, function(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 38 ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy)
    return {
        itemType = v6, 
        itemSubType = v7, 
        itemId = v8, 
        selectedInTryOnManager = v9, 
        overrideOrder = v10, 
        bundleInfo = v11, 
        widgetInfo = v12, 
        receivedBundleInfo = v13, 
        isRecolorable = v14, 
        bundleItems = if l_FFlagAXMISEnableMultiShopping_0 then v15 else nil, 
        resetTryOnsBeforeToggleOn = if l_FFlagAXMISEnableMultiShopping_0 then v16 else nil
    };
end);