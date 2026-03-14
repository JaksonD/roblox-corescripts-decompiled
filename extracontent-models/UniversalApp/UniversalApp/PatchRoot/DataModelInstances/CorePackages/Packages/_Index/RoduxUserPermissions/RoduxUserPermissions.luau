local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingUserSettings);
local v4 = require(l_Parent_0.NetworkingAccountInformation);
local v5 = require(script.Reducers.UserPermissionsReducer);
return {
    config = function(v6) --[[ Line: 9 ]] --[[ Name: config ]]
        -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy)
        v6 = v1.join(v6, {
            networkingUserSettings = v3.config({
                roduxNetworking = v2.mock()
            }), 
            networkingAccountInformation = v4.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 20 ]] --[[ Name: installReducer ]]
                -- upvalues: v5 (ref), v6 (ref)
                return v5(v6);
            end
        };
    end
};