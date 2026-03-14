local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = v6.App.Container.HorizontalPageMargin;
return function(v13) --[[ Line: 30 ]] --[[ Name: ContactProfileHeader ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), l_useStyle_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_LoadableImage_0 (copy), v4 (copy), l_HorizontalPageMargin_0 (copy), l_StyledTextLabel_0 (copy)
    local v14 = l_useLocalization_0({
        contactsProfileBody = {
            v5.ContactsProfileBody; 
            contactName = v13.contactName
        }, 
        failedMessage = v5.NoInternet, 
        fromContacts = v5.FromContacts
    });
    local v15 = l_useStyle_0();
    local l_Theme_0 = v15.Theme;
    local l_Font_0 = v15.Font;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 400), 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder
    }, {
        Background = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Image = l_Images_0[v15.Theme.PlayerBackgroundDefault.Image], 
            ZIndex = 1
        }), 
        AvatarThumbnail = v2.createElement(l_LoadableImage_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, -48), 
            Size = UDim2.new(1, -96, 1, -96), 
            ScaleType = Enum.ScaleType.Fit, 
            BackgroundTransparency = 1, 
            Image = v13.avatarThumbnailUrl, 
            useShimmerAnimationWhileLoading = true, 
            ZIndex = 2
        }), 
        TopGradient = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v4.CONTACT_CARD_GRADIENT_HEIGHT), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        BottomGradient = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v4.CONTACT_CARD_GRADIENT_HEIGHT), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            ZIndex = 3
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        UserDetails = v2.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 0, 56), 
            position = UDim2.fromScale(0, 0.9), 
            anchorPoint = Vector2.new(0, 1), 
            zIndex = 4, 
            backgroundTransparency = 1
        }, {
            UserDetailsLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding1 = v2.createElement("Frame", {
                Size = UDim2.fromOffset(0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            ContactName = v2.createElement(l_StyledTextLabel_0, {
                text = v13.contactName, 
                size = UDim2.new(1, 0, 0, 24), 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = l_Font_0.Header1, 
                colorStyle = l_Theme_0.TextEmphasis, 
                layoutOrder = 2
            }), 
            Padding2 = v2.createElement("Frame", {
                Size = UDim2.fromOffset(0, 15), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }), 
            FromContacts = v2.createElement(l_StyledTextLabel_0, {
                size = UDim2.new(1, 0, 0, 16), 
                text = v14.fromContacts, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                fontStyle = l_Font_0.CaptionHeader, 
                colorStyle = l_Theme_0.TextMuted, 
                layoutOrder = 4
            })
        })
    });
end;