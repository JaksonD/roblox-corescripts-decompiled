local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.InternalHttpStore);
local v3 = require(script.Parent.createHttpStore);
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7, v8 = v1.createSignal(nil);
v5 = v7;
v6 = v8;
return {
    _create = function(v9) --[[ Line: 24 ]] --[[ Name: _create ]]
        -- upvalues: v4 (ref), v3 (copy), v6 (ref)
        v4 = v3(v9);
        v6(v4);
        return v4;
    end, 
    _dispose = function() --[[ Line: 30 ]] --[[ Name: _dispose ]]
        -- upvalues: v5 (ref), v6 (ref)
        local v10 = v5();
        if v10 ~= nil then
            v10.cancelAll();
        end;
        v6(nil);
    end, 
    get = function(v11) --[[ Line: 38 ]] --[[ Name: get ]]
        -- upvalues: v5 (ref)
        return v5(v11);
    end
};