local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.Cryo);
local function v7() --[[ Line: 29 ]] --[[ Name: createSduiTemplateStore ]]
    -- upvalues: v1 (copy)
    local v2 = {};
    local function v4(v3) --[[ Line: 36 ]] --[[ Name: getTemplate ]]
        -- upvalues: v2 (ref)
        return v2[v3];
    end;
    local function v6(v5) --[[ Line: 42 ]] --[[ Name: addTemplates ]]
        -- upvalues: v2 (ref), v1 (ref)
        v2 = v1.Dictionary.join(v2, v5);
    end;
    return {
        getTemplate = v4, 
        addTemplates = v6
    };
end;
local v8 = nil;
return function() --[[ Line: 57 ]] --[[ Name: getSduiTemplateStore ]]
    -- upvalues: v8 (ref), v7 (copy)
    if v8 == nil then
        v8 = v7();
    end;
    return v8;
end;