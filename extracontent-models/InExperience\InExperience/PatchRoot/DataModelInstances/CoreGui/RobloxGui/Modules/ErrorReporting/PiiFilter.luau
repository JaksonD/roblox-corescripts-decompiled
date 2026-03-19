local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v3.strictInterface({
    eraseTimeout = v3.number, 
    testHarness = v3.optional(v3.strictInterface({
        players = v3.union(v3.instanceOf("Players"), v3.interface({
            GetPlayers = v3.callback, 
            GetPlayerByUserId = v3.callback, 
            PlayerAdded = v3.RBXScriptSignal, 
            PlayerRemoving = v3.RBXScriptSignal
        })), 
        wait = v3.callback
    }))
});
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), l_Players_0 (copy), v5 (copy)
    assert(v4(v6));
    local v7 = if v6.testHarness == nil then l_Players_0 else v6.testHarness.players;
    local v8 = if v6.testHarness == nil then wait else v6.testHarness.wait;
    return (setmetatable({
        _eraseTimeout = v6.eraseTimeout, 
        _trackedPii = {}, 
        _playerCounter = 1, 
        _disambiguationIdentifiers = {}, 
        _waitFn = v8, 
        _players = v7
    }, v5));
end;
v5._addPlayerToEraseMap = function(v9, v10) --[[ Line: 75 ]] --[[ Name: _addPlayerToEraseMap ]]
    local v11 = v9._disambiguationIdentifiers[v10.UserId];
    if v11 == nil then
        v11 = v9._playerCounter;
        v9._disambiguationIdentifiers[v10.UserId] = v9._playerCounter;
        v9._playerCounter = v9._playerCounter + 1;
    end;
    v9._trackedPii[tostring(v10.UserId)] = string.format("UserId(%d)", v11);
    v9._trackedPii[tostring(v10.Name)] = string.format("UserName(%d)", v11);
    v9._trackedPii[tostring(v10.DisplayName)] = string.format("DisplayName(%d)", v11);
end;
v5._removePlayerFromEraseMap = function(v12, v13) --[[ Line: 88 ]] --[[ Name: _removePlayerFromEraseMap ]]
    v12._trackedPii[tostring(v13.UserId)] = nil;
    v12._trackedPii[tostring(v13.Name)] = nil;
    v12._trackedPii[tostring(v13.DisplayName)] = nil;
end;
v5.startTracking = function(v14) --[[ Line: 94 ]] --[[ Name: startTracking ]]
    for _, v16 in ipairs(v14._players:GetPlayers()) do
        v14:_addPlayerToEraseMap(v16);
    end;
    v14._playerAddedConnection = v14._players.PlayerAdded:Connect(function(v17) --[[ Line: 99 ]]
        -- upvalues: v14 (copy)
        v14:_addPlayerToEraseMap(v17);
    end);
    v14._playerRemovingConnection = v14._players.PlayerRemoving:Connect(function(v18) --[[ Line: 103 ]]
        -- upvalues: v14 (copy)
        v14._waitFn(v14._eraseTimeout);
        if v14._players:GetPlayerByUserId(v18.UserId) == nil then
            v14:_removePlayerFromEraseMap(v18);
        end;
    end);
end;
v5.stopTracking = function(v19) --[[ Line: 116 ]] --[[ Name: stopTracking ]]
    v19._playerAddedConnection:Disconnect();
    v19._playerRemovingConnection:Disconnect();
end;
v5.cleanPii = function(v20, v21) --[[ Line: 121 ]] --[[ Name: cleanPii ]]
    for v22, v23 in pairs(v20._trackedPii) do
        v21 = string.gsub(v21, v22, v23);
    end;
    return v21;
end;
return v5;