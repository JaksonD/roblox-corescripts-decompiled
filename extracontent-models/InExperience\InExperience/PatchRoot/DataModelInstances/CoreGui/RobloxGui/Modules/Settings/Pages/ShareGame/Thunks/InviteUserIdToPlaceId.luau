local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame;
local v2 = require(l_ShareGame_0.Thunks.ApiSendGameInvite);
local l_ApiFetchPlaceInfos_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_ShareGame_0.Actions.ReceivedUserInviteStatus);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
return function(v7, v8, v9) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), l_InviteStatus_0 (copy), v4 (copy), l_ApiFetchPlaceInfos_0 (copy), v2 (copy)
    return function(v10) --[[ Line: 19 ]]
        -- upvalues: v9 (copy), v5 (ref), v8 (copy), l_InviteStatus_0 (ref), v4 (ref), l_ApiFetchPlaceInfos_0 (ref), v7 (copy), v2 (ref)
        if v9 == "0" then
            warn("Game Invite failed to send. Cannot send invite to unpublished Place.");
            v10:dispatch(v5(v8, l_InviteStatus_0.Failed));
            return v4.reject();
        else
            local v11 = v10:getState();
            return v4.new(function(v12, v13) --[[ Line: 29 ]]
                -- upvalues: v11 (copy), v8 (ref), l_InviteStatus_0 (ref)
                if v11.Invites[tostring(v8)] == l_InviteStatus_0.Pending then
                    v13();
                    return;
                else
                    v12();
                    return;
                end;
            end):andThen(function() --[[ Line: 36 ]]
                -- upvalues: v11 (copy), v9 (ref), v4 (ref), v10 (copy), v5 (ref), v8 (ref), l_InviteStatus_0 (ref), l_ApiFetchPlaceInfos_0 (ref), v7 (ref), v2 (ref)
                local v14 = v11.PlaceInfos[v9];
                return v4.new(function(v15, v16) --[[ Line: 39 ]]
                    -- upvalues: v10 (ref), v5 (ref), v8 (ref), l_InviteStatus_0 (ref), v14 (copy), l_ApiFetchPlaceInfos_0 (ref), v7 (ref), v9 (ref)
                    v10:dispatch(v5(v8, l_InviteStatus_0.Pending));
                    if v14 then
                        v15(v14);
                        return;
                    else
                        v10:dispatch(l_ApiFetchPlaceInfos_0(v7, {
                            v9
                        })):andThen(function(v17) --[[ Line: 46 ]]
                            -- upvalues: v15 (copy), v16 (copy)
                            if v17[1] ~= nil then
                                v15(v17[1]);
                                return;
                            else
                                v16();
                                return;
                            end;
                        end, function() --[[ Line: 52 ]]
                            -- upvalues: v16 (copy)
                            v16();
                        end);
                        return;
                    end;
                end):andThen(function(v18) --[[ Line: 56 ]]
                    -- upvalues: v10 (ref), v2 (ref), v7 (ref), v8 (ref)
                    return v10:dispatch(v2(v7, v8, v18));
                end):andThen(function(v19) --[[ Line: 58 ]]
                    -- upvalues: v10 (ref), v5 (ref), v8 (ref)
                    v10:dispatch(v5(v8, v19.resultType));
                    return v19;
                end, function() --[[ Line: 61 ]]
                    -- upvalues: v10 (ref), v5 (ref), v8 (ref), l_InviteStatus_0 (ref)
                    v10:dispatch(v5(v8, l_InviteStatus_0.Failed));
                end);
            end);
        end;
    end;
end;