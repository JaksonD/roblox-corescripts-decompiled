local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.Parent.generatedTypes);
return {
    Experience = {
        thumbnails = function(v4, _, v6) --[[ Line: 10 ]] --[[ Name: thumbnails ]]
            -- upvalues: v1 (copy)
            local l_thumbnails_0 = v6.dataLoaders.thumbnails;
            if not l_thumbnails_0 then
                return v1.resolve({});
            else
                return (l_thumbnails_0:load(v4.universeId):andThen(function(v8) --[[ Line: 17 ]]
                    if not v8 then
                        return {};
                    else
                        return {
                            {
                                url = v8.imageUrl
                            }
                        };
                    end;
                end):catch(function() --[[ Line: 23 ]]
                    return {};
                end));
            end;
        end
    }, 
    Query = {
        experienceThumbnails = function(_, v10) --[[ Line: 30 ]] --[[ Name: experienceThumbnails ]]
            -- upvalues: l_Array_0 (copy)
            return l_Array_0.map(v10.universeIds, function(v11) --[[ Line: 31 ]]
                return {
                    universeId = v11
                };
            end);
        end
    }
};