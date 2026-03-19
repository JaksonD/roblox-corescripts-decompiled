local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.Hooks.useSelectorSignal);
local function v6(v4, v5) --[[ Line: 9 ]]
    return v4 == v5;
end;
return function(v7, v8, v9) --[[ Line: 14 ]] --[[ Name: createSelectorSignal ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v10 = v7:getState();
    local v11, v12 = v2.createSignal(v10);
    v7.changed:connect(v12);
    return v2.createComputed(function(v13) --[[ Line: 20 ]]
        -- upvalues: v8 (copy), v11 (copy)
        return v8(v11(v13));
    end, v9 or v6);
end;