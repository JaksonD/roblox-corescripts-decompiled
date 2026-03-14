local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Parent_0.Foundation);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_IXPService_0 = game:GetService("IXPService");
local v10 = l_Logger_0:new(script.Name);
local v11 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v14 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local l_FFlagAppChatUserTileCustomTitleTruncation_0 = require(l_Parent_0.SharedFlags).FFlagAppChatUserTileCustomTitleTruncation;
return function(v16) --[[ Line: 32 ]] --[[ Name: ConversationFacePile ]]
    -- upvalues: v10 (copy), l_useLocalUserId_0 (copy), v3 (copy), l_useSelector_0 (copy), v11 (copy), v13 (copy), l_IXPService_0 (copy), v14 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v12 (copy), v6 (copy), l_FFlagAppChatUserTileCustomTitleTruncation_0 (copy)
    if not v16.conversationId or v16.conversationId == "" then
        v10:warning("conversationId cannot be nil nor an empty string");
        return nil;
    else
        local v17 = l_useLocalUserId_0();
        local v19 = v3.useCallback(function(v18) --[[ Line: 40 ]]
            -- upvalues: v16 (copy)
            if v18 and v18.ChatAppReducer and v18.ChatAppReducer.Conversations then
                return v18.ChatAppReducer.Conversations[v16.conversationId];
            else
                return nil;
            end;
        end, {
            v16.conversationId
        });
        local v20 = l_useSelector_0(v19);
        local v21 = if v20 and v20.participants then v20.participants else {};
        local v22 = {};
        local v23 = {};
        if #v21 == 1 then
            table.insert(v23, v17);
        else
            local v24 = 1;
            while #v22 < 2 and v24 <= #v21 do
                local v25 = v21[v24];
                if v25 ~= v17 then
                    table.insert(v23, v25);
                end;
                v24 = v24 + 1;
            end;
        end;
        local v26 = v23[1] or v17;
        local v27 = v11(v26);
        v3.useEffect(function() --[[ Line: 69 ]]
            -- upvalues: v13 (ref), l_IXPService_0 (ref), v14 (ref)
            if v13 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v14);
            end;
        end, {});
        return v3.createElement(l_UserTile_0, {
            userId = v26, 
            facePileSecondUserId = v23[2] or nil, 
            layoutMode = l_LayoutMode_0.wide, 
            title = v16.titleText, 
            subtitle = v16.subtitleText, 
            titleStyle = v16.titleStyle, 
            subtitleStyle = v16.subtitleStyle, 
            userPresenceType = if v12 then v27.presence else v6.Enums.UserPresence.None, 
            onActivated = v16.onActivated, 
            selectable = v16.selectable, 
            customTextTruncation = if l_FFlagAppChatUserTileCustomTitleTruncation_0 then Enum.TextTruncate.SplitWord else nil, 
            trustedConnectionIndicatorEnabled = v16.trustedConnectionIndicatorEnabled
        });
    end;
end;