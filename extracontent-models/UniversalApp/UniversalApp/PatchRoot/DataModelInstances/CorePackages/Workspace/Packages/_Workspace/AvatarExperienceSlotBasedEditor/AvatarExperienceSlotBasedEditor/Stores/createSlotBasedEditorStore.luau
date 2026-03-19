local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local l_DeviceOrientationMode_0 = require(l_Parent_0.RobloxAppEnums).DeviceOrientationMode;
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.Enums.Categories);
local l_createSelectorSignal_0 = require(l_Parent_0.AXCommon).Utils.createSelectorSignal;
local v7 = require(l_script_FirstAncestor_0.Utils.buildSlots);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FFlagAXSlotsDesktopRedesign_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign;
return function(v10) --[[ Line: 30 ]] --[[ Name: createSlotBasedEditorStore ]]
    -- upvalues: l_createSelectorSignal_0 (copy), l_DeviceOrientationMode_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), v5 (copy), v2 (copy), v7 (copy), v4 (copy)
    local v12 = l_createSelectorSignal_0(v10, function(v11) --[[ Line: 32 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v11.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v13 = if l_FFlagAXSlotsDesktopRedesign_0 then if v12(false) then v5.Avatars else v5.All else if v12(false) then v5.Avatars else v5.Body;
    local v14, v15 = v2.createSignal(v13);
    local v16, v17 = v2.createSignal(1);
    local v19 = l_createSelectorSignal_0(v10, function(v18) --[[ Line: 45 ]]
        return v18.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
    end);
    local v21 = v2.createComputed(function(v20) --[[ Line: 52 ]]
        -- upvalues: v7 (ref), v4 (ref), v14 (copy), v19 (copy)
        return v7(v4.SlotEditorCategories[v14(v20)].slots, v19(v20));
    end);
    return {
        getSlotCategory = v14, 
        setSlotCategory = v15, 
        getSlotIndex = v16, 
        setSlotIndex = v17, 
        getSlots = v21
    };
end;