local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.ContentSharingNetworking);
local v5 = require(l_script_0.Reducers.ContentSharingReducer);
return {
    ["jest.config"] = script["jest.config"], 
    config = function(v6) --[[ Line: 11 ]] --[[ Name: config ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
        v6 = v2.Dictionary.join(v6, {
            ContentSharingNetworking = v4.config({
                roduxNetworking = v3.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 19 ]] --[[ Name: installReducer ]]
                -- upvalues: v5 (ref), v6 (ref)
                return v5(v6);
            end
        };
    end
};