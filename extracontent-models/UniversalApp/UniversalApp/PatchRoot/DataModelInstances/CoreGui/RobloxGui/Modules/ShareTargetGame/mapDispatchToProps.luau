local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Thunks.SendGameLinkMessage);
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local l_ApiFetchPlaceInfos_0 = require(l_CorePackages_0.Workspace.Packages.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos;
local l_SetAppLoaded_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.SetAppLoaded;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v7 = require(l_script_FirstAncestor_0.ChatConversations.Thunks.requestOlderConversations);
local l_DEPRECATED_getLocalUserConversations_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations.Thunks.DEPRECATED_getLocalUserConversations;
return function(v9) --[[ Line: 19 ]]
    -- upvalues: l_DEPRECATED_getLocalUserConversations_0 (copy), v1 (copy), l_ApiFetchGameIcons_0 (copy), l_ApiFetchGameDetails_0 (copy), l_SetAppLoaded_0 (copy), l_ApiFetchPlaceInfos_0 (copy), v7 (copy)
    local function v11(v10) --[[ Line: 20 ]]
        -- upvalues: v9 (copy), l_DEPRECATED_getLocalUserConversations_0 (ref)
        return v9(l_DEPRECATED_getLocalUserConversations_0(v10, 30));
    end;
    return {
        sendGameLinkToConversation = function(v12, v13, v14, v15, v16) --[[ Line: 25 ]] --[[ Name: sendGameLinkToConversation ]]
            -- upvalues: v9 (copy), v1 (ref)
            return v9(v1(v12, v13, v14 or false, v15 or 0, v16 or 0));
        end, 
        fetchGameData = function(v17, v18) --[[ Line: 37 ]] --[[ Name: fetchGameData ]]
            -- upvalues: v9 (copy), l_ApiFetchGameIcons_0 (ref), l_ApiFetchGameDetails_0 (ref)
            v9(l_ApiFetchGameIcons_0(v17, {
                v18
            }));
            v9(l_ApiFetchGameDetails_0.Fetch(v17, {
                v18
            }));
        end, 
        fetchConversations = v11, 
        setAppLoaded = function() --[[ Line: 44 ]] --[[ Name: setAppLoaded ]]
            -- upvalues: v9 (copy), l_SetAppLoaded_0 (ref)
            return v9(l_SetAppLoaded_0(true));
        end, 
        fetchPlaceInfos = function(v19, v20) --[[ Line: 48 ]] --[[ Name: fetchPlaceInfos ]]
            -- upvalues: v9 (copy), l_ApiFetchPlaceInfos_0 (ref)
            return v9(l_ApiFetchPlaceInfos_0(v19, {
                v20
            }));
        end, 
        conversationListScrollTouchedBottom = function() --[[ Line: 52 ]] --[[ Name: conversationListScrollTouchedBottom ]]
            -- upvalues: v9 (copy), v7 (ref), v11 (copy)
            return v9(v7(v11, 30));
        end
    };
end;