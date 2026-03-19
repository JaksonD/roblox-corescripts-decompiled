local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_Focusable_0 = v4.Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.DeleteOutfit);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ItemsBulletList);
local v21 = require(l_CorePackages_0.Workspace.Packages.ToastRodux);
local l_SetCurrentToastMessage_0 = v21.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v21.Enums.ToastType;
local l_SlotBasedEditorAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics;
local l_FFlagAXAddManageOutfitClickTracking_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking;
local l_FFlagAXCharacterToAvatarStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings;
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXFixDeselectOutfitInManage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage;
local v30 = {
    toastMessage = "Feature.Avatar.Message.AvatarDeleted", 
    isLocalized = false, 
    toastType = l_ToastType_0.SuccessConfirmation
};
local v31 = {
    toastMessage = "Feature.Avatar.Message.MultiAvatarDeleted", 
    isLocalized = false, 
    ToastType = l_ToastType_0.SuccessConfirmation
};
local v32 = v2.PureComponent:extend("DeleteOutfitPrompt");
v32.validateProps = v5.strictInterface({
    outfitIds = v5.array(v5.string), 
    onOverlayClosed = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.table), 
    focusController = v5.optional(v5.table), 
    avatarEditorAnalytics = v5.table, 
    navigation = v5.table, 
    outfitInfos = v5.table, 
    screenSize = v5.Vector2, 
    deleteOutfit = v5.callback, 
    setCurrentToastMessage = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v5.optional(v5.callback) else nil
});
local v38 = l_memoize_0(function(v33, v34) --[[ Line: 94 ]]
    local v35 = {};
    for _, v37 in v33 do
        if v34[v37] then
            table.insert(v35, v34[v37].name);
        end;
    end;
    return v35;
end);
v32.init = function(v39) --[[ Line: 105 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v8 (copy), l_FFlagAXAddManageOutfitClickTracking_0 (copy), l_SlotBasedEditorAnalytics_0 (copy), v6 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), v31 (copy), v30 (copy), v38 (copy), v20 (copy)
    v39.mounted = false;
    v39:setState({
        maxContentSize = 10000, 
        itemListScrollable = false, 
        isDeleting = false
    });
    v39.middleContentRef = v2.createRef();
    v39.closePrompt = function() --[[ Line: 116 ]]
        -- upvalues: v8 (ref), v39 (copy)
        v8.closeOverlay(v39.props.navigation);
    end;
    v39.deleteOutfits = function() --[[ Line: 120 ]]
        -- upvalues: v39 (copy), l_FFlagAXAddManageOutfitClickTracking_0 (ref), l_SlotBasedEditorAnalytics_0 (ref), v6 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v31 (ref), v30 (ref)
        local v40 = {};
        for v41, v42 in v39.props.outfitIds do
            v40[v41] = v39.props.deleteOutfit(v42);
        end;
        v39:setState({
            isDeleting = true
        });
        if l_FFlagAXAddManageOutfitClickTracking_0 then
            l_SlotBasedEditorAnalytics_0.trackDeleteAvatarConfirm();
        end;
        v6.all(v40):andThen(function() --[[ Line: 135 ]]
            -- upvalues: l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v39 (ref), v31 (ref), v30 (ref)
            if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then
                if #v39.props.outfitIds > 1 then
                    v39.props.setCurrentToastMessage(v31);
                else
                    v39.props.setCurrentToastMessage(v30);
                end;
            end;
            if v39.mounted then
                v39.closePrompt();
            end;
        end):catch(function(_) --[[ Line: 147 ]]
            -- upvalues: v39 (ref)
            v39:setState({
                isDeleting = false
            });
        end);
    end;
    v39.itemListScrollableUpdated = function(v44) --[[ Line: 154 ]]
        -- upvalues: v39 (copy)
        if v39.state.itemListScrollable ~= v44 then
            v39:setState({
                itemListScrollable = v44
            });
        end;
    end;
    v39.renderAlertMiddleContent = function() --[[ Line: 162 ]]
        -- upvalues: v38 (ref), v39 (copy), v2 (ref), v20 (ref)
        local v45 = v38(v39.props.outfitIds, v39.props.outfitInfos);
        return v2.createElement(v20, {
            items = v45, 
            maxHeight = v39.state.maxContentSize, 
            onScrollableUpdated = v39.itemListScrollableUpdated, 
            [v2.Ref] = v39.middleContentRef
        });
    end;
    v39.onAbsoluteSizeChanged = function(v46) --[[ Line: 173 ]]
        -- upvalues: v39 (copy)
        local v47 = v39.middleContentRef:getValue();
        if not v47 then
            return;
        else
            local v48 = v39.props.screenSize.Y - 60;
            local l_Y_0 = v47.AbsoluteSize.Y;
            local v50 = v48 - (v46.AbsoluteSize.Y - l_Y_0);
            if v39.state.maxContentSize ~= v50 then
                v39:setState({
                    maxContentSize = v50
                });
            end;
            return;
        end;
    end;
end;
v32.renderLocalized = function(v51, v52) --[[ Line: 194 ]] --[[ Name: renderLocalized ]]
    -- upvalues: l_FFlagAXCharacterToAvatarStrings_0 (copy), l_ButtonType_0 (copy), v2 (copy), l_FFlagAXFixDeselectOutfitInManage_0 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v4 (copy), l_InteractiveAlert_0 (copy)
    local l_deleteSingleCharacter_0 = v52.deleteSingleCharacter;
    local l_singleNoLongerAvailable_0 = v52.singleNoLongerAvailable;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if #v51.props.outfitIds > 1 then
        l_deleteSingleCharacter_0 = v52.deleteAssets;
        l_singleNoLongerAvailable_0 = v52.multiNoLongerAvailable;
        v55 = if l_FFlagAXCharacterToAvatarStrings_0 then nil else v51.renderAlertMiddleContent;
        v56 = v51.state.itemListScrollable;
        v57 = v51.onAbsoluteSizeChanged;
    end;
    local v58 = {
        {
            props = {
                onActivated = v51.closePrompt, 
                text = v52.cancelButtonText
            }, 
            isDefaultChild = true
        }, 
        {
            buttonType = if l_FFlagAXCharacterToAvatarStrings_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
            props = {
                isLoading = v51.state.isDeleting, 
                onActivated = v51.deleteOutfits, 
                text = v52.confirmButtonText
            }
        }
    };
    return v2.createElement(if l_FFlagAXFixDeselectOutfitInManage_0 then l_Focusable_0.TextButton else l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        AutoButtonColor = not l_FFlagAXFixDeselectOutfitInManage_0 and nil, 
        Text = l_FFlagAXFixDeselectOutfitInManage_0 and "" or nil, 
        Selectable = not l_FFlagAXFixDeselectOutfitInManage_0 and nil, 
        [v2.Event.Activated] = if l_FFlagAXFixDeselectOutfitInManage_0 then v51.closePrompt else nil, 
        [v2.Ref] = v51.props.focusNavigationRef, 
        inputBindings = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then nil else {
            NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v51.closePrompt), 
            Confirm = v4.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 243 ]]

            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = l_deleteSingleCharacter_0, 
            bodyText = l_singleNoLongerAvailable_0, 
            buttonStackInfo = {
                buttons = v58
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v51.props.screenSize, 
            defaultChildRef = v51.props.defaultChildRef, 
            middleContent = v55, 
            isMiddleContentFocusable = v56, 
            onAbsoluteSizeChanged = v57
        })
    });
