local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v6 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v7 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
return function(v8, v9, v10) --[[ Line: 13 ]]
    -- upvalues: l_Analytics_0 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), v5 (copy), v7 (copy), v6 (copy)
    local v11 = nil;
    if v10 then
        v11 = v10;
    else
        local v12 = l_Analytics_0.new(l_RbxAnalyticsService_0);
        local v13 = tostring(l_Players_0.LocalPlayer.UserId);
        v11 = v5.new(v12, v13);
    end;
    if v8.messageType == v7.PlainText then
        for _, v15 in pairs(v6(v8)) do
            if v15.messageType == v7.Link then
                v11:loadGameLinkCardInChat(v9, v15.placeId);
            end;
        end;
        return;
    else
        if v8.messageType == v7.Link then
            v11:loadGameLinkCardInChat(v9, v8.gameLink.universeId);
        end;
        return;
    end;
end;