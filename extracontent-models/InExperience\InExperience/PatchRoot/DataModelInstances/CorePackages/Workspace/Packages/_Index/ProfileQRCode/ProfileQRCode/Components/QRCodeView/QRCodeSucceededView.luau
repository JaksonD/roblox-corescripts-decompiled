local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.QRCodeDisplay);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.UserLib);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LightTheme_0 = v4.App.Style.Themes.LightTheme;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_OpenTypeSupport_0 = v4.Utility.OpenTypeSupport;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v12 = require(l_script_FirstAncestor_0.Utils.useLocalUserInfo);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_DisplayQRCode_0 = v2.DisplayQRCode;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v5.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v17 = l_Images_0["component_assets/dropshadow_56_8"];
return function(v18) --[[ Line: 38 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v12 (copy), l_useStyle_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v3 (copy), l_LightTheme_0 (copy), l_DisplayQRCode_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local v19 = l_useLocalUserId_0();
    local v20 = v12(v19);
    local v21 = l_useStyle_0();
    local v22 = nil;
    if v19 then
        v22 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v19);
    end;
    return v3.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = l_LightTheme_0.BackgroundUIDefault.Transparency, 
        BackgroundColor3 = l_LightTheme_0.BackgroundUIDefault.Color, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, if v18.isSmallScreen then v18.padding / 2 else v18.padding), 
            PaddingRight = UDim.new(0, v18.padding), 
            PaddingBottom = UDim.new(0, if v18.isSmallScreen then v18.padding / 2 else v18.padding), 
            PaddingLeft = UDim.new(0, v18.padding)
        }), 
        QRCodeWrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v18.qrCodeLength, 0, v18.qrCodeLength), 
            LayoutOrder = 1
        }, {
            QRCode = v3.createElement(l_DisplayQRCode_0, {
                toEncode = v18.url, 
                ecLevel = v2.ECLevels.EC_LEVEL_4, 
                sideLength = v18.qrCodeLength, 
                pixelColor = l_LightTheme_0.UIEmphasis.Color, 
                qrCodeRotation = 15
            }), 
            PlayerAvatar = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = l_LightTheme_0.BackgroundUIDefault.Color, 
                BackgroundTransparency = l_LightTheme_0.BackgroundUIDefault.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Rotation = 15, 
                Size = UDim2.fromOffset(44, 44), 
                ZIndex = 3
            }, {
                Canvas = v3.createElement("CanvasGroup", {
                    BackgroundColor3 = l_LightTheme_0.BackgroundUIDefault.Color, 
                    BackgroundTransparency = l_LightTheme_0.BackgroundUIDefault.Transparency, 
                    BorderSizePixel = 0, 
                    ClipsDescendants = true, 
                    Size = UDim2.fromScale(1, 1)
                }, {
                    Avatar = v3.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundColor3 = l_LightTheme_0.BackgroundUIDefault.Color, 
                        BackgroundTransparency = l_LightTheme_0.BackgroundUIDefault.Transparency, 
                        BorderSizePixel = 0, 
                        Image = v22, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Rotation = -15, 
                        Size = UDim2.fromOffset(60, 60), 
                        ZIndex = 2
                    })
                }), 
                UIStroke = v3.createElement("UIStroke", {
                    Color = l_LightTheme_0.BackgroundUIDefault.Color, 
                    Thickness = 2
                })
            }), 
            BigShadow = v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, 70, 0, 70), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Image = v17, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v21.Theme.DropShadow.Color, 
                ImageTransparency = v21.Theme.DropShadow.Transparency
            })
        }), 
        Spacer1 = v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 0, 0, 10), 
            LayoutOrder = 2
        }), 
        DisplayName = v3.createElement(l_StyledTextLabel_0, {
            layoutOrder = 3, 
            text = v20.displayName, 
            fontStyle = v21.Font.SubHeader1, 
            lineHeight = 1, 
            colorStyle = l_LightTheme_0.TextEmphasis, 
            automaticSize = Enum.AutomaticSize.Y, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center, 
            fluidSizing = false, 
            richText = false, 
            size = UDim2.new(1, 0, 0, 0)
        }), 
        Username = v3.createElement(l_StyledTextLabel_0, {
            size = UDim2.new(1, 0, 0, 0), 
            layoutOrder = 4, 
            text = "@" .. v20.username, 
            fontStyle = v21.Font.CaptionBody, 
            lineHeight = 1, 
            automaticSize = Enum.AutomaticSize.Y, 
            colorStyle = l_LightTheme_0.TextEmphasis, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center, 
            fluidSizing = false, 
            richText = false, 
            openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0.05, 0)
        })
    });
end;