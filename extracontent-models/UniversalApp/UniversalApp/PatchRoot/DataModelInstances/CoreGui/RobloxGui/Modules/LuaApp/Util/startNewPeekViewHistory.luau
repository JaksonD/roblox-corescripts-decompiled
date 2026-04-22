local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v5 = require(l_script_FirstAncestor_0.LuaApp.AppPageProperties);
local function _() --[[ Line: 10 ]] --[[ Name: getDefaultRoute ]]
    -- upvalues: v2 (copy)
    return {
        {
            name = v2.Home
        }
    };
end;
return function(v7, v8) --[[ Line: 14 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v2 (copy), v5 (copy)
    local v9 = v7:getState();
    local v10 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v9) else v9.Navigation.history;
    local v11 = v10[#v10] or {
        {
            name = v2.Home
        }
    };
    local v12 = {};
    for v13 = 1, #v11 do
        local l_name_0 = v11[v13].name;
        if not v5[l_name_0] or not v5[l_name_0].isPeekView then
            v12[#v12 + 1] = v11[v13];
        end;
    end;
    v12[#v12 + 1] = v8;
    if #v12 == 0 then
        v12 = {
            {
                name = v2.Home
            }
        };
    end;
    local v15 = {};
    for v16 = 1, #v12 do
        local v17 = {};
        for v18 = 1, v16 do
            v17[#v17 + 1] = v12[v18];
        end;
        v15[#v15 + 1] = v17;
    end;
    return {
        newRoute = v12, 
        newHistory = v15
    };
end;