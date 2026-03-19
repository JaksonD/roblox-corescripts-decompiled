local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_withNavigation_0 = v4.withNavigation;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_CorePackages_0.Packages.t);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_Focusable_0 = v5.Focusable;
local l_ItemTile_0 = v3.Tile.ItemTile;
local v18 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v22 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v23 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v28 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v29 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v29.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v29.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v33 = v10.PureComponent:extend("PPEEmoteItemTile");
v33.validateProps = v11.strictInterface({
    itemId = v11.optional(v11.string), 
    titleFontStyle = v11.optional(v11.table), 
    isSelected = v11.boolean, 
    itemDetailsPeekViewRefs = v11.table, 
    resultsListRef = v11.table, 
    navigation = v11.table, 
    avatarRoute = v11.table, 
    adaptiveScrolling = v11.optional(v11.table), 
    itemData = v11.optional(v11.table), 
    emoteAssetId = v11.optional(v11.string), 
    name = v11.optional(v11.string), 
    thumbnail = v11.optional(v11.string), 
    avatarType = v11.string, 
    lastInputGroup = v11.string, 
    setEmoteAssetId = v11.callback, 
    navigateWithLock = v11.callback, 
    openItemDetails = v11.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.table, 
    catalogAnalytics = v11.table
});
v33.init = function(v34) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v15 (copy), v14 (copy), l_AvatarScreen_0 (copy), l_wasLastInputGamepad_0 (copy), v20 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v34.tileRef = v10.createRef();
    v34.activateMoreButton = function() --[[ Line: 84 ]]
        -- upvalues: v15 (ref), v34 (copy), v14 (ref)
        local v35 = v15.GetItemSubType(v34.props.itemType, v34.props.itemData);
        local v36 = if v34.props.itemData then v34.props.itemData.priceInRobux else nil;
        local v37 = {
            itemId = v34.props.itemId, 
            itemType = v14.ItemType.Asset, 
            itemSubType = v35, 
            priceInRobux = v36, 
            catalogAnalytics = v34.props.catalogAnalytics, 
            avatarRoute = v34.props.avatarRoute, 
            navigation = v34.props.navigation, 
            itemDetailsPeekViewRefs = v34.props.itemDetailsPeekViewRefs, 
            resultsListRef = v34.props.resultsListRef, 
            mountAsFullView = true, 
            closePreviousItemDetails = true
        };
        v34.props.openItemDetails(v37);
    end;
    v34.toggleAdaptiveScrollingSelectedItem = function(v38) --[[ Line: 103 ]]
        -- upvalues: v34 (copy)
        local l_adaptiveScrolling_0 = v34.props.adaptiveScrolling;
        if not l_adaptiveScrolling_0 then
            return;
        elseif v38 then
            l_adaptiveScrolling_0.setSelectedItemInstance(nil);
            return;
        else
            if v34.tileRef.current then
                l_adaptiveScrolling_0.setSelectedItemInstance(v34.tileRef.current);
            end;
            return;
        end;
    end;
    v34.toggleSelectEmote = function() --[[ Line: 115 ]]
        -- upvalues: v34 (copy), v14 (ref), l_AvatarScreen_0 (ref), l_wasLastInputGamepad_0 (ref), v20 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local l_itemId_0 = v34.props.itemId;
        local l_navigation_0 = v34.props.navigation;
        if l_itemId_0 == v34.props.emoteAssetId then
            v34.props.setEmoteAssetId(nil, l_navigation_0);
            v34.toggleAdaptiveScrollingSelectedItem(true);
            return;
        elseif v34.props.avatarType == v14.AvatarType.R6 then
            v34.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                bodyTextKey = "Feature.Avatar.Label.PPEEmoteR15Warning", 
                onSwitchSelected = function() --[[ Line: 128 ]] --[[ Name: onSwitchSelected ]]
                    -- upvalues: v34 (ref), l_itemId_0 (copy), l_navigation_0 (copy)
                    v34.props.setEmoteAssetId(l_itemId_0, l_navigation_0);
                    v34.toggleAdaptiveScrollingSelectedItem(false);
                end, 
                onOverlayClosed = function() --[[ Line: 132 ]] --[[ Name: onOverlayClosed ]]
                    -- upvalues: l_wasLastInputGamepad_0 (ref), v20 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v34 (ref)
                    local v42 = l_wasLastInputGamepad_0();
                    v20("EmotesScrollView", v42);
                    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v42 then
                        v34.props.focusController.captureFocus();
                    end;
                end
            });
            return;
        else
            v34.props.setEmoteAssetId(l_itemId_0, l_navigation_0);
            v34.toggleAdaptiveScrollingSelectedItem(false);
            return;
        end;
    end;
