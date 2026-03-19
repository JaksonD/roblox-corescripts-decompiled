local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UrlBuilder);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.AcceptTransferModel);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local function _(v9) --[[ Line: 20 ]] --[[ Name: acceptTransferUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = ("transfer/v1/robux-transfer/accept-transfer/%*"):format(v9)
    })();
end;
local v11 = v3.strictInterface({
    transferRequestId = v3.string
});
return function(v12, v13) --[[ Line: 31 ]] --[[ Name: acceptTransferRequest ]]
    -- upvalues: v11 (copy), v6 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), v5 (copy), v4 (copy)
    assert(v11(v12));
    local v14 = v6.new(v13);
    local l_transferRequestId_0 = v12.transferRequestId;
    return v14:post(l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = ("transfer/v1/robux-transfer/accept-transfer/%*"):format(l_transferRequestId_0)
    })(), {
        recipientId = 0
    }):andThen(function(v16) --[[ Line: 37 ]]
        -- upvalues: v5 (ref)
        local v17 = v5.format(v16);
        print("[acceptTransferRequest] Formatted result:", v17);
        return v17;
    end):catch(function(v18) --[[ Line: 42 ]]
        -- upvalues: v4 (ref)
        print("[acceptTransferRequest] Error response:", v18);
        return v4.reject(v18);
    end);
end;