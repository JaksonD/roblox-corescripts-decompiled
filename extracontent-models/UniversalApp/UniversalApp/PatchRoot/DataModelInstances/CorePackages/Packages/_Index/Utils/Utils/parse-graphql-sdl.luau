local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v5.Kind;
local l_parse_0 = v5.parse;
local l_Source_0 = v5.Source;
local l_visit_0 = v5.visit;
local l_isTypeSystemDefinitionNode_0 = v5.isTypeSystemDefinitionNode;
local l_print_0 = v5.print;
local v12 = require(script.Parent.comments);
local l_dedentBlockStringValue_0 = v12.dedentBlockStringValue;
local l_getLeadingCommentBlock_0 = v12.getLeadingCommentBlock;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
local v17 = nil;
local v18 = nil;
local function _(v19) --[[ Line: 51 ]] --[[ Name: removeCommentsAndTrim ]]
    -- upvalues: l_String_0 (copy)
    local v20 = string.gsub(v19, "(#[^*]*)", "");
    return l_String_0.trim(v20);
end;
v4.parseGraphQLSDL = function(v22, v23, v24) --[[ Line: 56 ]] --[[ Name: parseGraphQLSDL ]]
    -- upvalues: l_Boolean_0 (copy), l_String_0 (copy), v17 (ref), l_parse_0 (copy), l_print_0 (copy), l_Source_0 (copy), l_Kind_0 (copy)
    local v25 = false;
    local v26 = if v24 ~= nil then v24 else {};
    local v27 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
        -- upvalues: l_Boolean_0 (ref), v26 (copy), l_String_0 (ref), v23 (copy), v27 (ref), v17 (ref), l_parse_0 (ref), l_print_0 (ref), l_Source_0 (ref), v22 (copy)
        if l_Boolean_0.toJSBoolean(v26.commentDescriptions) and l_String_0.includes(v23, "#") then
            v27 = v17(v23, v26);
            if l_Boolean_0.toJSBoolean(v26.noLocation) then
                v27 = l_parse_0(l_print_0(v27), v26);
                return;
            end;
        else
            v27 = l_parse_0(l_Source_0.new(v23, v22), v26);
        end;
    end);
    if not l_status_0 then
        if l_String_0.includes(l_result_0.message, "EOF") then
            local v30 = string.gsub(v23, "(#[^*]*)", "");
            if l_String_0.trim(v30) == "" then
                v27 = {
                    kind = l_Kind_0.DOCUMENT, 
                    definitions = {}
                };
                v25 = true;
            end;
        end;
        if not v25 then
            error(l_result_0);
        end;
    end;
    v25 = false;
    return {
        location = v22, 
        document = v27
    };
end;
v17 = function(v31, v32) --[[ Line: 122 ]] --[[ Name: transformCommentsToDescriptions ]]
    -- upvalues: l_parse_0 (copy), l_Object_0 (copy), l_visit_0 (copy), l_Boolean_0 (copy), v18 (ref), l_getLeadingCommentBlock_0 (copy), l_dedentBlockStringValue_0 (copy), l_String_0 (copy), l_Kind_0 (copy)
    local v33 = if v32 ~= nil then v32 else {};
    local v34 = l_parse_0(v31, l_Object_0.assign({}, v33, {
        noLocation = false
    }));
    return (l_visit_0(v34, {
        leave = function(_, v36) --[[ Line: 129 ]] --[[ Name: leave ]]
            -- upvalues: l_Boolean_0 (ref), v18 (ref), l_getLeadingCommentBlock_0 (ref), l_dedentBlockStringValue_0 (ref), l_String_0 (ref), l_Object_0 (ref), l_Kind_0 (ref)
            if l_Boolean_0.toJSBoolean(v18(v36)) then
                local v37 = l_getLeadingCommentBlock_0(v36);
                if v37 ~= nil then
                    local v38 = l_dedentBlockStringValue_0("\n" .. tostring(v37));
                    local v39 = l_String_0.includes(v38, "\n");
                    if not l_Boolean_0.toJSBoolean(v36.description) then
                        return l_Object_0.assign({}, v36, {
                            description = {
                                kind = l_Kind_0.STRING, 
                                value = v38, 
                                block = v39
                            }
                        });
                    else
                        return l_Object_0.assign({}, v36, {
                            description = l_Object_0.assign({}, v36.description, {
                                value = v36.description.value .. "\n" .. v38, 
                                block = true
                            })
                        });
                    end;
                end;
            end;
        end
    }));
end;
v4.transformCommentsToDescriptions = v17;
v18 = function(v40) --[[ Line: 176 ]] --[[ Name: isDescribable ]]
    -- upvalues: l_isTypeSystemDefinitionNode_0 (copy), l_Kind_0 (copy)
    return l_isTypeSystemDefinitionNode_0(v40) or v40.kind == l_Kind_0.FIELD_DEFINITION or v40.kind == l_Kind_0.INPUT_VALUE_DEFINITION or v40.kind == l_Kind_0.ENUM_VALUE_DEFINITION;
end;
v4.isDescribable = v18;
return v4;