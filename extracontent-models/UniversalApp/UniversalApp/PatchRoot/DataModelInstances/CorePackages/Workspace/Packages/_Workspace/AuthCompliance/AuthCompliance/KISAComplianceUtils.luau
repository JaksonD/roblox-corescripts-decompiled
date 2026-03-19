local l_Parent_0 = script.Parent;
local l_llama_0 = require(l_Parent_0.dependencies).llama;
local v6 = {
    createIdToAgreementMap = function(v2) --[[ Line: 16 ]]
        local v3 = {};
        for _, v5 in v2 do
            v3[v5.id] = v5.agreementType;
        end;
        return v3;
    end
};
v6.getCheckBoxStatusVariables = function(v7, v8) --[[ Line: 24 ]]
    -- upvalues: v6 (copy)
    local v9 = true;
    local v10 = false;
    local v11 = true;
    local v12 = v6.createIdToAgreementMap(v8);
    for v13, v14 in v7 do
        local v15 = v12[v13];
        local v16 = string.find(v15:lower(), "optional");
        if v16 then
            v10 = true;
        end;
        if not v14 then
            v11 = false;
            if not v16 then
                v9 = false;
            end;
        end;
    end;
    return v9, v10, v11;
end;
v6.getAgreedUserAgreements = function(v17) --[[ Line: 52 ]]
    -- upvalues: l_llama_0 (copy)
    local v19 = l_llama_0.Dictionary.filter(v17, function(v18) --[[ Line: 53 ]]
        return v18 == true;
    end);
    return (l_llama_0.Dictionary.keys(v19));
end;
return v6;