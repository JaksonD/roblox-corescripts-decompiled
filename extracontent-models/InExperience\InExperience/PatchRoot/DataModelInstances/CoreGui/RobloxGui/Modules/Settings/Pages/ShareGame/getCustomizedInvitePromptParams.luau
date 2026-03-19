local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
return function(v2, v3) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    local v4 = if v2 and v2.InviteUser ~= 0 then v2.InviteUser else nil;
    local v5, v6 = v3(if v4 then v1.Triggers.DeveloperSingle else v1.Triggers.DeveloperMultiple, v4);
    if not v5 then
        return nil;
    else
        local v7 = {};
        if v6 and v2 then
            if v2.InviteMessageId ~= "" then
                v7.inviteMessageId = v2.InviteMessageId;
            end;
            if v2.InviteUser ~= 0 then
                v7.inviteUserId = v2.InviteUser;
            end;
            if v2.PromptMessage ~= "" then
                v7.promptMessage = v2.PromptMessage;
            end;
            if v2.LaunchData ~= "" then
                v7.launchData = v2.LaunchData;
            end;
        end;
        return v7;
    end;
end;