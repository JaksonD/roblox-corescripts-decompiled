local l_Parent_0 = script.Parent.Parent;
local l_MessageBusService_0 = game:GetService("MessageBusService");
local _ = require(l_Parent_0.MessageBus);
local v3 = require(l_Parent_0.Promise);
local v4 = require(script.Parent.Flags.getFFlagEnableToSwitchToSettingsAppWithRouteLua);
local _ = require(script.Parent.LinkingProtocolTypes);
local _ = require(script.Parent.Enums.SettingsRoute);
local l_LinkingService_0 = require(l_Parent_0.MockableProxyServices).LinkingService;
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        isListeningForURLs = false, 
        urlConnection = nil
    }, v8));
end;
v8.registerURL = function(_, v10) --[[ Line: 45 ]] --[[ Name: registerURL ]]
    -- upvalues: l_LinkingService_0 (copy)
    l_LinkingService_0:RegisterLuaUrl(v10);
end;
v8.getUID = function(_) --[[ Line: 60 ]] --[[ Name: getUID ]]
    -- upvalues: v3 (copy), l_MessageBusService_0 (copy)
    if not game:GetEngineFeature("EnableAppflyerUIDReporting") then
        return v3.resolve("");
    else
        return v3.new(function(v12, _) --[[ Line: 65 ]]
            -- upvalues: l_MessageBusService_0 (ref)
            l_MessageBusService_0:MakeRequest("Linking", "getUID", {}, function(v14) --[[ Line: 66 ]]
                -- upvalues: v12 (copy)
                v12(v14.uid);
            end, {});
        end);
    end;
end;
v8.detectURL = function(_, v16) --[[ Line: 79 ]] --[[ Name: detectURL ]]
    -- upvalues: l_LinkingService_0 (copy)
    l_LinkingService_0:DetectUrl(v16);
end;
v8.getLastLuaURL = function(_) --[[ Line: 89 ]] --[[ Name: getLastLuaURL ]]
    -- upvalues: l_LinkingService_0 (copy)
    return l_LinkingService_0:GetLastLuaUrl();
end;
v8.listenForLuaURLs = function(v18, v19, _) --[[ Line: 101 ]] --[[ Name: listenForLuaURLs ]]
    -- upvalues: l_LinkingService_0 (copy)
    v18:stopListeningForLuaURLs();
    v18.urlConnection = l_LinkingService_0.OnLuaUrl:Connect(function(v21, _, v23) --[[ Line: 103 ]]
        -- upvalues: v19 (copy)
        v19(v21, v23);
    end);
    v18.isListeningForURLs = true;
    local v24 = l_LinkingService_0:StartLuaUrlDelivery();
    if v24 and v24.url then
        v19(v24.url, v24.attributionUrl);
    end;
end;
v8.stopListeningForLuaURLs = function(v25) --[[ Line: 118 ]] --[[ Name: stopListeningForLuaURLs ]]
    -- upvalues: l_LinkingService_0 (copy)
    if v25.isListeningForURLs then
        v25.urlConnection:Disconnect();
        l_LinkingService_0:StopLuaUrlDelivery();
        v25.isListeningForURLs = false;
    end;
end;
v8.openURL = function(_, v27) --[[ Line: 142 ]] --[[ Name: openURL ]]
    -- upvalues: v3 (copy), l_LinkingService_0 (copy)
    return v3.new(function(v28, _) --[[ Line: 143 ]]
        -- upvalues: l_LinkingService_0 (ref), v27 (copy)
        v28(l_LinkingService_0:OpenUrl(v27));
    end);
end;
v8.isURLRegistered = function(_, v31) --[[ Line: 166 ]] --[[ Name: isURLRegistered ]]
    -- upvalues: v3 (copy), l_LinkingService_0 (copy)
    return v3.new(function(v32, _) --[[ Line: 167 ]]
        -- upvalues: l_LinkingService_0 (ref), v31 (copy)
        v32(l_LinkingService_0:IsUrlRegistered(v31));
    end);
end;
v8.getAndClearLastPendingURL = function(_) --[[ Line: 181 ]] --[[ Name: getAndClearLastPendingURL ]]
    -- upvalues: v3 (copy), l_LinkingService_0 (copy)
    if not game:GetEngineFeature("LinkingProtocolGetLastPendingUrlEnabled") then
        return v3.resolve({
            hasPendingUrl = false
        });
    else
        return v3.new(function(v35, _) --[[ Line: 188 ]]
            -- upvalues: l_LinkingService_0 (ref)
            v35(l_LinkingService_0:GetAndClearLastPendingUrl());
        end);
    end;
end;
v8.switchToSettingsApp = function(_, v38) --[[ Line: 199 ]] --[[ Name: switchToSettingsApp ]]
    -- upvalues: v4 (copy), v3 (copy), l_LinkingService_0 (copy)
    local v39 = if v4() then v38 else nil;
    return v3.new(function(v40, _) --[[ Line: 201 ]]
        -- upvalues: l_LinkingService_0 (ref), v39 (copy)
        v40(l_LinkingService_0:SwitchToSettingsApp(v39));
    end);
end;
v8.supportsSwitchToSettingsApp = function(_, _) --[[ Line: 213 ]] --[[ Name: supportsSwitchToSettingsApp ]]
    -- upvalues: v3 (copy), l_LinkingService_0 (copy)
    return v3.new(function(v44, _) --[[ Line: 214 ]]
        -- upvalues: l_LinkingService_0 (ref)
        v44(l_LinkingService_0:SupportsSwitchToSettingsApp());
    end);
end;
v8.default = v8.new();
return v8;