local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v5 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums);
local l_UserSearchTile_0 = require(script.Parent.Parent.api).UserSearchTile;
local l_ImpressionsTaggerWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTaggerWrapper;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
return function(v10) --[[ Line: 77 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v5 (copy), v1 (copy), l_ImpressionsTaggerWrapper_0 (copy), l_UserSearchTile_0 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy)
    local v11 = l_useDispatch_0();
    local function v13(v12) --[[ Line: 80 ]]
        -- upvalues: v11 (copy), v4 (ref), v5 (ref), v10 (copy)
        v11(v4(v12.userId, {
            profilePeekViewProps = {
                resetPeekView = false, 
                source = v5.Sources.PlayerSearch, 
                contextualInfoType = v12.contextualInfoType, 
                contextualInfoDisplay = v12.contextualInfoDisplay, 
                analyticsProps = {
                    userSearchSessionId = v10.Analytics.getInfoForAllEvents().userSearchSessionId
                }
            }
        }));
    end;
    return v1.createElement(l_ImpressionsTaggerWrapper_0, {
        impressionsIndex = v10.index, 
        impressionsTag = v10.impressionsTag, 
        renderComponent = function() --[[ Line: 98 ]] --[[ Name: renderComponent ]]
            -- upvalues: v1 (ref), l_UserSearchTile_0 (ref), v10 (copy), v13 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (ref)
            return v1.createElement(l_UserSearchTile_0, {
                index = v10.index, 
                user = v10.user, 
                size = v10.size, 
                searchParameters = v10.searchParameters, 
                hasEmphasis = v10.hasEmphasis, 
                profileInsight = v10.profileInsight, 
                luaAppNavigation = {
                    navigateToUserInfo = v13
                }, 
                fireAnalyticsEvent = v10.Analytics.fireAnalyticsEvent, 
                shouldUseCompactTiles = v10.shouldUseCompactTiles, 
                enablePresenceIndicator = v10.enablePresenceIndicator, 
                subpage = v10.subpage, 
                rowInSort = v10.rowInSort, 
                positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v10.positionInRow else nil, 
                feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v10.feedRowNumber else nil
            });
        end
    });
end;