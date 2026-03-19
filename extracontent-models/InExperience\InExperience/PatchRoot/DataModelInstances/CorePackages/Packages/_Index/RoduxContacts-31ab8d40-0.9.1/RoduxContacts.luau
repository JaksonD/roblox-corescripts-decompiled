local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingContacts);
local v4 = require(script.Reducers.ContactsReducer);
local v5 = require(script.Selectors);
return {
    config = function(v6) --[[ Line: 10 ]] --[[ Name: config ]]
        -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy)
        v6 = v1.join(v6, {
            networkingContacts = v3.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 18 ]] --[[ Name: installReducer ]]
                -- upvalues: v4 (ref), v6 (ref)
                return v4(v6);
            end, 
            Selectors = v5(v6), 
            Models = require(script.Models), 
            Actions = require(script.Actions)
        };
    end
};