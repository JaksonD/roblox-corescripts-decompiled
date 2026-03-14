local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_supportsTestSelectors_0 = require(script.Parent.ReactFiberHostConfig).supportsTestSelectors;
local v3 = {};
local v4 = {};
v3.onCommitRoot = function() --[[ Line: 512 ]]
    -- upvalues: l_supportsTestSelectors_0 (copy), v4 (copy)
    if l_supportsTestSelectors_0 then
        for _, v6 in v4 do
            v6();
        end;
    end;
end;
return v3;