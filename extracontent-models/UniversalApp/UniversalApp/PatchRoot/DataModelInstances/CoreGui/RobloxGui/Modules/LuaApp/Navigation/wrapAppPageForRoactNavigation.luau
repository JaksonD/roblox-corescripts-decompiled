local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v7 = require(l_Modules_0.LuaApp.AppPageProperties);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppTransparentPageMaxCount);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v10 = v8();
return function(v11, v12) --[[ Line: 18 ]] --[[ Name: wrapAppPageForRoactNavigation ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v7 (copy), v10 (copy)
    local v13 = v3.Component:extend("RNPageWrapper(" .. v12 .. ")");
    local l_v11_0 = v11;
    v11 = v4.withNavigationFocus(function(v15) --[[ Line: 22 ]]
        -- upvalues: l_v11_0 (copy)
        local l_isVisible_0 = v15.isVisible;
        local l_displayOrder_0 = v15.displayOrder;
        local l_detail_0 = v15.detail;
        local l_extraProps_0 = v15.extraProps;
        local v20 = {
            isVisible = l_isVisible_0, 
            displayOrder = l_displayOrder_0
        };
        return l_v11_0(v20, l_detail_0, l_extraProps_0);
    end);
    v13.render = function(v21) --[[ Line: 34 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v11 (ref)
        local l_isVisible_1 = v21.props.isVisible;
        local l_displayOrder_1 = v21.props.displayOrder;
        local l_detail_1 = v21.props.detail;
        local l_extraProps_1 = v21.props.extraProps;
        return v3.createElement(v11, {
            isVisible = l_isVisible_1, 
            displayOrder = l_displayOrder_1, 
            detail = l_detail_1, 
            extraProps = l_extraProps_1
        });
    end;
    v13 = v5.connect(function(v26, v27) --[[ Line: 51 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v7 (ref), v10 (ref)
        local l_navigation_0 = v27.navigation;
        local l_key_0 = l_navigation_0.state.key;
        local v30 = l_navigation_0.getParam("detail");
        local v31 = l_navigation_0.getParam("extraProps", {});
        local v32 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v26) else v26.Navigation.history;
        local v33 = v32[#v32];
        local v34 = 1;
        for v35 = #v33, 1, -1 do
            if not (v7[v33[v35].name] or {}).renderUnderlyingPage then
                v34 = v35;
                break;
            end;
        end;
        local v36 = math.max(v34 + 1, #v32 - v10 + 1);
        local v37 = #v33 == 1;
        local v38 = 0;
        for v39, v40 in ipairs(v33) do
            if v40.rnKey == l_key_0 then
                local v41 = true;
                if v39 ~= v34 then
                    v41 = v36 <= v39;
                end;
                v37 = v41;
                v38 = v39;
                break;
            end;
        end;
        return {
            isVisible = v37, 
            displayOrder = v38, 
            detail = v30, 
            extraProps = v31
        };
    end)(v13);
    return (v4.withNavigation(v13));
end;