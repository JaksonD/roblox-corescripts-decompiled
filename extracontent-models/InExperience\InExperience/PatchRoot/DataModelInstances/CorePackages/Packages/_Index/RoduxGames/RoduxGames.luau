local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.RoduxNetworking);
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.NetworkingGames);
local v4 = require(script.Reducers);
local v5 = require(script.Actions);
local v6 = require(script.Models);
local v7 = require(script.Enums);
return {
    config = function(v8) --[[ Line: 12 ]] --[[ Name: config ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
        v8 = v2.join(v8, {
            networkingGames = v3.config({
                roduxNetworking = v1.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 20 ]] --[[ Name: installReducer ]]
                -- upvalues: v4 (ref), v8 (ref)
                return v4(v8);
            end, 
            Actions = v5, 
            Models = v6, 
            Enums = v7
        };
    end
};