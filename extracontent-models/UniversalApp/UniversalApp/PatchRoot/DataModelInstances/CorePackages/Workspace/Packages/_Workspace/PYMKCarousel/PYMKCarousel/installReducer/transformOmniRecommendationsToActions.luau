local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
local v3 = require(l_Parent_0.SocialCommon);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v5 = require(script.Parent.getRecommendationsMetadata);
local l_ContextualInfoTypes_0 = v3.Enums.ContextualInfoTypes;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagTempFixInfiniteHomePYMK);
local function v13(v8, v9) --[[ Line: 25 ]]
    -- upvalues: l_llama_0 (copy)
    local v10 = v8.sorts or {};
    local v12 = l_llama_0.List.findWhere(v10, function(v11) --[[ Line: 30 ]]
        -- upvalues: v9 (copy)
        return v11.treatmentType == v9;
    end);
    if v12 then
        return v10[v12];
    else
        return nil;
    end;
end;
return function(v14, v15, v16, v17) --[[ Line: 36 ]]
    -- upvalues: v5 (copy), v13 (copy), v7 (copy), l_llama_0 (copy), l_ContextualInfoTypes_0 (copy)
    local v18 = {};
    local l_contentType_0 = v15.contentType;
    local l_treatmentType_0 = v15.treatmentType;
    for _, v22 in pairs(v14) do
        local v23 = v5(v22, l_contentType_0);
        local v24 = v13(v22, l_treatmentType_0);
        local v25 = if v24 then v24.recommendations or {} else {};
        if not v7() or #v25 ~= 0 then
            if v17 then
                v18 = l_llama_0.List.push(v18, v17(v24, v23));
            end;
            v18 = l_llama_0.List.reduce(v25, function(v26, v27, v28) --[[ Line: 61 ]]
                -- upvalues: l_ContextualInfoTypes_0 (ref), v23 (copy), v16 (copy), l_llama_0 (ref)
                local v29 = v23[if v27.contentMetadata.contextType == l_ContextualInfoTypes_0.Contacts then v27.contentStringId else tostring(v27.contentId)];
                local l_contentMetadata_0 = v27.contentMetadata;
                if not v29 then
                    return v26;
                elseif v16 then
                    return l_llama_0.List.push(v26, v16(v29, v28, l_contentMetadata_0));
                else
                    return v26;
                end;
            end, v18);
        end;
    end;
    return v18;
end;