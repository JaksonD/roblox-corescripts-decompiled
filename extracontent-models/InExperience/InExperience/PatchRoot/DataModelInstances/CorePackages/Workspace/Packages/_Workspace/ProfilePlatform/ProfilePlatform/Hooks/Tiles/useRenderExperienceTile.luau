local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local v8 = require(l_script_FirstAncestor_0.BaseComponents.Tiles.ExperienceTile);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v11, v12, v13, v14) --[[ Line: 22 ]] --[[ Name: useRenderExperienceTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), l_OpenGameDetails_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useNavigation_0();
    v12 = v12 or "ProfileExperienceTile_";
    local v20 = v2.useCallback(function(v17, v18, v19) --[[ Line: 33 ]]
        -- upvalues: v13 (copy), v15 (copy), l_OpenGameDetails_0 (ref), v16 (copy)
        return function() --[[ Line: 34 ]]
            -- upvalues: v13 (ref), v17 (copy), v18 (copy), v19 (copy), v15 (ref), l_OpenGameDetails_0 (ref), v16 (ref)
            if v13 then
                v13(v17, v18, v19);
            end;
            v15(l_OpenGameDetails_0(v17.experienceId, v16, {
                mountAsFullView = false, 
                showBackButton = true
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13, 
        v15, 
        v16
    } else l_dependencyArray_0(v13, v15, v16));
    return (v2.useCallback(function(v21, v22, _, v24) --[[ Line: 59 ]]
        -- upvalues: v2 (ref), v8 (ref), v20 (copy), v11 (copy), v14 (copy), v12 (ref)
        return v2.createElement(v8, {
            item = v21, 
            index = v22, 
            onActivated = v20(v21, v22, v24), 
            impressionsTag = v11, 
            showFooter = v14
        }), (("%*%*_"):format(v12, v21.experienceId));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11, 
        v20, 
        v12
    } else l_dependencyArray_0(v11, v20, v12)));
end;