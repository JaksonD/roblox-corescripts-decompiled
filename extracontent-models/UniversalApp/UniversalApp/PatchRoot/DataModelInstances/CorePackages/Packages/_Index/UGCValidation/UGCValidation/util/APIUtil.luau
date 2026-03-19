local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v7 = {
    getBaseDomain = function() --[[ Line: 10 ]] --[[ Name: getBaseDomain ]]
        -- upvalues: l_ContentProvider_0 (copy)
        local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
        if string.sub(l_BaseUrl_0, #l_BaseUrl_0) ~= "/" then
            l_BaseUrl_0 = l_BaseUrl_0 .. "/";
        end;
        local _, v4 = string.find(l_BaseUrl_0, "://");
        local _, v6 = string.find(l_BaseUrl_0, "%.", v4 + 1);
        return (string.sub(l_BaseUrl_0, v6 + 1));
    end
};
local function v8(v9, v10) --[[ Line: 21 ]] --[[ Name: requestAndRetry ]]
    -- upvalues: v8 (copy)
    if v10 == nil then
        v10 = 0;
    end;
    local l_status_0, l_result_0 = pcall(v9);
    if l_status_0 then
        return true, l_result_0;
    elseif v10 >= 2 then
        return false, l_result_0;
    else
        local v13 = 2 ^ (v10 - 1);
        wait(v13);
        return v8(v9, v10 + 1);
    end;
end;
v7.requestAndRetryPost = function(v14, v15) --[[ Line: 39 ]] --[[ Name: requestAndRetryPost ]]
    -- upvalues: v8 (copy), l_HttpRbxApiService_0 (copy)
    return v8(function() --[[ Line: 40 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v14 (copy), v15 (copy)
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v14, v15);
    end);
end;
v7.requestAndRetryGet = function(v16) --[[ Line: 45 ]] --[[ Name: requestAndRetryGet ]]
    -- upvalues: v8 (copy), l_HttpRbxApiService_0 (copy)
    return v8(function() --[[ Line: 46 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v16 (copy)
        return l_HttpRbxApiService_0:GetAsyncFullUrl(v16);
    end);
end;
return v7;