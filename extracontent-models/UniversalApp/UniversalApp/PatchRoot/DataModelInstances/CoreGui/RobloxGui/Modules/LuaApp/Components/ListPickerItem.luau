local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextBoundsRoundUp");
game:DefineFastFlag("ListPickerIconNotNeeded", false);
local v9 = not l_game_EngineFeature_0 and 14 or 15;
local v10 = v3.PureComponent:extend("ListPickerItem");
v10.init = function(v11) --[[ Line: 27 ]] --[[ Name: init ]]
    v11.state = {
        menuItemDown = false
    };
    v11.onMenuItemActive = function(v12, v13) --[[ Line: 32 ]]
        -- upvalues: v11 (copy)
        v11.props.onSelectItem(v12, v13);
    end;
    v11.onMenuItemInputBegan = function(_, v15) --[[ Line: 36 ]]
        -- upvalues: v11 (copy)
        if (v15.UserInputType == Enum.UserInputType.Touch or v15.UserInputType == Enum.UserInputType.MouseButton1) and v15.UserInputState == Enum.UserInputState.Begin then
            v11:onMenuItemDown();
        end;
    end;
    v11.onMenuItemInputEnd = function(_, _) --[[ Line: 47 ]]
        -- upvalues: v11 (copy)
        v11:onMenuItemUp();
    end;
end;
v10.onMenuItemDown = function(v18) --[[ Line: 52 ]] --[[ Name: onMenuItemDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v18.state.menuItemDown then
        v18:eventDisconnect();
        v18.userInputServiceCon = l_UserInputService_0.InputEnded:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v18 (copy)
            v18:onMenuItemUp();
        end);
        v18:setState({
            menuItemDown = true
        });
    end;
end;
v10.onMenuItemUp = function(v19, v20) --[[ Line: 66 ]] --[[ Name: onMenuItemUp ]]
    if v19.state.menuItemDown or v19.state.menuItemActive ~= v20 then
        v19:setState({
            menuItemDown = false
        });
    end;
    v19:eventDisconnect();
end;
v10.eventDisconnect = function(v21) --[[ Line: 76 ]] --[[ Name: eventDisconnect ]]
    if v21.userInputServiceCon then
        v21.userInputServiceCon:Disconnect();
        v21.userInputServiceCon = nil;
    end;
end;
v10.render = function(v22) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v5 (copy), v7 (copy), v9 (copy), v6 (copy)
    local l_item_0 = v22.props.item;
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_separatorEnabled_0 = v22.props.separatorEnabled;
    local l_menuItemDown_0 = v22.state.menuItemDown;
    local v27 = true;
    if game:GetFastFlag("ListPickerIconNotNeeded") then
        local v28 = false;
        if l_item_0.displayIcon ~= nil then
            v28 = l_item_0.displayIcon ~= "";
        end;
        v27 = v28;
    end;
    return l_withStyle_0(function(v29) --[[ Line: 101 ]]
        -- upvalues: v3 (ref), v5 (ref), l_menuItemDown_0 (copy), l_layoutOrder_0 (copy), l_item_0 (copy), v22 (copy), v27 (ref), v7 (ref), v9 (ref), v6 (ref), l_separatorEnabled_0 (copy)
        return v3.createElement(v5.FitImageButton, {
            AutoButtonColor = false, 
            BackgroundColor3 = l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Color or v29.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = l_menuItemDown_0 and v29.Theme.BackgroundOnPress.Transparency or v29.Theme.BackgroundUIDefault.Transparency, 
            BorderSizePixel = 0, 
            fitAxis = v5.FitAxis.Height, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v3.Event.Activated] = l_item_0.onSelect, 
            [v3.Event.InputBegan] = v22.onMenuItemInputBegan, 
            [v3.Event.InputEnded] = v22.onMenuItemInputEnd
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Icon = v3.createElement("Frame", {
                Size = UDim2.new(0, v27 and 60 or 20, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Image = v27 and v3.createElement(v7, {
                    Size = UDim2.new(0, 20, 0, 20), 
                    Position = UDim2.new(0, 20, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_item_0.displayIcon, 
                    ImageColor3 = v29.Theme.IconDefault.Color, 
                    ImageTransparency = v29.Theme.IconDefault.Transparency
                })
            }), 
            Content = v3.createElement(v5.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                fitAxis = v5.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, v27 and -60 or 0, 0, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v9)
                }), 
                TextContent = v3.createElement(v6, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -20, 0, 0), 
                    Text = l_item_0.text, 
                    Font = v29.Font.Body.Font, 
                    TextSize = v29.Font.BaseSize * v29.Font.Body.RelativeSize, 
                    TextColor3 = v29.Theme.TextDefault.Color, 
                    TextTransparency = v29.Theme.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true, 
                    fitAxis = v5.FitAxis.Height
                }), 
                UIBottomPadding = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, v9), 
                    LayoutOrder = 3
                }), 
                Separator = l_separatorEnabled_0 and v3.createElement("Frame", {
                    BackgroundColor3 = v29.Theme.Divider.Color, 
                    BackgroundTransparency = v29.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
v10.willUnmount = function(v30) --[[ Line: 197 ]] --[[ Name: willUnmount ]]
    v30:eventDisconnect();
end;
return v10;