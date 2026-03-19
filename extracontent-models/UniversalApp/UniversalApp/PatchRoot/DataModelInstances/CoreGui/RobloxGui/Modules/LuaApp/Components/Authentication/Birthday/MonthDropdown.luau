local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_MenuDirection_0 = v3.App.Menu.MenuDirection;
local l_ContextualMenu_0 = v3.App.Menu.ContextualMenu;
local l_AuthStatefulRoundCornerBorder_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.AuthStatefulRoundCornerBorder;
return function(v12) --[[ Line: 33 ]] --[[ Name: MonthDropdown ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_ContextualMenu_0 (copy), v2 (copy), l_MenuDirection_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), l_ImageSetButton_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v13 = l_useStyle_0();
    local v14 = l_useLocalization_0({
        January = "CommonUI.Controls.Label.January", 
        February = "CommonUI.Controls.Label.February", 
        March = "CommonUI.Controls.Label.March", 
        April = "CommonUI.Controls.Label.April", 
        May = "CommonUI.Controls.Label.May", 
        June = "CommonUI.Controls.Label.June", 
        July = "CommonUI.Controls.Label.July", 
        August = "CommonUI.Controls.Label.August", 
        September = "CommonUI.Controls.Label.September", 
        October = "CommonUI.Controls.Label.October", 
        November = "CommonUI.Controls.Label.November", 
        December = "CommonUI.Controls.Label.December", 
        Month = "Authentication.SignUp.Label.Month"
    });
    local v15 = {
        {
            text = v14.January, 
            key = 1
        }, 
        {
            text = v14.February, 
            key = 2
        }, 
        {
            text = v14.March, 
            key = 3
        }, 
        {
            text = v14.April, 
            key = 4
        }, 
        {
            text = v14.May, 
            key = 5
        }, 
        {
            text = v14.June, 
            key = 6
        }, 
        {
            text = v14.July, 
            key = 7
        }, 
        {
            text = v14.August, 
            key = 8
        }, 
        {
            text = v14.September, 
            key = 9
        }, 
        {
            text = v14.October, 
            key = 10
        }, 
        {
            text = v14.November, 
            key = 11
        }, 
        {
            text = v14.December, 
            key = 12
        }
    };
    local v16, v17 = v1.useState(0);
    local v18, v19 = v1.useState(false);
    local function v20() --[[ Line: 70 ]] --[[ Name: toggleDropdown ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19(not v18);
    end;
    local function _(v21, v22) --[[ Line: 74 ]] --[[ Name: monthSelectionElement ]]
        -- upvalues: v17 (copy), v12 (copy), v19 (copy), v16 (copy)
        local function v23() --[[ Line: 75 ]] --[[ Name: onMonthSelected ]]
            -- upvalues: v17 (ref), v22 (copy), v12 (ref), v19 (ref)
            v17(v22);
            v12.onMonthSelected(v22);
            v19(false);
        end;
        return {
            text = v21, 
            onActivated = v23, 
            selected = v16 == v22
        };
    end;
    local function v29() --[[ Line: 88 ]] --[[ Name: dropdownMenuList ]]
        -- upvalues: v1 (ref), v12 (copy), l_ContextualMenu_0 (ref), v2 (ref), v15 (copy), v17 (copy), v19 (copy), v16 (copy), v18 (copy), l_MenuDirection_0 (ref), v20 (copy)
        return v1.createElement("Frame", {
            Size = UDim2.new(1.25, 0, 0, 0), 
            AnchorPoint = if v12.shouldExpandRight then Vector2.new(0, 0) else Vector2.new(1, 0), 
            Position = if v12.shouldExpandRight then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            MonthMenu = v1.createElement(l_ContextualMenu_0, {
                buttonProps = v2.map(v15, function(v25) --[[ Line: 98 ]]
                    -- upvalues: v17 (ref), v12 (ref), v19 (ref), v16 (ref)
                    local l_text_0 = v25.text;
                    local l_key_0 = v25.key;
                    local function v28() --[[ Line: 75 ]] --[[ Name: onMonthSelected ]]
                        -- upvalues: v17 (ref), l_key_0 (copy), v12 (ref), v19 (ref)
                        v17(l_key_0);
                        v12.onMonthSelected(l_key_0);
                        v19(false);
                    end;
                    return {
                        text = l_text_0, 
                        onActivated = v28, 
                        selected = v16 == l_key_0
                    };
                end), 
                open = v18, 
                menuDirection = l_MenuDirection_0.Down, 
                screenSize = v12.screenSize, 
                openPositionY = UDim.new(0, v12.textInputHeight * -1), 
                contextMenuWidthOverride = UDim.new(1, 0), 
                onDismiss = v20
            })
        });
    end;
    return v1.createElement("Frame", {
        Size = v12.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v12.layoutOrder, 
        ZIndex = 2
    }, {
        Button = v1.createElement(l_AuthStatefulRoundCornerBorder_0, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 0, v12.textInputHeight), 
            borderState = l_AuthStatefulRoundCornerBorder_0.BorderState.Default
        }, {
            Base = v1.createElement(l_ImageSetButton_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = "LuaApp/buttons/buttonFill", 
                BackgroundColor3 = v13.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = v13.Theme.BackgroundUIContrast.Transparency, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                [v1.Event.Activated] = v20
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 12)
                }), 
                UIPadding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingBottom = UDim.new(0, 0), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                TextLabel = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, -16, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    Text = if v16 > 0 then v15[v16].text else v14.Month, 
                    Font = v13.Font.Body.Font, 
                    TextSize = v13.Font.BaseSize * v13.Font.Body.RelativeSize, 
                    TextColor3 = if v16 then v13.Theme.TextDefault.Color else v13.Theme.UIDefault.Color, 
                    TextTransparency = v13.Theme.TextDefault.Transparency
                }), 
                ImageLabel = v1.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(1, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v18 and l_Images_0["truncate_arrows/actions_truncationCollapse"] or l_Images_0["truncate_arrows/actions_truncationExpand"], 
                    ImageColor3 = v13.Theme.UIDefault.Color, 
                    ImageTransparency = v13.Theme.UIDefault.Transparency
                })
            })
        }), 
        DropdownMenu = v18 and v29()
    });
end;