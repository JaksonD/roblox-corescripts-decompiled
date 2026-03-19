local v0 = require(script.Reducers);
local v1 = require(script.Actions);
local v2 = require(script.Models);
local v3 = require(script.Enums);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.RoduxNetworking);
local v7 = require(l_Parent_0.ShareLinksNetworking);
return {
    config = function(v8) --[[ Line: 13 ]] --[[ Name: config ]]
        -- upvalues: v5 (copy), v7 (copy), v6 (copy), v0 (copy), v1 (copy), v2 (copy), v3 (copy)
        v8 = v5.Dictionary.join(v8, {
            shareLinksNetworking = v7.config({
                roduxNetworking = v6.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 21 ]] --[[ Name: installReducer ]]
                -- upvalues: v0 (ref), v8 (ref)
                return v0(v8);
            end, 
            Actions = v1, 
            Models = v2, 
            Enums = v3
        };
    end
};