local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UrlBuilder);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_script_FirstAncestor_0.Models.InitiateTransferModel);
local v6 = require(l_script_FirstAncestor_0.NetworkRequests.HttpRequest);
local v7 = require(l_script_FirstAncestor_0.Enums.TransferOrigination);
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "transfer/v1/robux-transfer/initiate-transfer"
})();
local v11 = v3.strictInterface({
    recipientId = v3.number, 
    transferOrigination = v3.optional(v3.string)
});
return function(v12, v13) --[[ Line: 32 ]] --[[ Name: initiateTransferRequest ]]
    -- upvalues: v11 (copy), v6 (copy), v7 (copy), v10 (copy), v5 (copy), v4 (copy)
    assert(v11(v12));
    local v14 = v6.new(v13);
    local v15 = v12.transferOrigination or v7.Unknown;
    local v16 = v7.toEnumInteger[v15] or v7.toEnumInteger[v7.Unknown];
    local v17 = {
        recipientId = v12.recipientId, 
        transferOrigin = v16
    };
    return v14:post(v10, v17):andThen(function(v18) --[[ Line: 47 ]]
        -- upvalues: v5 (ref)
        local v19 = v5.format(v18);
        print("[initiateTransferRequest] Formatted result:", v19);
        return v19;
    end):catch(function(v20) --[[ Line: 52 ]]
        -- upvalues: v4 (ref)
        print("[initiateTransferRequest] Error response:", v20);
        return v4.reject(v20);
    end);
end;