local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.BoxButton);
local v2 = require(script.Parent.Parent.Parent.Constants);
local v3 = require(script.Parent.Parent.Parent.Immutable);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = v4.Component:extend("MicroProfilerPanel");
v5.createTabSelector = function(v6, v7) --[[ Line: 10 ]] --[[ Name: createTabSelector ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy)
    local l_Size_0 = v7.Size;
    local v9 = v7.Position or UDim2.new(0, 0, 0, 0);
    local l_ButtonSize_0 = v7.ButtonSize;
    local l_LayoutOrder_0 = v7.LayoutOrder;
    local function v14(v12, v13) --[[ Line: 16 ]] --[[ Name: createHighlight ]]
        -- upvalues: v6 (copy), v4 (ref), v2 (ref)
        if v6.state.CurrentSection == v12 then
            return (v4.createElement("Frame", {
                Size = UDim2.new(0, v2.MicroProfilerFormatting.TabButtonWidth, 0, v2.MicroProfilerFormatting.TabButtonPad), 
                Position = UDim2.new(0, v2.MicroProfilerFormatting.TabButtonWidth * (v13 - 1), 0, v2.MicroProfilerFormatting.TabsHeight - v2.MicroProfilerFormatting.TabButtonPad), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v2.Color.HighlightBlue, 
                ZIndex = 10
            }));
        else
            return nil;
        end;
    end;
    local v15 = {};
    for v16, v17 in v6.props.Sections do
        v15[("Button_%*"):format((string.format("%02d", v16)))] = v4.createElement(v1, {
            text = v17.Name, 
            size = l_ButtonSize_0, 
            pos = UDim2.new(0, (v16 - 1) * l_ButtonSize_0.X.Offset, 0, 0), 
            onClicked = function() --[[ Line: 44 ]] --[[ Name: onClicked ]]
                -- upvalues: v6 (copy), v17 (copy)
                v6:setState({
                    CurrentSection = v17.Name
                });
            end
        });
        v15[("ButtonHighlight_%*"):format((string.format("%02d", v16)))] = v14(v17.Name, v16);
    end;
    return v4.createElement("Frame", {
        Size = l_Size_0, 
        Position = v9, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, v15);
end;
v5.init = function(v18) --[[ Line: 59 ]] --[[ Name: init ]]
    assert(v18.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.");
    v18.state = {
        CurrentSection = v18.props.Sections[1].Name
    };
end;
v5.render = function(v19) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    assert(v19.props.Sections[1] ~= nil, "MicroProfilerPanel requires at least one section.");
    local l_Sections_0 = v19.props.Sections;
    local v21 = {};
    for _, v23 in l_Sections_0 do
        v21[v23.Name] = {};
        for v24, v25 in v23.Rows do
            v21[v23.Name][("Row_%*"):format((string.format("%02d", v24)))] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v2.MicroProfilerFormatting.OptionRowHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = v24 * 2
            }, v25);
            if v24 < #v23.Rows then
                v21[v23.Name][("HorizontalLine_%*"):format((string.format("%02d", v24)))] = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    BorderSizePixel = 0, 
                    LayoutOrder = v24 * 2 + 1
                });
            end;
        end;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.props.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Title = v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v2.MicroProfilerFormatting.PanelTitleHeight), 
            BackgroundTransparency = 1, 
            Text = v19.props.Title, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v2.Font.MainWindowBold, 
            TextSize = v2.MicroProfilerFormatting.TextSizePanelTitle, 
            TextColor3 = Color3.new(1, 1, 1), 
            LayoutOrder = 1
        }), 
        Tabs = if #l_Sections_0 > 1 then v19:createTabSelector({
            Size = UDim2.new(1, 0, 0, v2.MicroProfilerFormatting.TabsHeight), 
            Position = UDim2.new(0, 0, 0, 0), 
            LayoutOrder = 2, 
            ButtonSize = UDim2.new(0, v2.MicroProfilerFormatting.TabButtonWidth, 1, 0)
        }) else nil, 
        [("Table_%*"):format(v19.state.CurrentSection)] = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, v3.JoinDictionaries({
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            UIStroke = v4.createElement("UIStroke", {
                Color = Color3.new(1, 1, 1), 
                Thickness = 1, 
                BorderStrokePosition = Enum.BorderStrokePosition.Inner
            })
        }, v21[v19.state.CurrentSection]))
    });
end;
return v5;