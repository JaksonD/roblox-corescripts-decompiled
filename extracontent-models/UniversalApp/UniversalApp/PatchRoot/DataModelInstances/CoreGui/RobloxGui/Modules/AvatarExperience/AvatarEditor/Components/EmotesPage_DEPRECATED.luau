local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v4.Focusable;
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v8 = require(l_CorePackages_0.Packages.Cryo);
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EquipSlots);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemsList);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v22 = v3.PureComponent:extend("EmotesPage");
v22.init = function(v23) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy), l_wasLastInputGamepad_0 (copy), v17 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v15 (copy), l_AvatarScreen_0 (copy)
    v23.equipSlotsRef = v3.createRef();
    v23.itemsListRef = v3.createRef();
    v23:setState({
        equipSlotsFocused = false, 
        itemsListFocused = false, 
        lastInputType = l_UserInputService_0:GetLastInputType()
    });
    v23.onEquipSlotsFocusChanged = function(v24) --[[ Line: 51 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            equipSlotsFocused = v24
        });
    end;
    v23.onItemsListFocusChanged = function(v25) --[[ Line: 57 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            itemsListFocused = v25
        });
    end;
    v23.onSlotActivated = function(v26) --[[ Line: 63 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v17 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v23 (copy), v15 (ref), l_AvatarScreen_0 (ref)
        local function v28() --[[ Line: 64 ]]
            -- upvalues: l_wasLastInputGamepad_0 (ref), v17 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v23 (ref)
            local v27 = l_wasLastInputGamepad_0();
            v17("EmotesPage", v27);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v27 then
                v23.props.focusController.captureFocus();
            end;
        end;
        if v23.props.avatarType == v15.AvatarType.R6 then
            v23.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v28, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
        v23.props.setSelectedEmoteSlot(v26);
    end;
end;
v22.render = function(v29) --[[ Line: 87 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_isGamepadInput_0 (copy), l_AvatarScreen_0 (copy), v3 (copy), l_Focusable_0 (copy), v12 (copy), v13 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    return l_withStyle_0(function(v30) --[[ Line: 90 ]]
        -- upvalues: v29 (copy), l_isGamepadInput_0 (ref), l_AvatarScreen_0 (ref), v3 (ref), l_Focusable_0 (ref), v12 (ref), v13 (ref), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref)
        local l_Overlay_0 = v30.Theme.Overlay;
        local l_lockNavigationCallback_0 = v29.props.lockNavigationCallback;
        local l_unlockNavigationCallback_0 = v29.props.unlockNavigationCallback;
        local l_categoryInfo_0 = v29.props.categoryInfo;
        local l_onSlotActivated_0 = v29.onSlotActivated;
        local v36 = l_isGamepadInput_0(v29.state.lastInputType) and v29.props.avatarRoute.current.name == l_AvatarScreen_0.ItemDetails;
        return v3.createElement(l_Focusable_0.Frame, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = 1, 
            defaultChild = v29.equipSlotsRef, 
            restorePreviousChildFocus = v29.props.restorePreviousChildFocus
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            EquipSlots = v3.createElement(v12, {
                slotsCount = l_categoryInfo_0.EquipSlotsCount, 
                lockNavigationCallback = l_lockNavigationCallback_0, 
                unlockNavigationCallback = l_unlockNavigationCallback_0, 
                onActivated = l_onSlotActivated_0, 
                LayoutOrder = 1, 
                NextSelectionUp = v29.props.NextSelectionUp, 
                itemsListRef = v29.itemsListRef, 
                [v3.Ref] = v29.equipSlotsRef, 
                onFocusChanged = v29.onEquipSlotsFocusChanged, 
                itemsListFocused = v29.state.itemsListFocused, 
                darkenItemsGrid = v36
            }), 
            Tiles = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -72), 
                LayoutOrder = 2
            }, {
                GamepadDarkOverlay = v29.state.equipSlotsFocused and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = l_Overlay_0.Transparency, 
                    BackgroundColor3 = l_Overlay_0.Color
                }), 
                ItemsList = v3.createElement(v13, {
                    buttonBInputRef = v29.equipSlotsRef, 
                    [v3.Ref] = v29.itemsListRef, 
                    onFocusChanged = v29.onItemsListFocusChanged, 
                    darkenItemsGrid = v36
                })
            }), 
            LastInputChangedListener = v3.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v37) --[[ Line: 150 ]] --[[ Name: callback ]]
                    -- upvalues: v29 (ref)
                    v29:setState({
                        lastInputType = v37
                    });
                end
            })
        });
    end);
end;
v22 = v19((l_withNavigation_0(v6.connect(function(v38, _) --[[ Line: 160 ]] --[[ Name: mapStateToProps ]]
    return {
        avatarType = v38.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end, function(v40) --[[ Line: 166 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy)
    return {
        setSelectedEmoteSlot = function(v41) --[[ Line: 168 ]] --[[ Name: setSelectedEmoteSlot ]]
            -- upvalues: v40 (copy), v14 (ref)
            v40(v14(v41));
        end
    };
end)(v22), nil)));
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v22;
else
    return function(v42) --[[ Line: 184 ]]
        -- upvalues: v4 (copy), v3 (copy), v22 (ref), v8 (copy)
        return v4.withFocusController(function(v43) --[[ Line: 185 ]]
            -- upvalues: v3 (ref), v22 (ref), v8 (ref), v42 (copy)
            return v3.createElement(v22, v8.Dictionary.join(v42, {
                focusController = v43
            }));
        end);
    end;
end;