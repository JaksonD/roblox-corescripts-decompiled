local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v4 = require(script.Parent.Parent.Constants);
local l_DropDownEntryHeight_0 = v4.GeneralFormatting.DropDownEntryHeight;
local l_DropDownArrowHeight_0 = v4.GeneralFormatting.DropDownArrowHeight;
local v7 = l_DropDownArrowHeight_0 / 2;
local l_DownArrow_0 = v4.Image.DownArrow;
local v9 = v2.Component:extend("FullScreenDropDownButton");
v9.init = function(v10) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: l_RobloxGui_0 (copy)
    v10.startDropDownView = function() --[[ Line: 20 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            selectionScreenExpanded = true
        });
    end;
    v10.noSelection = function(_, v12) --[[ Line: 26 ]]
        -- upvalues: v10 (copy)
        if v12.UserInputType == Enum.UserInputType.MouseButton1 or v12.UserInputType == Enum.UserInputType.Touch and v12.UserInputState == Enum.UserInputState.End then
            v10:setState({
                selectionScreenExpanded = false
            });
        end;
    end;
    v10.state = {
        selectionScreenExpanded = false, 
        guiSizeY = l_RobloxGui_0.AbsoluteSize.Y
    };
end;
v9.render = function(v13) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), l_DropDownEntryHeight_0 (copy), l_ExternalEventConnection_0 (copy), l_RobloxGui_0 (copy), l_DropDownArrowHeight_0 (copy), v7 (copy), l_DownArrow_0 (copy)
    local l_buttonSize_0 = v13.props.buttonSize;
    local l_dropDownList_0 = v13.props.dropDownList;
    local l_selectedIndex_0 = v13.props.selectedIndex;
    local l_onSelection_0 = v13.props.onSelection;
    local l_layoutOrder_0 = v13.props.layoutOrder;
    local l_selectionScreenExpanded_0 = v13.state.selectionScreenExpanded;
    local l_portalTarget_0 = v13.props.portalTarget;
    local v21 = {};
    local v22 = 16;
    if l_selectionScreenExpanded_0 then
        v21.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Vertical
        });
        if l_dropDownList_0 then
            for v23, v24 in ipairs(l_dropDownList_0) do
                local v25 = v23 == l_selectedIndex_0 and v4.Color.SelectedGray or v4.Color.UnselectedGray;
                v21[v23] = v2.createElement("TextButton", {
                    Text = v24, 
                    Font = v4.Font.TabBar, 
                    TextSize = v4.DefaultFontSize.DropDownTabBar, 
                    TextColor3 = v4.Color.Text, 
                    AutoButtonColor = false, 
                    Size = UDim2.new(1, 0, 0, l_DropDownEntryHeight_0), 
                    BackgroundColor3 = v25, 
                    LayoutOrder = v23, 
                    BorderSizePixel = 0, 
                    [v2.Event.Activated] = function(_) --[[ Line: 80 ]]
                        -- upvalues: v13 (copy), l_onSelection_0 (copy), v23 (copy)
                        v13:setState({
                            selectionScreenExpanded = false
                        });
                        l_onSelection_0(v23);
                    end
                });
                v22 = v22 + l_DropDownEntryHeight_0;
            end;
        end;
    end;
    local v27 = v22 - 16 - v13.state.guiSizeY;
    return v2.createElement("TextButton", {
        Size = l_buttonSize_0, 
        BackgroundColor3 = v4.Color.UnselectedGray, 
        Text = "", 
        AutoButtonColor = false, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Event.Activated] = v13.startDropDownView
    }, {
        SizeChangeEvent = v2.createElement(l_ExternalEventConnection_0, {
            event = l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"), 
            callback = function() --[[ Line: 106 ]] --[[ Name: callback ]]
                -- upvalues: v13 (copy), l_RobloxGui_0 (ref)
                v13:setState({
                    guiSizeY = l_RobloxGui_0.AbsoluteSize.Y
                });
            end
        }), 
        text = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -l_DropDownArrowHeight_0 - v7, 1, 0), 
            Text = l_dropDownList_0[l_selectedIndex_0], 
            Font = v4.Font.TabBar, 
            TextSize = v4.DefaultFontSize.DropDownTabBar, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = v4.Color.Text, 
            BackgroundTransparency = 1
        }), 
        arrow = v2.createElement("ImageLabel", {
            Image = l_DownArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_DropDownArrowHeight_0, 0, l_DropDownArrowHeight_0), 
            Position = UDim2.new(1, -l_DropDownArrowHeight_0 - v7, 0.5, -v7)
        }), 
        selectionView = l_selectionScreenExpanded_0 and v2.createElement(v2.Portal, {
            target = l_portalTarget_0 ~= nil and l_portalTarget_0 or game:GetService("CoreGui").DevConsoleMaster
        }, {
            GreyOutFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v4.Color.Black, 
                BackgroundTransparency = 0.36, 
                Active = true, 
                [v2.Event.InputEnded] = v13.noSelection
            }, {
                BorderFrame = v2.createElement("Frame", {
                    Size = UDim2.new(0, 375, 0, v22), 
                    Position = UDim2.new(0.5, -187.5, 0, 0), 
                    BackgroundColor3 = v4.Color.UnselectedGray, 
                    BorderSizePixel = 0
                }, {
                    SelectionFrame = v2.createElement("ScrollingFrame", {
                        Size = UDim2.new(1, -30, 1, -16), 
                        Position = UDim2.new(0, 15, 0, 8), 
                        BackgroundTransparency = 1, 
                        CanvasSize = UDim2.new(1, -30, 1, v27), 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 0
                    }, v21)
                })
            })
        })
    });
end;
return v9;