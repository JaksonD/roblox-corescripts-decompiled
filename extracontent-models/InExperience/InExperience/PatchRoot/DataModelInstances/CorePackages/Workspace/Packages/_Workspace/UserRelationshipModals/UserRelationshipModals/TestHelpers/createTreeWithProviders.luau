local l_Parent_0 = script:FindFirstAncestor("UserRelationshipModals").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.RoactRodux);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v5 = require(l_Parent_0.Rodux);
local v6 = require(script.Parent.mockLocalization);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v1 (copy), l_LocalizationProvider_0 (copy), v6 (copy), v2 (copy), v3 (copy)
    local v9 = if v8 ~= nil then v8.store else v5.Store.new(function() --[[ Line: 15 ]]
        return {
            UserRelationshipModals = {
                LocalUserId = 456, 
                NetworkStatus = {}
            }
        };
    end, {}, {
        v5.thunkMiddleware
    });
    return v1.createElement(l_LocalizationProvider_0, {
        localization = v6
    }, {
        Provider = v1.createElement(v2.FoundationProvider, {
            theme = "Dark", 
            preferences = {
                reducedMotion = true
            }
        }, {
            v1.createElement(v3.StoreProvider, {
                store = v9
            }, {
                component = v7
            })
        })
    });
end;