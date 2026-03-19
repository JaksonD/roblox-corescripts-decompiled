local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.AppPageProperties);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppTransparentPageMaxCount)();
return function(v8, v9) --[[ Line: 16 ]] --[[ Name: wrapAppPageForRoactNavigation ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
    local v10 = v3.Component:extend("RNPageWrapper(" .. v9 .. ")");
    local l_v8_0 = v8;
    v8 = v4.withNavigationFocus(function(v12) --[[ Line: 20 ]]
        -- upvalues: l_v8_0 (copy)
        local l_isVisible_0 = v12.isVisible;
        local l_displayOrder_0 = v12.displayOrder;
        local l_detail_0 = v12.detail;
        local l_extraProps_0 = v12.extraProps;
        local v17 = {
            isVisible = l_isVisible_0, 
            displayOrder = l_displayOrder_0
        };
        return l_v8_0(v17, l_detail_0, l_extraProps_0);
    end);
    v10.render = function(v18) --[[ Line: 32 ]] --[[ Name: render ]]
        -- upvalues: v3 (ref), v8 (ref)
        local l_isVisible_1 = v18.props.isVisible;
        local l_displayOrder_1 = v18.props.displayOrder;
        local l_detail_1 = v18.props.detail;
        local l_extraProps_1 = v18.props.extraProps;
        return v3.createElement(v8, {
            isVisible = l_isVisible_1, 
            displayOrder = l_displayOrder_1, 
            detail = l_detail_1, 
            extraProps = l_extraProps_1
        });
    end;
    v10 = v5.connect(function(v23, v24) --[[ Line: 49 ]]
        -- upvalues: v6 (ref), v7 (ref)
        local l_navigation_0 = v24.navigation;
        local l_key_0 = l_navigation_0.state.key;
        local v27 = l_navigation_0.getParam("detail");
        local v28 = l_navigation_0.getParam("extraProps", {});
        local l_history_0 = v23.Navigation.history;
        local v30 = l_history_0[#l_history_0];
        local v31 = 1;
        for v32 = #v30, 1, -1 do
            if not (v6[v30[v32].name] or {}).renderUnderlyingPage then
                v31 = v32;
                break;
            end;
        end;
        local v33 = math.max(v31 + 1, #l_history_0 - v7 + 1);
        local v34 = #v30 == 1;
        local v35 = 0;
        for v36, v37 in ipairs(v30) do
            if v37.rnKey == l_key_0 then
                local v38 = true;
                if v36 ~= v31 then
                    v38 = v33 <= v36;
                end;
                v34 = v38;
                v35 = v36;
                break;
            end;
        end;
        return {
            isVisible = v34, 
            displayOrder = v35, 
            detail = v27, 
            extraProps = v28
        };
    end)(v10);
    return (v4.withNavigation(v10));
end;