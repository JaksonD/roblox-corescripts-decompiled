local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v1.httpRequest;
local v3 = game:DefineFastInt("EventNetworkHttpRetryCount", 3);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Workspace.Packages.FriendsRodux);
local v6 = require(l_CorePackages_0.Workspace.Packages.FriendsNetworking);
local v7 = require(l_CorePackages_0.Workspace.Packages.ShareLinksNetworking);
local v11 = l_httpRequest_0.config({
    requestFunction = function(v8, v9, v10) --[[ Line: 11 ]] --[[ Name: requestFunction ]]
        -- upvalues: l_httpRequest_0 (copy)
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v8, v9, v10);
    end, 
    maxRetryCount = v3
});
local v12 = v1.RoduxNetworking.config({
    keyPath = "EventReceievers.NetworkStatus", 
    networkImpl = v11
});
local v13 = v6.config({
    roduxNetworking = v12
});
local v14 = v1.NetworkingPresence.config({
    roduxNetworking = v12
});
local v15 = v7.config({
    roduxNetworking = v12, 
    useMockedResponse = false
});
return {
    networkImpl = v11, 
    RoduxNetworking = v12, 
    installReducer = function() --[[ Line: 37 ]]
        -- upvalues: v4 (copy), v12 (copy)
        return v4.combineReducers({
            NetworkStatus = v12.installReducer()
        });
    end, 
    FriendsNetworking = v13, 
    NetworkingPresence = v14, 
    RoduxFriends = v5.config({
        keyPath = "EventReceievers.Friends"
    }), 
    RoduxUsers = v1.RoduxUsers.config({
        keyPath = "EventReceievers.Users"
    }), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "EventReceievers.Presence"
    }), 
    RoduxKey = "EventReceievers", 
    ShareLinksNetworking = v15
};