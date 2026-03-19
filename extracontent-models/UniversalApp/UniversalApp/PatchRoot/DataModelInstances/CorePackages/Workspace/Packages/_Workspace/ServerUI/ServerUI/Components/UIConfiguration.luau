local l_Parent_0 = script:FindFirstAncestor("ServerUI").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "UIConfiguration");
local v3 = require(l_Parent_0.RoduxNetworking);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v5 (copy)
    local v7 = if v6 and v6.enableLogging then v2:new("UIConfiguration Networking") else nil;
    local v13 = v1.config({
        requestFunction = function(v8, v9, v10) --[[ Line: 20 ]] --[[ Name: requestFunction ]]
            -- upvalues: v7 (copy), v1 (ref)
            if v7 then
                v7:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
            end;
            return v1.requestFunctions.HttpRbxApi(v8, v9, v10);
        end, 
        postRequestFunction = function(v11, v12) --[[ Line: 26 ]] --[[ Name: postRequestFunction ]]
            -- upvalues: v7 (copy)
            if v7 then
                v7:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
            end;
        end, 
        maxRetryCount = v6 and v6.maxRetryCount or 0
    });
    local v14 = {
        networking = v3.config({
            keyPath = v6 and v6.roduxKeyPath or "UIConfiguration.NetworkStatus", 
            networkImpl = v13
        })
    };
    setmetatable(v14, v5);
    return v14;
end;
v5.fetch = function(v15, v16, v17) --[[ Line: 56 ]] --[[ Name: fetch ]]
    -- upvalues: l_Url_0 (copy)
    return v15.networking.GET(script.Name, function(v18) --[[ Line: 57 ]]
        -- upvalues: l_Url_0 (ref), v16 (copy), v17 (copy)
        return v18(l_Url_0.APIS_URL):path(v16):queryArgs(v17);
    end).API();
end;
return v5;