local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UrlBuilder);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.ProcessTransferModel);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local function _(v9) --[[ Line: 21 ]] --[[ Name: processTransferUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = ("transfer/v1/robux-transfer/process-transfer/%*"):format(v9)
    })();
end;
local v11 = v3.strictInterface({
    transferRequestId = v3.string, 
    robuxAmount = v3.number
});
return function(v12, v13) --[[ Line: 33 ]] --[[ Name: processTransferRequest ]]
    -- upvalues: v11 (copy), v6 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), v5 (copy), v4 (copy)
    assert(v11(v12));
    local v14 = v6.new(v13);
    local l_transferRequestId_0 = v12.transferRequestId;
    return v14:post(l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = ("transfer/v1/robux-transfer/process-transfer/%*"):format(l_transferRequestId_0)
    })(), {
        robuxAmount = v12.robuxAmount
    }):andThen(function(v16) --[[ Line: 41 ]]
        -- upvalues: v5 (ref)
        return v5.format(v16);
    end):catch(function(v17) --[[ Line: 44 ]]
        -- upvalues: v4 (ref)
        return v4.reject(v17);
    end);
end;