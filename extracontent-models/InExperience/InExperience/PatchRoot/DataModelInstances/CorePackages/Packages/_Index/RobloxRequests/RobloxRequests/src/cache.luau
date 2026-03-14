local l_MessagingService_0 = game:GetService("MessagingService");
local l_DataStoreService_0 = game:GetService("DataStoreService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(script.Parent.json);
local v4 = l_RunService_0:IsStudio();
local function v5(...) --[[ Line: 10 ]] --[[ Name: dlog ]]
    print("[http]", ...);
end;
local v6 = {
    settings = {}, 
    max_size = 1e999, 
    data = {}
};
v6.update_settings = function(v7, v8) --[[ Line: 22 ]] --[[ Name: update_settings ]]
    -- upvalues: v6 (copy)
    v7 = type(v7) == "table" and v7 or {
        v7
    };
    local _ = {};
    local v10 = 0;
    while v10 < #v7 do
        v10 = v10 + 1;
        local v11 = v7[v10];
        if v11:sub(1, 7) == "http://" then
            v7[v10] = v11:sub(8);
            v11 = v7[v10];
        elseif v11:sub(1, 8) == "https://" then
            v7[v10] = v11:sub(9);
            v11 = v7[v10];
        end;
        if v11:sub(1, 2) == "*." then
            table.insert(v7, v11:sub(3));
        end;
        if not v11:find("/") then
            table.insert(v7, v11 .. "/");
            table.insert(v7, v11 .. "/*");
        end;
    end;
    for _, v13 in ipairs(v7) do
        v6.settings[v13] = v8;
        if v8.cache_locally == false and not v8.cache_globally then
            v6.settings[v13] = nil;
        end;
    end;
end;
v6.cache_locally = function(v14, v15) --[[ Line: 59 ]] --[[ Name: cache_locally ]]
    -- upvalues: v6 (copy)
    v15 = v15 or {};
    v15.cache_globally = false;
    v6.update_settings(v14, v15);
end;
v6.cache_globally = function(v16, v17) --[[ Line: 66 ]] --[[ Name: cache_globally ]]
    -- upvalues: v6 (copy)
    v17 = v17 or {};
    v17.cache_globally = true;
    v6.update_settings(v16, v17);
end;
v6.should_cache = function(v18) --[[ Line: 77 ]] --[[ Name: should_cache ]]
    -- upvalues: v6 (copy)
    v18 = v18:split("?")[1];
    for v19, _ in pairs(v6.settings) do
        if v18:match(".*://" .. v19:gsub("%*", ".*")) then
            return v19;
        end;
    end;
    return false;
end;
v6.is_cached = function(v21, v22) --[[ Line: 91 ]] --[[ Name: is_cached ]]
    -- upvalues: v6 (copy)
    local v23 = v6.should_cache(v21);
    local v24 = v6.settings[v23];
    if not v23 then
        return false;
    elseif v6.data[v22] ~= nil then
        if v24.expires and tick() - v6.data[v22].timestamp > v24.expires then
            return false;
        else
            return true;
        end;
    elseif v6.settings[v23].cache_globally then
        if v6.global_cache_index[v22] then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v6.global_cache_index = {};
local v25 = {};
local l_status_0, l_result_0 = pcall(function() --[[ Line: 127 ]]
    -- upvalues: l_DataStoreService_0 (copy)
    return l_DataStoreService_0:GetDataStore("HttpRequestsCache");
end);
if l_status_0 then
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 132 ]]
        -- upvalues: l_result_0 (copy)
        return l_result_0:GetAsync("index") or {};
    end);
    if l_status_1 then
        v6.global_cache_index = l_result_1;
        v6.global_cache_update_interval = 20;
        coroutine.wrap(function() --[[ Line: 140 ]]
            -- upvalues: v6 (copy), v25 (ref), l_result_0 (copy), v5 (copy), v4 (copy), l_MessagingService_0 (copy), v3 (copy)
            while wait(v6.global_cache_update_interval) do
                pcall(function() --[[ Line: 142 ]]
                    -- upvalues: v25 (ref), l_result_0 (ref), v5 (ref), v6 (ref), v4 (ref), l_MessagingService_0 (ref), v3 (ref)
                    local v30 = 0;
                    for v31, v32 in pairs(v25) do
                        l_result_0:SetAsync(v31, v32);
                        v30 = v30 + 1;
                    end;
                    if v30 > 0 then
                        v5(("pushing %s requests to global cache index"):format(v30));
                    end;
                    local v33 = {};
                    l_result_0:UpdateAsync("index", function(v34) --[[ Line: 155 ]]
                        -- upvalues: v25 (ref), v33 (copy), v6 (ref)
                        v34 = v34 or {};
                        for v35, _ in pairs(v25) do
                            table.insert(v33, v35);
                            v34[v35] = true;
                            v6.global_cache_index[v35] = true;
                        end;
                        return v34;
                    end);
                    if not v4 then
                        l_MessagingService_0:PublishAsync("RequestsCacheIndex", v3.enc(v33));
                    end;
                    v25 = {};
                end);
            end;
        end)();
        if not v4 then
            l_MessagingService_0:SubscribeAsync("RequestsCacheIndex", function(v37) --[[ Line: 177 ]]
                -- upvalues: v3 (copy), v6 (copy)
                local v38 = v3.dec(v37.Data);
                for _, v40 in ipairs(v38) do
                    v6.global_cache_index[v40] = true;
                end;
            end);
        end;
    end;
end;
v6.get_expire = function(v41) --[[ Line: 192 ]] --[[ Name: get_expire ]]
    -- upvalues: v6 (copy)
    local v42 = v6.should_cache(v41);
    return v6.settings[v42].expires or 1e999;
end;
v6.get_cached = function(v43, v44) --[[ Line: 198 ]] --[[ Name: get_cached ]]
    -- upvalues: v6 (copy), l_status_0 (copy), v5 (copy), l_result_0 (copy)
    local v45 = v6.should_cache(v43);
    local v46 = v6.data[v44];
    if v46 then
        return v46, "local";
    elseif l_status_0 and v6.settings[v45].cache_globally then
        v5("accessing datastore cache for", v44);
        return l_result_0:GetAsync(v44), "global";
    else
        return;
    end;
end;
v6.update_cache = function(v47, v48, v49) --[[ Line: 214 ]] --[[ Name: update_cache ]]
    -- upvalues: v6 (copy), l_status_0 (copy), v5 (copy), v25 (ref)
    print(("[http] %s added to cache"):format(v47));
    v49.timestamp = tick();
    v6.data[v48] = v49;
    local v50 = v6.should_cache(v47);
    if l_status_0 and v6.settings[v50].cache_globally then
        v5("queued", v48);
        v25[v48] = v49;
        return;
    else
        return;
    end;
end;
return v6;