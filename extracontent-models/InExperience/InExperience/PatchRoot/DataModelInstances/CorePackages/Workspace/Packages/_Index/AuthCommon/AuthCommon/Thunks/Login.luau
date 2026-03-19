local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Thunks.LoginByEmail);
local v2 = require(l_script_FirstAncestor_0.Thunks.LoginByPhone);
local v3 = require(l_script_FirstAncestor_0.Thunks.LoginByUsername);
local v4 = require(l_script_FirstAncestor_0.Utils.isStringEmail);
local v5 = require(l_script_FirstAncestor_0.Utils.isStringPhone);
local v6 = game:GetService("GuiService"):IsTenFootInterface();
return function(v7, v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v6 (copy), v1 (copy), v5 (copy), v2 (copy), v3 (copy)
    return function(v16) --[[ Line: 25 ]]
        -- upvalues: v4 (ref), v8 (copy), v15 (copy), v6 (ref), v1 (ref), v7 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v5 (ref), v2 (ref), v3 (ref)
        if v4(v8) and not v15 and not v6 then
            return v16:dispatch(v1(v7, v8, v9, v10, v11, v12, v13, v14));
        elseif v5(v8) and not v15 and not v6 then
            return v16:dispatch(v2(v7, v8, v9, v10, v11, v12, v13, v14));
        else
            return v16:dispatch(v3(v7, v8, v9, v10, v11, v12, v13));
        end;
    end;
end;