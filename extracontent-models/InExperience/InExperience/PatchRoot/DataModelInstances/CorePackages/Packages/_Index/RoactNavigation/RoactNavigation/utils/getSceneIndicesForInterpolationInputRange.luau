local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return function(v2) --[[ Line: 5 ]] --[[ Name: getSceneIndicesForInterpolationInputRange ]]
    -- upvalues: l_Array_0 (copy)
    local l_scene_0 = v2.scene;
    local l_scenes_0 = v2.scenes;
    local l_index_0 = l_scene_0.index;
    local v6 = #l_scenes_0;
    if not l_scenes_0[v6].isActive then
        local v7 = l_Array_0.indexOf(l_scenes_0, l_scene_0);
        local v8 = nil;
        for v9, v10 in l_scenes_0 do
            if v10.isActive then
                v8 = v9;
                break;
            end;
        end;
        local l_index_1 = l_scenes_0[v8].index;
        local l_index_2 = l_scenes_0[v6].index;
        if l_index_0 ~= l_index_1 and v7 == v6 then
            return {
                first = math.min(l_index_1, l_index_0 - 1), 
                last = l_index_0 + 1
            };
        elseif l_index_0 == l_index_1 and v7 == v8 then
            return {
                first = l_index_0 - 1, 
                last = math.max(l_index_2, l_index_0 + 1)
            };
        elseif l_index_0 == l_index_1 or v8 < v7 then
            return nil;
        end;
    end;
    return {
        first = l_index_0 - 1, 
        last = l_index_0 + 1
    };
end;