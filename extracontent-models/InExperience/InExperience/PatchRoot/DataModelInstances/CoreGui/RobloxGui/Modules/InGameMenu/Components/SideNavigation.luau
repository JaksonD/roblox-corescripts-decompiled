local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Components.Connection.FocusHandler);
local v12 = require(l_Parent_0.Components.ZonePortal);
local v13 = require(l_Parent_0.Thunks.CloseMenu);
local v14 = require(l_Parent_0.Actions.SetCurrentPage);
local v15 = require(l_Parent_0.Resources.Constants);
local v16 = require(l_Parent_0.Enums.Direction);
local v17 = require(script.CloseMenuButton);
local v18 = require(script.HomeButton);
local v19 = require(script.SystemMenuButton);
local v20 = require(l_Parent_0.InGameMenuPolicy);
local v21 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v22 = l_Roact_0.PureComponent:extend("SideNavigation");
v22.validateProps = l_t_0.strictInterface({
    open = l_t_0.boolean, 
    closeMenu = l_t_0.callback, 
    goToHomePage = l_t_0.callback, 
    goToSystemMenu = l_t_0.callback, 
    currentPage = l_t_0.string, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    currentZone = v21() and l_t_0.optional(l_t_0.number) or nil, 
    enableInGameHomeIcon = l_t_0.optional(l_t_0.boolean)
});
v22.init = function(v23) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: l_ControlState_0 (copy), v15 (copy), l_Roact_0 (copy), l_GuiService_0 (copy)
    v23.controlStateUpdated = function(v24, v25) --[[ Line: 52 ]]
        -- upvalues: l_ControlState_0 (ref), v23 (copy), v15 (ref)
        if v24 == l_ControlState_0.Hover and v25 ~= l_ControlState_0.Hover and v23.props.currentPage == v15.InitalPageKey then
            v23.props.closeMenu();
        end;
    end;
    v23.firstItemRef = l_Roact_0.createRef();
    v23.onContainerRendered = function(v26) --[[ Line: 62 ]]
        -- upvalues: l_GuiService_0 (ref)
        if v26 then
            l_GuiService_0:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup");
            l_GuiService_0:AddSelectionParent("SideNavigation_IGMSelectionGroup", v26);
        end;
    end;
end;
v22.oldRender = function(v27) --[[ Line: 71 ]] --[[ Name: oldRender ]]
    -- upvalues: v21 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v17 (copy), v11 (copy), l_GuiService_0 (copy), v15 (copy), v12 (copy), v16 (copy)
    local v28 = nil;
    if v21() then
        local v29 = true;
        if v27.props.currentZone == 0 then
            v29 = not v27.props.open;
        end;
        v28 = v29;
    end;
    return l_withStyle_0(function(v30) --[[ Line: 77 ]]
        -- upvalues: l_Roact_0 (ref), v27 (copy), v17 (ref), v11 (ref), v28 (ref), v21 (ref), l_GuiService_0 (ref), v15 (ref), v12 (ref), v16 (ref)
        return l_Roact_0.createElement("TextButton", {
            AutoButtonColor = false, 
            Text = "", 
            BackgroundColor3 = v30.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v30.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 64, 1, 0), 
            Visible = v27.props.open, 
            Selectable = false, 
            [l_Roact_0.Ref] = v27.onContainerRendered
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 1)
            }), 
            CloseMenuButton = l_Roact_0.createElement(v17, {
                onActivated = v27.props.closeMenu, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 4), 
                [l_Roact_0.Ref] = v27.firstItemRef
            }), 
            FocusHandler = l_Roact_0.createElement(v11, {
                isFocused = v27.props.canCaptureFocus, 
                shouldForgetPreviousSelection = v28, 
                didFocus = v21() and function(v31) --[[ Line: 102 ]]
                    -- upvalues: l_GuiService_0 (ref), v27 (ref)
                    l_GuiService_0.SelectedCoreObject = v31 or v27.firstItemRef:getValue();
                end or function() --[[ Line: 104 ]]
                    -- upvalues: l_GuiService_0 (ref), v27 (ref)
                    l_GuiService_0.SelectedCoreObject = v27.firstItemRef:getValue();
                end
            }), 
            ZonePortal = v27.props.currentPage ~= v15.InitalPageKey and l_Roact_0.createElement(v12, {
                targetZone = 1, 
                direction = v16.Right
            }) or nil
        });
    end);
