local v0 = require(script.Parent.HeadShape);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v2.FFlagDynamicHeadsMigration;
local v4 = game:DefineFastFlag("AXReplaceDefaultHeadAssetId", false);
local l_FFlagAXAddFacesToHeadList_0 = v2.FFlagAXAddFacesToHeadList;
local _ = require(l_Parent_0.AvatarExperienceSlotBasedEditor);
if l_FFlagDynamicHeadsMigration_0 then

end;
local v7 = {
    [v0.Default] = {
        name = v0.Default, 
        assetId = v4 and 2432102561 or 7430070993, 
        image = v4 and "rbxthumb://type=Asset&w=150&h=150&id=2432102561" or "rbxthumb://type=Asset&w=150&h=150&id=7430070993"
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
    v7.fromInventory = function(v8, v9) --[[ Line: 126 ]] --[[ Name: fromInventory ]]
        -- upvalues: v7 (copy), v0 (copy), l_FFlagAXAddFacesToHeadList_0 (copy)
        local v10 = {};
        if v7[v0.Default] then
            v10[v0.Default] = v7[v0.Default];
            if l_FFlagAXAddFacesToHeadList_0 and v9 then
                v10[v0.Default].image = ("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v9);
            end;
        end;
        if v8 and v8.avatarInventoryItems then
            for _, v12 in v8.avatarInventoryItems do
                if v12.headShape then
                    local v13 = "rbxasset://headshapes/" .. v12.headShape .. ".png";
                    if l_FFlagAXAddFacesToHeadList_0 and v9 then
                        v13 = ("rbxthumb://type=Asset&id=%*&headshape=%*&w=150&h=150"):format(v9, v12.headShape);
                    end;
                    v10[v12.headShape] = {
                        name = v12.headShape, 
                        assetId = v12.itemId, 
                        image = v13
                    };
                end;
            end;
        end;
        return v10;
    end;
end;
return v7;