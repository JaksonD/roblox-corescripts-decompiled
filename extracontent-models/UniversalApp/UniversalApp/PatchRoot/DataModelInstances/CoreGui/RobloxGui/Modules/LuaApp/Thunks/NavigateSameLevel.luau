local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local function v9(v2, v3) --[[ Line: 5 ]] --[[ Name: navigateSameLevel ]]
    local v4 = {};
    if #v2 > 1 then
        for v5 = 1, #v2 - 1 do
            v4[v5] = v2[v5];
        end;
    end;
    local v6 = v2[#v2];
    local v7 = {};
    if v6 and #v6 > 1 then
        for v8 = 1, #v6 - 1 do
            v7[v8] = v6[v8];
        end;
        v7[#v7 + 1] = {
            name = v3
        };
    else
        v7 = {
            {
                name = v3
            }
        };
    end;
    v4[#v4 + 1] = v7;
    return v7, v4;
end;
return function(v10, v11) --[[ Line: 33 ]]
    -- upvalues: v9 (copy), v1 (copy)
    return function(v12) --[[ Line: 34 ]]
        -- upvalues: v9 (ref), v10 (copy), v11 (copy), v1 (ref)
        local v13, v14 = v9(v10, v11);
        v12:dispatch(v1(v13, v14));
    end;
end;