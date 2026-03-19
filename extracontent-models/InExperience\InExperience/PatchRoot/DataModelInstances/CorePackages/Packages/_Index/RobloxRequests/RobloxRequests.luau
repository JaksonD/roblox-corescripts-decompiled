local l_lib_0 = script.lib;
local l_src_0 = script.src;
local v2 = require(l_lib_0.html);
local v3 = require(l_src_0.request);
local v4 = require(l_src_0.session);
local v5 = require(l_src_0.form);
local v6 = require(l_src_0.ratelimit);
local v7 = require(l_src_0.util);
local v8 = require(l_src_0.fetch);
local v13 = {
    VERSION = "0.5.4", 
    Request = v3.new, 
    Session = v4.new, 
    FormData = v5.FormData.new, 
    File = v5.File.new, 
    cache = require(l_src_0.cache), 
    request = function(v9, v10, v11) --[[ Line: 32 ]] --[[ Name: request ]]
        -- upvalues: v3 (copy)
        local v12 = v11 or {};
        return v3.new(v9, v10, v12):send();
    end
};
v13.send = v7.deprecate(v13.request, "0.5", "http.send");
v13.promise_request = function(v14, v15, v16) --[[ Line: 50 ]] --[[ Name: promise_request ]]
    -- upvalues: v3 (copy)
    local v17 = v16 or {};
    return v3.new(v14, v15, v17):send(true);
end;
v13.promise_send = v7.deprecate(v13.promise_request, "0.5", "http.promise_send");
v13.fetch = v8(v13.promise_request);
for _, v19 in pairs({
    "GET", 
    "POST", 
    "HEAD", 
    "OPTIONS", 
    "PUT", 
    "DELETE", 
    "PATCH"
}) do
    v13[v19:lower()] = function(v20, v21) --[[ Line: 65 ]]
        -- upvalues: v13 (copy), v19 (copy)
        return v13.request(v19, v20, v21);
    end;
    v13["promise_" .. v19:lower()] = function(v22, v23) --[[ Line: 69 ]]
        -- upvalues: v13 (copy), v19 (copy)
        return v13.promise_request(v19, v22, v23);
    end;
end;
v13.set_ratelimit = function(v24, v25) --[[ Line: 74 ]] --[[ Name: set_ratelimit ]]
    -- upvalues: v6 (copy)
    local v26 = v6.get("http", v24, v25);
    print("[http] RateLimiter settings changed: ", v26.rate, "reqs /", v26.window_size, "secs");
end;
v13.parse_html = function(v27, v28) --[[ Line: 81 ]] --[[ Name: parse_html ]]
    -- upvalues: v2 (copy)
    return v2.parse(v27, 100000, v28);
end;
v13.parse_xml = v13.parse_html;
return v13;