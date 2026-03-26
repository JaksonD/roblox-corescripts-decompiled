local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UrlBuilder);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.GetTransferByIdModel);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local function v10(v9) --[[ Line: 20 ]] --[[ Name: getTransferByIdUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = ("transfer/v1/robux-transfer/transfer/%*"):format(v9)
    })();
end;
local v11 = v3.strictInterface({
    transferRequestId = v3.string
});
return function(v12, v13) --[[ Line: 31 ]] --[[ Name: getTransferRequestByIdRequest ]]
    -- upvalues: v11 (copy), v6 (copy), v10 (copy), v5 (copy), v4 (copy)
    assert(v11(v12));
    return v6.new(v13):get(v10(v12.transferRequestId)):andThen(function(v14) --[[ Line: 37 ]]
        -- upvalues: v5 (ref)
        return v5.format(v14);
    end):catch(function(v15) --[[ Line: 40 ]]
        -- upvalues: v4 (ref)
        return v4.reject(v15);
    end);
end;