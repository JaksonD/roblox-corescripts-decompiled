local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.ReactGlobals);
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_inspect_0 = v3.util.inspect;
local l___DEV___0 = v2.__DEV__;
local l_console_0 = require(l_Parent_0.Shared).console;
local v8 = require(l_Parent_0.React);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local v10 = require(script.Parent.SingleEventManager);
local l_Type_0 = require(l_Parent_0.Shared).Type;
local v12 = require(script.Parent.getDefaultInstanceProperty);
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"]);
local l_Tag_0 = require(l_Parent_0.React).Tag;
local v15 = {};
local v16 = {};
local function v17(...) --[[ Line: 72 ]] --[[ Name: identity ]]
    return ...;
end;
local function v26(v18, v19, v20) --[[ Line: 76 ]] --[[ Name: setRobloxInstanceProperty ]]
    -- upvalues: v12 (copy)
    if v20 == nil then
        local l_status_0, _ = pcall(v18.ResetPropertyToDefault, v18, v19);
        if l_status_0 then
            return;
        else
            local l_ClassName_0 = v18.ClassName;
            local _, v25 = v12(l_ClassName_0, v19);
            v20 = v25;
        end;
    end;
    v18[v19] = v20;
end;
local function _(v27, v28) --[[ Line: 92 ]] --[[ Name: removeBinding ]]
    -- upvalues: v16 (copy)
    local v29 = v16[v27];
    if v29 ~= nil then
        v29[v28]();
        v29[v28] = nil;
    end;
end;
local function v40(v31, v32, v33) --[[ Line: 101 ]] --[[ Name: attachBinding ]]
    -- upvalues: v26 (copy), v17 (copy), l_console_0 (copy), v16 (copy), v8 (copy)
    local function v39(v34) --[[ Line: 102 ]] --[[ Name: updateBoundProperty ]]
        -- upvalues: v26 (ref), v17 (ref), v31 (copy), v32 (copy), v33 (copy), l_console_0 (ref)
        local v35, v36 = xpcall(v26, v17, v31, v32, v34);
        if not v35 then
            local v37 = v33._source or "<enable DEV mode for stack>";
            local v38 = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", v32, v31.Name, v31.ClassName, tostring(v34), v36, v37);
            l_console_0.error(v38);
            error(v38, 0);
        end;
    end;
    if v16[v31] == nil then
        v16[v31] = {};
    end;
    v16[v31][v32] = v8.__subscribeToBinding(v33, v39);
    v39(v33:getValue());
