local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_useStyle_0 = v6.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v12 = require(l_script_FirstAncestor_0.Constants);
local v13 = require(l_Context_0.SelectedUsersContext);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v15 = UDim.new(1, 0);
return (v5.forwardRef(function(v16, v17) --[[ Line: 25 ]]
    -- upvalues: v5 (copy), v13 (copy), l_useStyle_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_dependencyArray_0 (copy), l_Interactable_0 (copy), v12 (copy), v15 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v18 = v5.useContext(v13);
    local v19 = l_useStyle_0();
    local l_Theme_0 = v19.Theme;
    local l_Font_0 = v19.Font;
    local v22 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v16.userId);
    local v23 = v5.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v16 (copy), v18 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v16.onRemoved then
            v16.onRemoved();
        end;
        v18.removeFriend(v16.userId, v16.displayName);
    end, l_dependencyArray_0(v16.userId, v18.removeFriend, if l_FFlagEnableAppChatFocusableFixes_0 then v16.onRemoved else nil));
    return v5.createElement(l_Interactable_0, {
        Size = UDim2.new(0, v12.FRIEND_MENU_CARD_SIZE, 0, v12.FRIEND_MENU_CARD_SIZE), 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.layoutOrder, 
        [v5.Event.Activated] = if v16.unremovable then nil else v23, 
        ref = v17
    }, {
        AvatarContainer = v5.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.fromOffset(60, 60), 
            BackgroundTransparency = 1
        }, {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = v15
            }), 
            Avatar = v5.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(60, 60), 
                BackgroundColor3 = l_Theme_0.UIDefault.Color, 
                Image = v22, 
                ZIndex = 1
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = v15
                })
            }), 
            CloseButton = if v16.unremovable then nil else v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.fromScale(1, 0), 
                Size = UDim2.fromOffset(16, 16), 
                BackgroundTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                Image = l_Images_0["icons/navigation/close_small"], 
                ImageColor3 = l_Theme_0.SystemPrimaryContent.Color, 
                ZIndex = 2
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = v15
                })
            })
        }), 
        DisplayName = v5.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.fromScale(0.5, 1), 
            Size = UDim2.fromOffset(v12.FRIEND_MENU_CARD_SIZE, 0), 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Footer.Font, 
            Text = v16.displayName, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end));