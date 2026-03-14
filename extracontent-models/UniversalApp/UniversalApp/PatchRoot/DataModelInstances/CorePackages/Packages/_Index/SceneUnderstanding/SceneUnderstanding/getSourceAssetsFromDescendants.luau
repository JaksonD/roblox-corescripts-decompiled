local l_script_FirstAncestor_0 = script:FindFirstAncestor("SceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.isSourceAsset);
local v2 = require(l_script_FirstAncestor_0.findSourceAssetsFromDescendant);
return function(v3) --[[ Line: 17 ]] --[[ Name: getSourceAssetsFromDescendants ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    for _, v6 in v3 do
        if v1(v6) then
            table.insert(v4, v6);
        end;
        for _, v8 in v2(v6) do
            if not table.find(v4, v8) then
                table.insert(v4, v8);
            end;
        end;
    end;
    return v4;
end;