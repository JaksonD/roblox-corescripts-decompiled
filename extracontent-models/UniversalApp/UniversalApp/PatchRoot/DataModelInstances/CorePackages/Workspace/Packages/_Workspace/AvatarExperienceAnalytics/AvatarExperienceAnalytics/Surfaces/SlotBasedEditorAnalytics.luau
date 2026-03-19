local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.AnalyticsService);
local v3 = require(l_script_FirstAncestor_0.Enums.ImpressionEnums);
local v4 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXExtendUndoRedoTracking_0 = v4.FFlagAXExtendUndoRedoTracking;
local l_FFlagAXResetAvatarButton_0 = v4.FFlagAXResetAvatarButton;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local function v10(v8) --[[ Line: 16 ]] --[[ Name: trackSlotClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v9 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        subcategory = v8.editorSubcategory, 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v9);
end;
local function v12() --[[ Line: 27 ]] --[[ Name: trackSaveClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v11 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "SaveAvatarButton", 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v11);
end;
local function v14() --[[ Line: 36 ]] --[[ Name: trackSlotsCustomizeFtuxPrompt ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v13 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "SlotsCustomizeFtuxPrompt", 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v13);
end;
local function v16() --[[ Line: 45 ]] --[[ Name: trackSlotsAvatarSwitcherFtuxPrompt ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v15 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "SlotsAvatarSwitcherFtuxPrompt", 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v15);
end;
local function v18() --[[ Line: 54 ]] --[[ Name: trackSaveBlockPromptLeaveClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v17 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "SaveAvatarBlockPrompt_Leave", 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v17);
end;
local function v20() --[[ Line: 63 ]] --[[ Name: trackSaveBlockPromptSaveClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v19 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "SaveAvatarBlockPrompt_Save", 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v19);
end;
local function v23(v21) --[[ Line: 72 ]] --[[ Name: trackControlBarClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v22 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = ("ControlBar_%*"):format(v21), 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v22);
end;
local function v26(v24) --[[ Line: 81 ]] --[[ Name: trackAdvancedCustomizationControlBarClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v25 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = ("ControlBar_AdvancedCustomization_%*"):format(v24), 
        surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v25);
end;
local function v31(v27, v28) --[[ Line: 90 ]] --[[ Name: trackAdvancedCustomizationControlBarClickFromSurface ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v29 = mapAvatarScreenToSurface(v28);
    local v30 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = ("ControlBar_AdvancedCustomization_%*"):format(v27), 
        surface = v29
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v30);
end;
mapAvatarScreenToSurface = function(v32) --[[ Line: 101 ]] --[[ Name: mapAvatarScreenToSurface ]]
    -- upvalues: v3 (copy), l_AvatarScreen_0 (copy)
    local l_HOMEPAGE_0 = v3.MarketplaceSurfaceType.HOMEPAGE;
    if v32 == l_AvatarScreen_0.Catalog then
        return v3.MarketplaceSurfaceType.HOMEPAGE;
    elseif v32 == l_AvatarScreen_0.CatalogSearch then
        return v3.MarketplaceSurfaceType.SEARCH;
    else
        if v32 == l_AvatarScreen_0.AvatarEditor then
            l_HOMEPAGE_0 = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY;
        end;
        return l_HOMEPAGE_0;
    end;
end;
local function v39(v34, v35) --[[ Line: 113 ]] --[[ Name: trackUndoRedoClick ]]
    -- upvalues: l_FFlagAXExtendUndoRedoTracking_0 (copy), v3 (copy), v2 (copy)
    local v36 = v34 and "Undo" or "Redo";
    local v37 = if l_FFlagAXExtendUndoRedoTracking_0 and v35 then mapAvatarScreenToSurface(v35) else v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY;
    local v38 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = ("UndoRedo_%*"):format(v36), 
        surface = if l_FFlagAXExtendUndoRedoTracking_0 then v37 else v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v38);
end;
local function v44(v40, v41) --[[ Line: 129 ]] --[[ Name: trackUndoHistoryCount ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v42 = mapAvatarScreenToSurface(v40);
    local v43 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = ("UndoRedo_history_count_%*"):format(v41), 
        surface = v42
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v43);
end;
local function v48(v45) --[[ Line: 140 ]] --[[ Name: trackAvatarRestoreClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v46 = mapAvatarScreenToSurface(v45);
    local v47 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "AvatarRestoreSaved", 
        surface = v46
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v47);
end;
local function v52(v49) --[[ Line: 151 ]] --[[ Name: trackAvatarRemoveAllClick ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v50 = mapAvatarScreenToSurface(v49);
    local v51 = {
        actionType = v3.ActionType.UI_BUTTON_CLICK, 
        group = "AvatarRemoveAll", 
        surface = v50
    };
    v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v51);
end;
return {
    trackSlotClick = v10, 
    trackSaveClick = v12, 
    trackControlBarClick = v23, 
    trackAdvancedCustomizationControlBarClick = v26, 
    trackAdvancedCustomizationControlBarClickFromSurface = v31, 
    trackSaveBlockPromptLeaveClick = v18, 
    trackSaveBlockPromptSaveClick = v20, 
    trackUndoRedoClick = v39, 
    trackSlotsCustomizeFtuxPrompt = v14, 
    trackSlotsAvatarSwitcherFtuxPrompt = v16, 
    trackAddNewAvatarClick = function() --[[ Line: 162 ]] --[[ Name: trackAddNewAvatarClick ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v53 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = "AvatarSwitcher_AddNewAvatar", 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v53);
    end, 
    trackUpdateAvatarClick = function() --[[ Line: 171 ]] --[[ Name: trackUpdateAvatarClick ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v54 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = "AvatarSwitcher_UpdateAvatar", 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v54);
    end, 
    trackManageAvatarsClick = function() --[[ Line: 180 ]] --[[ Name: trackManageAvatarsClick ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v55 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = "AvatarSwitcher_ManageAvatars", 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v55);
    end, 
    trackDeleteAvatarAttemptClick = function(v56) --[[ Line: 189 ]] --[[ Name: trackDeleteAvatarAttemptClick ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v57 = v56 and "AvatarSwitcher_DeleteAvatar_Attempt_Mass" or "AvatarSwitcher_DeleteAvatar_Attempt_Single";
        local v58 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = v57, 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v58);
    end, 
    trackDeleteAvatarConfirm = function() --[[ Line: 201 ]] --[[ Name: trackDeleteAvatarConfirm ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v59 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = "AvatarSwitcher_DeleteAvatar_Confirm", 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v59);
    end, 
    trackSettingsTileClick = function() --[[ Line: 210 ]] --[[ Name: trackSettingsTileClick ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v60 = {
            actionType = v3.ActionType.UI_BUTTON_CLICK, 
            group = "AvatarSwitcher_SettingsTile", 
            surface = v3.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
        };
        v2.EventStream:sendTelemetryEvent("SlotBasedEditor", "marketplaceOrganicFELog", v60);
    end, 
    trackUndoHistoryCount = if l_FFlagAXExtendUndoRedoTracking_0 then v44 else nil, 
    trackAvatarRemoveAllClick = if l_FFlagAXResetAvatarButton_0 then v52 else nil, 
    trackAvatarRestoreClick = if l_FFlagAXResetAvatarButton_0 then v48 else nil
};