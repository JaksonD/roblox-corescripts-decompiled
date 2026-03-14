local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_1.EmojiList);
local l_useCursor_0 = require(l_Parent_1.UIBlox).App.SelectionCursor.useCursor;
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), l_useCursor_0 (copy), v2 (copy), v6 (copy), v4 (copy)
    local v9 = if v7 then l_useCursor_0() else nil;
    local l_createElement_0 = v2.createElement;
    local v11 = "Frame";
    local v12 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v6.AutocompleteEntryDefaultSizeY), 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.layoutOrder, 
        ZIndex = 2, 
        [v2.Event.MouseEnter] = v8.onAutocompleteDropdownHover
    };
    local v13 = {};
    local l_createElement_1 = v2.createElement;
    local v15 = "TextButton";
    local v16 = {
        Size = UDim2.new(1, 0, 1, v8.isDividerVisible and -1 or 0), 
        BackgroundTransparency = v8.setTransparency(v8.layoutOrder == v8.selectedIndex and v6.AutocompleteSelectedTransparency or 1, v8.transparencyValue), 
        BackgroundColor3 = v8.layoutOrder == v8.selectedIndex and v6.AutocompleteSelectedColor or nil, 
        SelectionImageObject = v9, 
        Text = "", 
        ZIndex = 3, 
        [v2.Event.Activated] = v8.onAutocompleteSelected
    };
    local v17 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 30), 
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v18 = false;
    if v8.autocompleteType == "emojis" then
        v18 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v8.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = string.format("%s", v4[v8.result].base), 
            TextColor3 = v8.chatInputBarSettings.TextColor3, 
            TextSize = v8.chatInputBarSettings.TextSize, 
            TextStrokeColor3 = v8.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v8.setTransparency(v8.chatInputBarSettings.TextStrokeTransparency, v8.transparencyValue), 
            TextTransparency = v8.setTransparency(0, v8.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1, 
            ZIndex = 2
        });
    end;
    v17.EmojiLabel = v18;
    v18 = false;
    if v8.autocompleteType == "emojis" then
        v18 = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v8.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = "  ", 
            TextColor3 = v8.chatInputBarSettings.TextColor3, 
            TextSize = 14, 
            TextStrokeColor3 = v8.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v8.setTransparency(v8.chatInputBarSettings.TextStrokeTransparency, v8.transparencyValue), 
            TextTransparency = v8.setTransparency(0, v8.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 2, 
            ZIndex = 2
        });
    end;
    v17.SpaceLabel = v18;
    v17.TextLabel = v2.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = v8.chatInputBarSettings.FontFace, 
        RichText = true, 
        Size = UDim2.new(0, 0, 0, 0), 
        Text = string.format("%s", v8.result), 
        TextColor3 = v8.chatInputBarSettings.TextColor3, 
        TextSize = v8.chatInputBarSettings.TextSize, 
        TextStrokeColor3 = v8.chatInputBarSettings.TextStrokeColor3, 
        TextStrokeTransparency = v8.setTransparency(v8.chatInputBarSettings.TextStrokeTransparency, v8.transparencyValue), 
        TextTransparency = v8.setTransparency(0, v8.transparencyValue), 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        LayoutOrder = 3, 
        ZIndex = 2
    });
    v13.TextLabelButton = l_createElement_1(v15, v16, v17);
    v13.Divider = v8.isDividerVisible and v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = v8.setTransparency(v6.ChatInputBarBorderTransparency, v8.transparencyValue), 
        BackgroundColor3 = v6.ChatInputBarBorderColor3, 
        BorderSizePixel = 0, 
        ZIndex = 2
    }) or nil;
    return l_createElement_0(v11, v12, v13);
end;