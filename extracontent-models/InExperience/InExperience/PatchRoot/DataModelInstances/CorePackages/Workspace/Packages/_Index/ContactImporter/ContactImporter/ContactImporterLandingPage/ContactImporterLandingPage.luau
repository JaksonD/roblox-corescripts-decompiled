local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v4 = require(l_script_FirstAncestor_0.Hooks.useBeginContactImporter);
return function() --[[ Line: 10 ]] --[[ Name: ContactImporterLandingPage ]]
    -- upvalues: l_useNavigation_0 (copy), v4 (copy), v2 (copy)
    local l_entryPoint_0 = (l_useNavigation_0().getParam("extraProps") or {}).entryPoint;
    local _, v7 = v4({
        entryPoint = l_entryPoint_0
    });
    local v8 = v2.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v7 (copy)
        if v7 then
            v7();
        end;
    end, {
        v7
    });
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v8 (copy)
        v8();
    end, {});
end;