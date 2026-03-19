local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local v3 = require(script.Parent.Parent.Analytics.Enums);
local l_Contexts_0 = v3.Contexts;
local l_EventTypes_0 = v3.EventTypes;
local l_SubPages_0 = v3.SubPages;
local l_Pages_0 = v3.Pages;
local _ = require(script.Parent.Parent.Analytics.FireEvent.Types);
local v9 = require(script.Parent.Parent.Utils.isEnum);
local l_t_0 = v1.t;
local v11 = require(script.Parent.formatKeyValidationError);
local v12 = require(script.Parent.formatErrorForIncorrectKey);
local v13 = l_t_0.strictInterface({
    context = l_t_0.any, 
    eventType = l_t_0.any, 
    additionalInfo = l_t_0.optional(l_t_0.table), 
    formatRulesForAdditionalInfo = l_t_0.optional(l_t_0.table)
});
return function(v14, v15) --[[ Line: 23 ]]
    -- upvalues: l_llama_0 (copy), v9 (copy), l_Contexts_0 (copy), v11 (copy), l_EventTypes_0 (copy), v12 (copy), v13 (copy), l_SubPages_0 (copy), l_Pages_0 (copy)
    l_llama_0.Dictionary.map(v14, function(v16, v17) --[[ Line: 24 ]]
        -- upvalues: v9 (ref), l_Contexts_0 (ref), v11 (ref), l_EventTypes_0 (ref), v12 (ref), v13 (ref), l_SubPages_0 (ref), l_Pages_0 (ref), l_llama_0 (ref), v15 (copy)
        local v18 = if v9(v17) then v17.rawValue() else v17;
        assert(l_Contexts_0.isEnumValue(v16.context), v11("context", "a Context enum", v18));
        assert(l_EventTypes_0.isEnumValue(v16.eventType), v11("eventType", "an EventType enum", v18));
        local v19 = true;
        if type(v16.additionalInfo) ~= "table" then
            v19 = v16.additionalInfo == nil;
        end;
        assert(v19, v11("additionalInfo", "nil or a table", v18));
        v19 = true;
        if type(v16.formatRulesForAdditionalInfo) ~= "table" then
            v19 = v16.formatRulesForAdditionalInfo == nil;
        end;
        assert(v19, v11("formatRulesForAdditionalInfo", "nil or a table", v18));
        assert(v12(v13)(v16, v18));
        if v16.additionalInfo then
            v19 = true;
            if v16.additionalInfo.subpage ~= nil then
                v19 = l_SubPages_0.isEnumValue(v16.additionalInfo.subpage);
            end;
            assert(v19, v11("subpage additional info", "SubPages enum", v18));
            v19 = true;
            if v16.additionalInfo.page ~= nil then
                v19 = l_Pages_0.isEnumValue(v16.additionalInfo.page);
            end;
            assert(v19, v11("page additional info", "Pages enum", v18));
            l_llama_0.Dictionary.map(v15 or {}, function(v20, v21) --[[ Line: 53 ]]
                -- upvalues: v16 (copy), v18 (copy)
                assert(v20(v16.additionalInfo[v21]), v21 .. " key is invalid. Issue with: " .. v18);
            end);
        end;
    end);
    return true;
end;