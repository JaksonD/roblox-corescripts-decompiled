local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_AvatarCircle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.AvatarCircle;
local l_RoactFitComponents_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoactFitComponents;
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v6 = require(script.Parent.Logger);
local v7 = require(script.Parent.NoticeText);
local v8 = require(script.Parent.SystemMessage);
local v9 = v2.PureComponent:extend("ChatMessageContainer");
v9.defaultProps = {
    BackgroundColor3 = nil, 
    BackgroundTransparency = nil, 
    debugElement = nil, 
    displayName = nil, 
    failed = false, 
    filteredForReceivers = false, 
    Font = Enum.Font.Gotham, 
    isIncoming = false, 
    isNewSender = false, 
    parentWidth = 0, 
    messageTypePaddingOffset = 0, 
    moderated = false, 
    messageMaxWidth = 0, 
    openViewProfile = function() --[[ Line: 41 ]] --[[ Name: openViewProfile ]]
        -- upvalues: v6 (copy)
        v6:warning("openViewProfile was not passed to ChatMessage");
    end, 
    renderMessage = function() --[[ Line: 44 ]] --[[ Name: renderMessage ]]
        -- upvalues: v6 (copy)
        v6:warning("renderMessage was not passed to ChatMessage");
    end, 
    senderUserId = nil, 
    thumbnail = nil, 
    viewProfileOnAvatarPressed = true, 
    messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.", 
    messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.", 
    unknownUserText = "PLACEHOLDER unknown user"
};
v9.init = function(v10) --[[ Line: 56 ]] --[[ Name: init ]]
    v10.onAvatarActivated = function() --[[ Line: 57 ]]
        -- upvalues: v10 (copy)
        if v10.props.viewProfileOnAvatarPressed then
            v10.props.openViewProfile(v10.props.senderUserId);
        end;
    end;
end;
v9.render = function(v11) --[[ Line: 64 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_RoactFitComponents_0 (copy), v8 (copy), l_AvatarCircle_0 (copy), v7 (copy)
    return l_withStyle_0(function(v12) --[[ Line: 65 ]]
        -- upvalues: v11 (copy), v2 (ref), l_RoactFitComponents_0 (ref), v8 (ref), l_AvatarCircle_0 (ref), v7 (ref)
        local v13 = 0;
        if not v11.props.showDateTime then
            v13 = (v11.props.isNewSender and 10 or 2) + v11.props.messageTypePaddingOffset;
        end;
        local v14 = v11.props.displayName == "" and v11.props.unknownUserText or v11.props.displayName;
        local v15 = v11.props.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right;
        local v16 = v11.props.moderated or v11.props.filteredForReceivers;
        return v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v15, 
            width = UDim.new(1, 0)
        }, {
            DateTime = v11.props.showDateTime and v2.createElement(v8, {
                LayoutOrder = 1, 
                Text = v11.props.sent:GetLongRelativeTime(), 
                maxWidth = 1000
            }), 
            MessageWithAvatar = v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = v15, 
                LayoutOrder = 2, 
                margin = {
                    top = v13, 
                    left = v11.props.thumbnail and 8 or 44, 
                    right = 0, 
                    bottom = 0
                }, 
                width = UDim.new(1, 0)
            }, {
                Avatar = v11.props.thumbnail and v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(0, 36, 0, 36)
                }, {
                    AvatarCircle = v2.createElement(l_AvatarCircle_0, {
                        circleColor3 = v11.props.BackgroundColor3 or v12.Theme.BackgroundDefault.Color, 
                        circleInteriorBackgroundColor3 = v11.props.BackgroundColor3 or v12.Theme.BackgroundDefault.Color, 
                        onActivated = v11.onAvatarActivated, 
                        thumbnails = {
                            v11.props.thumbnail
                        }
                    })
                }) or nil, 
                MessageWithDisplayName = v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = v15, 
                    LayoutOrder = 2, 
                    margin = {
                        top = 0, 
                        left = v11.props.isIncoming and 5 or 0, 
                        right = 0, 
                        bottom = 0
                    }, 
                    width = UDim.new(1, v11.props.isIncoming and -44 or 0)
                }, {
                    DisplayNameContainer = v11.props.displayName and v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        margin = {
                            top = 0, 
                            left = 6, 
                            right = 0, 
                            bottom = 0
                        }, 
                        width = UDim.new(0, v11.props.messageMaxWidth - 6)
                    }, {
                        DisplayName = v2.createElement(l_RoactFitComponents_0.FitTextLabel, {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = v12.Font.Footer.Font, 
                            maximumWidth = v11.props.messageMaxWidth - 6, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = v14, 
                            TextColor3 = v12.Theme.TextDefault.Color, 
                            TextSize = v12.Font.BaseSize * v12.Font.Footer.RelativeSize, 
                            TextTransparency = v12.Theme.TextDefault.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            width = l_RoactFitComponents_0.FitTextLabel.Width.FitToText
                        })
                    }), 
                    MessageWithAlertIcon = v2.createElement(l_RoactFitComponents_0.FitFrameVertical, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = v15, 
                        LayoutOrder = 2, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 10), 
                        width = UDim.new(1, v11.props.isIncoming and -44 or 0)
                    }, {
                        AlertIcon = (not not v11.props.failed or v11.props.moderated) and v2.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/ui/LuaChat/icons/ic-alert.png", 
                            ImageColor3 = v12.Theme.Alert.Color, 
                            ImageTransparency = v12.Theme.Alert.Transparency, 
                            LayoutOrder = v11.props.isIncoming and 2 or 1, 
                            Size = UDim2.new(0, 18, 0, 18)
                        }), 
                        Message = v11.props.renderMessage({
                            LayoutOrder = v11.props.isIncoming and 1 or 2
                        })
                    })
                })
            }), 
            Notice = v16 and v2.createElement(v7, {
                Font = v11.props.Font, 
                HorizontalAlignment = v15, 
                LayoutOrder = 3, 
                Text = v11.props.moderated and v11.props.messageModeratedNoticeText or v11.props.messageDefaultNoticeText, 
                TextColor3 = v11.props.moderated and v12.Theme.Alert.Color or v12.Theme.UIDefault.Color, 
                TextTransparency = v11.props.moderated and v12.Theme.Alert.Transparency or v12.Theme.UIDefault.Transparency, 
                TextXAlignment = v11.props.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right, 
                margin = {
                    top = 0, 
                    left = v11.props.isIncoming and 54 or 0, 
                    right = not v11.props.isIncoming and 10 or 0, 
                    bottom = 0
                }, 
                maxWidth = v11.props.parentWidth, 
                width = UDim.new(1, v11.props.isIncoming and -44 or 0)
            }), 
            debug = v11.props.debugElement or nil
        });
    end);
end;
return v9;