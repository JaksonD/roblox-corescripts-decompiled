local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Common_0 = l_CoreGui_0.RobloxGui.Modules.Common;
local l_formatAlias_0 = v4.SocialLibraries.Utils.formatAlias;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Constants;
local v8 = require(l_Common_0.Functional);
local l_Conversation_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Models.Conversation;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v11, v12, v13) --[[ Line: 21 ]]
    -- upvalues: l_Players_0 (copy), v8 (copy), l_Conversation_0 (copy), l_formatAlias_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Constants_0 (copy)
    local v14 = tostring(l_Players_0.LocalPlayer.UserId);
    local v16 = v8.Filter(v12.participants, function(v15) --[[ Line: 23 ]]
        -- upvalues: v14 (copy)
        return v15 ~= v14;
    end);
    local v17 = v12.conversationType == l_Conversation_0.Type.ONE_TO_ONE_CONVERSATION;
    local v18 = nil;
    local v19 = nil;
    local v20 = "";
    if v17 then
        local v21 = v11[v16[1]];
        if v21 then
            v19 = v21.presence;
            v18 = v21.lastLocation;
            local v22 = v13.byUserId[v21.id] or "";
            if v22 ~= "" then
                v20 = l_formatAlias_0(v22);
            end;
        end;
    end;
    local v23 = {};
    for _, v25 in pairs(v12.participants) do
        if v17 and v25 ~= v14 or not v17 then
            table.insert(v23, (l_getStandardSizeAvatarHeadShotRbxthumb_0(v25)));
        end;
    end;
    local v26 = nil;
    v26 = if v17 then l_Constants_0.PresenceIndicatorImagesBySize[l_Constants_0:GetPresenceIndicatorSizeKey(14)][v19] or "" else "";
    local v27 = if v12.lastUpdated then v12.lastUpdated:GetUnixTimestamp() else 0;
    return {
        oneToOne = v17, 
        lastUpdated = v27, 
        conversationId = v12.id, 
        lastLocation = v18, 
        presence = v19, 
        presenceImage = v26, 
        title = v12.title, 
        thumbnails = v23, 
        participants = v12.participants, 
        alias = v20
    };
end;