local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v4 = require(l_ShareGame_0.Thunks.ApiFetchUsersFriends);
local v5 = require(l_ShareGame_0.Constants);
local v6 = require(l_RobloxGui_0.Modules.Settings.Enum.UserSorts);
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
return function(v8, v9) --[[ Line: 15 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), v4 (copy), v5 (copy), l_GetFFlagInviteListRerank_0 (copy), v6 (copy)
    return function(v10) --[[ Line: 16 ]]
        -- upvalues: v9 (copy), l_RetrievalStatus_0 (ref), v4 (ref), v8 (copy), v5 (ref), l_GetFFlagInviteListRerank_0 (ref), v6 (ref)
        if v10:getState().Friends.retrievalStatus[v9] ~= l_RetrievalStatus_0.Fetching then
            v10:dispatch(v4(v8, v9, v5.ThumbnailRequest.InviteToGame, if l_GetFFlagInviteListRerank_0() then v6.StatusFrequents else nil));
        end;
    end;
end;