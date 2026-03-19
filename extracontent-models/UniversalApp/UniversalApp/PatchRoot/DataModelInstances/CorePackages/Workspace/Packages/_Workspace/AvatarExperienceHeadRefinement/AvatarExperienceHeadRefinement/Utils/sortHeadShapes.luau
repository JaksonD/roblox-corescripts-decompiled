local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local v1 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagDynamicHeadsMigration_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagDynamicHeadsMigration;
local v4 = {
    v1.Default, 
    v1.WomanHead, 
    v1.ManHead, 
    v1.Blockhead, 
    v1.Cheeks, 
    v1.Chiseled, 
    v1.Narrow, 
    v1.Paragon, 
    v1.Roundy, 
    v1.StrongJaw, 
    v1.Trim
};
local v5 = {};
for v6, v7 in v4 do
    v5[v7] = v6;
end;
return function(v8, v9) --[[ Line: 31 ]] --[[ Name: sortHeadShapes ]]
    -- upvalues: l_FFlagDynamicHeadsMigration_0 (copy), v5 (copy)
    if not l_FFlagDynamicHeadsMigration_0 then
        local v10 = table.clone(v8);
        table.sort(v10, function(v11, v12) --[[ Line: 35 ]]
            -- upvalues: v9 (copy), v5 (ref)
            local v13 = v9(v11);
            local v14 = v9(v12);
            return v5[v13] < v5[v14];
        end);
        return v10;
    else
        local v15 = table.clone(v8);
        table.sort(v15, function(v16, v17) --[[ Line: 45 ]]
            -- upvalues: v9 (copy), v5 (ref)
            local v18 = v9(v16);
            local v19 = v9(v17);
            local v20 = v5[v18];
            local v21 = v5[v19];
            if v20 == nil and v21 == nil then
                return v18 < v19;
            elseif v20 == nil then
                return false;
            elseif v21 == nil then
                return true;
            else
                return v20 < v21;
            end;
        end);
        return v15;
    end;
end;