local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return {
    init = function() --[[ Line: 11 ]] --[[ Name: init ]]
        -- upvalues: v1 (copy)
        local function v3(v2) --[[ Line: 12 ]] --[[ Name: generate ]]
            return {
                id = v2, 
                title = string.format("default dog chat no. %d", v2), 
                thumbnails = {
                    "rbxassetid://2610133241"
                }, 
                presenceImage = "", 
                messages = {
                    keys = {
                        "messageId"
                    }, 
                    values = {
                        messageId = {
                            content = "a message placeholder \240\159\142\183\240\159\144\155"
                        }
                    }
                }, 
                shortRelativeTime = "now+" .. v2, 
                alias = "(alias)"
            };
        end;
        local v4 = {};
        for v5 = 0, 200 do
            table.insert(v4, (v3(v5)));
        end;
        return {
            getItemList = function() --[[ Line: 38 ]] --[[ Name: getItemList ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            loadNext = function(v6) --[[ Line: 42 ]] --[[ Name: loadNext ]]
                -- upvalues: v1 (ref), v3 (copy)
                return v1.List.join(v6, {
                    (v3(v6[#v6].id + 1))
                });
            end, 
            loadPrevious = function(v7) --[[ Line: 46 ]] --[[ Name: loadPrevious ]]
                -- upvalues: v1 (ref), v3 (copy)
                return v1.List.join({
                    (v3(v7[1].id - 1))
                }, v7);
            end
        };
    end
};