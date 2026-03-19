local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(script.Parent.Parent.Util.setMouseVisibility);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Constants);
local l_FrameHeight_0 = v8.TopBarFormatting.FrameHeight;
local l_WindowPadding_0 = v8.Padding.WindowPadding;
local l_MinSize_0 = v8.MainWindowInit.MinSize;
local l_Components_0 = l_Parent_0.Components;
local v13 = require(l_Components_0.DevConsoleTopBar);
local l_Actions_0 = script.Parent.Parent.Actions;
local v15 = require(l_Actions_0.ChangeDevConsoleSize);
local v16 = require(l_Actions_0.SetDevConsoleVisibility);
local v17 = require(l_Actions_0.SetDevConsoleMinimized);
local v18 = v5.PureComponent:extend("DevConsoleWindow");
v18.onMinimizeClicked = function(v19) --[[ Line: 30 ]] --[[ Name: onMinimizeClicked ]]
    v19.props.dispatchSetDevConsoleMinimized(true);
end;
v18.onMaximizeClicked = function(v20) --[[ Line: 34 ]] --[[ Name: onMaximizeClicked ]]
    v20.props.dispatchSetDevConsoleMinimized(false);
end;
v18.onCloseClicked = function(v21) --[[ Line: 38 ]] --[[ Name: onCloseClicked ]]
    v21.props.onCloseCallback(false);
    v21.props.dispatchSetDevConsolVisibility(false);
end;
v18.init = function(v22) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_MinSize_0 (copy), l_UserInputService_0 (copy), v5 (copy)
    v22.setDevConsoleSize = function(v23, v24, v25) --[[ Line: 44 ]]
        -- upvalues: l_MinSize_0 (ref)
        local v26 = v25.X - v24.X;
        local v27 = v25.Y - v24.Y;
        v26 = v26 < l_MinSize_0.X and l_MinSize_0.X or v26;
        local v28 = v27 < l_MinSize_0.Y and l_MinSize_0.Y or v27;
        v23.props.dispatchChangeDevConsoleSize(UDim2.new(0, v26, 0, v28));
    end;
    v22.resizeInputBegan = function(_, v30) --[[ Line: 54 ]]
        -- upvalues: v22 (copy), l_UserInputService_0 (ref)
        if v30.UserInputType == Enum.UserInputType.MouseButton1 then
            local v31 = nil;
            local v32 = nil;
            local function v36(v33) --[[ Line: 58 ]] --[[ Name: onInputChanged ]]
                -- upvalues: v22 (ref)
                local l_AbsolutePosition_0 = v22.ref.current.AbsolutePosition;
                local l_Position_0 = v33.Position;
                v22:setDevConsoleSize(l_AbsolutePosition_0, l_Position_0);
            end;
            do
                local l_v31_0, l_v32_0 = v31, v32;
                local function v40(v39) --[[ Line: 64 ]] --[[ Name: onInputEnded ]]
                    -- upvalues: l_v31_0 (ref), l_v32_0 (ref)
                    if v39.UserInputType == Enum.UserInputType.MouseButton1 then
                        l_v31_0:Disconnect();
                        l_v32_0:Disconnect();
                    end;
                end;
                l_v31_0 = l_UserInputService_0.InputChanged:Connect(v36);
                l_v32_0 = l_UserInputService_0.InputEnded:Connect(v40);
            end;
        end;
    end;
    v22.doGamepadMenuButton = function(v41) --[[ Line: 76 ]]
        -- upvalues: v22 (copy)
        if v22.props.isVisible then
            local v42 = true;
            if v41.KeyCode ~= Enum.KeyCode.ButtonStart then
                v42 = v41.KeyCode == Enum.KeyCode.Escape;
            end;
            if v42 then
                v22.props.dispatchSetDevConsolVisibility(false);
            end;
        end;
    end;
    v22.ref = v5.createRef();
    v22.state = {
        resizing = false
    };
