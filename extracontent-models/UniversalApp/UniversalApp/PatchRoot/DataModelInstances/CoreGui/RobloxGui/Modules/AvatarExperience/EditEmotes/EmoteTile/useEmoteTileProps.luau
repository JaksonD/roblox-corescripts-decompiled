local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v6 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local v12 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v22 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v23 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v2.FFlagAXFixFocusGuiObjectFocusRef;
local function v33(v32) --[[ Line: 42 ]] --[[ Name: selectEquippedEmotes ]]
    return v32.AvatarExperience.AvatarEditor.EquippedEmotes;
end;
local function v35(v34) --[[ Line: 46 ]] --[[ Name: selectAvatarType ]]
    return v34.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return function(v36, v37) --[[ Line: 65 ]] --[[ Name: useEmoteTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v12 (copy), l_useDispatch_0 (copy), v13 (copy), v17 (copy), v18 (copy), v6 (copy), v5 (copy), l_useSelector_0 (copy), v35 (copy), v33 (copy), v3 (copy), v23 (copy), v16 (copy), v21 (copy), v22 (copy), v24 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), l_AvatarScreen_0 (copy), v19 (copy), v20 (copy), v8 (copy), l_ImpressionEnums_0 (copy), v27 (copy), v26 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v38 = l_useAvatarRoute_0();
    local v39 = l_useNavigation_0();
    local v40 = v12();
    local v41 = l_useDispatch_0();
    local v42 = v13(v17);
    local v43 = v13(v18);
    local v44 = v6.useFocusGuiObject();
    local v45 = v5.usePreferredInput();
    local v46 = l_useSelector_0(v35);
    local v47 = l_useSelector_0(v33);
    local l_selectedSlot_0 = v47.selectedSlot;
    local l_slotInfo_0 = v47.slotInfo;
    local v50 = l_slotInfo_0 and l_slotInfo_0[l_selectedSlot_0];
    local v51 = v50 and v50.assetId == v36.itemId;
    local v53 = v3.useCallback(function(v52) --[[ Line: 82 ]]
        -- upvalues: v23 (ref), v36 (copy), v16 (ref)
        return v23(v52.AvatarExperience.Common, v36.itemId, v16.ItemType.Asset);
    end, {
        v36.itemId
    });
    local v54 = l_useSelector_0(v53);
    local v59 = v3.useCallback(function(v55, v56) --[[ Line: 88 ]]
        -- upvalues: v40 (copy), v37 (copy), v41 (copy), v21 (ref), v43 (copy), v38 (copy), v22 (ref), v42 (copy), v24 (ref), v36 (copy), v16 (ref)
        if v40 then
            if v55 then
                v40.setSelectedItemInstance(nil);
            else
                local l_current_0 = v37.current;
                if l_current_0 and v56 then
                    v40.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v55 and v56 then
            v41(v21(v43, v38.opaque.name, v22.None));
        end;
        local v58 = if v56 then v42.equipAsset else v42.unequipAsset;
        v41(v24(v58, v36.itemId, v16.AssetTypeIdStrings.EmoteAnimation));
    end, {
        v40, 
        v41, 
        v43, 
        v38, 
        v36.itemId
    });
    local v60 = v3.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v45 (copy), v5 (ref), v44 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v37 (copy)
        if v45 == v5.Input.Directional then
            v44(if l_FFlagAXFixFocusGuiObjectFocusRef_0 then v37.current else v37);
        end;
    end, {
        v45, 
        v44
    });
    local v61 = v3.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v46 (copy), v16 (ref), v39 (copy), l_AvatarScreen_0 (ref), v60 (copy)
        if v46 == v16.AvatarType.R6 then
            v39.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v60, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
    end, {
        v46, 
        v39, 
        v60
    });
    local v63 = v3.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v46 (copy), v16 (ref), v41 (copy), v19 (ref), v61 (copy), v20 (ref), v36 (copy), v39 (copy), v59 (copy), v51 (copy)
        if v46 == v16.AvatarType.R6 then
            v41(v19(v61));
        end;
        local v62 = v41(v20(v16.AssetTypeIdStrings.EmoteAnimation, v36.itemId, v39));
        v59(v51, v62 or false);
    end, {
        v46, 
        v36.itemId, 
        v51, 
        v42, 
        v39, 
        v59, 
        v61, 
        v41
    });
    v3.useEffect(function() --[[ Line: 147 ]]
        -- upvalues: v37 (copy), v54 (copy), v8 (ref), v36 (copy), l_ImpressionEnums_0 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v27 (ref), v26 (ref), l_addUnifiedEventLogging_0 (ref), v51 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v37.current and v54 and not v8.isEmpty(v54) then
            local v64 = {
                itemId = v36.itemId, 
                itemType = "Asset", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 and v36.impressionsTag then
                v37.current:SetAttribute(v36.impressionsTag, v36.itemId);
            else
                v37.current:SetAttribute(v36.impressionsTag, v36.itemId);
            end;
            local v65 = v27[v36.impressionsSchema];
            v26.writeItemAttributes(v65, v37.current, v64);
            l_addUnifiedEventLogging_0(v37, {
                action = if v51 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET, 
                itemId = v36.itemId, 
                gridPositionRow = if v36.gridInformation then v36.gridInformation.row else nil, 
                gridPositionColumn = if v36.gridInformation then v36.gridInformation.column else nil
            }, {
                hasDeferredActions = true, 
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v36.itemId, 
        v54, 
        v51, 
        v36.gridInformation
    });
    return {
        item = v54, 
        onActivated = v63, 
        isSelected = v51, 
        itemId = v36.itemId, 
        index = v36.index, 
        itemWidth = v36.itemWidth, 
        impressionsTag = v36.impressionsTag
    };
end;