local l_CorePackages_0 = game:GetService("CorePackages");
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v3 = game:DefineFastFlag("GetJoinDataRemoteFunctionEnabled", false);
local l_RemoteFunction_0 = Instance.new("RemoteFunction");
l_RemoteFunction_0.Name = "GetServerType";
l_RemoteFunction_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteFunction_0.OnServerInvoke = function() --[[ Line: 12 ]] --[[ Name: getServerType ]]
    -- upvalues: l_Constants_0 (copy)
    if game.PrivateServerId ~= "" then
        if game.PrivateServerOwnerId ~= 0 then
            return l_Constants_0.VIP_SERVER;
        else
            return l_Constants_0.RESERVED_SERVER;
        end;
    else
        return l_Constants_0.STANDARD_SERVER;
    end;
end;
if v3 then
    local l_RemoteFunction_1 = Instance.new("RemoteFunction");
    l_RemoteFunction_1.Name = "GetJoinData";
    l_RemoteFunction_1.Parent = l_RobloxReplicatedStorage_0;
    l_RemoteFunction_1.OnServerInvoke = function(v6) --[[ Line: 32 ]] --[[ Name: getJoinData ]]
        return v6:GetJoinData();
    end;
end;