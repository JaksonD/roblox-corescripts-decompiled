local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.OutfitInformationReceived);
local v8 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
return v2.createReducer({}, {
    [v5.name] = function(v10, v11) --[[ Line: 32 ]]
        -- upvalues: v3 (copy)
        local v12 = v10 or {};
        local l_itemType_0 = v11.itemType;
        local v14 = {};
        for _, v16 in v11.ids do
            v14[v16] = l_itemType_0;
        end;
        return v3.Dictionary.join(v12, v14);
    end, 
    [v7.name] = v8.isEnabled() and function(v17, v18) --[[ Line: 46 ]]
        -- upvalues: v6 (copy)
        local v19 = table.clone(v17 or {});
        local l_Outfit_0 = v6.OutfitOrAsset.Outfit;
        for v21, _ in v18.outfits do
            v19[v21] = l_Outfit_0;
        end;
        return v19;
    end or nil
});