end;
v22.newRender = function(v32) --[[ Line: 116 ]] --[[ Name: newRender ]]
    -- upvalues: l_Roact_0 (copy), v19 (copy), v15 (copy), v18 (copy), v12 (copy), v16 (copy), l_withStyle_0 (copy), l_Interactable_0 (copy)
    local l_currentPage_0 = v32.props.currentPage;
    local v34 = {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4)
        }), 
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        SystemMenuButton = l_Roact_0.createElement(v19, {
            on = l_currentPage_0 == v15.MainPagePageKey, 
            onClose = v32.props.closeMenu, 
            onActivated = v32.props.goToSystemMenu, 
            layoutOrder = 1, 
            anchorPoint = Vector2.new(0.5, 0), 
            position = UDim2.new(0.5, 0, 0, 4), 
            canCaptureFocus = v32.props.canCaptureFocus
        }), 
        HomeButton = l_Roact_0.createElement(v18, {
            on = l_currentPage_0 == v15.LeaveToAppPromptPageKey, 
            onActivated = v32.props.goToHomePage, 
            layoutOrder = 2, 
            anchorPoint = Vector2.new(0.5, 0), 
            position = UDim2.new(0.5, 0, 0, 8)
        })
    };
    local v35 = {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 1)
        }), 
        Content = l_Roact_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Selectable = false
        }, v34), 
        ZonePortal = v32.props.currentPage ~= v15.InitalPageKey and l_Roact_0.createElement(v12, {
            targetZone = 1, 
            direction = v16.Right
        }) or nil
    };
    return l_withStyle_0(function(v36) --[[ Line: 162 ]]
        -- upvalues: l_Roact_0 (ref), l_Interactable_0 (ref), v32 (copy), v35 (copy)
        return l_Roact_0.createElement(l_Interactable_0, {
            onStateChanged = v32.controlStateUpdated, 
            AutoButtonColor = false, 
            BackgroundColor3 = v36.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v36.Theme.BackgroundUIContrast.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, 64, 1, 0), 
            Visible = v32.props.open, 
            Selectable = false, 
            [l_Roact_0.Ref] = v32.onContainerRendered
        }, v35);
    end);
end;
v22.render = function(v37) --[[ Line: 178 ]] --[[ Name: render ]]
    if v37.props.enableInGameHomeIcon then
        return v37:newRender();
    else
        return v37:oldRender();
    end;
end;
v22 = v20.connect(function(v38, _) --[[ Line: 185 ]]
    return {
        enableInGameHomeIcon = v38.enableInGameHomeIcon()
    };
end)(v22);
return l_RoactRodux_0.UNSTABLE_connect2(function(v40, _) --[[ Line: 191 ]]
    -- upvalues: v15 (copy), v21 (copy)
    local v42 = v40.isMenuOpen and not v40.respawn.dialogOpen and v40.displayOptions.inputType == v15.InputType.Gamepad and v40.currentZone == 0;
    local v43 = nil;
    if v21() then
        v43 = v40.currentZone;
    end;
    return {
        canCaptureFocus = v42, 
        currentPage = v40.menuPage, 
        open = v40.isMenuOpen, 
        currentZone = v43
    };
end, function(v44) --[[ Line: 208 ]]
    -- upvalues: v13 (copy), v14 (copy), v15 (copy)
    return {
        closeMenu = function() --[[ Line: 210 ]] --[[ Name: closeMenu ]]
            -- upvalues: v44 (copy), v13 (ref)
            v44(v13);
        end, 
        goToSystemMenu = function() --[[ Line: 213 ]] --[[ Name: goToSystemMenu ]]
            -- upvalues: v44 (copy), v14 (ref), v15 (ref)
            v44(v14(v15.MainPagePageKey));
        end, 
        goToHomePage = function() --[[ Line: 216 ]] --[[ Name: goToHomePage ]]
            -- upvalues: v44 (copy), v14 (ref), v15 (ref)
            v44(v14(v15.LeaveToAppPromptPageKey));
        end
    };
end)(v22);