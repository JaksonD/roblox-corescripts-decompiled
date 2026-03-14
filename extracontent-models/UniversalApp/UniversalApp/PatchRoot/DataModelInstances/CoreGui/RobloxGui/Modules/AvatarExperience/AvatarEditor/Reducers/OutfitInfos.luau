local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.OutfitRenamed);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.OutfitInformationReceived);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
return v2.createReducer({}, {
    [v5.name] = function(v12, v13) --[[ Line: 20 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v12, {
            [tostring(v13.outfit.outfitId)] = v13.outfit
        });
    end, 
    [v6.name] = function(v14, v15) --[[ Line: 23 ]]
        -- upvalues: v3 (copy)
        local v16 = tostring(v15.outfitId);
        return v3.Dictionary.join(v14, {
            [v16] = v3.None
        });
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        local v19 = tostring(v18.outfitId);
        return v3.Dictionary.join(v17, {
            [v19] = v3.None
        });
    end, 
    [v8.name] = function(v20, v21) --[[ Line: 33 ]]
        -- upvalues: v3 (copy)
        local v22 = v20[v21.outfitId];
        if not v22 then
            return v20;
        else
            return v3.Dictionary.join(v20, {
                [v21.outfitId] = v3.Dictionary.join(v22, {
                    name = v21.name
                })
            });
        end;
    end, 
    [v9.name] = v11.isEnabled() and function(v23, v24) --[[ Line: 46 ]]
        local v25 = table.clone(v23);
        for v26, v27 in v24.outfits do
            v25[v26] = v27.outfitInfo;
        end;
        return v25;
    end or nil
});