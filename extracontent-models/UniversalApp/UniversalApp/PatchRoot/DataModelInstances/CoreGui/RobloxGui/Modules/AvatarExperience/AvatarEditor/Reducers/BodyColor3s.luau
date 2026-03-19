local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_CharacterHistoryStateChangeButtonActivated_0 = v9.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXMISEnableMultiShopping_0 = v10.FFlagAXMISEnableMultiShopping;
local l_PurchaseItemsSuccess_0 = v11.State.Actions.PurchaseItemsSuccess;
local v16 = {
    headColor3 = v6.DefaultBodyColor3, 
    leftArmColor3 = v6.DefaultBodyColor3, 
    leftLegColor3 = v6.DefaultBodyColor3, 
    rightArmColor3 = v6.DefaultBodyColor3, 
    rightLegColor3 = v6.DefaultBodyColor3, 
    torsoColor3 = v6.DefaultBodyColor3
};
return v2.createReducer(v16, {
    [v4.name] = function(v17, v18) --[[ Line: 37 ]]
        -- upvalues: v7 (copy)
        return (v7.Dictionary.join(v17, v18.bodyColor3s));
    end, 
    [v5.name] = function(_, v20) --[[ Line: 41 ]]
        return v20.avatarData.bodyColor3s;
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v21, v22) --[[ Line: 45 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v22.equipped and v22.equipped.BodyColor3s then
            return table.clone(v22.equipped.BodyColor3s);
        else
            return v21;
        end;
    end, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v23, v24) --[[ Line: 57 ]]
        -- upvalues: v16 (copy), v7 (copy)
        v23 = v23 or v16;
        if v24.bodyColor3s then
            return (v7.Dictionary.join(v23, v24.bodyColor3s));
        else
            return v23;
        end;
    end or nil
});