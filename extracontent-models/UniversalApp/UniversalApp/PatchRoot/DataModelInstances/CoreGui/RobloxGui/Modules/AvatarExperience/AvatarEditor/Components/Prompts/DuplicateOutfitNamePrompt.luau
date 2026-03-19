local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_Focusable_0 = v4.Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = v2.PureComponent:extend("DuplicateOutfitNamePrompt");
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
v19.validateProps = v5.strictInterface({
    outfitName = v5.string, 
    sourcePrompt = v5.string, 
    sourceParams = v5.table, 
    saveCallback = v5.callback, 
    saveFetchingStateKey = v5.string, 
    onOverlayClosed = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.table), 
    focusController = v5.optional(v5.table), 
    navigation = v5.table, 
    screenSize = v5.Vector2, 
    fetchingState = v5.string
});
v19.init = function(v21) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    v21.goBack = function() --[[ Line: 64 ]]
        -- upvalues: v9 (ref), v21 (copy)
        v9.navigateToNextOverlay(v21.props.navigation, v21.props.sourcePrompt, v21.props.sourceParams);
    end;
end;
v19.willUpdate = function(v22, v23, _) --[[ Line: 69 ]] --[[ Name: willUpdate ]]
    -- upvalues: v18 (copy), v9 (copy)
    if v18.isFetchingDoneOrFailed(v22.props.fetchingState, v23.fetchingState) then
        v9.closeOverlay(v22.props.navigation);
    end;
end;
v19.renderLocalized = function(v25, v26) --[[ Line: 75 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v2 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v4 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_RetrievalStatus_0 (copy)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then nil else {
            NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v25.goBack), 
            Confirm = v4.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 85 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = v26.titleText, 
            bodyText = v26.messageText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v25.goBack, 
                            text = v26.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v25.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            onActivated = v25.props.saveCallback, 
                            text = v26.confirmButtonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v25.props.screenSize, 
            defaultChildRef = v25.props.defaultChildRef
        })
    });
end;
v19.render = function(v27) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.UsedName", 
        messageText = "Feature.Avatar.Label.UsedNameLong", 
        confirmButtonText = "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Label.Back"
    })(function(v28) --[[ Line: 125 ]]
        -- upvalues: v27 (copy)
        return v27:renderLocalized(v28);
    end);
end;
return (v17((v16((v3.connect(function(v29, v30) --[[ Line: 130 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return {
        screenSize = v29.ScreenSize, 
        fetchingState = l_PerformFetch_0.GetStatus(v29, v30.saveFetchingStateKey)
    };
end, nil)(v19))))));