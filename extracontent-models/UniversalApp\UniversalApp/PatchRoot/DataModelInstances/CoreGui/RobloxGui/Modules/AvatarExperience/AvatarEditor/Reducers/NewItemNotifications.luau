local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewAssetNotification);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewAssetNotification);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewOutfitNotification);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewOutfitNotification);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
return v4.createReducer({}, {
    [v7.name] = function(v12, v13) --[[ Line: 28 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v12, {
            [v13.assetTypeId] = true
        });
    end, 
    [v8.name] = function(v14, v15) --[[ Line: 34 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v14, {
            [v15.assetTypeId] = false
        });
    end, 
    [v9.name] = function(v16, v17) --[[ Line: 40 ]]
        -- upvalues: v11 (copy), v3 (copy), v6 (copy)
        if v11() then
            return v3.Dictionary.join(v16, {
                [v17.outfitType] = true
            });
        elseif v17.outfitType == v6.OutfitTypes.DynamicHead then
            return v3.Dictionary.join(v16, {
                [v6.NewDHOutfitNotificationKey] = true
            });
        else
            return v3.Dictionary.join(v16, {
                [v6.NewOutfitNotificationKey] = true
            });
        end;
    end, 
    [v10.name] = function(v18, v19) --[[ Line: 57 ]]
        -- upvalues: v11 (copy), v3 (copy), v6 (copy)
        if v11() then
            return v3.Dictionary.join(v18, {
                [v19.outfitType] = false
            });
        elseif v19.outfitType == v6.OutfitTypes.DynamicHead then
            return v3.Dictionary.join(v18, {
                [v6.NewDHOutfitNotificationKey] = false
            });
        else
            return v3.Dictionary.join(v18, {
                [v6.NewOutfitNotificationKey] = false
            });
        end;
    end
});