local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v6 = {};
    if type(v5) == "string" then
        v6.body = v5;
    elseif v5 == nil then
        v6.body = nil;
    else
        error(string.format("Expected string or nil as the first argument to Body.new(), but got: %s", (type(v5))));
    end;
    v6.bodyUsed = false;
    setmetatable(v6, v4);
    return v6;
end;
v4.arrayBuffer = function(_) --[[ Line: 53 ]] --[[ Name: arrayBuffer ]]
    -- upvalues: v2 (copy)
    return v2.new(function(_, v9) --[[ Line: 54 ]]
        v9("arrayBuffer not implemented");
    end);
end;
v4.blob = function(_) --[[ Line: 60 ]] --[[ Name: blob ]]
    -- upvalues: v2 (copy)
    return v2.new(function(_, v12) --[[ Line: 61 ]]
        v12("blob not implemented");
    end);
end;
v4.formData = function(_) --[[ Line: 67 ]] --[[ Name: formData ]]
    -- upvalues: v2 (copy)
    return v2.new(function(_, v15) --[[ Line: 68 ]]
        v15("formData not implemented");
    end);
end;
v4.json = function(v16) --[[ Line: 74 ]] --[[ Name: json ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v2.new(function(v17, v18) --[[ Line: 75 ]]
        -- upvalues: v16 (copy), l_HttpService_0 (ref)
        if v16._json then
            v17(v16._json);
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 81 ]]
                -- upvalues: l_HttpService_0 (ref), v16 (ref)
                return l_HttpService_0:JSONDecode(v16.body);
            end);
            if not l_status_0 then
                v18("Failed to decode response body as JSON. JSON decoding is only supported for Content-Type = application/json");
                return;
            else
                v16._json = l_result_0;
                v17(l_result_0);
                return;
            end;
        end;
    end);
end;
v4.text = function(v21) --[[ Line: 97 ]] --[[ Name: text ]]
    -- upvalues: v2 (copy)
    return v2.new(function(v22, _) --[[ Line: 98 ]]
        -- upvalues: v21 (copy)
        v22(v21.body or "");
    end);
end;
return {
    Body = v4
};