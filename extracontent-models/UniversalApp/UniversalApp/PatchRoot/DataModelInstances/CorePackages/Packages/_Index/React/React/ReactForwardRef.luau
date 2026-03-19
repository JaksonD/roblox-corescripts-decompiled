local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
return {
    forwardRef = function(v7) --[[ Line: 33 ]]
        -- upvalues: v1 (copy), l_REACT_MEMO_TYPE_0 (copy), l_console_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy)
        if v1.__DEV__ then
            if typeof(v7) == "table" and v7["$$typeof"] == l_REACT_MEMO_TYPE_0 then
                l_console_0.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).");
            elseif typeof(v7) ~= "function" then
                l_console_0.error("forwardRef requires a render function but was given %s.", (typeof(v7)));
            else
                local v8, _ = debug.info(v7, "a");
                if v8 ~= 0 and v8 ~= 2 then
                    l_console_0.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v8 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.");
                end;
            end;
        end;
        local v10 = {
            ["$$typeof"] = l_REACT_FORWARD_REF_TYPE_0, 
            render = v7
        };
        if v1.__DEV__ then
            local v11 = nil;
            do
                local l_v11_0 = v11;
                setmetatable(v10, {
                    __index = function(v13, v14) --[[ Line: 96 ]] --[[ Name: __index ]]
                        -- upvalues: l_v11_0 (ref)
                        if v14 == "displayName" then
                            return l_v11_0;
                        else
                            return (rawget(v13, v14));
                        end;
                    end, 
                    __newindex = function(v15, v16, v17) --[[ Line: 102 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_v11_0 (ref)
                        if v16 == "displayName" then
                            l_v11_0 = v17;
                            return;
                        else
                            rawset(v15, v16, v17);
                            return;
                        end;
                    end
                });
            end;
        end;
        return v10;
    end
};