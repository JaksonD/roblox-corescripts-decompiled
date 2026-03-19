local l_Parent_0 = script:FindFirstAncestor("SharedExperimentDefinition").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppIECVRLayerName", "PlatformExcellence.VR.SpatialUI");
local v3 = game:DefineFastString("LuaAppIECVRVariantKey", "spatial_ui_type");
local v4 = game:DefineFastInt("LuaAppIECVRVariantNoSpatialUI", 0);
local v5 = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithDragging", 1);
local v6 = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithoutDragging", 2);
local v7 = game:DefineFastInt("LuaAppIECVRVariantSpatialUIMovePanelToCenter", 3);
local v8 = game:DefineFastFlag("LuaAppIECVRIxpEnabled8", false);
local l_FFlagEnableUIManagerPackgify_0 = require(l_Parent_0.SharedFlags).FFlagEnableUIManagerPackgify;
local v10 = game:DefineFastFlag("EnableSpatialUIScalingFix", false);
local v11 = game:DefineFastFlag("EnableSpatialUICameraTypeFix8", false);
local v12 = game:DefineFastFlag("LuaAppIECVREnabled8", false);
local v13 = game:DefineFastFlag("SpatialUIEnableDrag8", false);
local v14 = game:DefineFastFlag("SpatialUIEnableMovePanelToCenter8", false);
local v15 = game:DefineFastFlag("EnableSpatialUIPlaceFilter", false);
local v16 = {};
v16.__index = v16;
v16.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    local v17 = {
        _layer_data = nil
    };
    setmetatable(v17, v16);
    return v17;
end;
v16.getIXPVariant = function(v18) --[[ Line: 48 ]] --[[ Name: getIXPVariant ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy), v3 (copy), v4 (copy)
    if v18._layer_data == nil then
        v18._layer_data = l_ExperimentCacheManager_0.default:getLayerVariables(v2) or {};
    end;
    local v19 = v18._layer_data[v3] or nil;
    if v19 == nil then
        return v4;
    else
        return (tonumber(v19));
    end;
end;
v16.isDependencyFlagsEnabled = function() --[[ Line: 60 ]] --[[ Name: isDependencyFlagsEnabled ]]
    -- upvalues: l_FFlagEnableUIManagerPackgify_0 (copy), v15 (copy)
    return l_FFlagEnableUIManagerPackgify_0 and not v15;
end;
v16.isInExperienceUIVREnabled = function(v20) --[[ Line: 64 ]] --[[ Name: isInExperienceUIVREnabled ]]
    -- upvalues: v12 (copy), v8 (copy), v4 (copy)
    if not v20:isDependencyFlagsEnabled() then
        return false;
    elseif v12 then
        return true;
    elseif not v8 then
        return false;
    else
        return v20:getIXPVariant() ~= v4;
    end;
end;
v16.isDraggingAllowed = function(v21) --[[ Line: 78 ]] --[[ Name: isDraggingAllowed ]]
    -- upvalues: v13 (copy), v14 (copy), v5 (copy), v6 (copy), v7 (copy)
    if not v21:isInExperienceUIVREnabled() then
        return false;
    elseif v13 then
        return not v14;
    elseif v14 then
        return false;
    else
        local v22 = v21:getIXPVariant();
        if v22 == v5 then
            return true;
        elseif v22 == v6 then
            return false;
        elseif v22 == v7 then
            return false;
        else
            return v13;
        end;
    end;
end;
v16.isMovePanelToCenter = function(v23) --[[ Line: 101 ]] --[[ Name: isMovePanelToCenter ]]
    -- upvalues: v14 (copy), v7 (copy)
    if not v23:isInExperienceUIVREnabled() then
        return false;
    elseif v14 then
        return true;
    else
        return v23:getIXPVariant() == v7;
    end;
end;
v16.isSpatialUICameraTypeFixEnabled = function(_) --[[ Line: 112 ]] --[[ Name: isSpatialUICameraTypeFixEnabled ]]
    -- upvalues: v11 (copy)
    return v11;
end;
v16.isSpatialUIScalingFixEnabled = function(_) --[[ Line: 116 ]] --[[ Name: isSpatialUIScalingFixEnabled ]]
    -- upvalues: v10 (copy)
    return v10;
end;
return (v16.new());