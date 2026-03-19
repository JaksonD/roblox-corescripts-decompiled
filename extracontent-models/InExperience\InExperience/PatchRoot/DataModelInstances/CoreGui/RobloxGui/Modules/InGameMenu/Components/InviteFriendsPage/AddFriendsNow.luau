local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Localization.withLocalization);
local v13 = require(l_Parent_0.Resources.Assets);
local v14 = require(l_Parent_0.Components.ThemedTextLabel);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.Connection.RootedConnection);
local v17 = require(l_Parent_0.Actions.SetCurrentPage);
local v18 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton();
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local v21 = l_Roact_0.PureComponent:extend("AddFriendsNow");
v21.validateProps = l_t_0.strictInterface({
    switchToPlayers = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v21.init = function(v22) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), v18 (copy)
    v22.buttonRef = l_Roact_0.createRef();
    v22.state = {
        buttonIsInitialized = v18 and true or false
    };
end;
v21.render = function(v23) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy), l_TextService_0 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v13 (copy), v14 (copy), v16 (copy), v15 (copy), l_GuiService_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_ControlState_0 (copy)
    local l_props_0 = v23.props;
    return l_withStyle_0(function(v25) --[[ Line: 56 ]]
        -- upvalues: v12 (ref), l_TextService_0 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v13 (ref), v14 (ref), v16 (ref), v15 (ref), l_props_0 (copy), v23 (copy), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_ControlState_0 (ref)
        return v12({
            noFriendsText = "CoreScripts.InGameMenu.InviteFriends.NoFriends", 
            makeFriendsNow = "CoreScripts.InGameMenu.InviteFriends.MakeFriendsNow"
        })(function(v26) --[[ Line: 60 ]]
            -- upvalues: v25 (copy), l_TextService_0 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v13 (ref), v14 (ref), v16 (ref), v15 (ref), l_props_0 (ref), v23 (ref), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_ControlState_0 (ref)
            local l_Font_0 = v25.Font.Body.Font;
            local v28 = v25.Font.Body.RelativeSize * v25.Font.BaseSize;
            local l_Y_0 = l_TextService_0:GetTextSize(v26.noFriendsText, v28, l_Font_0, Vector2.new(304, 1e999)).Y;
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 304, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v13.Images.AddFriend, 
                    Size = UDim2.new(0, 64, 0, 64), 
                    ImageTransparency = 0.5, 
                    LayoutOrder = 1
                }), 
                TextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_Y_0 + 20), 
                    LayoutOrder = 2
                }, {
                    Text = l_Roact_0.createElement(v14, {
                        fontKey = "Body", 
                        themeKey = "TextEmphasis", 
                        Text = v26.noFriendsText, 
                        Position = UDim2.new(0, 0, 0, 4), 
                        Size = UDim2.new(1, 0, 1, -20), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    })
                }), 
                RootedConnection = l_Roact_0.createElement(v16, {
                    render = function(v30) --[[ Line: 110 ]] --[[ Name: render ]]
                        -- upvalues: l_Roact_0 (ref), v15 (ref), l_props_0 (ref), v23 (ref), l_GuiService_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v26 (copy), l_ControlState_0 (ref)
                        return l_Roact_0.createElement(v15, {
                            isFocused = l_props_0.canCaptureFocus and v23.state.buttonIsInitialized and v30, 
                            didFocus = function() --[[ Line: 114 ]] --[[ Name: didFocus ]]
                                -- upvalues: l_GuiService_0 (ref), v23 (ref)
                                l_GuiService_0.SelectedCoreObject = v23.buttonRef:getValue();
                            end
                        }, {
                            MakeFriendsButton = v30 and l_Roact_0.createElement(l_Button_0, {
                                buttonType = l_ButtonType_0.Secondary, 
                                layoutOrder = 3, 
                                size = UDim2.new(1, 0, 0, 48), 
                                text = v26.makeFriendsNow, 
                                onActivated = l_props_0.switchToPlayers, 
                                buttonRef = v23.buttonRef, 
                                onStateChanged = function(_, v32) --[[ Line: 126 ]] --[[ Name: onStateChanged ]]
                                    -- upvalues: v23 (ref), l_ControlState_0 (ref)
                                    if not v23.state.buttonIsInitialized and v32 ~= l_ControlState_0.Initialize then
                                        v23:setState({
                                            buttonIsInitialized = true
                                        });
                                    end;
                                end
                            }) or nil
                        });
                    end
                })
            });
        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v33) --[[ Line: 146 ]]
    -- upvalues: v17 (copy)
    return {
        switchToPlayers = function() --[[ Line: 148 ]] --[[ Name: switchToPlayers ]]
            -- upvalues: v33 (copy), v17 (ref)
            v33(v17("Players"));
        end
    };
end)(v21);