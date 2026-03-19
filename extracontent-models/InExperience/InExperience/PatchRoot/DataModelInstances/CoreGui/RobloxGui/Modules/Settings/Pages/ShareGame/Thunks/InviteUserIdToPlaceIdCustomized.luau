local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame;
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_ShareGame_0.Actions.ReceivedUserInviteStatus);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
local l_PostSendExperienceInvite_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).PostSendExperienceInvite;
return function(v7, v8, v9, v10, v11, v12, v13) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_InviteStatus_0 (copy), v3 (copy), l_PostSendExperienceInvite_0 (copy), l_GameInviteEvents_0 (copy)
    return function(v14) --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v4 (ref), v8 (copy), l_InviteStatus_0 (ref), v3 (ref), l_PostSendExperienceInvite_0 (ref), v7 (copy), v11 (copy), v12 (copy), v13 (copy), v10 (copy), l_GameInviteEvents_0 (ref)
        if v9 == "0" then
            warn("Game Invite failed to send. Cannot send invite to unpublished Place.");
            v14:dispatch(v4(v8, l_InviteStatus_0.Failed));
            return v3.reject();
        else
            local v15 = v14:getState();
            return v3.new(function(v16, v17) --[[ Line: 36 ]]
                -- upvalues: v15 (copy), v8 (ref), l_InviteStatus_0 (ref)
                if v15.Invites[v8] == l_InviteStatus_0.Pending then
                    v17();
                    return;
                else
                    v16();
                    return;
                end;
            end):andThen(function() --[[ Line: 44 ]]
                -- upvalues: v14 (copy), v4 (ref), v8 (ref), l_InviteStatus_0 (ref), l_PostSendExperienceInvite_0 (ref), v7 (ref), v9 (ref), v11 (ref), v12 (ref), v13 (ref)
                v14:dispatch(v4(v8, l_InviteStatus_0.Pending));
                return l_PostSendExperienceInvite_0(v7, v8, v9, v11, v12, v13);
            end):andThen(function(v18) --[[ Line: 48 ]]
                -- upvalues: v14 (copy), v4 (ref), v8 (ref), l_InviteStatus_0 (ref)
                v14:dispatch(v4(v8, l_InviteStatus_0.Success));
                return v18;
            end, function() --[[ Line: 51 ]]
                -- upvalues: v10 (ref), v11 (ref), l_GameInviteEvents_0 (ref), v14 (copy), v4 (ref), v8 (ref), l_InviteStatus_0 (ref)
                v10:sendEvent(v11, l_GameInviteEvents_0.ErrorShown);
                v14:dispatch(v4(v8, l_InviteStatus_0.Failed));
            end);
        end;
    end;
end;