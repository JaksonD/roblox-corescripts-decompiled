local l_Parent_0 = script:FindFirstAncestor("Analytics").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
local v3 = nil;
v3 = if l_GetFFlagShareGetPlatformTargetImpl_0() then require(script.Parent.Parent.getPlatformTarget) else function() --[[ Line: 36 ]] --[[ Name: getPlatformTarget ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v4 = "unknownLua";
    local l_None_0 = Enum.Platform.None;
    pcall(function() --[[ Line: 42 ]]
        -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    local v6 = true;
    if l_None_0 ~= Enum.Platform.Windows then
        v6 = l_None_0 == Enum.Platform.OSX;
    end;
    local v7 = true;
    if l_None_0 ~= Enum.Platform.IOS then
        v7 = l_None_0 == Enum.Platform.Android;
    end;
    v7 = v7 or l_None_0 == Enum.Platform.UWP;
    local v8 = true;
    if l_None_0 ~= Enum.Platform.XBox360 then
        v8 = l_None_0 == Enum.Platform.XBoxOne;
    end;
    v8 = v8 or l_None_0 == Enum.Platform.PS3 or l_None_0 == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5 or l_None_0 == Enum.Platform.WiiU;
    return v6 and "client" or v7 and "mobile" or v8 and "console" or v4 .. tostring(l_None_0);
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 79 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v11 = type(v10);
    local v12 = true;
    if v11 ~= "table" then
        v12 = v11 == "userdata";
    end;
    assert(v12, "Unexpected value for reportingService");
    local v13 = {
        _reporter = v10, 
        _isEnabled = true
    };
    setmetatable(v13, v9);
    return v13;
end;
v9.setEnabled = function(v14, v15) --[[ Line: 92 ]] --[[ Name: setEnabled ]]
    assert(type(v15) == "boolean", "Expected isEnabled to be a boolean");
    v14._isEnabled = v15;
end;
v9.setRBXEvent = function(v16, v17, v18, v19) --[[ Line: 100 ]] --[[ Name: setRBXEvent ]]
    -- upvalues: v3 (ref)
    local v20 = v3();
    v19 = v19 or {};
    assert(type(v17) == "string", "Expected eventContext to be a string");
    assert(type(v18) == "string", "Expected eventName to be a string");
    assert(type(v19) == "table", "Expected additionalArgs to be a table");
    assert(v16._isEnabled, "This reporting service is disabled");
    v16._reporter:SetRBXEvent(v20, v17, v18, v19);
end;
v9.setRBXEventStream = function(v21, v22, v23, v24) --[[ Line: 116 ]] --[[ Name: setRBXEventStream ]]
    -- upvalues: v3 (ref)
    local v25 = v3();
    v24 = v24 or {};
    assert(type(v22) == "string", "Expected eventContext to be a string");
    assert(type(v23) == "string", "Expected eventName to be a string");
    assert(type(v24) == "table", "Expected additionalArgs to be a table");
    assert(v21._isEnabled, "This reporting service is disabled");
    v21._reporter:SetRBXEventStream(v25, v22, v23, v24);
end;
v9.releaseRBXEventStream = function(v26) --[[ Line: 129 ]] --[[ Name: releaseRBXEventStream ]]
    -- upvalues: v3 (ref)
    assert(v26._isEnabled, "This reporting service is disabled");
    v26._reporter:ReleaseRBXEventStream(v3());
end;
v9.sendEventDeferred = function(v27, v28, v29, v30) --[[ Line: 138 ]] --[[ Name: sendEventDeferred ]]
    -- upvalues: v3 (ref)
    local v31 = v3();
    v30 = v30 or {};
    assert(type(v28) == "string", "Expected eventContext to be a string");
    assert(type(v29) == "string", "Expected eventName to be a string");
    assert(type(v30) == "table", "Expected additionalArgs to be a table");
    assert(v27._isEnabled, "This reporting service is disabled");
    v27._reporter:SendEventDeferred(v31, v28, v29, v30);
end;
v9.sendEventImmediately = function(v32, v33, v34, v35) --[[ Line: 154 ]] --[[ Name: sendEventImmediately ]]
    -- upvalues: v3 (ref)
    local v36 = v3();
    v35 = v35 or {};
    assert(type(v33) == "string", "Expected eventContext to be a string");
    assert(type(v34) == "string", "Expected eventName to be a string");
    assert(type(v35) == "table", "Expected additionalArgs to be a table");
    assert(v32._isEnabled, "This reporting service is disabled");
    v32._reporter:SendEventImmediately(v36, v33, v34, v35);
end;
v9.updateHeartbeatObject = function(v37, v38) --[[ Line: 168 ]] --[[ Name: updateHeartbeatObject ]]
    v38 = v38 or {};
    assert(type(v38) == "table", "Expected additionalArgs to be a table");
    assert(v37._isEnabled, "This reporting service is disabled");
    v37._reporter:UpdateHeartbeatObject(v38);
end;
return v9;