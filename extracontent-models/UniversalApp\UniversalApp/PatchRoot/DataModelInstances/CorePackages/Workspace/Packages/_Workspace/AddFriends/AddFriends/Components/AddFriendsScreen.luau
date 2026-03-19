local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v7 = require(script.Parent.AddFriendsContainer);
local v8 = require(script.Parent.AddFriendsLayerExposure);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
AddFriendsScreen = function(v10) --[[ Line: 22 ]] --[[ Name: AddFriendsScreen ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDesignTokens_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), v1 (copy), v8 (copy), v7 (copy), v2 (copy), l_FullscreenPageWithSafeArea_0 (copy)
    local l_navigateToLuaAppPages_0 = v10.navigateToLuaAppPages;
    local v12 = l_useNavigation_0();
    local v13 = l_useDesignTokens_0();
    local v14 = l_FFlagCreateConnectionsHub_0 and v12.state.routeName == l_AppPage_0.CoHubAddConnections;
    return v1.createElement(v8, {
        renderChild = function(v15) --[[ Line: 31 ]] --[[ Name: renderChild ]]
            -- upvalues: v14 (copy), v1 (ref), v7 (ref), v2 (ref), l_navigateToLuaAppPages_0 (copy), l_FullscreenPageWithSafeArea_0 (ref), v13 (copy)
            if v14 then
                return v1.createElement(v7, v2.join(v15 or {}, {
                    navigateToLuaAppPages = l_navigateToLuaAppPages_0
                }));
            else
                return v1.createElement(l_FullscreenPageWithSafeArea_0, {
                    includeStatusBar = true, 
                    BackgroundColor3 = v13.LuaApps.App.Page.BackgroundColor, 
                    BackgroundTransparency = v13.LuaApps.App.Page.BackgroundTransparency
                }, {
                    AddFriendsScreen = v1.createElement(v7, v2.join(v15 or {}, {
                        navigateToLuaAppPages = l_navigateToLuaAppPages_0
                    }))
                });
            end;
        end
    });
end;
return AddFriendsScreen;