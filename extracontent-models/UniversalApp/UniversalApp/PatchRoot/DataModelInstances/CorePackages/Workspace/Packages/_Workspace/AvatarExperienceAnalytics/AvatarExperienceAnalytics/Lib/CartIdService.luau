local l_HttpService_0 = game:GetService("HttpService");
local v1 = l_HttpService_0:GenerateGUID(false);
local function v2() --[[ Line: 5 ]] --[[ Name: getCartId ]]
    -- upvalues: v1 (ref)
    return v1;
end;
local function v3() --[[ Line: 9 ]] --[[ Name: refreshCartId ]]
    -- upvalues: v1 (ref), l_HttpService_0 (copy)
    v1 = l_HttpService_0:GenerateGUID(false);
end;
return {
    getCartId = v2, 
    refreshCartId = v3
};