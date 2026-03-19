local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Networking.FriendsNetworking);
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_hydrateEmptyIdsHelper_0 = require(l_Parent_0.SocialCommon).Utils.hydrateEmptyIdsHelper;
return function(v6) --[[ Line: 14 ]]
    -- upvalues: l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy), l_hydrateEmptyIdsHelper_0 (copy), v2 (copy)
    return function(v7) --[[ Line: 15 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), l_hydrateEmptyIdsHelper_0 (ref), v6 (copy), v2 (ref)
        local v8 = v7:getState() or {};
        local v9 = l_getDeepValue_0(v8, string.format("%s.Friends.followings.followingStatuses", l_RODUX_KEY_0)) or {};
        return l_hydrateEmptyIdsHelper_0({
            ids = v6, 
            selector = function(v10) --[[ Line: 24 ]] --[[ Name: selector ]]
                -- upvalues: v9 (copy)
                return v9[v10];
            end, 
            hydrate = function(v11) --[[ Line: 27 ]] --[[ Name: hydrate ]]
                -- upvalues: v7 (copy), v2 (ref)
                return v7:dispatch(v2.GetFollowingExists.API({
                    targetUserIds = v11
                }));
            end
        });
    end;
end;