end;
v33.shouldProvideControlsToViewItemDetails = function(v43) --[[ Line: 151 ]] --[[ Name: shouldProvideControlsToViewItemDetails ]]
    if not v43.props.itemId then
        return false;
    elseif not v43.props.isSelected then
        return false;
    else
        return true;
    end;
end;
v33.renderMoreButton = function(v44) --[[ Line: 169 ]] --[[ Name: renderMoreButton ]]
    -- upvalues: v19 (copy), v10 (copy), v21 (copy)
    if not v44:shouldProvideControlsToViewItemDetails() then
        return nil;
    elseif v44.props.lastInputGroup == v19.InputType.Gamepad then
        return nil;
    else
        return v10.createElement(v21, {
            activateButton = v44.activateMoreButton
        });
    end;
end;
v33.render = function(v45) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v5 (copy), v10 (copy), l_Focusable_0 (copy), l_ItemTile_0 (copy)
    local l_ItemTileTitleMaxLines_0 = v14.ItemTileTitleMaxLines;
    local l_titleFontStyle_0 = v45.props.titleFontStyle;
    local v48 = v45:shouldProvideControlsToViewItemDetails();
    local v49 = {
        ToggleSelect = v5.Input.onBegin(Enum.KeyCode.ButtonA, v45.toggleSelectEmote), 
        MoreDetails = if v48 then v5.Input.onBegin(Enum.KeyCode.ButtonX, v45.activateMoreButton, {
            key = "CommonUI.Features.Label.More"
        }) else nil
    };
    return v10.createElement(l_Focusable_0[l_ItemTile_0], {
        isSelected = v45.props.isSelected, 
        onActivated = v45.toggleSelectEmote, 
        thumbnail = v45.props.thumbnail, 
        titleTextLineCount = l_ItemTileTitleMaxLines_0, 
        titleFontStyle = l_titleFontStyle_0, 
        name = v45.props.name, 
        inputBindings = v49, 
        renderTileInset = function() --[[ Line: 209 ]] --[[ Name: renderTileInset ]]
            -- upvalues: v45 (copy)
            return v45:renderMoreButton();
        end, 
        [v10.Ref] = v45.tileRef
    });
end;
local function v58(v50, v51) --[[ Line: 216 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy), v14 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    local l_emoteAssetId_0 = v50.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    local l_AvatarType_0 = v50.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_itemId_1 = v51.itemId;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if l_itemId_1 then
        v55 = v13(v50.AvatarExperience.Common, l_itemId_1, v14.ItemType.Asset);
        v56 = v55 and v55.name or nil;
        v57 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_1, l_Constants_0.RbxthumbTypes.Asset, 150);
    end;
    return {
        itemData = v55, 
        emoteAssetId = l_emoteAssetId_0, 
        name = v56, 
        thumbnail = v57, 
        avatarType = l_AvatarType_0
    };
end;
v33 = v27(v33);
v33 = v28((v8((l_withNavigation_0(v2.connect(v58, function(v59) --[[ Line: 241 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v22 (copy), v23 (copy)
    return {
        setEmoteAssetId = function(v60, v61) --[[ Line: 243 ]] --[[ Name: setEmoteAssetId ]]
            -- upvalues: v59 (copy), v18 (ref)
            return v59(v18(v60, v61));
        end, 
        navigateWithLock = function(v62) --[[ Line: 246 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v59 (copy), v22 (ref)
            v59(v22(v62));
        end, 
        openItemDetails = function(v63) --[[ Line: 249 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v59 (copy), v23 (ref)
            v59(v23(v63));
        end
    };
end)(v33), nil)))));
v33 = l_RoactServices_0.connect({
    catalogAnalytics = v24
})(v33);
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v33;
else
    return function(v64) --[[ Line: 268 ]]
        -- upvalues: v5 (copy), v10 (copy), v33 (ref), v6 (copy)
        return v5.withFocusController(function(v65) --[[ Line: 269 ]]
            -- upvalues: v10 (ref), v33 (ref), v6 (ref), v64 (copy)
            return v10.createElement(v33, v6.Dictionary.join(v64, {
                focusController = v65
            }));
        end);
    end;
end;