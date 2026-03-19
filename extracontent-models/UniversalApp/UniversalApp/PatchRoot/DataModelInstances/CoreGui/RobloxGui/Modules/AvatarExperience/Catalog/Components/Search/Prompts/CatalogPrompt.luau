local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v11.Style.withStyle;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v11.App.Dialog.Modal.PartialPageModal;
local v15 = v3.PureComponent:extend("CatalogPrompt");
v15.init = function(v16) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v16.state = {
        apply = false
    };
    v16.buttonStackRef = v3.createRef();
end;
v15.validateProps = v6.strictInterface({
    title = v6.string, 
    onApply = v6.callback, 
    contentPadding = v6.optional(v6.UDim), 
    [v3.Children] = v6.table, 
    secondaryButtonProps = v6.optional(v6.table), 
    forwardRef = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    disablePrimaryButton = v6.optional(v6.boolean), 
    overlayFocusController = v6.optional(v6.table), 
    isPortrait = v6.boolean, 
    screenSize = v6.Vector2, 
    navigation = v6.table
});
v15.defaultProps = {
    contentPadding = UDim.new(0, 0), 
    disablePrimaryButton = false
};
v15.onClose = function(v17, v18) --[[ Line: 60 ]] --[[ Name: onClose ]]
    -- upvalues: v10 (copy)
    if v18 then
        v17.props.onApply();
    end;
    v10.closeOverlay(v17.props.navigation);
end;
v15.render = function(v19) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_ButtonType_0 (copy), v3 (copy), l_Focusable_0 (copy), l_PartialPageModal_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 68 ]]
        -- upvalues: l_withLocalization_0 (ref), v19 (copy), l_ButtonType_0 (ref), v3 (ref), l_Focusable_0 (ref), l_PartialPageModal_0 (ref)
        return l_withLocalization_0({
            apply = "CommonUI.Messages.Action.Apply"
        })(function(v21) --[[ Line: 71 ]]
            -- upvalues: v19 (ref), l_ButtonType_0 (ref), v3 (ref), l_Focusable_0 (ref), l_PartialPageModal_0 (ref)
            local v22 = nil;
            local v23 = nil;
            if v19.props.isPortrait then
                v22 = UDim2.new(0.5, 0, 1, 0);
                v23 = Vector2.new(0.5, 1);
            else
                v22 = UDim2.new(0.5, 0, 0.5, 0);
                v23 = Vector2.new(0.5, 0.5);
            end;
            local v24 = {};
            if v19.props.secondaryButtonProps then
                table.insert(v24, v19.props.secondaryButtonProps);
            end;
            table.insert(v24, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    isDisabled = v19.props.disablePrimaryButton, 
                    onActivated = function() --[[ Line: 89 ]] --[[ Name: onActivated ]]
                        -- upvalues: v19 (ref)
                        v19:onClose(true);
                    end, 
                    text = v21.apply
                }
            });
            local l_forwardRef_0 = v19.props.forwardRef;
            return v3.createElement(l_Focusable_0.Frame, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                [v3.Ref] = l_forwardRef_0, 
                defaultChild = v19.buttonStackRef
            }, {
                PartialPageModal = v3.createElement(l_PartialPageModal_0, {
                    title = v19.props.title, 
                    screenSize = v19.props.screenSize, 
                    position = v22, 
                    anchorPoint = v23, 
                    contentPadding = v19.props.contentPadding, 
                    buttonStackProps = {
                        buttons = v24, 
                        frameRef = v19.buttonStackRef, 
                        NextSelectionUp = v19.props.NextSelectionUp
                    }, 
                    onCloseClicked = function() --[[ Line: 115 ]] --[[ Name: onCloseClicked ]]
                        -- upvalues: v19 (ref)
                        v19:onClose();
                    end
                }, v19.props[v3.Children])
            });
        end);
    end);
end;
v15 = l_withNavigation_0((v5.connect(function(v26) --[[ Line: 124 ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return {
        isPortrait = v26.DeviceOrientation == l_DeviceOrientationMode_0.Portrait, 
        screenSize = v26.ScreenSize
    };
end, nil)(v15)));
return v3.forwardRef(function(v27, v28) --[[ Line: 136 ]]
    -- upvalues: v3 (copy), v15 (ref), v2 (copy)
    return v3.createElement(v15, v2.Dictionary.join(v27, {
        forwardRef = v28
    }));
end);