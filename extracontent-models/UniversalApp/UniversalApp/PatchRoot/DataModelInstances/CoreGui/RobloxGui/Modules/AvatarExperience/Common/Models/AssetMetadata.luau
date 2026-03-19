local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCustomizeMakeupSupport_0 = v5.FFlagAXCustomizeMakeupSupport;
local l_FFlagParseHeadShapeFromAPIResponse_0 = v5.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v5.FFlagHeadRefinementFacialAnimationToggle;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v9.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_LAYERED_MAKEUP_ORDER_0 = v9.Constants.LAYERED_MAKEUP_ORDER;
local v14 = {
    mock = function() --[[ Line: 32 ]] --[[ Name: mock ]]
        return {
            version = "1", 
            order = 1, 
            type = Enum.AccessoryType.Hat, 
            isLayered = true, 
            position = Vector3.new(), 
            rotation = Vector3.new(), 
            scale = Vector3.new(1, 1, 1, 0)
        };
    end, 
    getDefaultLayeredClothingMetadata = function(v13) --[[ Line: 50 ]] --[[ Name: getDefaultLayeredClothingMetadata ]]
        -- upvalues: v3 (copy)
        if v3.AssetTypeIdToAccessoryTypeEnum[v13] == nil then
            return {
                version = "1"
            };
        else
            return {
                version = "1", 
                order = v3.LayeredClothingOrder[v13], 
                type = v3.AssetTypeIdToAccessoryTypeEnum[v13], 
                isLayered = v3.LayeredAssetTypes[v13] ~= nil
            };
        end;
    end
};
if l_FFlagAXCustomizeMakeupSupport_0 then
    v14.getDefaultLayeredMakeupMetadata = function(v15) --[[ Line: 70 ]] --[[ Name: getDefaultLayeredMakeupMetadata ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy)
        if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v15] == nil then
            return {
                version = "1"
            };
        else
            return {
                version = "1", 
                order = l_LAYERED_MAKEUP_ORDER_0[v15], 
                type = l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v15], 
                isLayered = true
            };
        end;
    end;
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v14.getDefaultMetadata = function(v16) --[[ Line: 94 ]] --[[ Name: getDefaultMetadata ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v14 (copy)
        local _ = nil;
        if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v16] then
            return (v14.getDefaultLayeredMakeupMetadata(v16));
        else
            return (v14.getDefaultLayeredClothingMetadata(v16));
        end;
    end;
else
    v14.getDefaultMetadata = function(v18) --[[ Line: 106 ]] --[[ Name: getDefaultMetadata ]]
        -- upvalues: v14 (copy)
        return (v14.getDefaultLayeredClothingMetadata(v18));
    end;
end;
local function _(v19) --[[ Line: 113 ]] --[[ Name: fromWebAPIVector3 ]]
    if v19 then
        return (Vector3.new(v19.x, v19.y, v19.z));
    else
        return nil;
    end;
end;
if l_FFlagAXCustomizeMakeupSupport_0 then
    v14.fromMetadata = function(v21, v22) --[[ Line: 124 ]] --[[ Name: fromMetadata ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_LAYERED_MAKEUP_ORDER_0 (copy), v4 (copy), v3 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
        v21 = v21 or {};
        local v23 = nil;
        if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v22] then
            local v24 = l_LAYERED_MAKEUP_ORDER_0[v22];
            return {
                version = if not (v4() ~= false) or v21.version then tostring(v21.version) else "1", 
                order = v21.order or v24, 
                type = v21.type, 
                isLayered = true
            };
        else
            local v25 = v3.LayeredClothingOrder[v22];
            v23 = {
                version = if not (v4() ~= false) or v21.version then tostring(v21.version) else "1", 
                order = v21.order or v25, 
                type = v21.type, 
                isLayered = v3.LayeredAssetTypes[v22] ~= nil
            };
            if l_FFlagParseHeadShapeFromAPIResponse_0 then
                v23.headShape = v21.headShape;
            end;
            if l_FFlagHeadRefinementFacialAnimationToggle_0 then
                v23.staticFacialAnimation = v21.staticFacialAnimation;
            end;
            local l_position_0 = v21.position;
            v23.position = if l_position_0 then Vector3.new(l_position_0.x, l_position_0.y, l_position_0.z) else nil;
            l_position_0 = v21.rotation;
            v23.rotation = if l_position_0 then Vector3.new(l_position_0.x, l_position_0.y, l_position_0.z) else nil;
            l_position_0 = v21.scale;
            v23.scale = if l_position_0 then Vector3.new(l_position_0.x, l_position_0.y, l_position_0.z) else nil;
            return v23;
        end;
    end;
    return v14;
else
    v14.fromMetadata = function(v27, v28) --[[ Line: 179 ]] --[[ Name: fromMetadata ]]
        -- upvalues: v3 (copy), v4 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy)
        v27 = v27 or {};
        local v29 = v3.LayeredClothingOrder[v28];
        local v30 = {
            version = if not (v4() ~= false) or v27.version then tostring(v27.version) else "1", 
            order = v27.order or v29, 
            type = v27.type, 
            isLayered = v3.LayeredAssetTypes[v28] ~= nil
        };
        if l_FFlagParseHeadShapeFromAPIResponse_0 then
            v30.headShape = v27.headShape;
        end;
        if l_FFlagHeadRefinementFacialAnimationToggle_0 then
            v30.staticFacialAnimation = v27.staticFacialAnimation;
        end;
        local l_position_1 = v27.position;
        v30.position = if l_position_1 then Vector3.new(l_position_1.x, l_position_1.y, l_position_1.z) else nil;
        l_position_1 = v27.rotation;
        v30.rotation = if l_position_1 then Vector3.new(l_position_1.x, l_position_1.y, l_position_1.z) else nil;
        l_position_1 = v27.scale;
        v30.scale = if l_position_1 then Vector3.new(l_position_1.x, l_position_1.y, l_position_1.z) else nil;
        return v30;
    end;
    return v14;
end;