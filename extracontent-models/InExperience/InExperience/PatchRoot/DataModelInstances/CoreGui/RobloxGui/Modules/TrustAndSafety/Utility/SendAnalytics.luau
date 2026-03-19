local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_GetFFlagShareGetPlatformTargetImpl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagShareGetPlatformTargetImpl;
local v4 = nil;
v4 = if l_GetFFlagShareGetPlatformTargetImpl_0() then require(l_CorePackages_0.Workspace.Packages.Analytics).getPlatformTarget else function() --[[ Line: 12 ]] --[[ Name: getPlatformTarget ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v5 = "unknownLua";
    local l_None_0 = Enum.Platform.None;
    pcall(function() --[[ Line: 18 ]]
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
    v9 = v9 or l_None_0 == Enum.Platform.PS3 or l_None_0 == Enum.Platform.PS4 or l_None_0 == Enum.Platform.WiiU;
    return v7 and "client" or v8 and "mobile" or v9 and "console" or v5 .. tostring(l_None_0);
end;
return function(v10, v11, v12) --[[ Line: 49 ]]
    -- upvalues: v4 (ref), l_EventIngestService_0 (copy)
    assert(type(v10) == "string", "Expected eventContext to be a string");
    assert(type(v11) == "string", "Expected eventName to be a string");
    assert(type(v12) == "table", "Expected eventTable to be a table");
    local v13 = v4();
    if not v12 then
        v12 = {};
    end;
    v12.universeId = tostring(game.GameId);
    l_EventIngestService_0:sendEventDeferred(v13, v10, v11, v12);
end;