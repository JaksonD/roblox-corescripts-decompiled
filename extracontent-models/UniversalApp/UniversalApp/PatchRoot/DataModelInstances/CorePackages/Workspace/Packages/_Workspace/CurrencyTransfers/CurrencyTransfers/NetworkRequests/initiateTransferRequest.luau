local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UrlBuilder);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.InitiateTransferModel);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "transfer/v1/robux-transfer/initiate-transfer"
})();
local v10 = v3.strictInterface({
    recipientId = v3.number, 
    transferOrigination = v3.optional(v3.string)
});
return function(v11, v12) --[[ Line: 31 ]] --[[ Name: initiateTransferRequest ]]
    -- upvalues: v10 (copy), v6 (copy), v9 (copy), v5 (copy), v4 (copy)
    assert(v10(v11));
    local v13 = v6.new(v12);
    local v14 = {
        recipientId = v11.recipientId
    };
    if v11.transferOrigination then
        v14.transferOrigination = v11.transferOrigination;
    end;
    return v13:post(v9, v14):andThen(function(v15) --[[ Line: 43 ]]
        -- upvalues: v5 (ref)
        local v16 = v5.format(v15);
        print("[initiateTransferRequest] Formatted result:", v16);
        return v16;
    end):catch(function(v17) --[[ Line: 48 ]]
        -- upvalues: v4 (ref)
        print("[initiateTransferRequest] Error response:", v17);
        return v4.reject(v17);
    end);
end;