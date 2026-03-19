local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.t);
local l_FFlagEnableLuaAccountSwitch_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaAccountSwitch;
local v4 = {};
local v5 = {};
v4[v5] = true;
local v6 = v2.interface({
    user = v2.interface({
        id = v2.number, 
        name = v2.string
    }), 
    twoStepVerificationData = v2.optional(v2.interface({
        mediaType = v2.string, 
        ticket = v2.string
    })), 
    twoStepVerificationDataV2 = v2.optional(v2.interface({
        mediaType = v2.string, 
        ticket = v2.string
    })), 
    accountBlob = v2.optional(v2.string)
});
v4.new = function(v7) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: l_FFlagEnableLuaAccountSwitch_0 (copy), v4 (copy)
    local v8 = {
        user = {
            id = "0", 
            name = ""
        }
    };
    if v7 and type(v7) == "table" then
        if v7.user then
            v8.user.id = tostring(v7.user.id) or v8.user.id;
            v8.user.name = v7.user.name or v8.user.name;
        end;
        if v7.twoStepVerificationData then
            v8.twoStepVerificationData = {};
            v8.twoStepVerificationData.mediaType = v7.twoStepVerificationData.mediaType or "";
            v8.twoStepVerificationData.ticket = v7.twoStepVerificationData.ticket or "";
        end;
        if l_FFlagEnableLuaAccountSwitch_0 and v7.accountBlob then
            v8.accountBlob = v7.accountBlob;
        end;
    end;
    setmetatable(v8, v4);
    return v8;
end;
v4.mock = function() --[[ Line: 79 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    local v9 = v4.new();
    v9.user = {
        id = "1", 
        name = "ROBLOX"
    };
    v9.twoStepVerificationData = {
        mediaType = "Email", 
        ticket = "00000000-0000-0000-0000-000000000000"
    };
    return v9;
end;
v4.fromJsonData = function(v10) --[[ Line: 95 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v4 (copy), v6 (copy), l_FFlagEnableLuaAccountSwitch_0 (copy), v1 (copy)
    local v11 = v4.new();
    local v12, v13 = v6(v10);
    if v12 then
        v11.user = {
            id = tostring(v10.user.id), 
            name = v10.user.name
        };
        if v10.twoStepVerificationData then
            v11.twoStepVerificationData = {
                mediaType = v10.twoStepVerificationData.mediaType, 
                ticket = v10.twoStepVerificationData.ticket
            };
        end;
        if l_FFlagEnableLuaAccountSwitch_0 and v10.accountBlob then
            v11.accountBlob = v10.accountBlob;
            return v11;
        end;
    else
        v1.assert(false, v13);
    end;
    return v11;
end;
v4.is = function(v14) --[[ Line: 126 ]] --[[ Name: is ]]
    -- upvalues: v5 (copy)
    if type(v14) ~= "table" then
        return false;
    else
        return v14[v5] == true;
    end;
end;
v4.hasTwoStepData = function(v15) --[[ Line: 134 ]] --[[ Name: hasTwoStepData ]]
    -- upvalues: v4 (copy)
    return v4.is(v15) and type(v15.twoStepVerificationData) == "table";
end;
v4.__index = v4;
return v4;