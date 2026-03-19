local v0 = require(script.Parent.HeadShape);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local l_FFlagDynamicHeadsMigration_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagDynamicHeadsMigration;
local v3 = game:DefineFastFlag("AXReplaceDefaultHeadAssetId", false);
local _ = require(l_Parent_0.AvatarExperienceSlotBasedEditor);
if l_FFlagDynamicHeadsMigration_0 then

end;
local v5 = {
    [v0.Default] = {
        name = v0.Default, 
        assetId = v3 and 2432102561 or 7430070993, 
        image = v3 and "rbxthumb://type=Asset&w=150&h=150&id=2432102561" or "rbxthumb://type=Asset&w=150&h=150&id=7430070993"
    }, 
    [v0.ManHead] = {
        name = v0.ManHead, 
        assetId = 86498048, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=86498048"
    }, 
    [v0.WomanHead] = {
        name = v0.WomanHead, 
        assetId = 86498113, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=86498113"
    }, 
    [v0.Cheeks] = {
        name = v0.Cheeks, 
        assetId = 746767604, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=746767604"
    }, 
    [v0.Narrow] = {
        name = v0.Narrow, 
        assetId = 746774687, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=746774687"
    }, 
    [v0.StrongJaw] = {
        name = v0.StrongJaw, 
        assetId = 616399508, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=616399508"
    }, 
    [v0.Paragon] = {
        name = v0.Paragon, 
        assetId = 616398268, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=616398268"
    }, 
    [v0.Chiseled] = {
        name = v0.Chiseled, 
        assetId = 616387160, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=616387160"
    }, 
    [v0.Roundy] = {
        name = v0.Roundy, 
        assetId = 6340213, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=6340213"
    }, 
    [v0.Blockhead] = {
        name = v0.Blockhead, 
        assetId = 6340101, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=6340101"
    }, 
    [v0.Trim] = {
        name = v0.Trim, 
        assetId = 6340227, 
        image = "rbxthumb://type=Asset&w=150&h=150&id=6340227"
    }
};
if l_FFlagDynamicHeadsMigration_0 then
    v5.fromInventory = function(v6) --[[ Line: 125 ]] --[[ Name: fromInventory ]]
        -- upvalues: v5 (copy), v0 (copy)
        local v7 = {};
        if v5[v0.Default] then
            v7[v0.Default] = v5[v0.Default];
        end;
        if v6 and v6.avatarInventoryItems then
            for _, v9 in v6.avatarInventoryItems do
                if v9.headShape then
                    v7[v9.headShape] = {
                        name = v9.headShape, 
                        assetId = v9.itemId, 
                        image = "rbxasset://headshapes/" .. v9.headShape .. ".png"
                    };
                end;
            end;
        end;
        return v7;
    end;
end;
return v5;