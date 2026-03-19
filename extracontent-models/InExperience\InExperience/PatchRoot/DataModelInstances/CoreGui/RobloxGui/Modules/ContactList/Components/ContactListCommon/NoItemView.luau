local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v4 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v4.UIBlox;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function(v10) --[[ Line: 29 ]] --[[ Name: NoItemView ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v11 = l_useStyle_0();
    local l_Font_0 = v11.Font;
    local l_Theme_0 = v11.Theme;
    local v14 = l_useLocalization_0({
        failedLabel = "Feature.Call.Label.Retry", 
        placeCallLabel = "Feature.Call.Prompt.StartCall"
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = 10000
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 20), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        Image = if v10.isImageEnabled then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = l_Images_0[v10.imageName], 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(96, 96)
        }) else nil, 
        Message = v2.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            Text = v10.messageText, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextWrapped = true
        }), 
        FailedButton = if v10.isFailedButtonEnabled then v2.createElement("TextButton", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            Font = l_Font_0.Header2.Font, 
            LayoutOrder = 3, 
            Text = v14.failedLabel, 
            TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency, 
            [v2.Event.Activated] = v10.onFailedButtonActivated
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8)
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(108, 36)
            })
        }) else nil, 
        CallButton = if v10.isCallButtonEnabled then v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 3, 
            [v2.Event.Activated] = v10.onCallButtonActivated
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            StartCallIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(24, 24), 
                BackgroundTransparency = 1, 
                Image = "rbxassetid://15239343417", 
                ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                LayoutOrder = 1
            }), 
            StartCallButtonText = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Header2.Font, 
                LayoutOrder = 2, 
                Text = v14.placeCallLabel, 
                TextColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.SystemPrimaryContent.Transparency
            })
        }) else nil
    });
end;