local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local l_isPrimaryRenderer_0 = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer;
local v7 = {};
local v8 = nil;
if v1.__DEV__ then
    v8 = {};
end;
v3.markSourceAsDirty = function(v9) --[[ Line: 39 ]]
    -- upvalues: v7 (copy)
    table.insert(v7, v9);
end;
v3.resetWorkInProgressVersions = function() --[[ Line: 43 ]]
    -- upvalues: v7 (copy), l_isPrimaryRenderer_0 (copy)
    for _, v11 in v7 do
        if l_isPrimaryRenderer_0 then
            v11._workInProgressVersionPrimary = nil;
        else
            v11._workInProgressVersionSecondary = nil;
        end;
    end;
    table.clear(v7);
end;
v3.getWorkInProgressVersion = function(v12) --[[ Line: 54 ]]
    -- upvalues: l_isPrimaryRenderer_0 (copy)
    if l_isPrimaryRenderer_0 then
        return v12._workInProgressVersionPrimary;
    else
        return v12._workInProgressVersionSecondary;
    end;
end;
v3.setWorkInProgressVersion = function(v13, v14) --[[ Line: 64 ]]
    -- upvalues: l_isPrimaryRenderer_0 (copy), v7 (copy)
    if l_isPrimaryRenderer_0 then
        v13._workInProgressVersionPrimary = v14;
    else
        v13._workInProgressVersionSecondary = v14;
    end;
    table.insert(v7, v13);
end;
v3.warnAboutMultipleRenderersDEV = function(v15) --[[ Line: 76 ]]
    -- upvalues: v1 (copy), l_isPrimaryRenderer_0 (copy), v8 (ref), l_console_0 (copy)
    if v1.__DEV__ then
        if l_isPrimaryRenderer_0 then
            if v15._currentPrimaryRenderer == nil then
                v15._currentPrimaryRenderer = v8;
                return;
            elseif v15._currentPrimaryRenderer ~= v8 then
                l_console_0.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.");
                return;
            end;
        elseif v15._currentSecondaryRenderer == nil then
            v15._currentSecondaryRenderer = v8;
            return;
        elseif v15._currentSecondaryRenderer ~= v8 then
            l_console_0.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.");
        end;
    end;
end;
v3.registerMutableSourceForHydration = function(v16, v17) --[[ Line: 104 ]]
    local v18 = v17._getVersion(v17._source);
    if v16.mutableSourceEagerHydrationData == nil then
        v16.mutableSourceEagerHydrationData = {
            v17, 
            v18
        };
        return;
    else
        return;
    end;
end;
return v3;