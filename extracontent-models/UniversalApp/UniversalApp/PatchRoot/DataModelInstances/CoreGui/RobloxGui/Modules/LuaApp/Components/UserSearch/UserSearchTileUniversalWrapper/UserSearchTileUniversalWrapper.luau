local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v5 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_UserSearchTile_0 = require(script.Parent.Parent.api).UserSearchTile;
local l_ImpressionsTaggerWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTaggerWrapper;
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
return function(v9) --[[ Line: 73 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v5 (copy), v1 (copy), l_ImpressionsTaggerWrapper_0 (copy), l_UserSearchTile_0 (copy)
    local v10 = l_useDispatch_0();
    local function v12(v11) --[[ Line: 76 ]]
        -- upvalues: v10 (copy), v4 (ref), v5 (ref), v9 (copy)
        v10(v4(v11.userId, {
            profilePeekViewProps = {
                resetPeekView = false, 
                source = v5.Sources.PlayerSearch, 
                contextualInfoType = v11.contextualInfoType, 
                contextualInfoDisplay = v11.contextualInfoDisplay, 
                analyticsProps = {
                    userSearchSessionId = v9.Analytics.getInfoForAllEvents().userSearchSessionId
                }
            }
        }));
    end;
    return v1.createElement(l_ImpressionsTaggerWrapper_0, {
        impressionsIndex = v9.index, 
        impressionsTag = v9.impressionsTag, 
        renderComponent = function() --[[ Line: 94 ]] --[[ Name: renderComponent ]]
            -- upvalues: v1 (ref), l_UserSearchTile_0 (ref), v9 (copy), v12 (copy)
            return v1.createElement(l_UserSearchTile_0, {
                index = v9.index, 
                user = v9.user, 
                size = v9.size, 
                searchParameters = v9.searchParameters, 
                hasEmphasis = v9.hasEmphasis, 
                profileInsight = v9.profileInsight, 
                luaAppNavigation = {
                    navigateToUserInfo = v12
                }, 
                fireAnalyticsEvent = v9.Analytics.fireAnalyticsEvent, 
                shouldUseCompactTiles = v9.shouldUseCompactTiles, 
                enablePresenceIndicator = v9.enablePresenceIndicator, 
                subpage = v9.subpage, 
                rowInSort = v9.rowInSort
            });
        end
    });
end;