end;
local function v52(v41, v42, v43) --[[ Line: 134 ]] --[[ Name: applyTags ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_inspect_0 (copy), l_CollectionService_0 (copy)
    if l___DEV___0 and v43 ~= nil and typeof(v43) ~= "string" then
        l_console_0.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", l_inspect_0(v43));
        return;
    else
        local v44 = {};
        for v45 in string.gmatch(v42 or "", "%S+") do
            v44[v45] = true;
        end;
        local v46 = {};
        for v47 in string.gmatch(v43 or "", "%S+") do
            v46[v47] = true;
        end;
        for v48, _ in v44 do
            if not v46[v48] then
                l_CollectionService_0:RemoveTag(v41, v48);
            end;
        end;
        for v50, _ in v46 do
            if not v44[v50] then
                l_CollectionService_0:AddTag(v41, v50);
            end;
        end;
        return;
    end;
end;
local _ = function(v53) --[[ Line: 168 ]] --[[ Name: removeAllTags ]]
    -- upvalues: l_CollectionService_0 (copy)
    for _, v55 in l_CollectionService_0:GetTags(v53) do
        l_CollectionService_0:RemoveTag(v53, v55);
    end;
end;
local function v73(v57, v58, v59, v60) --[[ Line: 174 ]] --[[ Name: applyProp ]]
    -- upvalues: l_Type_0 (copy), v15 (copy), v10 (copy), l_ReactSymbols_0 (copy), v16 (copy), v40 (copy), l_Tag_0 (copy), v52 (copy), v12 (copy)
    local v61 = l_Type_0.of(v58);
    if v61 == l_Type_0.HostEvent or v61 == l_Type_0.HostChangeEvent then
        local v62 = v15[v57];
        if v62 == nil then
            v62 = v10.new(v57);
            v15[v57] = v62;
        end;
        local l_name_0 = v58.name;
        if v61 == l_Type_0.HostChangeEvent then
            v62:connectPropertyChange(l_name_0, v59);
            return;
        else
            v62:connectEvent(l_name_0, v59);
            return;
        end;
    else
        local v64 = false;
        if typeof(v59) == "table" then
            v64 = v59["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        local v65 = false;
        if v60 ~= nil then
            v65 = false;
            if typeof(v60) == "table" then
                v65 = v60["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
            end;
        end;
        if v65 then
            local v66 = v16[v57];
            if v66 ~= nil then
                v66[v58]();
                v66[v58] = nil;
            end;
        end;
        if v64 then
            v40(v57, v58, v59);
            return;
        elseif v58 == l_Tag_0 then
            v52(v57, v60, v59);
            return;
        else
            local l_v59_0 = v59;
            if l_v59_0 == nil then
                local l_status_1, _ = pcall(v57.ResetPropertyToDefault, v57, v58);
                if l_status_1 then
                    return;
                else
                    local l_ClassName_1 = v57.ClassName;
                    local _, v72 = v12(l_ClassName_1, v58);
                    l_v59_0 = v72;
                end;
            end;
            v57[v58] = l_v59_0;
            return;
        end;
    end;
end;
local function v78(v74, v75) --[[ Line: 219 ]] --[[ Name: applyProps ]]
    -- upvalues: v73 (copy)
    for v76, v77 in v75 do
        if v76 ~= "ref" and v76 ~= "children" then
            v73(v74, v76, v77);
        end;
    end;
end;
local function v86(v79, _, v81, _) --[[ Line: 230 ]] --[[ Name: setInitialProperties ]]
    -- upvalues: v78 (copy), v17 (copy), l_console_0 (copy), v15 (copy)
    local v83, v84 = xpcall(v78, v17, v79, v81);
    if not v83 then
        local v85 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", v79.Name, v79.ClassName, (tostring(v84)));
        l_console_0.error(v85);
        error(v85, 0);
    end;
    if v15[v79] ~= nil then
        v15[v79]:resume();
    end;
end;
local function v93(v87, v88, v89) --[[ Line: 259 ]] --[[ Name: safelyApplyProperties ]]
    -- upvalues: l_Object_0 (copy), v73 (copy)
    for v90 = 1, #v88, 2 do
        local v91 = v88[v90];
        local v92 = v88[v90 + 1];
        if v92 == l_Object_0.None then
            v92 = nil;
        end;
        if v91 ~= "ref" and v91 ~= "children" then
            v73(v87, v91, v92, v89[v91]);
        end;
    end;
end;
local function v100(v94, v95, v96) --[[ Line: 278 ]] --[[ Name: updateProperties ]]
    -- upvalues: v15 (copy), v93 (copy), v17 (copy), l_console_0 (copy)
    if v15[v94] ~= nil then
        v15[v94]:suspend();
    end;
    local v97, v98 = xpcall(v93, v17, v94, v95, v96);
    if not v97 then
        local v99 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", v94.Name, v94.ClassName, v98);
        l_console_0.error(v99);
        error(v99, 0);
    end;
    if v15[v94] ~= nil then
        v15[v94]:resume();
    end;
end;
local _, v102 = xpcall(function() --[[ Line: 312 ]]
    return game:DefineFastFlag("ReactFixBindingMemoryLeak", false);
end, function() --[[ Line: 314 ]]
    return true;
end);
local _ = function(v103) --[[ Line: 318 ]] --[[ Name: cleanupBindings ]]
    -- upvalues: v16 (copy)
    local v104 = v16[v103];
    if v104 ~= nil then
        for _, v106 in v104 do
            v106();
        end;
        v16[v103] = nil;
    end;
end;
return {
    setInitialProperties = v86, 
    updateProperties = v100, 
    cleanupHostComponent = function(v108) --[[ Line: 331 ]] --[[ Name: cleanupHostComponent ]]
        -- upvalues: v15 (copy), v102 (copy), v16 (copy), l_CollectionService_0 (copy)
        if v15[v108] ~= nil then
            v15[v108] = nil;
        end;
        if v102 then
            local v109 = v16[v108];
            if v109 ~= nil then
                for _, v111 in v109 do
                    v111();
                end;
                v16[v108] = nil;
            end;
        elseif v16[v108] ~= nil then
            v16[v108] = nil;
        end;
        if typeof(v108) ~= "Instance" then
            return;
        else
            for _, v113 in l_CollectionService_0:GetTags(v108) do
                l_CollectionService_0:RemoveTag(v108, v113);
            end;
            for _, v115 in v108:GetDescendants() do
                if v15[v115] ~= nil then
                    v15[v115] = nil;
                end;
                if v102 then
                    local v116 = v16[v115];
                    if v116 ~= nil then
                        for _, v118 in v116 do
                            v118();
                        end;
                        v16[v115] = nil;
                    end;
                elseif v16[v115] ~= nil then
                    v16[v115] = nil;
                end;
                for _, v120 in l_CollectionService_0:GetTags(v108) do
                    l_CollectionService_0:RemoveTag(v108, v120);
                end;
            end;
            return;
        end;
    end, 
    _instanceToEventManager = v15, 
    _instanceToBindings = v16
};