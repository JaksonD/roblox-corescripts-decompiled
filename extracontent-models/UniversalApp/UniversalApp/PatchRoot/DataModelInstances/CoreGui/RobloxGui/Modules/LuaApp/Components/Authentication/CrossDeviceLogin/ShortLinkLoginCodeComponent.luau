local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_getIconSizeUDim2_0 = v3.App.ImageSet.getIconSizeUDim2;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v12 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
local v13 = l_Images_0["icons/graphic/devices_xxlarge"];
local v14 = v4.interface({
    DeviceCode = v4.string, 
    ShortLink = v4.string
});
return function(v15) --[[ Line: 24 ]]
    -- upvalues: v14 (copy), l_useDesignTokens_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v12 (copy), v13 (copy), l_LoadingSpinner_0 (copy)
    assert(v14(v15));
    local v16 = l_useDesignTokens_0();
    local l_LoginView_0 = v16.LuaApps.LoginView;
    local v18 = l_useStyle_0();
    local l_DeviceCode_0 = v15.DeviceCode;
    local l_TextEmphasis_0 = v18.Theme.TextEmphasis;
    local l_TextMuted_0 = v18.Theme.TextMuted;
    local l_IconDefault_0 = v18.Theme.IconDefault;
    local v23 = l_useLocalization_0({
        goToText = "Authentication.CrossDevice.GoToInstruction", 
        enterCodeInstruction = "Authentication.CrossDevice.EnterCodeInstruction"
    });
    local l_createElement_0 = v1.createElement;
    local v25 = "Frame";
    local v26 = {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v27 = {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_LoginView_0.quickLinkCodeViewTopPadding), 
            PaddingBottom = UDim.new(0, l_LoginView_0.quickLinkCodeViewBottomPadding)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 0)
        }), 
        DeviceIcon = v1.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = v12, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Fit, 
            Image = v13, 
            ImageColor3 = l_IconDefault_0.Color, 
            ImageTransparency = l_IconDefault_0.Transparency
        }), 
        InstructionsPadding = v1.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4)
        }), 
        InstructionTextGroup = v1.createElement("Frame", {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            GotToDeviceText = v1.createElement("TextLabel", {
                Text = v23.goToText, 
                Font = v16.Semantic.Typography.Subheader.Font, 
                RichText = false, 
                TextSize = v16.Semantic.Typography.Subheader.FontSize, 
                TextColor3 = l_TextMuted_0.Color, 
                TextTransparency = l_TextMuted_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = nil, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            LinkText = v1.createElement("TextLabel", {
                Text = v15.ShortLink, 
                RichText = true, 
                Font = v16.Semantic.Typography.Title.Font, 
                TextSize = v16.Semantic.Typography.Title.FontSize, 
                TextColor3 = l_TextEmphasis_0.Color, 
                TextTransparency = l_TextEmphasis_0.Transparency, 
                TextWrapped = true, 
                TextXAlignment = nil, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        QuickLoginCodePadding = v1.createElement("Frame", {
            LayoutOrder = 4, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 8)
        })
    };
    local l_createElement_1 = v1.createElement;
    local v29 = "Frame";
    local v30 = {
        LayoutOrder = 5, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    };
    local v31 = {
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        GoToCodeText = v1.createElement("TextLabel", {
            Text = v23.enterCodeInstruction, 
            Font = v16.Semantic.Typography.Body.Font, 
            RichText = false, 
            TextSize = v16.Semantic.Typography.Body.FontSize, 
            TextColor3 = l_TextMuted_0.Color, 
            TextTransparency = l_TextMuted_0.Transparency, 
            TextWrapped = true, 
            TextXAlignment = nil, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        CodeDisplayPadding = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 8), 
            LayoutOrder = 2
        })
    };
    local l_createElement_2 = v1.createElement;
    local v33 = "TextLabel";
    local v34 = {
        LayoutOrder = 3, 
        Text = l_DeviceCode_0, 
        Font = v16.Semantic.Typography.Title.Font, 
        TextSize = v16.Semantic.Typography.Title.FontSize, 
        TextColor3 = l_TextEmphasis_0.Color, 
        TextTransparency = l_TextEmphasis_0.Transparency, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.7, 
        TextXAlignment = nil, 
        Size = UDim2.new(0, v16.Semantic.Typography.Title.FontSize * 6, 0, v16.Semantic.Typography.Title.FontSize * 1.5)
    };
    local v35 = {};
    local v36 = false;
    if l_DeviceCode_0 == "" then
        v36 = v1.createElement(l_LoadingSpinner_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            size = UDim2.new(0, l_LoginView_0.quickLinkCodeViewCodeTextSize * 1.5, 0, l_LoginView_0.quickLinkCodeViewCodeTextSize * 1.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    end;
    v35.Spinner = v36;
    v35.UICorner = v1.createElement("UICorner", {
        CornerRadius = UDim.new(0, 8)
    });
    v35.UIPadding = v1.createElement("UIPadding", {
        PaddingLeft = UDim.new(l_LoginView_0.quickLinkCodeViewCodeBoxHorizontalPadding, 0), 
        PaddingRight = UDim.new(l_LoginView_0.quickLinkCodeViewCodeBoxHorizontalPadding, 0), 
        PaddingTop = UDim.new(0, l_LoginView_0.quickLinkCodeViewCodeBoxVertialPaddingb), 
        PaddingBottom = UDim.new(0, l_LoginView_0.quickLinkCodeViewCodeBoxVertialPaddingb)
    });
    v31.CodeDisplay = l_createElement_2(v33, v34, v35);
    v27.QuickLoginCodeGroup = l_createElement_1(v29, v30, v31);
    return l_createElement_0(v25, v26, v27);
end;