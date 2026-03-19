local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Map_0 = v2.Map;
local _ = require(l_Parent_0.jsutils.invariant).invariant;
local l_GraphQLSchema_0 = require(l_Parent_0.type.schema).GraphQLSchema;
local l_GraphQLString_0 = require(l_Parent_0.type.scalars).GraphQLString;
local v8 = require(l_Parent_0.type.definition);
local l_GraphQLList_0 = v8.GraphQLList;
local l_GraphQLNonNull_0 = v8.GraphQLNonNull;
local l_GraphQLEnumType_0 = v8.GraphQLEnumType;
local l_GraphQLInterfaceType_0 = v8.GraphQLInterfaceType;
local l_GraphQLObjectType_0 = v8.GraphQLObjectType;
local v14 = require(script.Parent.starWarsData);
local l_getFriends_0 = v14.getFriends;
local l_getHero_0 = v14.getHero;
local l_getHuman_0 = v14.getHuman;
local l_getDroid_0 = v14.getDroid;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = l_GraphQLEnumType_0.new({
    name = "Episode", 
    description = "One of the films in the Star Wars Trilogy", 
    values = l_Map_0.new({
        {
            "NEW_HOPE", 
            {
                value = 4, 
                description = "Released in 1977."
            }
        }, 
        {
            "EMPIRE", 
            {
                value = 5, 
                description = "Released in 1980."
            }
        }, 
        {
            "JEDI", 
            {
                value = 6, 
                description = "Released in 1983."
            }
        }
    })
});
v19 = l_GraphQLInterfaceType_0.new({
    name = "Character", 
    description = "A character in the Star Wars Trilogy", 
    fields = function() --[[ Line: 127 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLList_0 (copy), v19 (ref), v22 (copy)
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the character."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the character."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v19), 
                    description = "The friends of the character, or an empty list if they have none."
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v22), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "All secrets about their past."
                }
            }
        });
    end, 
    resolveType = function(v23) --[[ Line: 166 ]] --[[ Name: resolveType ]]
        -- upvalues: v20 (ref), v21 (ref)
        if v23.type == "Human" then
            return v20.name;
        elseif v23.type == "Droid" then
            return v21.name;
        else
            assert(false);
            return;
        end;
    end
});
v20 = l_GraphQLObjectType_0.new({
    name = "Human", 
    description = "A humanoid creature in the Star Wars universe.", 
    fields = function() --[[ Line: 195 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLList_0 (copy), v19 (ref), l_getFriends_0 (copy), v22 (copy), l_Error_0 (copy)
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the human."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the human."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v19), 
                    description = "The friends of the human, or an empty list if they have none.", 
                    resolve = function(v24) --[[ Line: 216 ]] --[[ Name: resolve ]]
                        -- upvalues: l_getFriends_0 (ref)
                        return l_getFriends_0(v24);
                    end
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v22), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "homePlanet", 
                {
                    type = l_GraphQLString_0, 
                    description = "The home planet of the human, or null if unknown."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "Where are they from and how they came to be who they are.", 
                    resolve = function() --[[ Line: 240 ]] --[[ Name: resolve ]]
                        -- upvalues: l_Error_0 (ref)
                        error(l_Error_0("secretBackstory is secret."));
                    end
                }
            }
        });
    end, 
    interfaces = {
        v19
    }
});
v21 = l_GraphQLObjectType_0.new({
    name = "Droid", 
    description = "A mechanical creature in the Star Wars universe.", 
    fields = function() --[[ Line: 266 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_GraphQLList_0 (copy), v19 (ref), l_getFriends_0 (copy), v22 (copy), l_Error_0 (copy)
        return l_Map_0.new({
            {
                "id", 
                {
                    type = l_GraphQLNonNull_0.new(l_GraphQLString_0), 
                    description = "The id of the droid."
                }
            }, 
            {
                "name", 
                {
                    type = l_GraphQLString_0, 
                    description = "The name of the droid."
                }
            }, 
            {
                "friends", 
                {
                    type = l_GraphQLList_0.new(v19), 
                    description = "The friends of the droid, or an empty list if they have none.", 
                    resolve = function(v25) --[[ Line: 287 ]] --[[ Name: resolve ]]
                        -- upvalues: l_getFriends_0 (ref)
                        return l_getFriends_0(v25);
                    end
                }
            }, 
            {
                "appearsIn", 
                {
                    type = l_GraphQLList_0.new(v22), 
                    description = "Which movies they appear in."
                }
            }, 
            {
                "secretBackstory", 
                {
                    type = l_GraphQLString_0, 
                    description = "Construction date and the name of the designer.", 
                    resolve = function() --[[ Line: 304 ]] --[[ Name: resolve ]]
                        -- upvalues: l_Error_0 (ref)
                        error(l_Error_0("secretBackstory is secret."));
                    end
                }
            }, 
            {
                "primaryFunction", 
                {
                    type = l_GraphQLString_0, 
                    description = "The primary function of the droid."
                }
            }
        });
    end, 
    interfaces = {
        v19
    }
});
local v32 = l_GraphQLObjectType_0.new({
    name = "Query", 
    fields = function() --[[ Line: 337 ]] --[[ Name: fields ]]
        -- upvalues: l_Map_0 (copy), v19 (ref), v22 (copy), l_getHero_0 (copy), v20 (ref), l_GraphQLNonNull_0 (copy), l_GraphQLString_0 (copy), l_getHuman_0 (copy), v21 (ref), l_getDroid_0 (copy)
        return l_Map_0.new({
            {
                "hero", 
                {
                    type = v19, 
                    args = {
                        episode = {
                            description = "If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.", 
                            type = v22
                        }
                    }, 
                    resolve = function(_, v27) --[[ Line: 349 ]] --[[ Name: resolve ]]
                        -- upvalues: l_getHero_0 (ref)
                        return l_getHero_0(v27.episode);
                    end
                }
            }, 
            {
                "human", 
                {
                    type = v20, 
                    args = {
                        id = {
                            description = "id of the human", 
                            type = l_GraphQLNonNull_0.new(l_GraphQLString_0)
                        }
                    }, 
                    resolve = function(_, v29) --[[ Line: 364 ]] --[[ Name: resolve ]]
                        -- upvalues: l_getHuman_0 (ref)
                        return l_getHuman_0(v29.id);
                    end
                }
            }, 
            {
                "droid", 
                {
                    type = v21, 
                    args = {
                        id = {
                            description = "id of the droid", 
                            type = l_GraphQLNonNull_0.new(l_GraphQLString_0)
                        }
                    }, 
                    resolve = function(_, v31) --[[ Line: 379 ]] --[[ Name: resolve ]]
                        -- upvalues: l_getDroid_0 (ref)
                        return l_getDroid_0(v31.id);
                    end
                }
            }
        });
    end
});
return {
    StarWarsSchema = l_GraphQLSchema_0.new({
        query = v32, 
        types = {
            v20, 
            v21
        }
    })
};