local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_devAssert_0 = require(l_Parent_1.jsutils.devAssert).devAssert;
local l_GraphQLError_0 = require(l_Parent_1.error.GraphQLError).GraphQLError;
local _ = require(l_Parent_1.language.ast);
local _ = require(l_Parent_1.type.schema);
local v10 = require(l_Parent_1.language.visitor);
local l_visit_0 = v10.visit;
local l_visitInParallel_0 = v10.visitInParallel;
local l_assertValidSchema_0 = require(l_Parent_1.type.validate).assertValidSchema;
local v14 = require(l_Parent_1.utilities.TypeInfo);
local l_TypeInfo_0 = v14.TypeInfo;
local l_visitWithTypeInfo_0 = v14.visitWithTypeInfo;
local v17 = require(l_Parent_0.specifiedRules);
local l_specifiedRules_0 = v17.specifiedRules;
local l_specifiedSDLRules_0 = v17.specifiedSDLRules;
local v20 = require(l_Parent_0.ValidationContext);
local l_SDLValidationContext_0 = v20.SDLValidationContext;
local l_ValidationContext_0 = v20.ValidationContext;
local v48 = {
    validate = function(v23, v24, v25, v26, v27) --[[ Line: 64 ]]
        -- upvalues: l_specifiedRules_0 (copy), l_TypeInfo_0 (copy), l_devAssert_0 (copy), l_assertValidSchema_0 (copy), l_ValidationContext_0 (copy), l_GraphQLError_0 (copy), l_visitInParallel_0 (copy), l_Array_0 (copy), l_visit_0 (copy), l_visitWithTypeInfo_0 (copy)
        local v28 = v25 or l_specifiedRules_0;
        local v29 = v26 or {
            maxErrors = nil
        };
        local v30 = v27 or l_TypeInfo_0.new(v23);
        l_devAssert_0(v24, "Must provide document.");
        l_assertValidSchema_0(v23);
        local v31 = {};
        local v32 = {};
        local v34 = l_ValidationContext_0.new(v23, v24, v30, function(v33) --[[ Line: 82 ]]
            -- upvalues: v29 (copy), v32 (copy), l_GraphQLError_0 (ref), v31 (copy)
            if v29.maxErrors ~= nil and #v32 >= v29.maxErrors then
                table.insert(v32, l_GraphQLError_0.new("Too many validation errors, error limit reached. Validation aborted."));
                error(v31);
            end;
            table.insert(v32, v33);
        end);
        local v36 = l_visitInParallel_0(l_Array_0.map(v28, function(v35) --[[ Line: 98 ]]
            -- upvalues: v34 (copy)
            return v35(v34);
        end));
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 103 ]]
            -- upvalues: l_visit_0 (ref), v24 (copy), l_visitWithTypeInfo_0 (ref), v30 (copy), v36 (copy)
            l_visit_0(v24, l_visitWithTypeInfo_0(v30, v36));
        end);
        if not l_status_0 and l_result_0 ~= v31 then
            error(l_result_0);
        end;
        return v32;
    end, 
    validateSDL = function(v39, v40, v41) --[[ Line: 118 ]]
        -- upvalues: l_specifiedSDLRules_0 (copy), l_SDLValidationContext_0 (copy), l_Array_0 (copy), l_visit_0 (copy), l_visitInParallel_0 (copy)
        local v42 = v41 or l_specifiedSDLRules_0;
        local v43 = {};
        local v45 = l_SDLValidationContext_0.new(v39, v40, function(v44) --[[ Line: 126 ]]
            -- upvalues: v43 (copy)
            table.insert(v43, v44);
        end);
        local v47 = l_Array_0.map(v42, function(v46) --[[ Line: 129 ]]
            -- upvalues: v45 (copy)
            return v46(v45);
        end);
        l_visit_0(v39, l_visitInParallel_0(v47));
        return v43;
    end
};
v48.assertValidSDL = function(v49) --[[ Line: 142 ]]
    -- upvalues: v48 (copy), l_Error_0 (copy), l_Array_0 (copy)
    local v50 = v48.validateSDL(v49);
    if #v50 ~= 0 then
        error(l_Error_0.new(table.concat(l_Array_0.map(v50, function(v51) --[[ Line: 146 ]]
            return v51.message;
        end), "\n\n")));
    end;
end;
v48.assertValidSDLExtension = function(v52, v53) --[[ Line: 160 ]]
    -- upvalues: v48 (copy), l_Error_0 (copy), l_Array_0 (copy)
    local v54 = v48.validateSDL(v52, v53);
    if #v54 ~= 0 then
        error(l_Error_0.new(table.concat(l_Array_0.map(v54, function(v55) --[[ Line: 164 ]]
            if typeof(v55) == "string" then
                return v55;
            else
                return v55.message;
            end;
        end), "\n\n")));
    end;
end;
return v48;