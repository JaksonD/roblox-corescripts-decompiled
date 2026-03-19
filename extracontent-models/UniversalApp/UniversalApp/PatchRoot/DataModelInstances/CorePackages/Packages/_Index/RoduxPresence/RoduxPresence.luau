local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.RoduxNetworking);
local v3 = require(l_Parent_0.NetworkingPresence);
local v4 = require(script.Reducer);
local v5 = require(script.Actions);
local v6 = require(script.Selectors);
local v7 = require(script.Models);
local v8 = require(script.Enums);
return {
    config = function(v9) --[[ Line: 13 ]] --[[ Name: config ]]
        -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
        v9 = v1.Dictionary.join(v9, {
            presenceNetworking = v3.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 21 ]] --[[ Name: installReducer ]]
                -- upvalues: v4 (ref), v9 (ref)
                return v4(v9);
            end, 
            Actions = v5(v9), 
            Selectors = v6(v9), 
            Models = v7, 
            Enums = v8
        };
    end
};