local l_Parent_0 = script.Parent.Parent;
local _ = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local v3 = require(l_src_0.request);
local v4 = require(l_src_0.cookies);
local v5 = require(l_src_0.ratelimit);
local v6 = require(l_src_0.util);
local function v10(v7) --[[ Line: 15 ]] --[[ Name: randomString ]]
    local v8 = "";
    for _ = 1, v7 do
        v8 = v8 .. string.char(math.random(97, 122));
    end;
    return v8;
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), v4 (copy)
    local v13 = setmetatable({}, v11);
    v13.headers = {};
    v13.cookies = v4.new();
    v13.base_url = v12 or "";
    v13._ratelimit = nil;
    v13.ignore_ratelimit = false;
    v13.before_request = nil;
    v13.after_request = nil;
    v13.no_stats = false;
    v13.log = true;
    return v13;
end;
v11.set_ratelimit = function(v14, v15, v16) --[[ Line: 52 ]] --[[ Name: set_ratelimit ]]
    -- upvalues: v5 (copy), v10 (copy)
    if not v15 then
        v14:disable_ratelimit();
    end;
    v16 = v16 or 60;
    if v14._ratelimit then
        v5.ratelimit[v14._ratelimit.id] = nil;
    end;
    local v17 = "http.session-" .. v10(12);
    v14._ratelimit = v5.get(v17, v15, v16);
end;
v11.disable_ratelimit = function(v18) --[[ Line: 70 ]] --[[ Name: disable_ratelimit ]]
    -- upvalues: v5 (copy)
    if v18._ratelimit then
        v5.ratelimit[v18._ratelimit.id] = nil;
        v18._ratelimit = nil;
    end;
end;
v11.set_headers = function(v19, v20) --[[ Line: 79 ]] --[[ Name: set_headers ]]
    for v21, v22 in pairs(v20) do
        v19.headers[v21] = v22;
    end;
    return v19;
end;
v11.Request = function(v23, v24, v25, v26) --[[ Line: 89 ]] --[[ Name: Request ]]
    -- upvalues: v3 (copy)
    v26 = v26 or {};
    if v25:sub(1, 7) ~= "http://" and v25:sub(1, 8) ~= "https://" then
        v25 = v23.base_url .. v25;
    end;
    local l_log_0 = v23.log;
    if v26.log ~= nil then
        l_log_0 = v26.log;
    end;
    local v28 = v3.new(v24, v25, {
        headers = v23.headers, 
        query = v26.query, 
        data = v26.data, 
        log = l_log_0, 
        cookies = v26.cookies or v23.cookies, 
        ignore_ratelimit = v26.ignore_ratelimit or v23.ignore_ratelimit, 
        no_stats = v23.no_stats or false
    });
    if v23._ratelimit then
        table.insert(v28._ratelimits, v23._ratelimit);
    end;
    v28:set_headers(v26.headers or {});
    v28._callback = function(v29) --[[ Line: 122 ]]
        -- upvalues: v23 (copy)
        for _, v31 in ipairs(v29.cookies.cookies) do
            table.insert(v23.cookies.cookies, v31);
        end;
    end;
    return v28;
end;
v11.request = function(v32, v33, v34, v35) --[[ Line: 131 ]] --[[ Name: request ]]
    return v32:Request(v33, v34, v35 or {}):send();
end;
v11.send = v6.deprecate(v11.request, "0.5", "Session:send");
v11.promise_request = function(v36, v37, v38, v39) --[[ Line: 149 ]] --[[ Name: promise_request ]]
    return v36:Request(v37, v38, v39 or {}):send(true);
end;
v11.promise_send = v6.deprecate(v11.promise_request, "0.5", "Session:promise_send");
for _, v41 in pairs({
    "GET", 
    "POST", 
    "HEAD", 
    "OPTIONS", 
    "PUT", 
    "DELETE", 
    "PATCH"
}) do
    v11[v41:lower()] = function(v42, v43, v44) --[[ Line: 161 ]]
        -- upvalues: v41 (copy)
        return v42:send(v41, v43, v44);
    end;
    v11["promise_" .. v41:lower()] = function(v45, v46, v47) --[[ Line: 165 ]]
        -- upvalues: v41 (copy)
        return v45:promise_send(v41, v46, v47);
    end;
end;
return v11;