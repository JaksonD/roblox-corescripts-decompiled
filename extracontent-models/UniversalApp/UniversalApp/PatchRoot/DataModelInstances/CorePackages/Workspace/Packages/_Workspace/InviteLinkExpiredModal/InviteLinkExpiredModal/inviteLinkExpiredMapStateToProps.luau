local l_script_FirstAncestor_0 = script:FindFirstAncestor("InviteLinkExpiredModal");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingGames_0 = v1.NetworkingGames;
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v7, v8) --[[ Line: 10 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_NetworkingGames_0 (copy), l_NetworkStatus_0 (copy)
    local l_universeId_0 = v8.universeId;
    local v10 = l_getDeepValue_0(v7, string.format("InviteLinkExpiredModal.Games.byGameId.%s.name", l_universeId_0));
    local v11 = false;
    if #l_universeId_0 > 0 then
        v11 = l_NetworkingGames_0.GetExperiencesDetails.getStatus(v7, l_universeId_0) == l_NetworkStatus_0.Fetching;
    end;
    return {
        experienceName = v10, 
        isLoading = v11, 
        screenSize = v7.ScreenSize
    };
end;