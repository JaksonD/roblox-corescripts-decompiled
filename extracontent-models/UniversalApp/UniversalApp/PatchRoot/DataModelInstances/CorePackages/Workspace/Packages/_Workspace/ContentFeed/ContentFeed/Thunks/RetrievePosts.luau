local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getDeepValue_0 = require(l_Parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_GetExperiencesDetails_0 = require(l_Parent_0.App.Networking).NetworkingGames.GetExperiencesDetails;
local v4 = require(l_Parent_0.Utils.getUniverseIds);
local v5 = require(l_Parent_0.App.Networking);
local _ = require(l_Parent_0.Types);
return function(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), l_getDeepValue_0 (copy), v4 (copy), l_GetExperiencesDetails_0 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v5 (ref), v8 (copy), v9 (copy), v7 (copy), l_getDeepValue_0 (ref), v4 (ref), l_GetExperiencesDetails_0 (ref)
        v10:dispatch(v5.ContentSharingNetworking.GetPostsByCursor.API({
            cursor = v8, 
            sortOrder = v9, 
            userId = v7
        })):andThen(function() --[[ Line: 20 ]]
            -- upvalues: l_getDeepValue_0 (ref), v10 (copy), v7 (ref), v4 (ref), l_GetExperiencesDetails_0 (ref)
            local v11 = l_getDeepValue_0(v10:getState(), "ContentSharing.byUserId." .. v7 .. ".posts") or {};
            local v12 = v4(v11);
            v10:dispatch(l_GetExperiencesDetails_0.API(v12));
        end):catch(function() --[[ Line: 28 ]]

        end);
    end;
end;