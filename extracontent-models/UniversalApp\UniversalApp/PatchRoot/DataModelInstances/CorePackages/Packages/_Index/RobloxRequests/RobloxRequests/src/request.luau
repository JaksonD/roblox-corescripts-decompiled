local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_lib_0.url);
local v6 = require(l_Parent_1.Promise);
local v7 = require(l_src_0.json);
local v8 = require(l_src_0.response);
local v9 = require(l_src_0.cookies);
local v10 = require(l_src_0.ratelimit);
local v11 = require(l_src_0.util);
local v12 = require(l_src_0.cache);
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15, v16) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v5 (copy), v10 (copy), v9 (copy)
    local v17 = setmetatable({}, v13);
    v16 = v16 or {};
    local v18 = v5.parse(v15);
    local v19 = v16.headers or {};
    v17.method = v14:upper();
    v17.url = v18;
    v17.input_url = v15;
    v17.headers = v19;
    v17.query = {};
    v17.data = nil;
    v17._ratelimits = {
        v10.get("http", 250, 30)
    };
    v17.ignore_ratelimit = v16.ignore_ratelimit or false;
    if v16.data then
        v17:set_data(v16.data);
    end;
    v17:set_query(v16.query or {});
    local v20 = v16.cookies or {};
    if not v20.__cookiejar then
        local v21 = v9.new();
        if v20 then
            for v22, v23 in pairs(v20) do
                v21:insert(v22, v23);
            end;
        end;
        v20 = v21;
    end;
    v17.cookies = v20;
    v17.headers.Cookie = v20:string(v15);
    v17._callback = nil;
    v17._log = v16.log == nil or v16.log;
    return v17;
end;
v13.set_headers = function(v24, v25) --[[ Line: 87 ]] --[[ Name: set_headers ]]
    for v26, v27 in pairs(v25) do
        v24.headers[v26] = v27;
    end;
    return v24;
end;
v13.update_headers = v11.deprecate(v13.set_headers, "0.5", "update_headers");
v13.set_query = function(v28, v29) --[[ Line: 98 ]] --[[ Name: set_query ]]
    for v30, v31 in pairs(v29) do
        v28.query[v30] = v31;
    end;
    v28.url:setQuery(v28.query);
    return v28;
end;
v13.update_query = v11.deprecate(v13.set_headers, "0.5", "update_query");
v13.set_data = function(v32, v33) --[[ Line: 111 ]] --[[ Name: set_data ]]
    -- upvalues: v7 (copy)
    if type(v33) == "table" then
        if v33.__FormData then
            v32.headers["Content-Type"] = v33.content_type;
            v33 = v33:build();
        else
            v33 = v7.enc(v33);
            v32.headers["Content-Type"] = "application/json";
        end;
    end;
    v32.data = v33;
    return v32;
end;
v13._ratelimit = function(v34) --[[ Line: 129 ]] --[[ Name: _ratelimit ]]
    for _, v36 in ipairs(v34._ratelimits) do
        if not v36:request() then
            return false;
        end;
    end;
    return true;
end;
v13._send = function(v37) --[[ Line: 141 ]] --[[ Name: _send ]]
    -- upvalues: v12 (copy), v8 (copy), l_HttpService_0 (copy)
    local v38 = {
        Url = v37.url:build(), 
        Method = v37.method, 
        Headers = v37.headers
    };
    if v37.data ~= nil then
        v38.Body = v37.data;
    end;
    local v39 = v38.Url:sub(-1, -1) == "/" and v38.Url:sub(1, -2) or v38.Url;
    local v40 = ("Request_%s_%s_%s"):format(v37.method, v39, v38.Body or "");
    if v37.method:upper() == "GET" and v12.is_cached(v38.Url, v40) then
        local v41 = tick();
        local v42, v43 = v12.get_cached(v38.Url, v40);
        if v41 - v42.timestamp <= v12.get_expire(v38.Url) then
            local v44 = v8.new(v37, v42, tick() - v41);
            v44.from_cache = true;
            print("[http]", v43:upper(), "CACHE |", v44.method, v44.url);
            return v44;
        end;
    end;
    local v45 = 0;
    local v46 = false;
    local v47 = nil;
    local v48 = nil;
    while v45 < 5 do
        if v37.ignore_ratelimit or v37:_ratelimit() then
            local v49 = tick();
            v48 = l_HttpService_0:RequestAsync(v38);
            v47 = v8.new(v37, v48, tick() - v49);
            v37.timestamp = v49;
            v46 = true;
            break;
        else
            warn("[http] Rate limit exceeded. Retrying in 5 seconds");
            v45 = v45 + 1;
            wait(5);
        end;
    end;
    if not v46 then
        error("[http] Rate limit still exceeded after 5 attempts");
    end;
    if v37._log then
        local v50 = tostring(math.floor(v37._ratelimits[#v37._ratelimits]:consumption() * 1000) * 0.1) .. "%";
        print("[http]", v47.code, v47.message, "|", v47.method, v47.url, "(", v50, "ratelimit )");
    end;
    if v37._callback then
        v37._callback(v47);
    end;
    if v37.method:upper() == "GET" and v47.ok and v12.should_cache(v38.Url) then
        v12.update_cache(v38.Url, v40, v48);
    end;
    return v47;
end;
v13.send = function(v51, v52) --[[ Line: 212 ]] --[[ Name: send ]]
    -- upvalues: v6 (copy)
    if v52 then
        return v6.new(function(v53, v54) --[[ Line: 218 ]]
            -- upvalues: v51 (copy)
            local l_status_0, l_result_0 = pcall(v51._send, v51);
            if l_status_0 and l_result_0.ok then
                v53(l_result_0);
                return;
            elseif l_status_0 then
                v54({
                    request_sent = true, 
                    response = l_result_0
                });
                return;
            else
                v54({
                    request_sent = false, 
                    error = l_result_0
                });
                return;
            end;
        end);
    else
        return v51:_send();
    end;
end;
v13.promise = function(v57) --[[ Line: 238 ]] --[[ Name: promise ]]
    return v57:send(true);
end;
return v13;