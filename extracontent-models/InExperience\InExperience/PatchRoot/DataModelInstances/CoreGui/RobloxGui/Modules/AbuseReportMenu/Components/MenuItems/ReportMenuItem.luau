local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = v4.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Components.Constants);
local v9 = require(l_script_FirstAncestor_0.Components.getMenuItemDimensions);
return function(v10) --[[ Line: 22 ]] --[[ Name: DropdownReportMenuItem ]]
    -- upvalues: l_useStyle_0 (copy), v9 (copy), v8 (copy), v6 (copy), l_TextService_0 (copy), l_AppFonts_0 (copy), v5 (copy)
    local v11 = l_useStyle_0();
    local v12 = (not (v10.label ~= "") or v10.isRightComponentFullWidth) and 0 or v11.Tokens.Global.Size_75;
    local l_Theme_0 = v11.Theme;
    local v14 = v9(v10.menuContainerWidth);
    local v15 = math.max(v10.menuContainerWidth - v8.MenuItemDynamicWidthOffset, v14.LeftWidth + v14.RightWidth);
    local v16, v17 = v6.useState(v11.Tokens.Global.Size_500);
    v6.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy), v11 (copy), l_TextService_0 (ref), v10 (copy), v14 (copy), l_AppFonts_0 (ref), v15 (copy)
        v17((math.max(v11.Tokens.Global.Size_500, l_TextService_0:GetTextSize(v10.label, v14.TextSize, l_AppFonts_0.default:getMedium(), Vector2.new(if v10.isSmallPortraitViewport then v15 else v14.LeftWidth, 1e999)).Y)));
    end, {});
    local v18 = {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = if v10.isSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = if v10.isSmallPortraitViewport then UDim.new(0, v12) else UDim.new(0, 0)
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v12), 
            PaddingBottom = UDim.new(0, v12)
        })
    };
    if v10.isRightComponentFullWidth then
        local v19 = math.max(v10.menuContainerWidth - v8.MenuItemDynamicWidthOffset, v14.LeftWidth + v14.RightWidth);
        v18 = v5.Dictionary.join(v18, {
            RightComponentWrapper = v6.createElement("Frame", {
                Size = UDim2.new(0, v19, 0, v8.MenuItemHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                RightComponent = v10.rightComponent
            })
        });
    else
        local v20 = math.max(0, v10.menuContainerWidth - v14.LeftWidth - v14.RightWidth - v8.MenuItemDynamicWidthOffset);
        v18 = v5.Dictionary.join(v18, {
            Label = if v10.label == "" and v10.isSmallPortraitViewport then nil else v6.createElement("TextLabel", {
                Text = v10.label, 
                Font = l_AppFonts_0.default:getMedium(), 
                LayoutOrder = 1, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = v14.TextSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = if v10.isSmallPortraitViewport then UDim2.new(0, v15, 0, 0) else UDim2.new(0, v14.LeftWidth, 0, v16), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }), 
            MiddleSpaceHolder = if v10.isSmallPortraitViewport then nil else v6.createElement("Frame", {
                Size = UDim2.new(0, v20, 0, v8.MenuItemHeight), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            RightComponentWrapper = v6.createElement("Frame", {
                Size = if v10.isSmallPortraitViewport then UDim2.new(0, v15, 0, 0) else UDim2.new(0, v14.RightWidth, 0, v8.MenuItemHeight), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if v10.isSmallPortraitViewport then Enum.HorizontalAlignment.Left else nil
                }), 
                RightComponent = v10.rightComponent
            })
        });
    end;
    local l_v16_0 = v16;
    if v10.heightOverride then
        l_v16_0 = v10.heightOverride;
    end;
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_v16_0), 
        AutomaticSize = if not not v10.isRightComponentFullWidth or v10.isSmallPortraitViewport then Enum.AutomaticSize.Y else nil, 
        BackgroundTransparency = 1, 
        LayoutOrder = v10.layoutOrder
    }, v18);
end;