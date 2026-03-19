local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    setmetatable(v4, {
        __index = v2
    });
    v4.callback = v3;
    v4.connected = true;
    v4.isMock = 231;
    return v4;
end;
v2.Fire = function(v5, v6) --[[ Line: 50 ]] --[[ Name: Fire ]]
    if v5.connected then
        v5.callback(v6);
    end;
end;
v2.Disconnect = function(v7) --[[ Line: 56 ]] --[[ Name: Disconnect ]]
    v7.connected = false;
end;
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v9 = {};
    setmetatable(v9, {
        __index = v8
    });
    v9.connections = {};
    return v9;
end;
v8.Connect = function(v10, v11) --[[ Line: 75 ]] --[[ Name: Connect ]]
    -- upvalues: v2 (copy)
    local v12 = v2.new(v11);
    table.insert(v10.connections, v12);
    return v12;
end;
v8.Fire = function(v13, v14) --[[ Line: 81 ]] --[[ Name: Fire ]]
    for _, v16 in v13.connections do
        v16:Fire(v14);
    end;
end;
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19, v20) --[[ Line: 92 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy)
    local v21 = {};
    setmetatable(v21, {
        __index = v17
    });
    v21.mockContentProviderProceedWithLoad = false;
    v21.contentResolved = false;
    v21.assetFetchStatuses = {};
    v21.signals = {};
    v21.preloadAsyncCalled = false;
    v21.isMock = true;
    v21.ultimatelySuccessfulContentIds = v18 or {};
    v21.ultimatelyTimedOutContentIds = v19 or {};
    v21.ultimatelyFailedContentIds = v20 or {};
    return v21;
end;
v17.mockReload = function(v22, v23, v24) --[[ Line: 114 ]] --[[ Name: mockReload ]]
    v22.mockContentProviderProceedWithLoad = false;
    v22:_staggeredProgress(nil, v23, v24 or Enum.AssetFetchStatus.Success);
end;
v17.proceedWithLoad = function(v25) --[[ Line: 120 ]] --[[ Name: proceedWithLoad ]]
    -- upvalues: v1 (copy)
    v25.mockContentProviderProceedWithLoad = true;
    v1.act(function() --[[ Line: 122 ]]
        task.wait(0.1);
    end);
end;
v17._setAssetFetchStatus = function(v26, v27, v28) --[[ Line: 127 ]] --[[ Name: _setAssetFetchStatus ]]
    v26.assetFetchStatuses[v27] = v28;
    if v26.signals[v27] then
        v26.signals[v27]:Fire(v28);
    end;
end;
v17._staggeredProgress = function(v29, v30, v31, v32) --[[ Line: 134 ]] --[[ Name: _staggeredProgress ]]
    v29.contentResolved = false;
    task.spawn(function() --[[ Line: 137 ]]
        -- upvalues: v29 (copy), v31 (copy), v30 (copy), v32 (copy)
        local v33 = false;
        while true do
            v33 = not v29.mockContentProviderProceedWithLoad;
            if not v33 then
                if not v29.contentResolved then
                    v29:_setAssetFetchStatus(v31, Enum.AssetFetchStatus.Loading);
                    if v30 then
                        v30(v31, Enum.AssetFetchStatus.Loading);
                    end;
                    v29.contentResolved = true;
                    v29.mockContentProviderProceedWithLoad = false;
                else
                    break;
                end;
            end;
            v33 = false;
            task.wait();
        end;
        v29:_setAssetFetchStatus(v31, v32);
        if v30 then
            v30(v31, v32);
        end;
        v29.mockContentProviderProceedWithLoad = false;
    end);
end;
v17._makeMockSignal = function(_) --[[ Line: 161 ]] --[[ Name: _makeMockSignal ]]
    -- upvalues: v8 (copy)
    return (v8.new());
end;
v17.GetAssetFetchStatusChangedSignal = function(v35, v36) --[[ Line: 166 ]] --[[ Name: GetAssetFetchStatusChangedSignal ]]
    if v35.signals[v36] == nil then
        v35.signals[v36] = v35:_makeMockSignal();
    end;
    return v35.signals[v36];
end;
v17.GetAssetFetchStatus = function(v37, v38) --[[ Line: 173 ]] --[[ Name: GetAssetFetchStatus ]]
    if v37.assetFetchStatuses[v38] ~= nil then
        return v37.assetFetchStatuses[v38];
    else
        return Enum.AssetFetchStatus.None;
    end;
end;
v17.PreloadAsync = function(v39, v40, v41) --[[ Line: 181 ]] --[[ Name: PreloadAsync ]]
    v39.preloadAsyncCalled = true;
    for _, v43 in ipairs(v40) do
        if v39.ultimatelySuccessfulContentIds[v43] then
            v39:_staggeredProgress(v41, v43, Enum.AssetFetchStatus.Success);
        elseif v39.ultimatelyTimedOutContentIds[v43] then
            v39:_staggeredProgress(v41, v43, Enum.AssetFetchStatus.TimedOut);
        elseif v39.ultimatelyFailedContentIds[v43] then
            v39:_staggeredProgress(v41, v43, Enum.AssetFetchStatus.Failure);
        else
            task.delay(0, function() --[[ Line: 191 ]]
                -- upvalues: v39 (copy), v43 (copy), v41 (copy)
                v39:_setAssetFetchStatus(v43, Enum.AssetFetchStatus.Success);
                if v41 then
                    v41(v43, Enum.AssetFetchStatus.Success);
                end;
            end);
        end;
    end;
end;
return v17;