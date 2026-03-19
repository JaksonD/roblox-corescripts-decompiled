local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.Parent.language.ast);
concatAST = function(v3) --[[ Line: 23 ]] --[[ Name: concatAST ]]
    -- upvalues: l_Array_0 (copy)
    local v4 = {};
    for _, v6 in ipairs(v3) do
        v4 = l_Array_0.concat(v4, v6.definitions);
    end;
    return {
        kind = "Document", 
        definitions = v4
    };
end;
return {
    concatAST = concatAST
};