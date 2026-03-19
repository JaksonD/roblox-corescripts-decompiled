local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.Parent.Enums.SlotType);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagEnableSlotsHeadShapeThumbnail_0 = v3.FFlagEnableSlotsHeadShapeThumbnail;
local l_FFlagAXCustomizeMakeupSupport_0 = v3.FFlagAXCustomizeMakeupSupport;
local function v9(v6, v7, v8) --[[ Line: 23 ]] --[[ Name: buildSlotSubcategory ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy)
    if l_FFlagAXCustomizeMakeupSupport_0 then
        return {
            nameTranslationKey = v6.nameTranslationKey, 
            icon = v6.icon, 
            thumbnailUrl = v7, 
            assetTypes = v6.assetTypes, 
            editorSubcategory = v6.editorSubcategory, 
            eligibleSubcategories = v6.eligibleSubcategories, 
            currentAssetType = v8, 
            hide = v6.hide, 
            deselectable = v6.deselectable
        };
    else
        return {
            nameTranslationKey = v6.nameTranslationKey, 
            icon = v6.icon, 
            thumbnailUrl = v7, 
            assetTypes = v6.assetTypes, 
            editorSubcategory = v6.editorSubcategory
        };
    end;
end;
local function _(v10, v11, v12, v13) --[[ Line: 47 ]] --[[ Name: buildLayeredSlotSubcategory ]]
    -- upvalues: v9 (copy), v2 (copy)
    local v14 = v9(v10, v11, v12);
    v14.slotType = v2.LayeredSlot;
    v14.layerLimit = v10.layerLimit;
    v14.layerIndex = v13;
    return v14;
end;
local _ = function(v16) --[[ Line: 62 ]] --[[ Name: getHeadShapeFromEquippedAssets ]]
    local v17 = v16[tostring(Enum.AvatarAssetType.DynamicHead.Value)];
    if v17 then
        for _, v19 in v17 do
            if v19.headShape == "Default" then
                return nil;
            else
                return v19.headShape;
            end;
        end;
    end;
    return nil;
end;
local function v26(v21, v22) --[[ Line: 75 ]] --[[ Name: getClassicFaceOrDynamicHeadThumbnail ]]
    local v23 = v21[if v22 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)];
    if v23 then
        for v24, _ in v23 do
            return (("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v24));
        end;
    end;
    return nil;
end;
return function(v27, v28) --[[ Line: 92 ]] --[[ Name: buildSlots ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), v2 (copy), v9 (copy), l_FFlagEnableSlotsHeadShapeThumbnail_0 (copy), v26 (copy)
    local v29 = false;
    local v30 = {};
    local v31 = false;
    local v32 = false;
    for _, v34 in v27 do
        if l_FFlagAXCustomizeMakeupSupport_0 and v34.slotType == v2.LayeredSlot then
            for v35 = 0, v34.layerLimit - 1 do
                local v36 = false;
                for _, v38 in v34.assetTypes do
                    local v39 = v28[tostring(v38.Value)];
                    local v40 = false;
                    if v39 ~= nil then
                        v40 = next(v39);
                    end;
                    if v40 then
                        for v41, v42 in v39 do
                            if v42.order == v35 then
                                local v43 = ("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v41);
                                local v44 = v9(v34, v43, v38);
                                v44.slotType = v2.LayeredSlot;
                                v44.layerLimit = v34.layerLimit;
                                v44.layerIndex = v35;
                                table.insert(v30, v44);
                                v36 = true;
                                break;
                            end;
                        end;
                    end;
                end;
                if not v36 then
                    local v45 = v9(v34, nil, nil);
                    v45.slotType = v2.LayeredSlot;
                    v45.layerLimit = v34.layerLimit;
                    v45.layerIndex = v35;
                    table.insert(v30, v45);
                end;
            end;
        else
            local l_assetTypes_0 = v34.assetTypes;
            local v47 = false;
            for _, v49 in l_assetTypes_0 do
                local v50 = v28[tostring(v49.Value)];
                local v51 = false;
                if v50 ~= nil then
                    v51 = next(v50);
                end;
                if v51 then
                    if v49 == Enum.AvatarAssetType.Face then
                        v32 = true;
                    else
                        if v49 == Enum.AvatarAssetType.DynamicHead then
                            v31 = true;
                        end;
                        for v52, _ in v50 do
                            local v54 = ("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v52);
                            if v31 and l_FFlagEnableSlotsHeadShapeThumbnail_0 then
                                local v55 = v28[tostring(Enum.AvatarAssetType.DynamicHead.Value)];
                                local v56;
                                if v55 then
                                    for _, v58 in v55 do
                                        v56 = if v58.headShape == "Default" then nil else v58.headShape;
                                        v29 = true;
                                        if v29 then
                                            break;
                                        end;
                                    end;
                                end;
                                if not v29 then
                                    v56 = nil;
                                end;
                                v29 = false;
                                if v56 then
                                    v54 = ("rbxthumb://type=Asset&id=%*&headshape=%*&w=150&h=150"):format(v52, v56);
                                end;
                            end;
                            table.insert(v30, (v9(v34, v54, v49)));
                            v47 = true;
                        end;
                    end;
                end;
            end;
            for _, v60 in l_assetTypes_0 do
                if v60 == Enum.AvatarAssetType.Face and (v31 or v32) then
                    table.insert(v30, (v9(v34, v26(v28, v31), v60)));
                    v47 = true;
                end;
            end;
            if not v47 then
                table.insert(v30, (v9(v34)));
            end;
        end;
    end;
    return v30;
end;