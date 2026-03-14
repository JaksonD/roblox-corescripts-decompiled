local l_LocalizationService_0 = game:GetService("LocalizationService");
return function(v1, v2, v3, v4, v5, v6) --[[ Line: 13 ]]
    -- upvalues: l_LocalizationService_0 (copy)
    assert(type(v2) == "string", "Expected eventContext to be a string");
    assert(type(v3) == "string", "Expected act to be a string");
    if v4 then
        assert(type(v4) == "string", "Expected keyword to be a string");
    end;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    v1:setRBXEventStream(v2, "search", {
        act = v3, 
        kwd = v4, 
        locale = l_RobloxLocaleId_0, 
        isAutoSearchType = v5 or false, 
        currentPage = v6
    });
end;