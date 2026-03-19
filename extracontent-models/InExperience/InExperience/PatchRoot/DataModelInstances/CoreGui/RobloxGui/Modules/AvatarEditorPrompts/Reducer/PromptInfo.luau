local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.PromptType);
local v5 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v6 = require(l_Parent_0.Actions.OpenPrompt);
local v7 = require(l_Parent_0.Actions.CreateOutfitConfirmed);
local v8 = {
    promptType = nil, 
    humanoidDescription = nil, 
    rigType = nil, 
    itemId = nil, 
    itemType = nil, 
    itemName = nil, 
    isFavorited = nil, 
    queue = {}, 
    infoQueue = {}
};
return (v1.createReducer(v8, {
    [v5.name] = function(v9, _) --[[ Line: 32 ]]
        -- upvalues: v2 (copy)
        if v2.isEmpty(v9.queue) then
            return {
                queue = v9.queue, 
                infoQueue = v9.infoQueue
            };
        else
            return v2.Dictionary.join(v9.infoQueue[1], {
                promptType = v9.queue[1], 
                queue = v2.List.removeIndex(v9.queue, 1), 
                infoQueue = v2.List.removeIndex(v9.infoQueue, 1)
            });
        end;
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 47 ]]
        -- upvalues: v2 (copy)
        if v11.promptType == nil then
            return v2.Dictionary.join(v11, {
                promptType = v12.promptType
            }, v12.promptInfo);
        else
            return v2.Dictionary.join(v11, {
                queue = v2.List.join(v11.queue, {
                    v12.promptType
                }), 
                infoQueue = v2.List.join(v11.infoQueue, {
                    v12.promptInfo
                })
            });
        end;
    end, 
    [v7.name] = function(v13, _) --[[ Line: 60 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.Dictionary.join(v13, {
            promptType = v4.EnterOutfitName
        });
    end
}));