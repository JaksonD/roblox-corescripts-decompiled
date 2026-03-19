local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.isSourceAsset);
return function(v2) --[[ Line: 5 ]] --[[ Name: findSourceAssetsFromDescendant ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    local l_Parent_0 = v2.Parent;
    while l_Parent_0 do
        if v1(l_Parent_0) then
            table.insert(v3, l_Parent_0);
        end;
        l_Parent_0 = l_Parent_0.Parent;
    end;
    return v3;
end;