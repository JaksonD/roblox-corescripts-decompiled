local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_Headers_0 = require(script.Parent.Headers).Headers;
local l_Body_0 = require(script.Parent.Body).Body;
local v4 = setmetatable({}, {
    __index = l_Body_0
});
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: l_Body_0 (copy), v4 (copy), l_Headers_0 (copy)
    local v7 = v6 or {};
    local v8 = setmetatable(l_Body_0.new(v5), v4);
    v8.status = v7.status or 200;
    v8.statusText = v7.statusText or "";
    v8.headers = l_Headers_0.new(v7.headers or {});
    v8.headers.guard = "response";
    v8.type = "text";
    v8.url = "";
    v8.redirected = false;
    local v9 = false;
    if v8.status >= 200 then
        v9 = v8.status < 300;
    end;
    v8.ok = v9;
    return v8;
end;
v4.error = function() --[[ Line: 59 ]] --[[ Name: error ]]
    -- upvalues: v4 (copy)
    local v10 = v4.new(nil, {
        status = 0
    });
    v10.type = "error";
    return v10;
end;
v4.redirect = function(_, _) --[[ Line: 67 ]] --[[ Name: redirect ]]
    error("Response.redirect not implemented");
end;
v4.STATIC_json = function(_, _) --[[ Line: 75 ]] --[[ Name: STATIC_json ]]
    error("Response.json static method not implemented");
end;
v4.clone = function(v15) --[[ Line: 79 ]] --[[ Name: clone ]]
    -- upvalues: v4 (copy)
    return v4.new(v15.body, {
        status = v15.status, 
        statusText = v15.statusText, 
        headers = v15.headers.headerList
    });
end;
return {
    Response = v4
};