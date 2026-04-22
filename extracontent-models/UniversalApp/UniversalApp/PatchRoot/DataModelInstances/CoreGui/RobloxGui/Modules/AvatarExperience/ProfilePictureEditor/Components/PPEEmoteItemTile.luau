local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v6.Enums.AvatarScreen;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTableWrappedCallbackRef_0 = v8.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_CatalogItemCard_0 = v8.Components.CatalogItemCard.CatalogItemCard;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_CorePackages_0.Packages.Foundation);
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v18 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_ItemTile_0 = v4.Tile.ItemTile;
local v21 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId);
local v22 = require(l_Modules_0.LuaApp.Constants);
local l_logOnOverlayClosed_0 = v6.Debug.logOnOverlayClosed;
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v29 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v29.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v29.Utils.getRbxthumbWithTypeSizeAndOptions;
local v32 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.usePPEEmoteItemTileBindings);
local v33 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useAdaptiveScrolling_0 = v8.Hooks.useAdaptiveScrolling;
local l_useFocusGuiObject_0 = v12.useFocusGuiObject;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useAvatarRoute_0 = v6.AvatarRoute.Hooks.useAvatarRoute;
local l_useDispatch_0 = v33.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
shouldProvideControlsToViewItemDetails = function(v43) --[[ Line: 80 ]] --[[ Name: shouldProvideControlsToViewItemDetails ]]
    if not v43.itemId then
        return false;
    elseif not v43.isSelected then
        return false;
    else
        return true;
    end;
