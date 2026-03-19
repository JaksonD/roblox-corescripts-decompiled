local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(script.Parent.warnOnce);
return function(_) --[[ Line: 21 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1.__DEV__ and v1.__COMPAT_WARNINGS__ then
        v2("setGlobalConfig", "Roact 17 uses a `ReactGlobals.__DEV__` flag to enable development behavior. If you're seeing this warning, you already have it enabled. Please remove any redundant uses of `setGlobalConfig`.");
    end;
end;