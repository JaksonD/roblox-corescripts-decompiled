local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local l_RadioGroup_0 = v7.RadioGroup;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.FormResponsiveDropdown);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v4.useFocusNavigableSurfaceRegistryConnection;
return function() --[[ Line: 35 ]] --[[ Name: SubcategoryFiltersDropdown ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), v3 (copy), l_useDispatch_0 (copy), v16 (copy), v15 (copy), l_useNavigation_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v14 (copy), v13 (copy), l_useLocalization_0 (copy), l_RadioGroup_0 (copy), v11 (copy), v7 (copy)
    local v20 = l_useSelector_0(v12.getAvatarEditorCategoryInfoFromState);
    local v21 = l_useSelector_0(v12.getAvatarEditorSubcategoryFilterFromState);
    local v22, v23 = v3.useState(if v21 then v21.NavigationKey else nil);
    local v24 = l_useDispatch_0();
    local v25 = v16(v15);
    local v26 = l_useNavigation_0();
    local l_params_0 = v26.state.params;
    local v28 = not v21 or v21.NavigationKey ~= v22;
    local v29 = v20.SubcategoryFilters or {};
    local v30 = v3.useRef(nil);
    l_useFocusNavigableSurfaceRegistryConnection_0(v30.current, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
    local v31 = v3.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v14 (ref), v26 (copy)
        v14.closeFocusedScreen(v26);
    end, {
        v26
    });
    local v35 = v3.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v29 (copy), v22 (copy), v24 (copy), v13 (ref), v20 (copy), v25 (copy), v31 (copy)
        local v32 = nil;
        for v33, v34 in v29 do
            if v34.NavigationKey == v22 then
                v32 = v33;
                break;
            end;
        end;
        v24(v13(v20.Category, v20.Subcategory, v25, v32));
        v31();
    end, {
        v29, 
        v20, 
        v24, 
        v22, 
        v25, 
        v31
    });
    local v39 = v3.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v20 (copy), v29 (copy)
        local v36 = {
            header = v20.SubcategoryFiltersHeader
        };
        for _, v38 in v29 do
            v36[v38.NavigationKey] = v38.Title;
        end;
        return v36;
    end, {
        v20, 
        v29
    });
    local v40 = l_useLocalization_0(v39);
    local v44 = v3.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: v29 (copy), v3 (ref), l_RadioGroup_0 (ref), v40 (copy)
        local v41 = {};
        for _, v43 in v29 do
            table.insert(v41, (v3.createElement(l_RadioGroup_0.Item, {
                value = v43.NavigationKey, 
                label = v40[v43.NavigationKey]
            })));
        end;
        return v41;
    end, {
        v29, 
        v40
    });
    return v3.createElement(v11, {
        canApply = v28, 
        onApply = v35, 
        onClose = v31, 
        dropdownPosition = l_params_0.dropdownPosition, 
        headerText = v40.header, 
        ref = v30
    }, {
        Container = v3.createElement(v7.View, {
            tag = "size-full-0 auto-y"
        }, {
            RadioGroup = v3.createElement(l_RadioGroup_0.Root, {
                onValueChanged = v23, 
                value = v22
            }, v44)
        })
    });
end;