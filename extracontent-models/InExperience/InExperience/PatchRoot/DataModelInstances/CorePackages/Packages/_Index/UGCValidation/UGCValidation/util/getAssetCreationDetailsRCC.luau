local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.util.APIUtil);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = v1.getBaseDomain();
local v4 = string.format("https://apis.%s", v3) .. "assets/rcc/v1/assets/%s";
return function(v5) --[[ Line: 15 ]] --[[ Name: getAssetCreationDetailsRCC ]]
    -- upvalues: v4 (copy), v1 (copy), l_HttpService_0 (copy)
    local v6 = string.format(v4, v5);
    local v7, v8 = v1.requestAndRetryGet(v6);
    if v7 then
        return true, l_HttpService_0:JSONDecode(v8);
    else
        return false, v8;
    end;
end;