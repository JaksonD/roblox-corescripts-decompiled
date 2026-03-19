local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Parent_0.Foundation);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_IXPService_0 = game:GetService("IXPService");
local v12 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v13 = l_Logger_0:new(script.Name);
local v14 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local l_FFlagAppChatEnableGroupAvatarPresence_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupAvatarPresence;
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v18 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local l_FFlagAppChatUserTileCustomTitleTruncation_0 = require(l_Parent_0.SharedFlags).FFlagAppChatUserTileCustomTitleTruncation;
local l_PresenceType_0 = v12.Enums.PresenceType;
local l_UserPresence_0 = v6.Enums.UserPresence;
return function(v22) --[[ Line: 42 ]] --[[ Name: ConversationFacePile ]]
    -- upvalues: v13 (copy), l_useLocalUserId_0 (copy), v3 (copy), l_useSelector_0 (copy), v14 (copy), l_UserPresence_0 (copy), l_FFlagAppChatEnableGroupAvatarPresence_0 (copy), l_PresenceType_0 (copy), v15 (copy), v17 (copy), l_IXPService_0 (copy), v18 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_FFlagAppChatUserTileCustomTitleTruncation_0 (copy)
    if not v22.conversationId or v22.conversationId == "" then
        v13:warning("conversationId cannot be nil nor an empty string");
        return nil;
    else
        local v23 = l_useLocalUserId_0();
        local v25 = v3.useCallback(function(v24) --[[ Line: 50 ]]
            -- upvalues: v22 (copy)
            if v24 and v24.ChatAppReducer and v24.ChatAppReducer.Conversations then
                return v24.ChatAppReducer.Conversations[v22.conversationId];
            else
                return nil;
            end;
        end, {
            v22.conversationId
        });
        local v26 = l_useSelector_0(v25);
        local v28 = l_useSelector_0(function(v27) --[[ Line: 58 ]]
            if v27 and v27.ChatAppReducer and v27.ChatAppReducer.Presence then
                return v27.ChatAppReducer.Presence.byUserId;
            else
                return nil;
            end;
        end);
        local v29 = if v26 and v26.participants then v26.participants else {};
        local v30 = {};
        local v31 = {};
        if #v29 == 1 then
            table.insert(v31, v23);
        else
            local v32 = 1;
            while #v30 < 2 and v32 <= #v29 do
                local v33 = v29[v32];
                if v33 ~= v23 then
                    table.insert(v31, v33);
                end;
                v32 = v32 + 1;
            end;
        end;
        local v34 = v31[1] or v23;
        local v35 = v14(v34);
        local l_None_0 = l_UserPresence_0.None;
        if #v31 >= 2 and l_FFlagAppChatEnableGroupAvatarPresence_0 then
            local v37 = false;
            local v38 = false;
            for _, v40 in ipairs(v31) do
                if v28 and v28[v40] then
                    local l_userPresenceType_0 = v28[v40].userPresenceType;
                    if l_userPresenceType_0 == l_PresenceType_0.InGame or l_userPresenceType_0 == l_PresenceType_0.InStudio then
                        v37 = true;
                    elseif l_userPresenceType_0 == l_PresenceType_0.Online then
                        v38 = true;
                    end;
                end;
            end;
            if v37 then
                l_None_0 = l_UserPresence_0.InExperience;
            elseif v38 then
                l_None_0 = l_UserPresence_0.Active;
            end;
        elseif v15 then
            l_None_0 = v35.presence;
        end;
        v3.useEffect(function() --[[ Line: 112 ]]
            -- upvalues: v17 (ref), l_IXPService_0 (ref), v18 (ref)
            if v17 then
                l_IXPService_0:LogFlagLinkedUserLayerExposure(v18);
            end;
        end, {});
        local v42 = nil;
        if l_FFlagEnableBlackbirdCheckDev_0 and #v29 == 2 then
            for _, v44 in v29 do
                local v45 = if type(v44) == "table" then tostring(v44.id) else tostring(v44);
                if v45 ~= tostring(v23) then
                    v42 = v45;
                    break;
                end;
            end;
        end;
        local v46 = l_useIsRobloxSubscriber_0(v42);
        return v3.createElement(l_UserTile_0, {
            userId = v34, 
            facePileSecondUserId = v31[2] or nil, 
            layoutMode = l_LayoutMode_0.wide, 
            title = v22.titleText, 
            subtitle = v22.subtitleText, 
            titleStyle = v22.titleStyle, 
            subtitleStyle = v22.subtitleStyle, 
            userPresenceType = l_None_0, 
            onActivated = v22.onActivated, 
            selectable = v22.selectable, 
            customTextTruncation = if l_FFlagAppChatUserTileCustomTitleTruncation_0 then Enum.TextTruncate.SplitWord else nil, 
            trustedConnectionIndicatorEnabled = v22.trustedConnectionIndicatorEnabled, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v46 else nil
        });
    end;
end;