end;
local v78 = v3.connect(function(v44, v45) --[[ Line: 251 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v17 (copy), v18 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    local l_emoteAssetId_0 = v44.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    local l_AvatarType_0 = v44.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_itemId_0 = v45.itemId;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    if l_itemId_0 then
        v49 = v17(v44.AvatarExperience.Common, l_itemId_0, v18.ItemType.Asset);
        v50 = v49 and v49.name or nil;
        v51 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, l_Constants_0.RbxthumbTypes.Asset, 150);
    end;
    return {
        itemData = v49, 
        emoteAssetId = l_emoteAssetId_0, 
        name = v50, 
        thumbnail = v51, 
        avatarType = l_AvatarType_0
    };
end, function(v52) --[[ Line: 274 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), l_NavigateWithLock_0 (copy)
    return {
        setEmoteAssetId = function(v53, v54) --[[ Line: 276 ]] --[[ Name: setEmoteAssetId ]]
            -- upvalues: v52 (copy), v21 (ref)
            return v52(v21(v53, v54));
        end, 
        navigateWithLock = function(v55) --[[ Line: 279 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v52 (copy), l_NavigateWithLock_0 (ref)
            v52(l_NavigateWithLock_0(v55));
        end
    };
end)(function(v56) --[[ Line: 96 ]] --[[ Name: PPEEmoteItemTile ]]
    -- upvalues: l_useAdaptiveScrolling_0 (copy), v14 (copy), l_useDispatch_0 (copy), l_useFocusGuiObject_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useInputType_0 (copy), l_useRoactService_0 (copy), v27 (copy), l_wasLastInputGamepad_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useLocalization_0 (copy), v13 (copy), v19 (copy), v18 (copy), v26 (copy), l_AvatarScreen_0 (copy), l_logOnOverlayClosed_0 (copy), v22 (copy), v24 (copy), v32 (copy), l_useTableWrappedCallbackRef_0 (copy), l_CatalogItemCard_0 (copy), l_ItemCardThumbnail_0 (copy), l_ItemTile_0 (copy)
    local v57 = l_useAdaptiveScrolling_0();
    local v58 = v14.createRef();
    local v59 = l_useDispatch_0();
    local v60 = shouldProvideControlsToViewItemDetails(v56);
    local v61 = l_useFocusGuiObject_0();
    local v62 = l_useNavigation_0();
    local v63 = l_useAvatarRoute_0();
    local v64 = l_useInputType_0();
    local v65 = l_useRoactService_0(v27);
    local v66 = l_wasLastInputGamepad_0();
    local v67 = nil;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v67 = l_useLocalization_0({
            details = "Feature.Avatar.Label.DetailsButton"
        });
    end;
    local v71 = v13.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v19 (ref), v56 (copy), v18 (ref), v65 (copy), v63 (copy), v62 (copy), v59 (copy), v26 (ref)
        local v68 = v19.GetItemSubType(v56.itemType, v56.itemData);
        local v69 = if v56.itemData then v56.itemData.priceInRobux else nil;
        local v70 = {
            itemId = if v56.itemId then v56.itemId else "", 
            itemType = v18.ItemType.Asset, 
            itemSubType = v68, 
            priceInRobux = v69, 
            catalogAnalytics = v65, 
            avatarRoute = v63, 
            navigation = v62, 
            itemDetailsPeekViewRefs = v56.itemDetailsPeekViewRefs, 
            resultsListRef = v56.resultsListRef, 
            mountAsFullView = true, 
            closePreviousItemDetails = true
        };
        v59(v26(v70));
    end, {
        v56.itemType, 
        v56.itemData, 
        v56.itemId, 
        v56.itemDetailsPeekViewRefs, 
        v56.resultsListRef, 
        v62, 
        v63, 
        v65, 
        v59
    });
    local v73 = v13.useCallback(function(v72) --[[ Line: 146 ]]
        -- upvalues: v57 (copy), v58 (copy)
        if not v57 then
            return;
        elseif v72 then
            v57.setSelectedItemInstance(nil);
            return;
        else
            if v58.current then
                v57.setSelectedItemInstance(v58.current);
            end;
            return;
        end;
    end, {
        v58.current
    });
    local v74 = v13.useCallback(function() --[[ Line: 158 ]]
        -- upvalues: v56 (copy), v62 (copy), v73 (copy), v18 (ref), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref), v66 (copy), v61 (copy), v58 (copy)
        if v56.itemId == v56.emoteAssetId then
            v56.setEmoteAssetId(nil, v62);
            v73(true);
            return;
        elseif v56.avatarType == v18.AvatarType.R6 then
            v62.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                bodyTextKey = "Feature.Avatar.Label.PPEEmoteR15Warning", 
                onSwitchSelected = function() --[[ Line: 168 ]] --[[ Name: onSwitchSelected ]]
                    -- upvalues: v56 (ref), v62 (ref), v73 (ref)
                    v56.setEmoteAssetId(v56.itemId, v62);
                    v73(false);
                end, 
                onOverlayClosed = function() --[[ Line: 172 ]] --[[ Name: onOverlayClosed ]]
                    -- upvalues: l_logOnOverlayClosed_0 (ref), v66 (ref), v61 (ref), v58 (ref)
                    l_logOnOverlayClosed_0("EmotesScrollView", v66);
                    if v66 then
                        v61(v58.current);
                    end;
                end
            });
            return;
        else
            v56.setEmoteAssetId(v56.itemId, v62);
            v73(false);
            return;
        end;
    end, {
        v56.itemId, 
        v56.emoteAssetId, 
        v56.setEmoteAssetId, 
        v56.avatarType, 
        v62, 
        v73, 
        v66, 
        v61
    });
    local v75 = v13.useCallback(function() --[[ Line: 198 ]]
        -- upvalues: v60 (copy), v64 (copy), v22 (ref), v14 (ref), v24 (ref), v71 (copy)
        if not v60 then
            return nil;
        elseif v64 == v22.InputType.Gamepad then
            return nil;
        else
            return v14.createElement(v24, {
                activateButton = v71
            });
        end;
    end, {
        v64, 
        v60
    });
    local v76 = v32({
        onSelectItem = v74, 
        onOpenItemDetailsPage = if shouldProvideControlsToViewItemDetails(v56) then v71 else nil
    });
    local v77 = l_useTableWrappedCallbackRef_0(v76);
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        return v13.createElement(l_CatalogItemCard_0, {
            ref = v77, 
            onActivated = v74, 
            isSelected = v56.isSelected, 
            onOverlayButtonActivated = v71, 
            overlayButtonText = v67.details, 
            presentationSlot = if v56.thumbnail then v13.createElement(l_ItemCardThumbnail_0, {
                url = v56.thumbnail
            }) else nil, 
            title = v56.name, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    else
        return v14.createElement(l_ItemTile_0, {
            isSelected = v56.isSelected, 
            onActivated = v74, 
            thumbnail = v56.thumbnail, 
            titleTextLineCount = v18.ItemTileTitleMaxLines, 
            titleFontStyle = v56.titleFontStyle, 
            name = v56.name, 
            ref = v77, 
            renderTileInset = v75
        });
    end;
end);
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v78;
else
    return function(v79) --[[ Line: 291 ]]
        -- upvalues: v5 (copy), v14 (copy), v78 (ref), v2 (copy)
        return v5.withFocusController(function(v80) --[[ Line: 292 ]]
            -- upvalues: v14 (ref), v78 (ref), v2 (ref), v79 (copy)
            return v14.createElement(v78, v2.Dictionary.join(v79, {
                focusController = v80
            }));
        end);
    end;
end;