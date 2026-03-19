local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v4.Core.Style.useTextSizeOffset;
local v7 = require(l_Parent_0.Dash);
local l_ExperienceFooter_0 = require(l_Parent_0.GameTile).ExperienceFooter;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v10 = require(l_Modules_0.LuaApp.Components.Common.ItemTileCreatorName);
return function(v11) --[[ Line: 51 ]]
    -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v2 (copy), v3 (copy), v7 (copy), l_ExperienceFooter_0 (copy), v10 (copy)
    local v12 = l_useStyle_0();
    local l_Font_0 = v12.Font;
    local l_Theme_0 = v12.Theme;
    local v15 = l_useTextSizeOffset_0();
    local v16, v17 = v2.useState(2);
    local v18 = math.max(0, v16 - 2);
    local v19 = v16 > 3;
    local v20 = v16 == 2;
    local v21 = v11.padding or 0;
    local v22 = math.ceil(l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize);
    local v23, v24 = v2.useState(v22);
    local l_FontSize_300_0 = v12.Tokens.Global.FontSize_300;
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v24 (copy), v22 (copy), v15 (copy)
        v24(v22 + v15);
    end, {
        v22, 
        v15
    });
    local v32 = v2.useCallback(function(v26) --[[ Line: 74 ]]
        -- upvalues: v23 (copy), v21 (copy), l_FontSize_300_0 (copy), v3 (ref), v17 (copy)
        if v26 and v23 > 0 then
            local l_AbsoluteSize_0 = v26.AbsoluteSize;
            local l_X_0 = l_AbsoluteSize_0.X;
            local v29 = l_AbsoluteSize_0.Y - v21 - math.max(v21, 8) - l_X_0 - 48;
            local v30 = math.floor(v29 / (v23 + 8));
            if v30 > 3 then
                local v31 = math.floor((v29 - math.floor(v29 - (v23 + 8) * 2)) / l_FontSize_300_0);
                v3.assert(v31 >= 0, "bodyRows should always be at least 0. Otherwise, it will subtract from newContentRows, breaking component behavior.");
                v30 = v31 + 2;
            end;
            v17(v30);
        end;
    end, {
        v21, 
        v23
    });
    local v33 = v7.join(v11.footerData, {
        size = UDim2.new(0, 132, 0, v23), 
        position = if not not v19 or v20 then UDim2.new(1, 0, 0, 0) else nil, 
        anchorPoint = if not not v19 or v20 then Vector2.new(1, 0) else nil, 
        isStatsOnly = true, 
        automaticSize = Enum.AutomaticSize.X
    });
    local v34 = v2.createElement(l_ExperienceFooter_0, v33);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        ref = v32, 
        [v2.Change.AbsoluteSize] = v32
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = if v11.hasBackground then UDim.new(0, v21) else nil, 
            PaddingRight = UDim.new(0, v21), 
            PaddingTop = UDim.new(0, (math.max(v21, 8))), 
            PaddingBottom = UDim.new(0, v21)
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8)
        }), 
        TitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Title = if v11.title and string.len(v11.title) > 0 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, v19 and -132 or 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v11.title, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v22, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = -1
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Shrink
                })
            }) else nil, 
            InlineFooter = if v19 then v34 else nil
        }), 
        LicenseDescription = if v11.licenseDescription then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            LicenseDescription = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v11.licenseDescription, 
                Font = l_Font_0.Body.Font, 
                TextSize = v22, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }) else nil, 
        PaidAccessDescription = if not v11.paidAccessDescription or v11.licenseDescription then nil else v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            PaidAccessDescription = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v11.paidAccessDescription, 
                Font = l_Font_0.Body.Font, 
                TextSize = v22, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        SubtitleFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v23), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            CreatorName = if v11.creatorName then v2.createElement("Frame", {
                Size = UDim2.new(1, v20 and -132 or 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Text = v2.createElement(v10, {
                    name = v11.creatorName, 
                    hasVerifiedBadge = v11.creatorVerified, 
                    creatorId = v11.creatorId
                })
            }) else nil, 
            InlineFooter = if v20 then v34 else nil
        }), 
        BodyFrame = if v18 > 0 then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, if v18 > 1 then l_FontSize_300_0 * v18 else v23 * v18), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = 4
        }, {
            ExperienceInfo = if v18 > 1 then v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v11.description, 
                Font = l_Font_0.Body.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }, {
                UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = l_FontSize_300_0
                })
            }) else v34
        }) else nil
    });
end;