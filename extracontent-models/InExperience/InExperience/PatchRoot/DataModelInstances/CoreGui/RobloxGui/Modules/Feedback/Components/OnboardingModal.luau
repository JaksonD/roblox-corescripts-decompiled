local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Signals);
local v5 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local v9 = require(l_Parent_0.Components.ModalDialog);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local v12 = require(l_Parent_0.Thunks.ShowOnboardingModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v14 = v2.PureComponent:extend("OnboardingModal");
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
v14.init = function(v16) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: l_ExperienceStateCaptureService_0 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v5 (copy), v4 (copy)
    v16.onDismiss = function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        v16.props.showOnboardingModal(false);
    end;
    v16.onCancel = function() --[[ Line: 40 ]]
        -- upvalues: l_ExperienceStateCaptureService_0 (ref)
        l_ExperienceStateCaptureService_0:ToggleCaptureMode();
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v5.GetDisplayStore(false).getViewportSize;
        v16.disposeScreenSize = v4.createEffect(function(v18) --[[ Line: 47 ]]
            -- upvalues: v16 (copy), l_getViewportSize_0 (copy)
            v16:setState({
                screenSize = l_getViewportSize_0(v18)
            });
        end);
    end;
end;
v14.willUnmount = function(v19) --[[ Line: 55 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v19.disposeScreenSize();
    end;
end;
v14.render = function(v20) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v2 (copy), v9 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v8 (copy)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.Onboarding.MainHeader", 
        instructionLabel = "CoreScripts.Feedback.Onboarding.Instructions", 
        cancel = "CoreScripts.Feedback.Onboarding.Cancel", 
        start = "CoreScripts.Feedback.Onboarding.Start"
    })(function(v21) --[[ Line: 67 ]]
        -- upvalues: v2 (ref), v9 (ref), v20 (copy), l_FFlagTopBarSignalizeScreenSize_0 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v8 (ref)
        return v2.createElement(v9, {
            visible = v20.props.visible, 
            screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then v20.state.screenSize else v20.props.screenSize, 
            titleText = v21.mainHeader, 
            maxHeight = 200, 
            maxWidth = 540, 
            showCloseButton = true, 
            actionButtons = v2.createElement(l_ButtonStack_0, {
                buttonHeight = 36, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v20.onCancel, 
                            text = v21.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = v20.onDismiss, 
                            text = v21.start
                        }
                    }
                }
            }), 
            contents = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                InstructionLabel = v2.createElement(v8, {
                    LayoutOrder = 1, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0.4, 36), 
                    Text = v21.instructionLabel, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            onDismiss = v20.onDismiss
        });
    end);
end;
return v3.connect(function(v22) --[[ Line: 126 ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v22.displayOptions.screenSize, 
        visible = v22.common.showOnboardingModal
    };
end, function(v23) --[[ Line: 131 ]]
    -- upvalues: v12 (copy)
    return {
        showOnboardingModal = function(v24) --[[ Line: 133 ]] --[[ Name: showOnboardingModal ]]
            -- upvalues: v23 (copy), v12 (ref)
            v23(v12(v24));
        end
    };
end)(v14);