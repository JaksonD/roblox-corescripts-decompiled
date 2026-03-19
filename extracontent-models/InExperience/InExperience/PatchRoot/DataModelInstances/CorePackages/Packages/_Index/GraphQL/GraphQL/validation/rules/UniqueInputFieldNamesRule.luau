local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local _ = require(l_Parent_0.language.visitor);
local _ = require(script.Parent.Parent.ValidationContext);
local l_language_0 = l_Parent_0.language;
local _ = require(l_language_0.ast);
return {
    UniqueInputFieldNamesRule = function(v6) --[[ Line: 30 ]]
        -- upvalues: l_GraphQLError_0 (copy)
        local v7 = {};
        local v8 = {};
        return {
            ObjectValue = {
                enter = function() --[[ Line: 36 ]] --[[ Name: enter ]]
                    -- upvalues: v7 (copy), v8 (ref)
                    table.insert(v7, v8);
                    v8 = {};
                end, 
                leave = function() --[[ Line: 40 ]] --[[ Name: leave ]]
                    -- upvalues: v8 (ref), v7 (copy)
                    v8 = table.remove(v7);
                end
            }, 
            ObjectField = function(_, v10) --[[ Line: 45 ]] --[[ Name: ObjectField ]]
                -- upvalues: v8 (ref), v6 (copy), l_GraphQLError_0 (ref)
                local l_value_0 = v10.name.value;
                if v8[l_value_0] then
                    v6:reportError(l_GraphQLError_0.new(("There can be only one input field named \"%s\"."):format(l_value_0), {
                        v8[l_value_0], 
                        v10.name
                    }));
                    return;
                else
                    v8[l_value_0] = v10.name;
                    return;
                end;
            end
        };
    end
};