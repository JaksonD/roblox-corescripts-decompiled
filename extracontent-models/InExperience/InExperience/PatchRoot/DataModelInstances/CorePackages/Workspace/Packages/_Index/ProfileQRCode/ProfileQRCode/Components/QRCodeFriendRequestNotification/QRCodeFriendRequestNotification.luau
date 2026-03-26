local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local v15 = require(l_script_FirstAncestor_0.Utils.useLocalUserInfo);
local v16 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v17 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v19 = l_Images_0["icons/menu/scanqr"];
local v20 = l_Images_0["icons/navigation/close"];
return function(v21) --[[ Line: 46 ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useStyle_0 (copy), v15 (copy), v16 (copy), v2 (copy), v17 (copy), l_ImageSetLabel_0 (copy), v19 (copy), l_StyledTextLabel_0 (copy), l_IconButton_0 (copy), v20 (copy), l_IconSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v22 = l_useLocalization_0({
        notificationRequest = v6.NotificationRequestText, 
        acceptFriend = if l_FFlagConnectionsToFriendsRename_0 then v6.AcceptFriend else v6.AcceptConnection
    });
    local v23 = l_useStyle_0();
    local v24 = v15(v21.userId);
    local v25 = v16();
    local v26, v27 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v25 (copy), v17 (ref), v21 (copy)
        v25.fireEvent(v17.QRPageFriendRequestBannerShown, {
            qrCodeBannerQueueSize = v21.notificationQueueSize
        });
    end, {
        v21.userId
    });
    return v2.createElement("Frame", {
        ZIndex = 2, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v23.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v23.Theme.BackgroundUIDefault.Transparency
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12)
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Color = v23.Theme.Divider.Color, 
            Transparency = v23.Theme.Divider.Transparency, 
            Thickness = 1
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, 1e999)
        }), 
        UpperFrame = v2.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            QRCodeImageFrame = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 40, 0, 40), 
                BorderSizePixel = 0
            }, {
                QRImage = v2.createElement(l_ImageSetLabel_0, {
                    Image = v19, 
                    BackgroundTransparency = 1, 
                    ImageTransparency = 0, 
                    ImageColor3 = v23.Theme.TextEmphasis.Color, 
                    Size = UDim2.new(0, 40, 0, 40)
                })
            }), 
            TextFrame = v2.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -72, 0, 0), 
                BorderSizePixel = 0
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 16), 
                    PaddingRight = UDim.new(0, 16)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Username = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v24.displayName, 
                    fontStyle = v23.Font.Header2, 
                    colorStyle = v23.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 20), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    textWrapped = true
                }), 
                Spacer1 = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 5), 
                    LayoutOrder = 2
                }), 
                Description = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    text = v22.notificationRequest, 
                    fontStyle = v23.Font.Body, 
                    colorStyle = v23.Theme.TextDefault, 
                    size = UDim2.new(1, 0, 0, 28), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    textXAlignment = Enum.TextXAlignment.Left, 
                    textYAlignment = Enum.TextYAlignment.Center, 
                    textWrapped = true, 
                    lineHeight = 1
                })
            }), 
            CloseButtonFrame = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 32, 0, 32), 
                BorderSizePixel = 0
            }, {
                CloseButton = v2.createElement(l_IconButton_0, {
                    icon = v20, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v21.onClose, 
                    anchorPoint = Vector2.new(0.13, 0.13)
                })
            })
        }), 
        AcceptButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 2, 
            standardSize = l_StandardButtonSize_0.Small, 
            text = v22.acceptFriend, 
            fontStyle = v23.Font.CaptionBody, 
            isDisabled = v26, 
            onActivated = function() --[[ Line: 184 ]] --[[ Name: onActivated ]]
                -- upvalues: v27 (copy), v21 (copy)
                v27(true);
                v21.onAccept(v21.userId);
            end
        })
    });
end;