local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.getMockName);
local _ = require(script.Parent.Parent.Types.ContactTypes);
local v3 = require(l_Parent_0.Dash);
local v4 = {};
v4.new = function(v5) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    v4.__index = v4;
    local v6 = {
        id = v5.id, 
        phoneNumbers = v5.phoneNumbers, 
        contactName = v5.contactName
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.mock = function(v7) --[[ Line: 23 ]] --[[ Name: mock ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy)
    local v8 = v1();
    local v9 = {
        id = v8, 
        contactName = v8, 
        phoneNumbers = {
            "123456"
        }
    };
    local v10 = v3.join(v9, v7);
    return v4.new(v10);
end;
v4.formatFromDevice = function(v11) --[[ Line: 39 ]] --[[ Name: formatFromDevice ]]
    -- upvalues: v4 (copy)
    local v12 = v11.firstname or "";
    local v13 = v11.lastname or "";
    return v4.new({
        id = v4.generateId(v11), 
        contactName = v12 .. " " .. v13, 
        phoneNumbers = v11.phonenumber
    });
end;
v4.generateId = function(v14) --[[ Line: 49 ]] --[[ Name: generateId ]]
    return (v14.firstname or "") .. (v14.lastname or "") .. tostring(v14.phonenumber[1]);
end;
return v4;