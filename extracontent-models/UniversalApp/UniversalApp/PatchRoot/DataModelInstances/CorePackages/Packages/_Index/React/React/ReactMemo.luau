local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.Shared);
local l_console_0 = v2.console;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_inspect_0 = v4.util.inspect;
local l_ReactSymbols_0 = v2.ReactSymbols;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_isValidElementType_0 = v2.isValidElementType;
local l_getComponentName_0 = v2.getComponentName;
return {
    memo = function(v13, v14) --[[ Line: 47 ]]
        -- upvalues: v1 (copy), l_isValidElementType_0 (copy), l_Object_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_getComponentName_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_REACT_MEMO_TYPE_0 (copy)
        if v1.__DEV__ and not l_isValidElementType_0(v13) then
            local v15 = "";
            if v13 == nil or typeof(v13) == "table" and #l_Object_0.keys(v13) == 0 then
                v15 = v15 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
            end;
            local v16 = nil;
            if v13 == nil then
                v16 = "nil";
            elseif l_Array_0.isArray(v13) then
                v16 = "array";
            elseif v13 ~= nil and typeof(v13) == "table" and v13["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v16 = string.format("<%s />", l_getComponentName_0(v13.type) or "UNKNOWN");
                v15 = " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v16 = typeof(v13);
                if v13 ~= nil then
                    v15 = "\n" .. l_inspect_0(v13);
                end;
            end;
            l_console_0.error("memo: The first argument must be a component. Instead received: `%s`.%s", v16, v15);
        end;
        local v17 = {
            ["$$typeof"] = l_REACT_MEMO_TYPE_0, 
            type = v13, 
            compare = v14 or nil
        };
        if v1.__DEV__ then
            local v18 = nil;
            do
                local l_v18_0 = v18;
                setmetatable(v17, {
                    __index = function(v20, v21) --[[ Line: 113 ]] --[[ Name: __index ]]
                        -- upvalues: l_v18_0 (ref)
                        if v21 == "displayName" then
                            return l_v18_0;
                        else
                            return (rawget(v20, v21));
                        end;
                    end, 
                    __newindex = function(v22, v23, v24) --[[ Line: 119 ]] --[[ Name: __newindex ]]
                        -- upvalues: l_v18_0 (ref), v13 (copy)
                        if v23 == "displayName" then
                            l_v18_0 = v24;
                            if typeof(v13) == "table" and v13.displayName == nil then
                                v13.displayName = l_v18_0;
                                return;
                            end;
                        else
                            rawset(v22, v23, v24);
                        end;
                    end
                });
            end;
        end;
        return v17;
    end
};