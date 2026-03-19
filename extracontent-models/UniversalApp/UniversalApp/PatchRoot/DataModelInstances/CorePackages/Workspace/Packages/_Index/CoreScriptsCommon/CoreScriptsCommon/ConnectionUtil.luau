local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.connections = {};
    return v1;
end;
v0.connect = function(v2, v3, v4, v5) --[[ Line: 27 ]] --[[ Name: connect ]]
    if v2.connections[v3] then
        v2.connections[v3]();
    end;
    local v6 = v4:Connect(v5);
    v2.connections[v3] = function() --[[ Line: 33 ]]
        -- upvalues: v6 (copy)
        v6:Disconnect();
    end;
end;
v0.connectManual = function(v7, v8, v9) --[[ Line: 38 ]] --[[ Name: connectManual ]]
    if v7.connections[v8] then
        v7.connections[v8]();
    end;
    v7.connections[v8] = v9;
end;
v0.disconnect = function(v10, v11) --[[ Line: 45 ]] --[[ Name: disconnect ]]
    if v10.connections[v11] then
        v10.connections[v11]();
        v10.connections[v11] = nil;
    end;
end;
v0.disconnectAll = function(v12) --[[ Line: 52 ]] --[[ Name: disconnectAll ]]
    for _, v14 in pairs(v12.connections) do
        v14();
    end;
    v12.connections = {};
end;
return v0;