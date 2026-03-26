local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useMemo_0 = v2.useMemo;
return function() --[[ Line: 18 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useMemo_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v9 = l_useDispatch_0();
    return l_useMemo_0(function() --[[ Line: 21 ]]
        -- upvalues: v4 (ref)
        return {
            [v4.GameDetail] = function() --[[ Line: 23 ]]

            end, 
            [v4.Notifications] = function() --[[ Line: 24 ]]

            end, 
            [v4.PrivacySettings] = function() --[[ Line: 25 ]]

            end, 
            [v4.ReportAbuse] = function() --[[ Line: 26 ]]

            end, 
            [v4.ViewUserProfile] = function() --[[ Line: 27 ]]

            end, 
            [v4.Groups] = function() --[[ Line: 28 ]]

            end, 
            [v4.Home] = function() --[[ Line: 29 ]]

            end
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9
    } else l_dependencyArray_0(v9));
end;