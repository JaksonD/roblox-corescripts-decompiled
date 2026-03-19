local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = {};
local v5 = {};
local v6 = nil;
if v1.__DEV__ then
    v6 = {};
end;
local v7 = 0;
local function v9(v8) --[[ Line: 36 ]] --[[ Name: createCursor ]]
    return {
        current = v8
    };
end;
local function v10() --[[ Line: 42 ]] --[[ Name: isEmpty ]]
    -- upvalues: v7 (ref)
    return v7 == 0;
end;
local function v14(v11, v12) --[[ Line: 46 ]] --[[ Name: pop ]]
    -- upvalues: v7 (ref), v1 (copy), l_console_0 (copy), v6 (ref), v5 (copy), v4 (copy)
    if v7 < 1 then
        if v1.__DEV__ then
            l_console_0.error("Unexpected pop.");
        end;
        return;
    else
        if v1.__DEV__ and v12 ~= v6[v7] then
            l_console_0.error("Unexpected Fiber popped.");
        end;
        local v13 = v5[v7];
        if v13 == v4 then
            v11.current = nil;
        else
            v11.current = v13;
        end;
        v5[v7] = nil;
        if v1.__DEV__ then
            v6[v7] = nil;
        end;
        v7 = v7 - 1;
        return;
    end;
end;
local function v19(v15, v16, v17) --[[ Line: 78 ]] --[[ Name: push ]]
    -- upvalues: v7 (ref), v5 (copy), v4 (copy), v1 (copy), v6 (ref)
    v7 = v7 + 1;
    local l_current_0 = v15.current;
    if l_current_0 == nil then
        v5[v7] = v4;
    else
        v5[v7] = l_current_0;
    end;
    if v1.__DEV__ then
        v6[v7] = v17;
    end;
    v15.current = v16;
end;
local function v20() --[[ Line: 95 ]] --[[ Name: checkThatStackIsEmpty ]]
    -- upvalues: v1 (copy), v7 (ref), l_console_0 (copy)
    if v1.__DEV__ and v7 ~= 0 then
        l_console_0.error("Expected an empty stack. Something was not reset properly.");
    end;
end;
local function v21() --[[ Line: 103 ]] --[[ Name: resetStackAfterFatalErrorInDev ]]
    -- upvalues: v1 (copy), v7 (ref), v5 (copy), v6 (ref)
    if v1.__DEV__ then
        v7 = 0;
        table.clear(v5);
        table.clear(v6);
    end;
end;
return {
    createCursor = v9, 
    isEmpty = v10, 
    pop = v14, 
    push = v19, 
    checkThatStackIsEmpty = v20, 
    resetStackAfterFatalErrorInDev = v21
};