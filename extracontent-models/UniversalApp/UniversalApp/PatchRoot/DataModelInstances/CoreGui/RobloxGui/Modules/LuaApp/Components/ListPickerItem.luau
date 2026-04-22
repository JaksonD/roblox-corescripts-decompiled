local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
game:DefineFastFlag("ListPickerIconNotNeeded", false);
local v8 = v3.PureComponent:extend("ListPickerItem");
v8.init = function(v9) --[[ Line: 24 ]] --[[ Name: init ]]
    v9.state = {
        menuItemDown = false
    };
    v9.onMenuItemActive = function(v10, v11) --[[ Line: 29 ]]
        -- upvalues: v9 (copy)
        v9.props.onSelectItem(v10, v11);
    end;
    v9.onMenuItemInputBegan = function(_, v13) --[[ Line: 33 ]]
        -- upvalues: v9 (copy)
        if (v13.UserInputType == Enum.UserInputType.Touch or v13.UserInputType == Enum.UserInputType.MouseButton1) and v13.UserInputState == Enum.UserInputState.Begin then
            v9:onMenuItemDown();
        end;
    end;
    v9.onMenuItemInputEnd = function(_, _) --[[ Line: 44 ]]
        -- upvalues: v9 (copy)
        v9:onMenuItemUp();
    end;
end;
v8.onMenuItemDown = function(v16) --[[ Line: 49 ]] --[[ Name: onMenuItemDown ]]
    -- upvalues: l_UserInputService_0 (copy)
    if not v16.state.menuItemDown then
        v16:eventDisconnect();
        v16.userInputServiceCon = l_UserInputService_0.InputEnded:Connect(function() --[[ Line: 53 ]]
            -- upvalues: v16 (copy)
            v16:onMenuItemUp();
        end);
        v16:setState({
            menuItemDown = true
        });
    end;
end;
v8.onMenuItemUp = function(v17, v18) --[[ Line: 63 ]] --[[ Name: onMenuItemUp ]]
    if v17.state.menuItemDown or v17.state.menuItemActive ~= v18 then
        v17:setState({
            menuItemDown = false
        });
    end;
    v17:eventDisconnect();
end;
v8.eventDisconnect = function(v19) --[[ Line: 73 ]] --[[ Name: eventDisconnect ]]
    if v19.userInputServiceCon then
        v19.userInputServiceCon:Disconnect();
        v19.userInputServiceCon = nil;
    end;
end;
v8.render = function(v20) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), v5 (copy), v7 (copy), v6 (copy)
    local l_item_0 = v20.props.item;
    local l_layoutOrder_0 = v20.props.layoutOrder;
    local l_separatorEnabled_0 = v20.props.separatorEnabled;
    local l_menuItemDown_0 = v20.state.menuItemDown;
    local v25 = true;
    if game:GetFastFlag("ListPickerIconNotNeeded") then
        local v26 = false;
        if l_item_0.displayIcon ~= nil then
            v26 = l_item_0.displayIcon ~= "";
        end;
        v25 = v26;
    end;
    return l_withStyle_0(function(v27) --[[ Line: 98 ]]
        -- upvalues: v3 (ref), v5 (ref), l_menuItemDown_0 (copy), l_layoutOrder_0 (copy), l_item_0 (copy), v20 (copy), v25 (ref), v7 (ref), v6 (ref), l_separatorEnabled_0 (copy)
        return v3.createElement(v5.FitImageButton, {
            AutoButtonColor = false, 
            BackgroundColor3 = l_menuItemDown_0 and v27.Theme.BackgroundOnPress.Color or v27.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = l_menuItemDown_0 and v27.Theme.BackgroundOnPress.Transparency or v27.Theme.BackgroundUIDefault.Transparency, 
            BorderSizePixel = 0, 
            fitAxis = v5.FitAxis.Height, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, 0), 
            [v3.Event.Activated] = l_item_0.onSelect, 
            [v3.Event.InputBegan] = v20.onMenuItemInputBegan, 
            [v3.Event.InputEnded] = v20.onMenuItemInputEnd
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Icon = v3.createElement("Frame", {
                Size = UDim2.new(0, v25 and 60 or 20, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                Image = v25 and v3.createElement(v7, {
                    Size = UDim2.new(0, 20, 0, 20), 
                    Position = UDim2.new(0, 20, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_item_0.displayIcon, 
                    ImageColor3 = v27.Theme.IconDefault.Color, 
                    ImageTransparency = v27.Theme.IconDefault.Transparency
                })
            }), 
            Content = v3.createElement(v5.FitFrame, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                fitAxis = v5.FitAxis.Height, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, v25 and -60 or 0, 0, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 15)
                }), 
                TextContent = v3.createElement(v6, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -20, 0, 0), 
                    Text = l_item_0.text, 
                    Font = v27.Font.Body.Font, 
                    TextSize = v27.Font.BaseSize * v27.Font.Body.RelativeSize, 
                    TextColor3 = v27.Theme.TextDefault.Color, 
                    TextTransparency = v27.Theme.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true, 
                    fitAxis = v5.FitAxis.Height
                }), 
                UIBottomPadding = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 15), 
                    LayoutOrder = 3
                }), 
                Separator = l_separatorEnabled_0 and v3.createElement("Frame", {
                    BackgroundColor3 = v27.Theme.Divider.Color, 
                    BackgroundTransparency = v27.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
v8.willUnmount = function(v28) --[[ Line: 194 ]] --[[ Name: willUnmount ]]
    v28:eventDisconnect();
end;
return v8;