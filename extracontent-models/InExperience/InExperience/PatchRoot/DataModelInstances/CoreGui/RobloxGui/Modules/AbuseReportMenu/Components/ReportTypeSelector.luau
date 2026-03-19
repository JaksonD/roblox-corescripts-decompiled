local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.React);
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.Components.Constants);
local v8 = require(l_script_FirstAncestor_0.Components.getMenuItemDimensions);
local v9 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local l_TextButton_0 = v3.App.Button.TextButton;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
return function(v13) --[[ Line: 28 ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v9 (copy), v7 (copy), v4 (copy), l_AppFonts_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_TextButton_0 (copy)
    local l_Size_100_0 = l_useStyle_0().Tokens.Global.Size_100;
    local v15 = v8(v13.menuWidth);
    local v16 = v9();
    local l_MenuItemHeightTight_0 = v7.MenuItemHeightTight;
    local v18 = math.max(v13.menuWidth - v7.MenuItemDynamicWidthOffset, v15.LeftWidth + v15.RightWidth);
    local l_isSmallPortraitViewport_0 = v13.isSmallPortraitViewport;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = if l_isSmallPortraitViewport_0 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = if l_isSmallPortraitViewport_0 then UDim.new(0, l_Size_100_0) else UDim.new(0, 0)
        }), 
        Label = v4.createElement("TextLabel", {
            Text = v13.label, 
            Font = l_AppFonts_0.default:getMedium(), 
            LayoutOrder = 1, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextTransparency = 0, 
            TextSize = v15.TextSize, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = if l_isSmallPortraitViewport_0 then UDim2.fromOffset(v18, 0) else UDim2.new(0, v15.LeftWidth, 0, v7.MenuItemHeight), 
            BackgroundTransparency = 1
        }), 
        MiddleWidthHolder = if l_isSmallPortraitViewport_0 then nil else v4.createElement("Frame", {
            Size = UDim2.new(0, math.max(0, v13.menuWidth - v15.LeftWidth - v15.RightWidth - 100), 0, v7.MenuItemHeight), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }), 
        Container = v4.createElement("Frame", {
            Size = if l_isSmallPortraitViewport_0 then UDim2.fromOffset(v18, l_MenuItemHeightTight_0) else UDim2.new(0, v15.RightWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = if l_isSmallPortraitViewport_0 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            LeftChevron = if v13.isSelectionDisabled then nil else v4.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(32, 32), 
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/cycleLeft"], 
                onActivated = v13.onClickLeft, 
                layoutOrder = 1
            }), 
            ButtonContainer = v4.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(0, v15.RightWidth - 64, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ToggleButton = v4.createElement(l_TextButton_0, {
                    size = UDim2.new(1, 0, 1, 0), 
                    text = v13.abuseType, 
                    onActivated = v13.onClickRight, 
                    layoutOrder = 2, 
                    isDisabled = v13.isSelectionDisabled, 
                    fontStyle = v16.FontStyle, 
                    verticalPadding = v16.ButtonInsideVerticalPadding
                })
            }), 
            RightChevron = if v13.isSelectionDisabled then nil else v4.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(32, 32), 
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/cycleRight"], 
                onActivated = v13.onClickRight, 
                layoutOrder = 3
            })
        })
    });
end;