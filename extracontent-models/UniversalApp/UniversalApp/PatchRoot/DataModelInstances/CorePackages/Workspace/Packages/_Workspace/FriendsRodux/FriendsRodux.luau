local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(l_Parent_0.RoduxNetworking);
local l_NetworkingBlocking_0 = require(l_Parent_0.LuaSocialLibrariesDeps).NetworkingBlocking;
local v4 = require(l_Parent_0.UserBlockingNetworking);
local v5 = require(script.Reducers.FriendsReducer);
local v6 = require(script.Actions);
local v7 = require(script.Selectors);
local v8 = require(script.Models);
local v9 = require(script.Enums);
return {
    ["jest.config"] = script["jest.config"], 
    config = function(v10) --[[ Line: 16 ]] --[[ Name: config ]]
        -- upvalues: v1 (copy), l_Parent_0 (copy), v2 (copy), l_NetworkingBlocking_0 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
        v10 = v1.Dictionary.join(v10, {
            friendsNetworking = require(l_Parent_0.FriendsNetworking).config({
                roduxNetworking = v2.mock()
            }), 
            networkingBlocking = l_NetworkingBlocking_0.config({
                roduxNetworking = v2.mock()
            }), 
            userBlockingNetworking = v4.config({
                roduxNetworking = v2.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 30 ]] --[[ Name: installReducer ]]
                -- upvalues: v5 (ref), v10 (ref)
                return v5(v10);
            end, 
            Actions = v6(v10), 
            Selectors = v7(v10), 
            Models = v8, 
            Enums = v9
        };
    end
};