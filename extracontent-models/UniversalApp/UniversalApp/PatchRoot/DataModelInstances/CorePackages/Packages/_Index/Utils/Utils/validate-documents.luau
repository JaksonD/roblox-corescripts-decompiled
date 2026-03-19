local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v7.Kind;
local l_validate_0 = v7.validate;
local l_specifiedRules_0 = v7.specifiedRules;
local l_concatAST_0 = v7.concatAST;
local l_versionInfo_0 = v7.versionInfo;
local _ = require(script.Parent.loaders);
local l_AggregateError_0 = require(script.Parent.AggregateError).AggregateError;
local v15 = nil;
v6.validateGraphQlDocuments = function(v16, v17, v18) --[[ Line: 66 ]] --[[ Name: validateGraphQlDocuments ]]
    -- upvalues: v15 (ref), v5 (copy), l_Map_0 (copy), l_Kind_0 (copy), l_Array_0 (copy), l_concatAST_0 (copy), l_validate_0 (copy)
    local v19 = if v18 ~= nil then v18 else v15();
    return v5.resolve():andThen(function() --[[ Line: 74 ]]
        -- upvalues: l_Map_0 (ref), v17 (copy), l_Kind_0 (ref), l_Array_0 (ref), v5 (ref), l_concatAST_0 (ref), l_validate_0 (ref), v16 (copy), v19 (copy)
        local v20 = l_Map_0.new();
        local v21 = {};
        for _, v23 in v17 do
            if v23.document then
                local v24 = {};
                for _, v26 in v23.document.definitions do
                    if v26.kind == l_Kind_0.FRAGMENT_DEFINITION then
                        v20:set(v26.name.value, v26);
                    else
                        table.insert(v24, v26);
                    end;
                end;
                table.insert(v21, {
                    location = v23.location, 
                    document = {
                        kind = l_Kind_0.DOCUMENT, 
                        definitions = v24
                    }
                });
            end;
        end;
        local v27 = {};
        local v28 = {
            kind = l_Kind_0.DOCUMENT, 
            definitions = l_Array_0.concat({}, v20:values())
        };
        v5.all(l_Array_0.map(v21, function(v29) --[[ Line: 104 ]]
            -- upvalues: v5 (ref), l_concatAST_0 (ref), v28 (copy), l_validate_0 (ref), v16 (ref), v19 (ref), v27 (copy)
            return v5.resolve():andThen(function() --[[ Line: 105 ]]
                -- upvalues: l_concatAST_0 (ref), v28 (ref), v29 (copy), l_validate_0 (ref), v16 (ref), v19 (ref), v27 (ref)
                local v30 = l_concatAST_0({
                    v28, 
                    v29.document
                });
                local v31 = l_validate_0(v16, v30, v19);
                if #v31 > 0 then
                    table.insert(v27, {
                        filePath = v29.location, 
                        errors = v31
                    });
                end;
            end);
        end)):expect();
        return v27;
    end);
end;
v6.checkValidationErrors = function(v32) --[[ Line: 123 ]] --[[ Name: checkValidationErrors ]]
    -- upvalues: l_Error_0 (copy), l_AggregateError_0 (copy), l_Array_0 (copy)
    if #v32 > 0 then
        local v33 = {};
        for _, v35 in v32 do
            for _, v37 in v35.errors do
                local v38 = l_Error_0.new();
                v38.name = "GraphQLDocumentError";
                v38.message = ("%s: %s"):format(tostring(v38.name), (tostring(v37.message)));
                v38.stack = v38.message;
                if v37.locations then
                    for _, v40 in v37.locations do
                        v38.stack = tostring(v38.stack) .. ("\n    at %s:%s:%s"):format(tostring(v35.filePath), tostring(v40.line), (tostring(v40.column)));
                    end;
                end;
                table.insert(v33, v38);
            end;
        end;
        error(l_AggregateError_0.new(v33, ("GraphQL Document Validation failed with %s errors;\n  %s"):format(tostring(#v33), (tostring(l_Array_0.join(l_Array_0.map(v33, function(v41, v42) --[[ Line: 170 ]]
            return ("Error %s: %s"):format(tostring(v42), (tostring(v41.stack)));
        end), "\n\n"))))));
    end;
end;
v15 = function() --[[ Line: 185 ]] --[[ Name: createDefaultRules ]]
    -- upvalues: l_versionInfo_0 (copy), l_Array_0 (copy), l_specifiedRules_0 (copy)
    local v43 = {
        "NoUnusedFragmentsRule", 
        "NoUnusedVariablesRule", 
        "KnownDirectivesRule"
    };
    if l_versionInfo_0.major < 15 then
        v43 = l_Array_0.map(v43, function(v44) --[[ Line: 192 ]]
            return (v44:gsub("Rule$", "", 1));
        end);
    end;
    return l_Array_0.filter(l_specifiedRules_0, function(v45) --[[ Line: 200 ]]
        -- upvalues: l_Array_0 (ref), v43 (ref)
        local v46 = debug.info(v45, "n");
        return not l_Array_0.includes(v43, v46);
    end);
end;
v6.createDefaultRules = v15;
return v6;