local l_Parent_0 = script.Parent.Parent;
local l_instanceof_0 = require(l_Parent_0.LuauPolyfill).instanceof;
local l_Headers_0 = require(script.Parent.Headers).Headers;
local l_Body_0 = require(script.Parent.Body).Body;
local l_AbortSignal_0 = require(script.Parent.AbortSignal).AbortSignal;
local v5 = setmetatable({}, {
    __index = l_Body_0
});
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 92 ]] --[[ Name: new ]]
    -- upvalues: l_instanceof_0 (copy), v5 (copy), l_Body_0 (copy), l_Headers_0 (copy), l_AbortSignal_0 (copy)
    local v8 = v7 or {};
    local v9 = nil;
    local v10 = nil;
    if type(v6) == "string" then
        v9 = v6;
        v10 = {};
    elseif l_instanceof_0(v6, v5) then
        v9 = v6.url;
        v10 = v6;
    else
        error("The first argument of Request.new() must be a string or Request object");
    end;
    local v11 = if not v8.body and l_instanceof_0(v6, v5) then v6.body else nil;
    local v12 = setmetatable(l_Body_0.new(v8.body or v11), v5);
    v12.method = v8.method or v10.method or "GET";
    if (v8.body or v11) and (v12.method == "GET" or v12.method == "HEAD") then
        error(string.format("'body' should not be provided as an option for request method %s", v12.method));
    end;
    v12.url = v9;
    local v13 = v10.headers or l_Headers_0.new();
    v12.headers = if v8.headers then l_Headers_0.new(v8.headers) else v13;
    v12.cache = v8.cache or v10.cache or Enum.HttpCachePolicy.None;
    v12.signal = v8.signal or v10.signal or l_AbortSignal_0.abort("Request Cancelled");
    v12.destination = "document";
    v12.referrer = "client";
    v12.referrerPolicy = "no-referrer";
    v12.mode = v8.mode or "cors";
    v12.credentials = v8.credentials or v10.credentials or "omit";
    v12.redirect = v8.redirect or v10.redirect or "error";
    v12.integrity = v8.integrity or v10.integrity or "";
    v12.keepalive = v8.keepalive or v10.keepalive or false;
    v12.isReloadNavigation = false;
    v12.isHistoryNavigation = false;
    v12.duplex = v8.duplex or v10.duplex or "half";
    return v12;
end;
v5.clone = function(v14) --[[ Line: 137 ]] --[[ Name: clone ]]
    -- upvalues: v5 (copy)
    return v5.new(v14);
end;
return {
    Request = v5
};