local l_Parent_0 = script:FindFirstAncestor("UserRelationshipModals").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_Parent_0.UserTile);
local l_UserTile_0 = v7.UserTile;
local l_LayoutMode_0 = v7.LayoutMode;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v11 = game:DefineFastFlag("PromptFriendRequestModalRevampFriendsRename", false);
local v12 = l_FFlagConnectionsToFriendsRename_0 and v11;
return function(v13) --[[ Line: 33 ]] --[[ Name: PromptFriendRequestModal ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), v1 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v2 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_ButtonVariant_0 (copy)
    local v14 = l_useLocalization_0({
        titleText = v12 and "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" or "InGame.FriendPlayerPrompt.Title.SendFriendRequest", 
        sendText = "InGame.FriendPlayerPrompt.Action.Send"
    });
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v13.onClose
    }, {
        DialogTitle = v1.createElement(l_Dialog_0.Title, {
            text = v14.titleText
        }), 
        Avatar = v1.createElement(v2.View, {
            tag = "row align-x-center size-full-3000", 
            LayoutOrder = 2
        }, {
            UserTile = v1.createElement(l_UserTile_0, {
                userId = v13.userId, 
                title = v13.displayName, 
                subtitle = "@" .. v13.username, 
                layoutMode = l_LayoutMode_0.compact
            })
        }), 
        Buffer = v1.createElement(v2.View, {
            tag = "size-full-500", 
            LayoutOrder = 3
        }), 
        DialogActions = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 4, 
            actions = {
                {
                    text = v14.sendText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v13.onSendClicked, 
                    inputDelay = v13.inputDelay == nil and 3 or v13.inputDelay
                }
            }
        })
    });
end;