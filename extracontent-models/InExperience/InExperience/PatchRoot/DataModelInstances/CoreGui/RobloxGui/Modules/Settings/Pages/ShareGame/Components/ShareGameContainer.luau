local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_Modules_0.Common.httpRequest);
local v9 = require(l_ShareGame_0.Components.ShareGamePageFrame);
local v10 = require(l_ShareGame_0.Constants);
local v11 = require(l_ShareGame_0.Thunks.FetchUserFriends);
local v12 = require(l_ShareGame_0.Actions.ClosePage);
local v13 = v6.PureComponent:extend("ShareGameContainer");
v13.defaultProps = {
    skeletonComponent = v9
};
v13.init = function(v14) --[[ Line: 30 ]] --[[ Name: init ]]
    v14.props.reFetch();
end;
v13.render = function(v15) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy)
    return v6.createElement(v15.props.skeletonComponent, v15.props);
end;
return (v7.UNSTABLE_connect2(function(v16, _) --[[ Line: 38 ]]
    return {
        deviceLayout = v16.DeviceInfo.DeviceLayout, 
        searchAreaActive = v16.ConversationsSearch.SearchAreaActive, 
        searchText = v16.ConversationsSearch.SearchText
    };
end, function(v18) --[[ Line: 44 ]]
    -- upvalues: v12 (copy), v10 (copy), l_Players_0 (copy), v8 (copy), l_HttpRbxApiService_0 (copy), v11 (copy)
    return {
        closePage = function() --[[ Line: 46 ]] --[[ Name: closePage ]]
            -- upvalues: v18 (copy), v12 (ref), v10 (ref)
            v18(v12(v10.PageRoute.SHARE_GAME));
        end, 
        reFetch = function() --[[ Line: 50 ]] --[[ Name: reFetch ]]
            -- upvalues: l_Players_0 (ref), v8 (ref), l_HttpRbxApiService_0 (ref), v18 (copy), v11 (ref)
            local v19 = tostring(l_Players_0.LocalPlayer.UserId);
            local v20 = v8(l_HttpRbxApiService_0);
            v18(v11(v20, v19));
        end
    };
end)(v13));