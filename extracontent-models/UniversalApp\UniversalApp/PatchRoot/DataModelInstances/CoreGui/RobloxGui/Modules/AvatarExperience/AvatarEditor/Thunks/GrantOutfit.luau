local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfit);
local v4 = require(l_Modules_0.AvatarExperience.Common.Actions.AddNewOutfitNotification);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType);
local v13 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = game:DefineFastFlag("AXFixShoesInPurchasedCharacters", false);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local function _(v17, v18) --[[ Line: 23 ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy), v10 (copy)
    local v19 = v18 == l_AvatarScreen_0.AvatarEditor;
    local l_category_0 = v17.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v17.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v22 = v8()[l_category_0];
    local v23 = v22 and v22.Subcategories or nil;
    if v19 and v23 and v23[l_subcategory_0].SearchUuid == v10.PurchasedCharacterKey then
        return true;
    else
        return false;
    end;
end;
local v29 = l_memoize_0(function() --[[ Line: 47 ]]
    -- upvalues: v8 (copy), v11 (copy)
    for _, v26 in (v8()) do
        if v26 and v26.Subcategories then
            for _, v28 in v26.Subcategories do
                if v28 and v28.OutfitType == v11.OutfitTypes.DynamicHead then
                    return v28.SearchUuid;
                end;
            end;
        end;
    end;
    return nil;
end);
return function(v30, v31) --[[ Line: 63 ]]
    -- upvalues: v13 (copy), v16 (copy), v3 (copy), v7 (copy), v11 (copy), v4 (copy), v29 (copy), v12 (copy), v5 (copy), v15 (copy), v6 (copy), l_AvatarScreen_0 (copy), v8 (copy), v10 (copy)
    v13.isType(v30, "string", "GrantOutfit thunk expects outfitId to be a string");
    return function(v32) --[[ Line: 65 ]]
        -- upvalues: v16 (ref), v3 (ref), v30 (copy), v7 (ref), v11 (ref), v4 (ref), v29 (ref), v12 (ref), v5 (ref), v15 (ref), v6 (ref), v31 (copy), l_AvatarScreen_0 (ref), v8 (ref), v10 (ref)
        local v33 = nil;
        local v34 = nil;
        if not v16() then
            v33 = v32:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
            v32:dispatch(v3(v30));
            v34 = v32:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        end;
        v32:dispatch(v7(v30)):andThen(function() --[[ Line: 73 ]]
            -- upvalues: v32 (copy), v30 (ref), v16 (ref), v11 (ref), v33 (ref), v3 (ref), v34 (ref), v4 (ref), v29 (ref), v12 (ref), v5 (ref), v15 (ref), v6 (ref), v31 (ref), l_AvatarScreen_0 (ref), v8 (ref), v10 (ref)
            local v35 = v32:getState();
            local v36 = v35.AvatarExperience.AvatarEditor.OutfitInfos[tostring(v30)];
            if v16() then
                local l_outfitType_0 = v36.outfitType;
                if v36.inventoryType == v11.OutfitTypes.Animations then
                    l_outfitType_0 = v11.OutfitTypes.Animations;
                elseif l_outfitType_0 == v11.OutfitTypes.Avatar and v36.isEditable then
                    l_outfitType_0 = v11.OutfitTypes.EditableAvatar;
                end;
                v33 = v32:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
                v32:dispatch(v3(v30, l_outfitType_0));
                v34 = v32:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
                v32:dispatch(v4(l_outfitType_0));
            end;
            if v30 and v36.outfitType == v11.OutfitTypes.DynamicHead then
                local v38 = v29();
                if v38 then
                    v32:dispatch(v12(v38, v30));
                    if not v16() then
                        v32:dispatch(v4(v11.OutfitTypes.DynamicHead));
                    end;
                end;
                return;
            elseif v30 and v36.isEditable then
                v32:dispatch(v5(v30));
                return;
            else
                if v33 ~= v34 and (not v15 or v36.outfitType == v11.OutfitTypes.Avatar) then
                    if v30 and not v36.isEditable then
                        v32:dispatch(v6(v30));
                    end;
                    if not v16() then
                        local v39 = v31 == l_AvatarScreen_0.AvatarEditor;
                        local l_category_1 = v35.AvatarExperience.AvatarEditor.Categories.category;
                        local l_subcategory_1 = v35.AvatarExperience.AvatarEditor.Categories.subcategory;
                        local v42 = v8()[l_category_1];
                        local v43 = v42 and v42.Subcategories or nil;
                        if not if v39 and v43 then v43[l_subcategory_1].SearchUuid == v10.PurchasedCharacterKey else false then
                            v32:dispatch(v4(v11.OutfitTypes.Avatar));
                        end;
                    end;
                end;
                return;
            end;
        end);
    end;
end;