local l_Parent_0 = script:FindFirstAncestor("MarkdownCore").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local l_map_0 = v2.map;
local l_View_0 = v3.View;
local l_Image_0 = v3.Image;
local l_Text_0 = v3.Text;
local v8 = {
    ItemOffset = 12, 
    MarkerImage = "rbxasset://textures/StudioSharedUI/dot.png", 
    MarkerSize = 4, 
    Padding = 6, 
    LineHeight = 18, 
    Font = Enum.Font.BuilderSans, 
    TextColor = Color3.fromRGB(0, 0, 0), 
    TextSize = 18, 
    ItemIndentation = 0, 
    SubItemStyle = {
        ItemIndentation = 20, 
        ItemOffset = 12
    }
};
local function _(v9, v10) --[[ Line: 57 ]] --[[ Name: calculateItemOffset ]]
    return v10 + v9;
end;
local function _(v12) --[[ Line: 98 ]] --[[ Name: isOrdered ]]
    return v12 and not v12:find("^*") and not v12:find("^-");
end;
return function(v14) --[[ Line: 102 ]] --[[ Name: BulletList ]]
    -- upvalues: v3 (copy), v8 (copy), l_map_0 (copy), v1 (copy), l_Text_0 (copy), l_View_0 (copy), l_Image_0 (copy), v2 (copy)
    local v15 = v3.Hooks.useTokens();
    local l_TextWrapped_0 = v14.TextWrapped;
    local l_TextTruncate_0 = v14.TextTruncate;
    local v18 = v14.ListStyle or v8;
    local l_Items_0 = v14.Items;
    local v20 = v18.ItemIndentation or v8.ItemIndentation;
    local l_Small_0 = v15.Gap.Small;
    local v22 = (v18.MarkerSize or v8.MarkerSize) + l_Small_0;
    l_Small_0 = UDim2.new(1, -v22, 0, 0);
    local v41 = l_map_0(l_Items_0, function(v23, v24) --[[ Line: 116 ]]
        -- upvalues: v20 (copy), v18 (copy), v8 (ref), v1 (ref), l_Text_0 (ref), l_Small_0 (copy), l_TextTruncate_0 (copy), l_TextWrapped_0 (copy), l_View_0 (ref), l_Image_0 (ref)
        local v25 = nil;
        local l_v20_0 = v20;
        local v27 = v18.MarkerImage or v8.MarkerImage;
        local v28 = nil;
        local v29 = nil;
        if type(v23) == "string" then
            v25 = v1.createElement(l_Text_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v18.Font or v8.Font, 
                LayoutOrder = 2, 
                Size = l_Small_0, 
                Text = v23, 
                TextColor = v18.TextColor or v8.TextColor, 
                TextSize = v18.TextSize or v8.TextSize, 
                TextTruncate = l_TextTruncate_0, 
                TextWrapped = l_TextWrapped_0, 
                Padding = v18.Padding or v8.Padding, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        elseif typeof(v23) == "table" and v23.Text then
            v29 = v23.Prefix;
            local l_SubItemStyle_0 = v18.SubItemStyle;
            local v31 = UDim2.new(1, -l_SubItemStyle_0.ItemOffset or v8.SubItemStyle.ItemOffset, 0, 0);
            l_v20_0 = l_SubItemStyle_0.ItemIndentation or l_v20_0;
            v27 = l_SubItemStyle_0.MarkerStyle or v27;
            if l_v20_0 then
                v28 = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_v20_0)
                });
            end;
            v25 = v1.createElement(l_Text_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                Size = v31, 
                textStyle = {
                    Color3 = v18.TextColor or v8.TextColor
                }, 
                FontStyle = {
                    Font = v18.Font or v8.Font, 
                    FontSize = v18.TextSize or v8.TextSize
                }, 
                Text = v23.Text, 
                TextWrapped = l_TextWrapped_0, 
                TextTruncate = l_TextTruncate_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        elseif typeof(v23) == "table" and v23.Item then
            v29 = v23.Prefix;
            v25 = v1.createElement(l_View_0, {
                tag = "auto-y", 
                LayoutOrder = 2, 
                Size = l_Small_0
            }, {
                ContentElement = v23.Item
            });
        else
            v25 = v1.createElement(l_View_0, {
                tag = "auto-y", 
                LayoutOrder = 2, 
                Size = l_Small_0
            }, {
                ContentElement = v23
            });
        end;
        local l_createElement_0 = v1.createElement;
        local l_l_View_0_0 = l_View_0;
        local v34 = {
            key = tostring(v24), 
            testId = "--markdown--bullet-list-item", 
            LayoutOrder = v24, 
            tag = "gap-small auto-xy row align-x-left align-y-top"
        };
        local v35 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_View_0_1 = l_View_0;
        local v38 = {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v18.MarkerSize or v8.MarkerSize, v18.LineHeight or v8.LineHeight)
        };
        local v39 = {};
        local l_v29_0 = v29;
        v39.Image = if l_v29_0 and not l_v29_0:find("^*") and not l_v29_0:find("^-") then v1.createElement(l_Text_0, {
            tag = "position-center-left anchor-center-left", 
            Text = ("%*."):format(v29), 
            fontStyle = {
                Font = v18.Font or v8.Font, 
                FontSize = v18.TextSize or v8.TextSize
            }, 
            textStyle = {
                Color3 = v18.TextColor or v8.TextColor
            }, 
            Size = UDim2.fromOffset(v18.MarkerSize or v8.MarkerSize, v18.MarkerSize or v8.MarkerSize)
        }) else v1.createElement(l_Image_0, {
            tag = "position-center-left anchor-center-left", 
            Image = v27, 
            imageStyle = {
                Color3 = v18.TextColor or v8.TextColor
            }, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v18.MarkerSize or v8.MarkerSize, v18.MarkerSize or v8.MarkerSize)
        });
        v35.Marker = l_createElement_1(l_l_View_0_1, v38, v39);
        v35.Content = v25;
        v35.Padding = v28;
        return l_createElement_0(l_l_View_0_0, v34, v35);
    end);
    local l_Size_0 = v14.Size;
    local l_Position_0 = v14.Position;
    local l_XY_0 = Enum.AutomaticSize.XY;
    if l_Size_0 and (l_Size_0.X.Scale > 0 or l_Size_0.X.Offset > 0) then
        l_XY_0 = Enum.AutomaticSize.Y;
    end;
    return v1.createElement(l_View_0, {
        testId = "--markdown--bullet-list", 
        tag = "col align-x-left gap-small", 
        AutomaticSize = l_XY_0, 
        backgroundStyle = {
            Transparency = 1
        }, 
        LayoutOrder = v14.LayoutOrder or 1, 
        Position = l_Position_0, 
        Size = l_Size_0
    }, v2.assign(v41, v14.children or {}));
end;