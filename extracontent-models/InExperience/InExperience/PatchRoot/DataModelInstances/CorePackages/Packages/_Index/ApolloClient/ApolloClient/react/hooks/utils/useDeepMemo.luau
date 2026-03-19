local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_useRef_0 = require(l_Parent_1.React).useRef;
local v4 = require(l_Parent_0.jsutils.equal);
v0.useDeepMemo = function(v5, v6) --[[ Line: 26 ]] --[[ Name: useDeepMemo ]]
    -- upvalues: l_useRef_0 (copy), v4 (copy)
    local v7 = l_useRef_0(nil);
    if not v7.current or not v4(v6, v7.current.key) then
        v7.current = {
            key = v6, 
            value = v5()
        };
    end;
    return v7.current.value;
end;
return v0;