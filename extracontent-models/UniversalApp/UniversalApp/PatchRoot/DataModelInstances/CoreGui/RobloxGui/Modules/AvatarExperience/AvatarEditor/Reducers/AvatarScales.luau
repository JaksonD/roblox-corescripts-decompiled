local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_PurchaseItemsSuccess_0 = v9.State.Actions.PurchaseItemsSuccess;
local l_CharacterHistoryStateChangeButtonActivated_0 = v7.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXMISEnableMultiShopping_0 = v8.FFlagAXMISEnableMultiShopping;
local v15 = {
    height = 1, 
    width = 1, 
    depth = 1, 
    head = 1, 
    bodyType = 0, 
    proportion = 0
};
return v2.createReducer(v15, {
    [v4.name] = function(v16, v17) --[[ Line: 45 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v16, v17.scales);
    end, 
    [v5.name] = function(v18, v19) --[[ Line: 48 ]]
        if not v19.avatarData then
            return v18;
        else
            return v19.avatarData.scales;
        end;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v20, v21) --[[ Line: 55 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v21.equipped and v21.equipped.AvatarScales then
            return table.clone(v21.equipped.AvatarScales);
        else
            return v20;
        end;
    end, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v22, v23) --[[ Line: 67 ]]
        -- upvalues: v15 (copy), v3 (copy)
        v22 = v22 or v15;
        if v23.bodyScales then
            return (v3.Dictionary.join(v22, v23.bodyScales));
        else
            return v22;
        end;
    end or nil
});