local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = l_script_FirstAncestor_0.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v3 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local function v5() --[[ Line: 10 ]] --[[ Name: getEconomyUserCurrencyUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local v4 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
    v4 = string.gsub(v4, "http:", "https:");
    return string.gsub(v4, "https://www.", "https://economy.") .. "v1/user/currency";
end;
return function(v6) --[[ Line: 18 ]] --[[ Name: getBalanceRequest ]]
    -- upvalues: v3 (copy), v5 (copy)
    return v3.new(v6):get((v5())):andThen(function(v7) --[[ Line: 21 ]]
        return (if v7.robux ~= nil then v7.robux else v7.Robux) or 0;
    end);
end;