local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_AvatarThumbnailRequests_0 = require(l_Parent_0.UserLib).Utils.AvatarThumbnailRequests;
local l_PreloadUsersThumbnail_0 = require(l_Parent_0.UserLib).Thunks.PreloadUsersThumbnail;
local l_FetchFriendsCarousel_0 = require(l_Parent_0.FriendsCarousel).FetchFriendsCarousel;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v7 = require(l_Modules_0.LuaApp.Thunks.FetchAdditionalFriendsInfo);
local v8 = require(l_Modules_0.LuaApp.Thunks.LegacyUpdateUsers);
local v9 = game:DefineFastFlag("RemoveFetchFriendsCarouselAtStartup", false);
local v10 = l_Logger_0:new(script.Name);
local function v16(v11, v12, v13) --[[ Line: 15 ]] --[[ Name: fetchUserDataForHomePage ]]
    -- upvalues: v9 (copy), l_FetchFriendsCarousel_0 (copy), v8 (copy), v7 (copy), v10 (copy), l_PreloadUsersThumbnail_0 (copy), l_AvatarThumbnailRequests_0 (copy)
    if not v9 then
        v13:dispatch(l_FetchFriendsCarousel_0()):andThen(function(v14) --[[ Line: 19 ]]
            -- upvalues: v13 (copy), v8 (ref), v7 (ref), v11 (copy)
            v13:dispatch(v8(v14));
            v13:dispatch(v7(v11, v14));
            return v14;
        end):catch(function(v15) --[[ Line: 24 ]]
            -- upvalues: v10 (ref)
            v10:error((("Error fetching friends sort: %*"):format(v15)));
        end);
    end;
    v13:dispatch(l_PreloadUsersThumbnail_0({
        v12
    }, l_AvatarThumbnailRequests_0.HOME_HEADER_USER));
    v13:dispatch(l_PreloadUsersThumbnail_0({
        v12
    }, l_AvatarThumbnailRequests_0.CUSTOMIZE_BUTTON));
end;
return function(v17, v18) --[[ Line: 33 ]]
    -- upvalues: v16 (copy)
    return function(v19) --[[ Line: 34 ]]
        -- upvalues: v16 (ref), v17 (copy), v18 (copy)
        return v16(v17, v18, v19);
    end;
end;