local l_ScriptProfilerService_0 = game:GetService("ScriptProfilerService");
local l_Players_0 = game:GetService("Players");
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_Players_0 (copy), l_ScriptProfilerService_0 (copy)
    local v4 = setmetatable({}, v2);
    v4._isProfiling = false;
    v4._isClient = false;
    v4._player = l_Players_0.LocalPlayer;
    v4._connection = if v3 then l_ScriptProfilerService_0.OnNewData:Connect(function(v5, v6) --[[ Line: 45 ]]
        -- upvalues: v3 (copy)
        local v7 = v5 ~= nil;
        if v3 then
            v3(v7, v6);
        end;
    end) else nil;
    return v4;
end;
v2.ClientStart = function(v8, v9) --[[ Line: 58 ]] --[[ Name: ClientStart ]]
    -- upvalues: l_ScriptProfilerService_0 (copy)
    if v8._isProfiling then
        return;
    else
        local v10 = v9 or 1000;
        l_ScriptProfilerService_0:ClientStart(v8._player, v10);
        v8._isProfiling = true;
        v8._isClient = true;
        return;
    end;
end;
v2.ClientStop = function(v11) --[[ Line: 70 ]] --[[ Name: ClientStop ]]
    -- upvalues: l_ScriptProfilerService_0 (copy)
    if not v11._isProfiling or not v11._isClient then
        return;
    else
        l_ScriptProfilerService_0:ClientStop(v11._player);
        l_ScriptProfilerService_0:ClientRequestData(v11._player);
        v11._isProfiling = false;
        v11._isClient = false;
        return;
    end;
end;
v2.ServerStart = function(v12, v13) --[[ Line: 82 ]] --[[ Name: ServerStart ]]
    -- upvalues: l_ScriptProfilerService_0 (copy)
    if v12._isProfiling then
        return;
    else
        local v14 = v13 or 1000;
        l_ScriptProfilerService_0:ServerStart(v14);
        v12._isProfiling = true;
        v12._isClient = false;
        return;
    end;
end;
v2.ServerStop = function(v15) --[[ Line: 94 ]] --[[ Name: ServerStop ]]
    -- upvalues: l_ScriptProfilerService_0 (copy)
    if not v15._isProfiling or v15._isClient then
        return;
    else
        l_ScriptProfilerService_0:ServerStop();
        l_ScriptProfilerService_0:ServerRequestData();
        v15._isProfiling = false;
        return;
    end;
end;
v2.IsProfiling = function(v16) --[[ Line: 105 ]] --[[ Name: IsProfiling ]]
    return v16._isProfiling;
end;
v2.Disconnect = function(v17) --[[ Line: 109 ]] --[[ Name: Disconnect ]]
    if v17._connection then
        v17._connection:Disconnect();
        v17._connection = nil;
    end;
end;
return v2;