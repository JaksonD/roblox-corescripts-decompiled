local l_Parent_0 = script:FindFirstAncestor("SessionizationUtil").Parent;
local l_SessionService_0 = game:GetService("SessionService");
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5, v6, v7, v8) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v9 = setmetatable({}, v3);
    v9.level = v4;
    v9.sessionId = v5;
    v9.tagName = v6;
    v9.creationTimestamp = v7;
    v9.metadata = v8 or {};
    return v9;
end;
v3.__tostring = function(v10) --[[ Line: 63 ]] --[[ Name: __tostring ]]
    local v11 = 0;
    for _ in pairs(v10.metadata) do
        v11 = v11 + 1;
    end;
    return string.format("SessionInfo{level=%s, sessionId=%s, tagName=%s, creationTimestamp=%s, metadata_count=%d}", tostring(v10.level), tostring(v10.sessionId), tostring(v10.tagName), tostring(v10.creationTimestamp), v11);
end;
v3.getSessionByLevel = function(v13) --[[ Line: 97 ]] --[[ Name: getSessionByLevel ]]
    -- upvalues: l_SessionType_0 (copy), l_SessionService_0 (copy), v3 (copy)
    local v14 = nil;
    local v15 = nil;
    local v16 = l_SessionType_0.StructuralIdentifier[v13];
    if v13 == l_SessionType_0.StructuralIdentifier.Level0 then
        v14 = l_SessionService_0:GetRootSID();
        v15 = nil;
    elseif v16 then
        if l_SessionService_0:SessionExists(v16) then
            v14 = l_SessionService_0:GetSessionID(v16);
            v15 = l_SessionService_0:GetSessionTag(v16);
        else
            v14 = nil;
            v15 = nil;
        end;
    else
        v14 = nil;
        v15 = nil;
    end;
    return v3.new(v13, v14, v15, nil, {});
end;
return v3;