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
local l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting;
local function _(v18, v19) --[[ Line: 25 ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy), v10 (copy)
    local v20 = v19 == l_AvatarScreen_0.AvatarEditor;
    local l_category_0 = v18.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v18.AvatarExperience.AvatarEditor.Categories.subcategory;
    local v23 = v8()[l_category_0];
    local v24 = v23 and v23.Subcategories or nil;
    if v20 and v24 and v24[l_subcategory_0].SearchUuid == v10.PurchasedCharacterKey then
        return true;
    else
        return false;
    end;
end;
local v30 = l_memoize_0(function() --[[ Line: 49 ]]
    -- upvalues: v8 (copy), v11 (copy)
    for _, v27 in (v8()) do
        if v27 and v27.Subcategories then
            for _, v29 in v27.Subcategories do
                if v29 and v29.OutfitType == v11.OutfitTypes.DynamicHead then
                    return v29.SearchUuid;
                end;
            end;
        end;
    end;
    return nil;
end);
return function(v31, v32) --[[ Line: 65 ]]
    -- upvalues: v13 (copy), v16 (copy), v3 (copy), v7 (copy), v11 (copy), v4 (copy), v30 (copy), v12 (copy), l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (copy), v10 (copy), v5 (copy), v15 (copy), v6 (copy), l_AvatarScreen_0 (copy), v8 (copy)
    v13.isType(v31, "string", "GrantOutfit thunk expects outfitId to be a string");
    return function(v33) --[[ Line: 67 ]]
        -- upvalues: v16 (ref), v3 (ref), v31 (copy), v7 (ref), v11 (ref), v4 (ref), v30 (ref), v12 (ref), l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (ref), v10 (ref), v5 (ref), v15 (ref), v6 (ref), v32 (copy), l_AvatarScreen_0 (ref), v8 (ref)
        local v34 = nil;
        local v35 = nil;
        if not v16() then
            v34 = v33:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
            v33:dispatch(v3(v31));
            v35 = v33:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
        end;
        v33:dispatch(v7(v31)):andThen(function() --[[ Line: 75 ]]
            -- upvalues: v33 (copy), v31 (ref), v16 (ref), v11 (ref), v34 (ref), v3 (ref), v35 (ref), v4 (ref), v30 (ref), v12 (ref), l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (ref), v10 (ref), v5 (ref), v15 (ref), v6 (ref), v32 (ref), l_AvatarScreen_0 (ref), v8 (ref)
            local v36 = v33:getState();
            local v37 = v36.AvatarExperience.AvatarEditor.OutfitInfos[tostring(v31)];
            if v16() then
                local l_outfitType_0 = v37.outfitType;
                if v37.inventoryType == v11.OutfitTypes.Animations then
                    l_outfitType_0 = v11.OutfitTypes.Animations;
                elseif l_outfitType_0 == v11.OutfitTypes.Avatar and v37.isEditable then
                    l_outfitType_0 = v11.OutfitTypes.EditableAvatar;
                end;
                v34 = v33:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
                v33:dispatch(v3(v31, l_outfitType_0));
                v35 = v33:getState().AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
                v33:dispatch(v4(l_outfitType_0));
            end;
            if v31 and v37.outfitType == v11.OutfitTypes.DynamicHead then
                local v39 = v30();
                if v39 then
                    v33:dispatch(v12(v39, v31));
                    if not v16() then
                        v33:dispatch(v4(v11.OutfitTypes.DynamicHead));
                    end;
                end;
                return;
            else
                local v40 = if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 then v37.outfitType == v11.OutfitTypes.Makeup else nil;
                if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 and v31 and v40 then
                    v33:dispatch(v12(v10.MakeupOutfitKey, v31));
                    return;
                elseif v31 and v37.isEditable then
                    v33:dispatch(v5(v31));
                    return;
                else
                    if v34 ~= v35 and (not v15 or v37.outfitType == v11.OutfitTypes.Avatar) then
                        if v31 and not v37.isEditable then
                            v33:dispatch(v6(v31));
                        end;
                        if not v16() then
                            local v41 = v32 == l_AvatarScreen_0.AvatarEditor;
                            local l_category_1 = v36.AvatarExperience.AvatarEditor.Categories.category;
                            local l_subcategory_1 = v36.AvatarExperience.AvatarEditor.Categories.subcategory;
                            local v44 = v8()[l_category_1];
                            local v45 = v44 and v44.Subcategories or nil;
                            if not if v41 and v45 then v45[l_subcategory_1].SearchUuid == v10.PurchasedCharacterKey else false then
                                v33:dispatch(v4(v11.OutfitTypes.Avatar));
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end);
    end;
end;