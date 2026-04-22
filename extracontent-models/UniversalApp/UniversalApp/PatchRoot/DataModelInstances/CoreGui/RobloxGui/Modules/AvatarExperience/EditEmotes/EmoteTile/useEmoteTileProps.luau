local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useAdaptiveScrolling_0 = v2.Hooks.useAdaptiveScrolling;
local v14 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v22 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = v2.Enums.FullView;
local v24 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_ImpressionsUtil_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil;
local l_OrganicEventImpressionsSchema_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXFixFocusGuiObjectFocusRef_0 = v3.FFlagAXFixFocusGuiObjectFocusRef;
local function v35(v34) --[[ Line: 46 ]] --[[ Name: selectEquippedEmotes ]]
    return v34.AvatarExperience.AvatarEditor.EquippedEmotes;
end;
local function v37(v36) --[[ Line: 50 ]] --[[ Name: selectAvatarType ]]
    return v36.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return function(v38, v39) --[[ Line: 69 ]] --[[ Name: useEmoteTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useAdaptiveScrolling_0 (copy), l_useDispatch_0 (copy), v14 (copy), v18 (copy), v19 (copy), v7 (copy), v6 (copy), l_useSelector_0 (copy), v37 (copy), v35 (copy), v4 (copy), v24 (copy), v17 (copy), v22 (copy), l_FullView_0 (copy), v25 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy), v21 (copy), v9 (copy), l_ImpressionEnums_0 (copy), l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionsUtil_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v40 = l_useAvatarRoute_0();
    local v41 = l_useNavigation_0();
    local v42 = l_useAdaptiveScrolling_0();
    local v43 = l_useDispatch_0();
    local v44 = v14(v18);
    local v45 = v14(v19);
    local v46 = v7.useFocusGuiObject();
    local v47 = v6.usePreferredInput();
    local v48 = l_useSelector_0(v37);
    local v49 = l_useSelector_0(v35);
    local l_selectedSlot_0 = v49.selectedSlot;
    local l_slotInfo_0 = v49.slotInfo;
    local v52 = l_slotInfo_0 and l_slotInfo_0[l_selectedSlot_0];
    local v53 = v52 and v52.assetId == v38.itemId;
    local v55 = v4.useCallback(function(v54) --[[ Line: 86 ]]
        -- upvalues: v24 (ref), v38 (copy), v17 (ref)
        return v24(v54.AvatarExperience.Common, v38.itemId, v17.ItemType.Asset);
    end, {
        v38.itemId
    });
    local v56 = l_useSelector_0(v55);
    local v61 = v4.useCallback(function(v57, v58) --[[ Line: 92 ]]
        -- upvalues: v42 (copy), v39 (copy), v43 (copy), v22 (ref), v45 (copy), v40 (copy), l_FullView_0 (ref), v44 (copy), v25 (ref), v38 (copy), v17 (ref)
        if v42 then
            if v57 then
                v42.setSelectedItemInstance(nil);
            else
                local l_current_0 = v39.current;
                if l_current_0 and v58 then
                    v42.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v57 and v58 then
            v43(v22(v45, v40.opaque.name, l_FullView_0.None));
        end;
        local v60 = if v58 then v44.equipAsset else v44.unequipAsset;
        v43(v25(v60, v38.itemId, v17.AssetTypeIdStrings.EmoteAnimation));
    end, {
        v42, 
        v43, 
        v45, 
        v40, 
        v38.itemId
    });
    local v62 = v4.useCallback(function() --[[ Line: 113 ]]
        -- upvalues: v47 (copy), v6 (ref), v46 (copy), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), v39 (copy)
        if v47 == v6.Input.Directional then
            v46(if l_FFlagAXFixFocusGuiObjectFocusRef_0 then v39.current else v39);
        end;
    end, {
        v47, 
        v46
    });
    local v63 = v4.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v48 (copy), v17 (ref), v41 (copy), l_AvatarScreen_0 (ref), v62 (copy)
        if v48 == v17.AvatarType.R6 then
            v41.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v62, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
    end, {
        v48, 
        v41, 
        v62
    });
    local v65 = v4.useCallback(function() --[[ Line: 129 ]]
        -- upvalues: v48 (copy), v17 (ref), v43 (copy), l_NavigateWithLock_0 (ref), v63 (copy), v21 (ref), v38 (copy), v41 (copy), v61 (copy), v53 (copy)
        if v48 == v17.AvatarType.R6 then
            v43(l_NavigateWithLock_0(v63));
        end;
        local v64 = v43(v21(v17.AssetTypeIdStrings.EmoteAnimation, v38.itemId, v41));
        v61(v53, v64 or false);
    end, {
        v48, 
        v38.itemId, 
        v53, 
        v44, 
        v41, 
        v61, 
        v63, 
        v43
    });
    v4.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: v39 (copy), v56 (copy), v9 (ref), v38 (copy), l_ImpressionEnums_0 (ref), l_FFlagAXFixFocusGuiObjectFocusRef_0 (ref), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionsUtil_0 (ref), l_addUnifiedEventLogging_0 (ref), v53 (copy), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v39.current and v56 and not v9.isEmpty(v56) then
            local v66 = {
                itemId = v38.itemId, 
                itemType = "Asset", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            if l_FFlagAXFixFocusGuiObjectFocusRef_0 and v38.impressionsTag then
                v39.current:SetAttribute(v38.impressionsTag, v38.itemId);
            else
                v39.current:SetAttribute(v38.impressionsTag, v38.itemId);
            end;
            local v67 = l_OrganicEventImpressionsSchema_0[v38.impressionsSchema];
            l_ImpressionsUtil_0.writeItemAttributes(v67, v39.current, v66);
            l_addUnifiedEventLogging_0(v39, {
                action = if v53 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET, 
                itemId = v38.itemId, 
                gridPositionRow = if v38.gridInformation then v38.gridInformation.row else nil, 
                gridPositionColumn = if v38.gridInformation then v38.gridInformation.column else nil
            }, {
                hasDeferredActions = not l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 or nil, 
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v38.itemId, 
        v56, 
        v53, 
        v38.gridInformation
    });
    return {
        item = v56, 
        onActivated = v65, 
        isSelected = v53, 
        itemId = v38.itemId, 
        index = v38.index, 
        itemWidth = v38.itemWidth, 
        impressionsTag = v38.impressionsTag
    };
end;