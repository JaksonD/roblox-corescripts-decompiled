local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local v3 = require(script.Parent.Parent.Utils.isEnum);
local l_t_0 = v1.t;
local v5 = require(script.Parent.formatKeyValidationError);
local v6 = require(script.Parent.formatErrorForIncorrectKey)(l_t_0.strictInterface({
    name = l_t_0.any, 
    counter = l_t_0.optional(l_t_0.any)
}));
return function(v7) --[[ Line: 14 ]]
    -- upvalues: l_llama_0 (copy), v3 (copy), v5 (copy), v6 (copy)
    l_llama_0.Dictionary.map(v7, function(v8, v9) --[[ Line: 15 ]]
        -- upvalues: v3 (ref), v5 (ref), v6 (ref)
        local v10 = if v3(v9) then v9.rawValue() else v9;
        assert(type(v8.name) == "string", v5("name", "a string", v10));
        local v11 = true;
        if type(v8.counter) ~= "number" then
            v11 = v8.counter == nil;
        end;
        assert(v11, v5("counter", "nil or a number", v10));
        assert(v6(v8, v10));
    end);
    return true;
end;