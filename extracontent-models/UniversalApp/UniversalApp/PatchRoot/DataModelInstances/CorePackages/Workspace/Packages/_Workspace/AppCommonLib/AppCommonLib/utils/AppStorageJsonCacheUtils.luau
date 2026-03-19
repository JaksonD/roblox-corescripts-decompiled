local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_AppStorageService_0 (copy), l_HttpService_0 (copy), v2 (copy)
    local v4 = {
        _appStorageService = v3 or l_AppStorageService_0, 
        _httpService = l_HttpService_0, 
        _jsonDecodeCache = {}
    };
    setmetatable(v4, v2);
    return v4;
end;
v2.getCachedJsonForKey = function(v5, v6, v7) --[[ Line: 30 ]] --[[ Name: getCachedJsonForKey ]]
    local v8 = nil;
    if v5._jsonDecodeCache[v6] == nil or v7 then
        v8 = v5:decodeInternal(v6);
        v5._jsonDecodeCache[v6] = v8;
    else
        v8 = v5._jsonDecodeCache[v6];
    end;
    return v8.result;
end;
v2.decodeInternal = function(v9, v10) --[[ Line: 41 ]] --[[ Name: decodeInternal ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
        -- upvalues: v9 (copy), v10 (copy)
        return v9._appStorageService:GetItem(v10);
    end);
    if not l_status_0 then
        return {
            result = nil
        };
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 50 ]]
            -- upvalues: v9 (copy), l_result_0 (copy)
            return v9._httpService:JSONDecode(l_result_0);
        end);
        if not l_status_1 then
            return {
                result = nil
            };
        else
            return {
                result = l_result_1
            };
        end;
    end;
end;
v2.default = v2.new(nil);
return v2;