end;
v32.render = function(v59) --[[ Line: 264 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXCharacterToAvatarStrings_0 (copy), l_withLocalization_0 (copy)
    local v60 = if l_FFlagAXCharacterToAvatarStrings_0 then if v59.props.outfitIds then #v59.props.outfitIds else 0 else nil;
    return l_withLocalization_0({
        deleteSingleCharacter = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Title.DeleteSingleAvatar" or "Feature.Avatar.Heading.DeleteCharacter", 
        singleNoLongerAvailable = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Message.DeleteAvatars" or "Feature.Avatar.Label.NoLongerAvailableInCollection", 
        deleteAssets = if l_FFlagAXCharacterToAvatarStrings_0 then {
            "Feature.Avatar.Label.Title.DeleteMultipleAvatars"; 
            count = v60
        } else "Feature.Avatar.Heading.DeleteAssets", 
        multiNoLongerAvailable = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Message.DeleteAvatars" or "Feature.Avatar.Label.MultiNoLongerAvailableInCollection", 
        confirmButtonText = "Feature.Avatar.Action.Delete", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v61) --[[ Line: 287 ]]
        -- upvalues: v59 (copy)
        return v59:renderLocalized(v61);
    end);
end;
v32.didMount = function(v62) --[[ Line: 292 ]] --[[ Name: didMount ]]
    v62.mounted = true;
end;
v32.willUnmount = function(v63) --[[ Line: 296 ]] --[[ Name: willUnmount ]]
    v63.mounted = false;
end;
v32 = v3.connect(function(v64, _) --[[ Line: 300 ]] --[[ Name: mapStateToProps ]]
    return {
        outfitInfos = v64.AvatarExperience.AvatarEditor.OutfitInfos, 
        screenSize = v64.ScreenSize
    };
end, function(v66) --[[ Line: 307 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), l_SetCurrentToastMessage_0 (copy)
    return {
        deleteOutfit = function(v67) --[[ Line: 309 ]] --[[ Name: deleteOutfit ]]
            -- upvalues: v66 (copy), v19 (ref)
            v66(v19(v67));
        end, 
        setCurrentToastMessage = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and function(v68) --[[ Line: 313 ]]
            -- upvalues: v66 (copy), l_SetCurrentToastMessage_0 (ref)
            v66(l_SetCurrentToastMessage_0(v68));
        end or nil
    };
end)(v32);
return (v17((v16((l_RoactServices_0.connect({
    avatarEditorAnalytics = v18
})(v32))))));