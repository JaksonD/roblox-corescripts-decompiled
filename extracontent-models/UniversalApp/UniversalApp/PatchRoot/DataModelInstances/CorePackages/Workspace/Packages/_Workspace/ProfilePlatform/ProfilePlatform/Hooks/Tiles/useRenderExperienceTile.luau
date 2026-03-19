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
return function(v10, v11, v12, v13) --[[ Line: 20 ]] --[[ Name: useRenderExperienceTile ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), l_OpenGameDetails_0 (copy), l_dependencyArray_0 (copy), v8 (copy)
    local v14 = l_useDispatch_0();
    local v15 = l_useNavigation_0();
    v11 = v11 or "ProfileExperienceTile_";
    local v19 = v2.useCallback(function(v16, v17, v18) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v14 (copy), l_OpenGameDetails_0 (ref), v15 (copy)
        return function() --[[ Line: 31 ]]
            -- upvalues: v12 (ref), v16 (copy), v17 (copy), v18 (copy), v14 (ref), l_OpenGameDetails_0 (ref), v15 (ref)
            if v12 then
                v12(v16, v17, v18);
            end;
            v14(l_OpenGameDetails_0(v16.experienceId, v15, {
                mountAsFullView = false, 
                showBackButton = true
            }));
        end;
    end, l_dependencyArray_0(v12, v14, v15));
    return (v2.useCallback(function(v20, v21, _, v23) --[[ Line: 52 ]]
        -- upvalues: v2 (ref), v8 (ref), v19 (copy), v10 (copy), v13 (copy), v11 (ref)
        return v2.createElement(v8, {
            item = v20, 
            index = v21, 
            onActivated = v19(v20, v21, v23), 
            impressionsTag = v10, 
            showFooter = v13
        }), (("%*%*_"):format(v11, v20.experienceId));
    end, l_dependencyArray_0(v10, v19, v11)));
end;