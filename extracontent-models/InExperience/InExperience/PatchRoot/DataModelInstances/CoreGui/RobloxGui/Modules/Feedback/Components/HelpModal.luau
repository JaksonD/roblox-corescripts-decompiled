local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.Signals);
local v4 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local v7 = require(l_Parent_0.Components.ModalDialog);
local v8 = require(l_Parent_0.Thunks.ShowHelpModalThunk);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = v1.PureComponent:extend("HelpModal");
local l_FFlagTopBarSignalizeScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize;
v10.init = function(v12) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy), v4 (copy), v3 (copy)
    v12.onDismiss = function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy)
        v12.props.showHelpModal(false);
    end;
    if l_FFlagTopBarSignalizeScreenSize_0 then
        local l_getViewportSize_0 = v4.GetDisplayStore(false).getViewportSize;
        v12.disposeScreenSize = v3.createEffect(function(v14) --[[ Line: 40 ]]
            -- upvalues: v12 (copy), l_getViewportSize_0 (copy)
            v12:setState({
                screenSize = l_getViewportSize_0(v14)
            });
        end);
    end;
end;
v10.willUnmount = function(v15) --[[ Line: 48 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    if l_FFlagTopBarSignalizeScreenSize_0 then
        v15.disposeScreenSize();
    end;
end;
v10.render = function(v16) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v1 (copy), v7 (copy), l_FFlagTopBarSignalizeScreenSize_0 (copy), v6 (copy)
    return l_withLocalization_0({
        mainHeader = "CoreScripts.Feedback.Help.MainHeader", 
        instructionLabel = "CoreScripts.Feedback.Help.Instructions"
    })(function(v17) --[[ Line: 58 ]]
        -- upvalues: v1 (ref), v7 (ref), v16 (copy), l_FFlagTopBarSignalizeScreenSize_0 (ref), v6 (ref)
        return v1.createElement(v7, {
            visible = v16.props.visible, 
            screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then v16.state.screenSize else v16.props.screenSize, 
            titleText = v17.mainHeader, 
            maxHeight = 130, 
            maxWidth = 540, 
            showCloseButton = true, 
            contents = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Layout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                InstructionLabel = v1.createElement(v6, {
                    LayoutOrder = 1, 
                    fontKey = "Body", 
                    themeKey = "TextDefault", 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 76, 0.5, 0), 
                    Size = UDim2.new(1, 0, 0.4, 36), 
                    Text = v17.instructionLabel, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            onDismiss = v16.onDismiss
        });
    end);
end;
return v2.connect(function(v18) --[[ Line: 96 ]]
    -- upvalues: l_FFlagTopBarSignalizeScreenSize_0 (copy)
    return {
        screenSize = if l_FFlagTopBarSignalizeScreenSize_0 then nil else v18.displayOptions.screenSize, 
        visible = v18.common.showHelpModal
    };
end, function(v19) --[[ Line: 101 ]]
    -- upvalues: v8 (copy)
    return {
        showHelpModal = function(v20) --[[ Line: 103 ]] --[[ Name: showHelpModal ]]
            -- upvalues: v19 (copy), v8 (ref)
            v19(v8(v20));
        end
    };
end)(v10);