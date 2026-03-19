local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local l_Constants_0 = v6.App.Style.Constants;
local function v9(v10, v11) --[[ Line: 14 ]] --[[ Name: dumpInstanceTree ]]
    -- upvalues: v9 (copy)
    v11 = v11 or "";
    if v10 == nil then
        print(v11 .. "[nil Instance]");
        return;
    else
        print(v11 .. v10.Name);
        v11 = v11 .. "  ";
        for _, v13 in ipairs(v10:GetChildren()) do
            v9(v13, v11);
        end;
        return;
    end;
end;
return function(v14, v15, v16, v17, v18) --[[ Line: 41 ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), l_AppStyleProvider_0 (copy), l_Constants_0 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v9 (copy)
    v17 = v17 or {};
    v18 = v18 or {};
    local v19 = v4.Store.new(v16, v17, {
        v4.thunkMiddleware
    });
    local v20 = v3.createElement(v5.StoreProvider, {
        store = v19
    }, {
        AppStyleProvider = v3.createElement(l_AppStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            Folder = v3.createElement("Folder", {}, {
                Root = v3.createElement(v15, v18)
            })
        })
    });
    local v21 = tostring(v15);
    local v22 = v3.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        [v21] = v20
    });
    local v23 = "Test-" .. l_HttpService_0:GenerateGUID(false);
    local v24 = v3.mount(v22, l_CoreGui_0, v23);
    local v25 = ("game.CoreGui.%s.*[ClassName=Folder].*"):format(v23);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 74 ]]
        -- upvalues: v14 (copy), v25 (copy)
        v14(v25);
    end);
    if not l_status_0 then
        print("Test instance tree:\n");
        v9(l_CoreGui_0:FindFirstChild(v23));
        print();
    end;
    v3.unmount(v24);
    if not l_status_0 then
        error(l_result_0);
    end;
end;