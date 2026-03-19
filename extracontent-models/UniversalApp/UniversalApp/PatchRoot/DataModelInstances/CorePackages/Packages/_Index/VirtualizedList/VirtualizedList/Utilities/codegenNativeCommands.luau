local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local function v2(...) --[[ Line: 18 ]]
    error("Not implemented. Dependencies used upstream aren't implemented");
end;
return {
    default = function(v3) --[[ Line: 31 ]]
        -- upvalues: v2 (copy)
        local v4 = {};
        for _, v6 in ipairs(v3.supportedCommands) do
            v4[v6] = function(v7, ...) --[[ Line: 35 ]]
                -- upvalues: v2 (ref), v6 (copy)
                v2(v7, v6, ...);
            end;
        end;
        return v4;
    end
};