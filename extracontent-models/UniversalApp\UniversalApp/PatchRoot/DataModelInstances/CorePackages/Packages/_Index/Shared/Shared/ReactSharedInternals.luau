local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local function _(v3) --[[ Line: 28 ]] --[[ Name: onlyInTestError ]]
    -- upvalues: l_console_0 (copy)
    return function() --[[ Line: 29 ]]
        -- upvalues: l_console_0 (ref), v3 (copy)
        l_console_0.error(v3 .. " is only available in tests, not in production");
    end;
end;
local v5 = require(script.ReactCurrentDispatcher);
local v6 = require(script.ReactCurrentBatchConfig);
local v7 = require(script.ReactCurrentOwner);
local v8 = require(script.ReactDebugCurrentFrame);
local v9 = require(script.IsSomeRendererActing);
return {
    ReactCurrentDispatcher = v5, 
    ReactCurrentBatchConfig = v6, 
    ReactCurrentOwner = v7, 
    IsSomeRendererActing = v9, 
    ReactDebugCurrentFrame = if v1.__DEV__ then v8 else {
        setExtraStackFrame = function(_) --[[ Line: 52 ]] --[[ Name: setExtraStackFrame ]]

        end
    }
};