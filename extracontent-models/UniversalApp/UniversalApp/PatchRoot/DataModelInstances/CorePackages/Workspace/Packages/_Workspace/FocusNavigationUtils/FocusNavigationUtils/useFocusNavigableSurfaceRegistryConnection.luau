local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry);
local l_useRegisterFocusNavigableSurface_0 = v3.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = v3.useDeRegisterFocusNavigableSurface;
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
return function(v7, v8, v9) --[[ Line: 17 ]]
    -- upvalues: l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), v2 (copy)
    local v10 = l_useRegisterFocusNavigableSurface_0();
    local v11 = l_useDeRegisterFocusNavigableSurface_0();
    local v12 = false;
    if v7 ~= nil then
        v12 = v9 == nil or v9;
    end;
    v2.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v12 (copy), v10 (copy), v8 (copy), v7 (copy), v11 (copy)
        if v12 then
            v10(v8, v7);
        else
            v11(v8, v7);
        end;
        return function() --[[ Line: 33 ]]
            -- upvalues: v11 (ref), v8 (ref), v7 (ref)
            v11(v8, v7);
        end;
    end, {
        v12, 
        v8, 
        v7
    });
end;