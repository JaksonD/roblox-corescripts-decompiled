local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v5 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local v11 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v21 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v22 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local function v31(v30) --[[ Line: 38 ]] --[[ Name: selectEquippedEmotes ]]
    return v30.AvatarExperience.AvatarEditor.EquippedEmotes;
end;
local function v33(v32) --[[ Line: 42 ]] --[[ Name: selectAvatarType ]]
    return v32.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return function(v34, v35) --[[ Line: 61 ]] --[[ Name: useEmoteTileProps ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), v11 (copy), l_useDispatch_0 (copy), v12 (copy), v16 (copy), v17 (copy), v5 (copy), v4 (copy), l_useSelector_0 (copy), v33 (copy), v31 (copy), v2 (copy), v22 (copy), v15 (copy), v20 (copy), v21 (copy), v23 (copy), l_AvatarScreen_0 (copy), v18 (copy), v19 (copy), v7 (copy), l_ImpressionEnums_0 (copy), v26 (copy), v25 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    local v36 = l_useAvatarRoute_0();
    local v37 = l_useNavigation_0();
    local v38 = v11();
    local v39 = l_useDispatch_0();
    local v40 = v12(v16);
    local v41 = v12(v17);
    local v42 = v5.useFocusGuiObject();
    local v43 = v4.usePreferredInput();
    local v44 = l_useSelector_0(v33);
    local v45 = l_useSelector_0(v31);
    local l_selectedSlot_0 = v45.selectedSlot;
    local l_slotInfo_0 = v45.slotInfo;
    local v48 = l_slotInfo_0 and l_slotInfo_0[l_selectedSlot_0];
    local v49 = v48 and v48.assetId == v34.itemId;
    local v51 = v2.useCallback(function(v50) --[[ Line: 78 ]]
        -- upvalues: v22 (ref), v34 (copy), v15 (ref)
        return v22(v50.AvatarExperience.Common, v34.itemId, v15.ItemType.Asset);
    end, {
        v34.itemId
    });
    local v52 = l_useSelector_0(v51);
    local v57 = v2.useCallback(function(v53, v54) --[[ Line: 84 ]]
        -- upvalues: v38 (copy), v35 (copy), v39 (copy), v20 (ref), v41 (copy), v36 (copy), v21 (ref), v40 (copy), v23 (ref), v34 (copy), v15 (ref)
        if v38 then
            if v53 then
                v38.setSelectedItemInstance(nil);
            else
                local l_current_0 = v35.current;
                if l_current_0 and v54 then
                    v38.setSelectedItemInstance(l_current_0);
                end;
            end;
        end;
        if not v53 and v54 then
            v39(v20(v41, v36.opaque.name, v21.None));
        end;
        local v56 = if v54 then v40.equipAsset else v40.unequipAsset;
        v39(v23(v56, v34.itemId, v15.AssetTypeIdStrings.EmoteAnimation));
    end, {
        v38, 
        v39, 
        v41, 
        v36, 
        v34.itemId
    });
    local v58 = v2.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v43 (copy), v4 (ref), v42 (copy), v35 (copy)
        if v43 == v4.Input.Directional then
            v42(v35);
        end;
    end, {
        v43, 
        v42
    });
    local v59 = v2.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v44 (copy), v15 (ref), v37 (copy), l_AvatarScreen_0 (ref), v58 (copy)
        if v44 == v15.AvatarType.R6 then
            v37.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v58, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
    end, {
        v44, 
        v37, 
        v58
    });
    local v61 = v2.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v44 (copy), v15 (ref), v39 (copy), v18 (ref), v59 (copy), v19 (ref), v34 (copy), v37 (copy), v57 (copy), v49 (copy)
        if v44 == v15.AvatarType.R6 then
            v39(v18(v59));
        end;
        local v60 = v39(v19(v15.AssetTypeIdStrings.EmoteAnimation, v34.itemId, v37));
        v57(v49, v60 or false);
    end, {
        v44, 
        v34.itemId, 
        v49, 
        v40, 
        v37, 
        v57, 
        v59, 
        v39
    });
    v2.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v35 (copy), v52 (copy), v7 (ref), v34 (copy), l_ImpressionEnums_0 (ref), v26 (ref), v25 (ref), l_addUnifiedEventLogging_0 (ref), v49 (copy), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v35.current and v52 and not v7.isEmpty(v52) then
            local v62 = {
                itemId = v34.itemId, 
                itemType = "Asset", 
                surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
            };
            v35.current:SetAttribute(v34.impressionsTag, v34.itemId);
            local v63 = v26[v34.impressionsSchema];
            v25.writeItemAttributes(v63, v35.current, v62);
            l_addUnifiedEventLogging_0(v35, {
                action = if v49 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET, 
                itemId = v34.itemId, 
                gridPositionRow = if v34.gridInformation then v34.gridInformation.row else nil, 
                gridPositionColumn = if v34.gridInformation then v34.gridInformation.column else nil
            }, {
                hasDeferredActions = true, 
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
    end, {
        v34.itemId, 
        v52, 
        v49, 
        v34.gridInformation
    });
    return {
        item = v52, 
        onActivated = v61, 
        isSelected = v49, 
        itemId = v34.itemId, 
        index = v34.index, 
        itemWidth = v34.itemWidth, 
        impressionsTag = v34.impressionsTag
    };
end;