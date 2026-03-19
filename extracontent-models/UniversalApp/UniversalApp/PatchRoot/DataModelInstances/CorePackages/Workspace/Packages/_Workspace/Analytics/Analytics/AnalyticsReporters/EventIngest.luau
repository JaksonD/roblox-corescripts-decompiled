local l_script_FirstAncestor_0 = script:FindFirstAncestor("Analytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_Parent_0.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
local v4 = nil;
v4 = if l_GetFFlagShareGetPlatformTargetImpl_0() then require(l_script_FirstAncestor_0.getPlatformTarget) else function() --[[ Line: 19 ]] --[[ Name: getPlatformTarget ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v5 = "unknownLua";
    local l_None_0 = Enum.Platform.None;
    pcall(function() --[[ Line: 25 ]]
        -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
        l_None_0 = l_UserInputService_0:GetPlatform();
    end);
    local v7 = true;
    if l_None_0 ~= Enum.Platform.Windows then
        v7 = l_None_0 == Enum.Platform.OSX;
    end;
    local v8 = true;
    if l_None_0 ~= Enum.Platform.IOS then
        v8 = l_None_0 == Enum.Platform.Android;
    end;
    v8 = v8 or l_None_0 == Enum.Platform.UWP;
    local v9 = true;
    if l_None_0 ~= Enum.Platform.XBox360 then
        v9 = l_None_0 == Enum.Platform.XBoxOne;
    end;
    v9 = v9 or l_None_0 == Enum.Platform.PS3 or l_None_0 == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5 or l_None_0 == Enum.Platform.WiiU;
    return v7 and "client" or v8 and "mobile" or v9 and "console" or v5 .. tostring(l_None_0);
end;
local v10 = {};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v12 = type(v11);
    local v13 = true;
    if v12 ~= "table" then
        v13 = v12 == "userdata";
    end;
    assert(v13, "Unexpected value for eventIngestService");
    local v14 = {
        _eventIngest = v11
    };
    setmetatable(v14, v10);
    return v14;
end;
v10.setRBXEvent = function(v15, v16, v17, v18) --[[ Line: 76 ]] --[[ Name: setRBXEvent ]]
    -- upvalues: v4 (ref)
    local v19 = v4();
    v18 = v18 or {};
    assert(type(v16) == "string", "Expected eventContext to be a string");
    assert(type(v17) == "string", "Expected eventName to be a string");
    assert(type(v18) == "table", "Expected additionalArgs to be a table");
    v15._eventIngest:SetRBXEvent(v19, v16, v17, v18);
end;
v10.setRBXEventStream = function(v20, v21, v22, v23) --[[ Line: 90 ]] --[[ Name: setRBXEventStream ]]
    -- upvalues: v4 (ref)
    local v24 = v4();
    v23 = v23 or {};
    assert(type(v21) == "string", "Expected eventContext to be a string");
    assert(type(v22) == "string", "Expected eventName to be a string");
    assert(type(v23) == "table", "Expected additionalArgs to be a table");
    v20._eventIngest:SetRBXEventStream(v24, v21, v22, v23);
end;
v10.sendEventDeferred = function(v25, v26, v27, v28) --[[ Line: 104 ]] --[[ Name: sendEventDeferred ]]
    -- upvalues: v4 (ref)
    local v29 = v4();
    v28 = v28 or {};
    assert(type(v26) == "string", "Expected eventContext to be a string");
    assert(type(v27) == "string", "Expected eventName to be a string");
    assert(type(v28) == "table", "Expected additionalArgs to be a table");
    v25._eventIngest:SendEventDeferred(v29, v26, v27, v28);
end;
v10.sendEventImmediately = function(v30, v31, v32, v33) --[[ Line: 119 ]] --[[ Name: sendEventImmediately ]]
    -- upvalues: v4 (ref)
    local v34 = v4();
    v33 = v33 or {};
    assert(type(v31) == "string", "Expected eventContext to be a string");
    assert(type(v32) == "string", "Expected eventName to be a string");
    assert(type(v33) == "table", "Expected additionalArgs to be a table");
    v30._eventIngest:SendEventImmediately(v34, v31, v32, v33);
end;
return v10;