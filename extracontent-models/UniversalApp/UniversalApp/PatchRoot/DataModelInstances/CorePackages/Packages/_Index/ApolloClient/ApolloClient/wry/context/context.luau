local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local l_Slot_0 = require(script.Parent.slot).Slot;
v2.Slot = l_Slot_0;
local l_bind_0 = l_Slot_0.bind;
local l_noContext_0 = l_Slot_0.noContext;
v2.bind = l_bind_0;
v2.noContext = l_noContext_0;
local l_setTimeout_0 = v1.setTimeout;
v2.setTimeout = function(v7, v8) --[[ Line: 27 ]] --[[ Name: setTimeoutWithContext ]]
    -- upvalues: l_setTimeout_0 (copy), l_bind_0 (copy)
    return l_setTimeout_0(l_bind_0(v7), v8);
end;
return v2;