end;
v18.didMount = function(v43) --[[ Line: 92 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy), l_UserInputService_0 (copy)
    delay(0, function() --[[ Line: 96 ]]
        -- upvalues: v43 (copy)
        if v43.ref.current then
            local l_AbsolutePosition_1 = v43.ref.current.AbsolutePosition;
            local l_AbsolutePosition_2 = v43.ref.current.ResizeButton.AbsolutePosition;
            v43:setDevConsoleSize(l_AbsolutePosition_1, l_AbsolutePosition_2);
        end;
    end);
    v4(v43.props.isVisible);
    v43.gamepadMenuListener = l_UserInputService_0.InputBegan:Connect(v43.doGamepadMenuButton);
end;
v18.willUnmount = function(v46) --[[ Line: 108 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_GuiService_0 (copy)
    if l_GuiService_0.SelectedCoreObject == v46.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
    v46.gamepadMenuListener:Disconnect();
end;
v18.didUpdate = function(v47, v48, _) --[[ Line: 116 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    v4(v47.props.isVisible);
    if v47.props.isMinimized and l_GuiService_0.SelectedCoreObject == v47.ref.current then
        l_GuiService_0.SelectedCoreObject = nil;
        return;
    else
        if v47.props.isVisible ~= v48.isVisible or v47.props.currTabIndex ~= v48.currTabIndex then
            if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Gamepad1 and v47.props.isVisible then
                l_GuiService_0.SelectedCoreObject = v47.ref.current;
                return;
            else
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        return;
    end;
end;
v18.render = function(v50) --[[ Line: 133 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy), v5 (copy), l_WindowPadding_0 (copy), v13 (copy), l_FrameHeight_0 (copy)
    local l_isVisible_0 = v50.props.isVisible;
    local l_formFactor_0 = v50.props.formFactor;
    local l_isDeveloperView_0 = v50.props.isDeveloperView;
    local l_currTabIndex_0 = v50.props.currTabIndex;
    local l_tabList_0 = v50.props.tabList;
    local l_isMinimized_0 = v50.props.isMinimized;
    local l_position_0 = v50.props.position;
    local l_size_0 = v50.props.size;
    local _ = v50.state.resizing;
    local l_l_size_0_0 = l_size_0;
    local v61 = UDim2.new();
    local v62 = {};
    local v63 = 16;
    if l_formFactor_0 ~= v8.FormFactor.Large then
        local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
        l_size_0 = UDim2.new(0, l_AbsoluteSize_0.X, 0, l_AbsoluteSize_0.Y);
        l_position_0 = UDim2.new(0, 0, 0, 0);
        v61 = UDim2.new(0, 16, 0, 0);
        l_l_size_0_0 = l_size_0 + UDim2.new(0, -32, 0, 0);
        v63 = 0;
    end;
    v62.UIListLayout = v5.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, l_WindowPadding_0)
    });
    if l_isMinimized_0 then
        v62.TopBar = v5.createElement(v13, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = true, 
            onMinimizeClicked = function() --[[ Line: 176 ]] --[[ Name: onMinimizeClicked ]]
                -- upvalues: v50 (copy)
                v50:onMinimizeClicked();
            end, 
            onMaximizeClicked = function() --[[ Line: 179 ]] --[[ Name: onMaximizeClicked ]]
                -- upvalues: v50 (copy)
                v50:onMaximizeClicked();
            end, 
            onCloseClicked = function() --[[ Line: 182 ]] --[[ Name: onCloseClicked ]]
                -- upvalues: v50 (copy)
                v50:onCloseClicked();
            end
        });
        return v5.createElement("Frame", {
            Position = UDim2.new(1, -500, 1, -2 * l_FrameHeight_0), 
            Size = UDim2.new(0, 500, 0, 2 * l_FrameHeight_0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            Active = true, 
            AutoLocalize = false, 
            Visible = l_isVisible_0, 
            Selectable = true, 
            BorderColor3 = v8.Color.BaseGray, 
            [v5.Ref] = v50.ref
        }, v62);
    else
        v62.TopBar = v5.createElement(v13, {
            LayoutOrder = 1, 
            formFactor = l_formFactor_0, 
            isMinimized = false, 
            onMinimizeClicked = function() --[[ Line: 205 ]] --[[ Name: onMinimizeClicked ]]
                -- upvalues: v50 (copy)
                v50:onMinimizeClicked();
            end, 
            onMaximizeClicked = function() --[[ Line: 208 ]] --[[ Name: onMaximizeClicked ]]
                -- upvalues: v50 (copy)
                v50:onMaximizeClicked();
            end, 
            onCloseClicked = function() --[[ Line: 211 ]] --[[ Name: onCloseClicked ]]
                -- upvalues: v50 (copy)
                v50:onCloseClicked();
            end
        });
        local l_l_l_size_0_0_0 = l_l_size_0_0;
        local v66 = l_FrameHeight_0 + 2 * l_WindowPadding_0;
        l_l_l_size_0_0_0 = l_l_l_size_0_0_0 - UDim2.new(0, 0, 0, v66);
        if v50.ref.current and l_isVisible_0 and l_tabList_0 then
            local v67 = l_tabList_0[l_currTabIndex_0];
            if v67 then
                v62.MainView = v5.createElement(v67.tab, {
                    size = l_l_l_size_0_0_0, 
                    formFactor = l_formFactor_0, 
                    isDeveloperView = l_isDeveloperView_0, 
                    tabList = l_tabList_0
                });
            end;
        end;
        return v5.createElement("Frame", {
            Position = l_position_0, 
            Size = l_size_0, 
            Visible = l_isVisible_0, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            Transparency = v8.MainWindowInit.Transparency, 
            BorderColor3 = v8.Color.BaseGray, 
            BorderSizePixel = v63, 
            Active = true, 
            AutoLocalize = false, 
            Selectable = false, 
            [v5.Ref] = v50.ref
        }, {
            DevConsoleUI = v5.createElement("Frame", {
                Size = l_l_size_0_0, 
                Position = v61, 
                BackgroundTransparency = 1
            }, v62), 
            ResizeButton = v5.createElement("ImageButton", {
                Position = UDim2.new(1, 0, 1, 0), 
                Size = UDim2.new(0, v63, 0, v63), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                Modal = true, 
                [v5.Event.InputBegan] = v50.resizeInputBegan
            })
        });
    end;
end;
return v6.UNSTABLE_connect2(function(v68, _) --[[ Line: 266 ]] --[[ Name: mapStateToProps ]]
    return {
        isVisible = v68.DisplayOptions.isVisible, 
        isMinimized = v68.DisplayOptions.isMinimized, 
        position = v68.DisplayOptions.position, 
        size = v68.DisplayOptions.size, 
        isDeveloperView = v68.MainView.isDeveloperView, 
        currTabIndex = v68.MainView.currTabIndex, 
        tabList = v68.MainView.tabList
    };
end, function(v70) --[[ Line: 278 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy)
    return {
        dispatchChangeDevConsoleSize = function(v71) --[[ Line: 280 ]] --[[ Name: dispatchChangeDevConsoleSize ]]
            -- upvalues: v70 (copy), v15 (ref)
            v70(v15(v71));
        end, 
        dispatchSetDevConsolVisibility = function(v72) --[[ Line: 283 ]] --[[ Name: dispatchSetDevConsolVisibility ]]
            -- upvalues: v70 (copy), v16 (ref)
            v70(v16(v72));
        end, 
        dispatchSetDevConsoleMinimized = function(v73) --[[ Line: 286 ]] --[[ Name: dispatchSetDevConsoleMinimized ]]
            -- upvalues: v70 (copy), v17 (ref)
            v70(v17(v73));
        end
    };
end)(v18);