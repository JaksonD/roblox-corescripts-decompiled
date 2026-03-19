local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v6 = require(l_ShareGame_0.Components.App);
local v7 = require(l_ShareGame_0.AppReducer);
local v8 = require(l_ShareGame_0.InviteStore);
local v9 = require(l_Modules_0.Flags.GetFFlagEnableSharedInviteStore);
return {
    createApp = function(v10, v11) --[[ Line: 17 ]] --[[ Name: createApp ]]
        -- upvalues: v9 (copy), v8 (copy), v3 (copy), v7 (copy), v2 (copy), v4 (copy), v6 (copy)
        local v12 = {
            store = if v9() then v8 else v3.Store.new(v7, nil, {
                v3.thunkMiddleware
            })
        };
        v12._instanceHandle = v2.mount(v2.createElement(v4.StoreProvider, {
            store = v12.store
        }, {
            App = v2.createElement(v6, {
                analytics = v11, 
                pageTarget = v10
            })
        }));
        return v12;
    end
};