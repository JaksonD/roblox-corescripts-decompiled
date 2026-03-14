local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_PurchaseItemsSuccess_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).State.Actions.PurchaseItemsSuccess;
local l_CharacterHistoryStateChangeButtonActivated_0 = v5.State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local v11 = {};
return v2.createReducer(v11, {
    [v3.name] = function(v12, v13) --[[ Line: 31 ]]
        -- upvalues: v4 (copy)
        return (v4.Dictionary.join(v12, v13.bodyPartRangeIds));
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v14, v15) --[[ Line: 34 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v15.equipped and v15.equipped.BodyPartRangeIds then
            return (table.clone(v15.equipped.BodyPartRangeIds));
        else
            return v14;
        end;
    end, 
    [l_PurchaseItemsSuccess_0.name] = l_FFlagAXMISEnableMultiShopping_0 and function(v16, v17) --[[ Line: 43 ]]
        -- upvalues: v11 (copy), v4 (copy)
        v16 = v16 or v11;
        if v17.bodyPartColorRangeIds then
            return (v4.Dictionary.join(v16, v17.bodyPartColorRangeIds));
        else
            return v16;
        end;
    end or nil
});