local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_0.roduxFriendsTypes);
local v3 = require(script.Parent.selectRecommendationsForUserId);
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v4.Object;
local l_Array_0 = v4.Array;
local function v9(v7, v8) --[[ Line: 13 ]]
    return (v7.rank or 0) - (v8.rank or 0);
end;
return function(v10) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), l_Array_0 (copy), l_Object_0 (copy), v9 (copy)
    return function(v11) --[[ Line: 20 ]]
        -- upvalues: v3 (ref), v10 (copy), l_Array_0 (ref), l_Object_0 (ref), v9 (ref)
        return function(v12, v13) --[[ Line: 21 ]]
            -- upvalues: v3 (ref), v10 (ref), v11 (copy), l_Array_0 (ref), l_Object_0 (ref), v9 (ref)
            local v14 = v3(v10)(v11)(v12, v13);
            return l_Array_0.map(l_Array_0.sort(l_Object_0.values(v14), v9), function(v15) --[[ Line: 28 ]]
                return v15.id;
            end);
        end;
    end;
end;