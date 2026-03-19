local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_FFlagAXCharacterToAvatarStrings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings;
local v17 = v2.PureComponent:extend("DuplicateOutfitInfoPrompt");
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
v17.validateProps = v4.strictInterface({
    saveAsNew = v4.boolean, 
    duplicateOutfitId = v4.string, 
    onOverlayClosed = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    showCustomOutfitNames = v4.boolean, 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    duplicateOutfitName = v4.optional(v4.string)
});
v17.init = function(v19) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy)
    v19.saveOutfit = function() --[[ Line: 61 ]]
        -- upvalues: v9 (ref), v19 (copy), l_AvatarScreen_0 (ref)
        v9.navigateToNextOverlay(v19.props.navigation, l_AvatarScreen_0.SaveOutfitPrompt);
    end;
    v19.updateExisting = function() --[[ Line: 65 ]]
        -- upvalues: v9 (ref), v19 (copy), l_AvatarScreen_0 (ref)
        v9.navigateFromOverlay(v19.props.navigation, l_AvatarScreen_0.UpdateOutfitPage);
    end;
    v19.closePrompt = function() --[[ Line: 69 ]]
        -- upvalues: v9 (ref), v19 (copy)
        v9.closeOverlay(v19.props.navigation);
    end;
end;
v17.renderLocalized = function(v20, v21) --[[ Line: 74 ]] --[[ Name: renderLocalized ]]
    -- upvalues: l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v22 = nil;
    v22 = if v20.props.duplicateOutfitName and v20.props.showCustomOutfitNames then if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v21.savedSimilarCharacter else if l_FFlagAXCharacterToAvatarStrings_0 then v21.savedSimilarCharacter .. "\n\n" .. "\"" .. v20.props.duplicateOutfitName .. "\"" else v21.savedSimilarCharacter .. "\n" .. v20.props.duplicateOutfitName else v21.savedSimilarCharacterNoName;
    local v23 = nil;
    local v24 = nil;
    if v20.props.saveAsNew then
        v23 = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v21.addNewAvatarConfirmText else v21.saveAsNewConfirmText;
        v24 = v20.saveOutfit;
    else
        v23 = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v21.updateAvatarConfirmText else v21.updateExistingConfirmText;
        v24 = v20.updateExisting;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = v21.titleText, 
            bodyText = v22, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v20.closePrompt, 
                            text = v21.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = if l_FFlagAXCharacterToAvatarStrings_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v24, 
                            text = v23
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v20.props.screenSize, 
            defaultChildRef = v20.props.defaultChildRef
        })
    });
end;
v17.render = function(v25) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagAXCharacterToAvatarStrings_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy)
    return l_withLocalization_0({
        titleText = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Title.DuplicateAvatar" or "Feature.Avatar.Heading.DuplicateCharacter", 
        savedSimilarCharacter = if l_FFlagAXCharacterToAvatarStrings_0 then if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then {
            "Feature.Avatar.Message.AddAvatarAgain"; 
            prevAvatar = v25.props.duplicateOutfitName
        } else "Feature.Avatar.Label.Message.DuplicateAvatar" else "Feature.Avatar.Label.SavedSimilarCharacter", 
        savedSimilarCharacterNoName = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Label.Message.DuplicateAvatar" or "Feature.Avatar.Label.SavedSimilarCharacterNoName", 
        saveAsNewConfirmText = "Feature.Avatar.Action.Save", 
        updateExistingConfirmText = l_FFlagAXCharacterToAvatarStrings_0 and "Feature.Avatar.Action.Save" or "Feature.Avatar.Action.GotIt", 
        addNewAvatarConfirmText = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Add" or nil, 
        updateAvatarConfirmText = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Replace" or nil, 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v26) --[[ Line: 163 ]]
        -- upvalues: v25 (copy)
        return v25:renderLocalized(v26);
    end);
end;
v17 = v3.connect(function(v27, v28) --[[ Line: 168 ]] --[[ Name: mapStateToProps ]]
    local l_OutfitInfos_0 = v27.AvatarExperience.AvatarEditor.OutfitInfos;
    local v30 = nil;
    if l_OutfitInfos_0[v28.duplicateOutfitId] then
        v30 = l_OutfitInfos_0[v28.duplicateOutfitId].name;
    end;
    return {
        screenSize = v27.ScreenSize, 
        duplicateOutfitName = v30
    };
end, nil)(v17);
return (v13((v12((l_RoactAppPolicy_0.connect(function(v31, _) --[[ Line: 184 ]]
    return {
        showCustomOutfitNames = v31.getCustomOutfitNames()
    };
end)(v17))))));