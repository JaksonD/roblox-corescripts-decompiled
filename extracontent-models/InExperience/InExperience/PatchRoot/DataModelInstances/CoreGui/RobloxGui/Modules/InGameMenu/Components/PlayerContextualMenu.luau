local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_t_0 = v4.t;
local l_BaseMenu_0 = l_UIBlox_0.App.Menu.BaseMenu;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(script.Parent.Connection.FocusHandler);
local v11 = require(script.Parent.Connection.RootedConnection);
local l_Flags_0 = l_Parent_0.Flags;
local v13 = require(l_Flags_0.GetFFlagIGMGamepadSelectionHistory);
local v14 = l_Roact_0.PureComponent:extend("PlayerContextualMenu");
v14.validateProps = l_t_0.strictInterface({
    moreActions = l_t_0.table, 
    actionWidth = l_t_0.number, 
    xOffset = l_t_0.number, 
    yOffset = l_t_0.number, 
    onClose = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v14.init = function(v15) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v15.firstOptionRef = l_Roact_0.createRef();
    v15.containerRef = l_Roact_0.createRef();
end;
v14.renderContextualMenuFocusHandler = function(v16, v17, v18) --[[ Line: 41 ]] --[[ Name: renderContextualMenuFocusHandler ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v13 (copy)
    local v19 = v16.props.canCaptureFocus and v17;
    return l_Roact_0.createElement(v10, {
        isFocused = v19, 
        didFocus = function(v20) --[[ Line: 47 ]] --[[ Name: didFocus ]]
            -- upvalues: l_ContextActionService_0 (ref), v16 (copy), l_GuiService_0 (ref), v13 (ref)
            l_ContextActionService_0:BindCoreAction("player_contextual_menu_close_action", function(_, v22) --[[ Line: 48 ]]
                -- upvalues: v16 (ref)
                if v22 == Enum.UserInputState.End and v16.props.onClose then
                    v16.props.onClose();
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            l_GuiService_0:RemoveSelectionGroup("player_contextual_menu_selection_parent");
            l_GuiService_0:AddSelectionParent("player_contextual_menu_selection_parent", v16.containerRef:getValue());
            if v13() then
                l_GuiService_0.SelectedCoreObject = v20 or v16.firstOptionRef:getValue();
                return;
            else
                l_GuiService_0.SelectedCoreObject = v16.firstOptionRef:getValue();
                return;
            end;
        end, 
        didBlur = function() --[[ Line: 68 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("player_contextual_menu_close_action");
        end
    }, v18);
end;
v14.render = function(v23) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_CoreGui_0 (copy), v11 (copy), l_BaseMenu_0 (copy)
    return l_Roact_0.createElement(l_Roact_0.Portal, {
        target = l_CoreGui_0
    }, {
        InGameMenuContextGui = l_Roact_0.createElement("ScreenGui", {
            DisplayOrder = 2, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            RootedConnection = l_Roact_0.createElement(v11, {
                render = function(v24) --[[ Line: 84 ]] --[[ Name: render ]]
                    -- upvalues: v23 (copy), l_Roact_0 (ref), l_BaseMenu_0 (ref)
                    return v23:renderContextualMenuFocusHandler(v24, {
                        MoreActionsMenu = l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromScale(1, 1), 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Ref] = v23.containerRef
                        }, {
                            BaseMenu = l_Roact_0.createElement(l_BaseMenu_0, {
                                buttonProps = v23.props.moreActions, 
                                setFirstItemRef = v23.firstOptionRef, 
                                width = UDim.new(0, v23.props.actionWidth), 
                                position = UDim2.fromOffset(v23.props.xOffset, v23.props.yOffset)
                            })
                        })
                    });
                end
            })
        })
    });
end;
return v14;