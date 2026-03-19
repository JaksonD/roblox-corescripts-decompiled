local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventNames);
local v6 = require(script.Parent.BtnValues);
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local function v9(v8) --[[ Line: 17 ]] --[[ Name: concatToString ]]
    if v8 then
        return (table.concat(v8, ","));
    else
        return "";
    end;
end;
local function v11(v10) --[[ Line: 21 ]] --[[ Name: acceptAnyValue ]]
    return v10;
end;
return {
    [v5.PlayerTileImpressions] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerTileImpressions, 
        formatRulesForAdditionalInfo = {
            tilePos = v9, 
            playerId = v9, 
            playerName = v9, 
            rowInSort = v9
        }
    }, 
    [v5.NavigateToAddFriendsBtn] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v6.NavigateToAddFriends
        }
    }, 
    [v5.PlayerFriendRequest] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerFriendAdd, 
        formatRulesForAdditionalInfo = {
            playerId = v11, 
            tilePos = v11, 
            contextualInfoType = v11, 
            rowInSort = v11, 
            positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            interactionUuid = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            contentType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "User" or nil, 
            actionType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "RequestFriendship" or nil
        }
    }, 
    [v5.PlayerFriendAccept] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerFriendAccept, 
        formatRulesForAdditionalInfo = {
            playerId = v11, 
            tilePos = v11, 
            contextualInfoType = v11, 
            rowInSort = v11, 
            positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            interactionUuid = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            contentType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "User" or nil, 
            actionType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "AcceptFriendship" or nil
        }
    }, 
    [v5.PlayerTileClick] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PlayerTileClick, 
        formatRulesForAdditionalInfo = {
            playerId = v11, 
            tilePos = v11, 
            contextualInfoType = v11, 
            rowInSort = v11, 
            positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            interactionUuid = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v11 else nil
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            contentType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "User" or nil, 
            actionType = l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 and "OpenProfile" or nil
        }
    }, 
    [v5.UserSearchLoadingTime] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.LoadingTime, 
        formatRulesForAdditionalInfo = {
            status = v11, 
            loadingTime = v11, 
            loadingThreshold = v11, 
            nextPage = v11
        }, 
        additionalInfo = {
            fetch = "userSearch", 
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.UserSearchLoaded] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            status = v11, 
            nextPage = v11
        }, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.UserSearchBarOpen] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.Search, 
        formatRulesForAdditionalInfo = {
            kwd = v11, 
            currentPage = v11
        }, 
        additionalInfo = {
            act = "open", 
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.UserSearchBarCancel] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.Search, 
        formatRulesForAdditionalInfo = {
            kwd = v11, 
            currentPage = v11
        }, 
        additionalInfo = {
            act = "cancel", 
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v5.UserSearchBarSubmit] = {
        context = l_Contexts_0.PlayerSearch, 
        eventType = l_EventTypes_0.Search, 
        formatRulesForAdditionalInfo = {
            kwd = v11, 
            currentPage = v11
        }, 
        additionalInfo = {
            act = "search", 
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }
};