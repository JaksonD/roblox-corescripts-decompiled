local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v13 = require(l_Parent_0.Common.TextKeys);
local l_Dash_0 = v1.Dash;
local v15 = l_Roact_0.PureComponent:extend("ContactsImporterOverlay");
v15.validateProps = l_t_0.strictInterface({
    screenSize = l_t_0.Vector2, 
    onCloseClicked = l_Dash_0.isCallable, 
    onConnectContacts = l_Dash_0.isCallable, 
    onLearnMoreClick = l_Dash_0.isCallable, 
    onAddFriendsActivated = l_Dash_0.isCallable, 
    isFromAddFriendsPage = l_t_0.boolean, 
    isFromSignup = l_t_0.optional(l_t_0.boolean)
});
v15.render = function(v16) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v13 (copy), l_withStyle_0 (copy), l_ButtonType_0 (copy), l_Roact_0 (copy), l_PartialPageModal_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_IconSize_0 (copy), l_StyledTextLabel_0 (copy)
    return l_withLocalization_0({
        connectWithFriends = v13.CONTACTS_LIST_TITLE, 
        connectWithFriendsBody = v13.CONNECT_CONTACTS_BODY, 
        connectWithFriendsCaption = v13.CONNECT_CONTACTS_CAPTION, 
        getStarted = v13.GET_STARTED, 
        closeModal = v13.CLOSE_MODAL, 
        goToAddFriends = v13.NOT_NOW, 
        learnMore = v13.LEARN_MORE
    })(function(v17) --[[ Line: 57 ]]
        -- upvalues: l_withStyle_0 (ref), v16 (copy), l_ButtonType_0 (ref), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), l_StyledTextLabel_0 (ref)
        return l_withStyle_0(function(v18) --[[ Line: 58 ]]
            -- upvalues: v16 (ref), l_ButtonType_0 (ref), v17 (copy), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_IconSize_0 (ref), l_StyledTextLabel_0 (ref)
            local l_Theme_0 = v18.Theme;
            local l_Font_0 = v18.Font;
            local l_props_0 = v16.props;
            local v22 = {};
            if l_props_0.isFromAddFriendsPage or l_props_0.isFromSignup then
                table.insert(v22, {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = l_props_0.onCloseClicked, 
                        text = v17.goToAddFriends
                    }
                });
            else
                table.insert(v22, {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = l_props_0.onAddFriendsActivated, 
                        text = v17.goToAddFriends
                    }
                });
            end;
            table.insert(v22, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = l_props_0.onConnectContacts, 
                    text = v17.getStarted
                }
            });
            return l_Roact_0.createElement(l_PartialPageModal_0, {
                title = v17.connectWithFriends, 
                screenSize = l_props_0.screenSize, 
                onCloseClicked = l_props_0.onCloseClicked, 
                buttonStackProps = {
                    buttons = v22, 
                    buttonHeight = 48, 
                    marginBetween = 6, 
                    forcedFillDirection = Enum.FillDirection.Vertical
                }
            }, {
                ViewContainer = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 36)
                    }), 
                    IconContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(120, 132)
                    }, {
                        Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            Image = l_Images_0["icons/graphic/connectcontacts_xlarge"], 
                            Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            LayoutOrder = 1
                        })
                    }), 
                    Header = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        text = v17.connectWithFriendsBody, 
                        fontStyle = l_Font_0.Body, 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        size = UDim2.fromScale(1, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        layoutOrder = 2
                    }), 
                    Description = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        text = v17.connectWithFriendsCaption, 
                        fontStyle = l_Font_0.CaptionBody, 
                        colorStyle = l_Theme_0.TextDefault, 
                        size = UDim2.fromScale(1, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        layoutOrder = 3
                    }), 
                    LearnMore = l_Roact_0.createElement("TextButton", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = v18.Font.CaptionBody.Font, 
                        Size = UDim2.fromScale(1, 0), 
                        Text = v17.learnMore, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
                        TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        LayoutOrder = 4, 
                        [l_Roact_0.Event.Activated] = l_props_0.onLearnMoreClick
                    })
                })
            });
        end);
    end);
end;
return v15;