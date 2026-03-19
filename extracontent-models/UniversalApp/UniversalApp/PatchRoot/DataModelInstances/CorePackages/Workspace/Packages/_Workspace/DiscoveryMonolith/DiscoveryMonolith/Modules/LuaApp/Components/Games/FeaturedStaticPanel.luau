local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local v6 = require(l_Parent_0.Dash);
local v7 = require(l_Parent_0.GameTile);
local l_GridTileTextFooter_0 = v7.GridTileTextFooter;
local l_ExperienceFooter_0 = v7.ExperienceFooter;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.Common.ItemTileCreatorName);
return function(v12) --[[ Line: 38 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v2 (copy), v6 (copy), l_GridTileTextFooter_0 (copy), l_ExperienceFooter_0 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local l_Font_0 = v13.Font;
    local l_Theme_0 = v13.Theme;
    local v16 = l_useTextSizeOffset_0();
    local v17 = v12.padding or 0;
    local v18 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v19, v20 = v2.useState(v18);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v20 (copy), v18 (copy), v16 (copy)
        v20(v18 + v16);
    end, {
        v18, 
        v16
    });
    local v21 = v6.join(v12.footerData, {
        size = UDim2.new(0, 132, 0, v18), 
        layoutOrder = 2, 
        isStatsOnly = true
    });
    local v22 = nil;
    if v12.licenseDescription then
        v22 = v2.createElement(l_GridTileTextFooter_0, {
            text = v12.licenseDescription, 
            useLargerFont = true, 
            LayoutOrder = 2
        });
    elseif v12.paidAccessDescription then
        v22 = v2.createElement(l_GridTileTextFooter_0, {
            text = v12.paidAccessDescription, 
            useLargerFont = true, 
            LayoutOrder = 2
        });
    else
        v2.createElement(l_ExperienceFooter_0, v21);
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v17), 
            PaddingLeft = if v12.hasBackground then UDim.new(0, v17) else nil, 
            PaddingRight = if v12.hasBackground then UDim.new(0, v17) else nil, 
            PaddingBottom = if v12.hasBackground then UDim.new(0, v17) else nil
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v17)
        }), 
        Title = if v12.title and string.len(v12.title) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v19), 
            BackgroundTransparency = 1, 
            Text = v12.title, 
            Font = l_Font_0.Header2.Font, 
            TextSize = v18, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }) else nil, 
        Footer = v22, 
        CreatorName = if v12.creatorName then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v19), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Text = v2.createElement(v11, {
                name = v12.creatorName, 
                hasVerifiedBadge = v12.creatorVerified, 
                creatorId = v12.creatorId
            })
        }) else nil, 
        Description = if v12.description and string.len(v12.description) > 0 then v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v19 * 3), 
            BackgroundTransparency = 1, 
            Text = v12.description, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 4
        }, {
            UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                MaxTextSize = v13.Tokens.Global.FontSize_300
            })
        }) else nil
    });
end;