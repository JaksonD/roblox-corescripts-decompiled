local v0 = require(script.Parent.HeadShape);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagDynamicHeadsMigration_0 = v2.FFlagDynamicHeadsMigration;
local v4 = game:DefineFastFlag("AXReplaceDefaultHeadAssetId", false);
local l_FFlagAXAddFacesToHeadList_0 = v2.FFlagAXAddFacesToHeadList;
local l_FFlagAXFixTryOnHeadShapeThumbnail_0 = v2.FFlagAXFixTryOnHeadShapeThumbnail;
local _ = require(l_Parent_0.AvatarExperienceSlotBasedEditor);
if l_FFlagDynamicHeadsMigration_0 then

end;
local v8 = {
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
    v8.fromInventory = function(v9, v10, v11) --[[ Line: 127 ]] --[[ Name: fromInventory ]]
        -- upvalues: v8 (copy), v0 (copy), l_FFlagAXAddFacesToHeadList_0 (copy), l_FFlagAXFixTryOnHeadShapeThumbnail_0 (copy)
        local v12 = {};
        if v8[v0.Default] then
            v12[v0.Default] = v8[v0.Default];
            if l_FFlagAXAddFacesToHeadList_0 and v10 then
                v12[v0.Default].image = ("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v10);
            end;
            if l_FFlagAXFixTryOnHeadShapeThumbnail_0 and v11 then
                v12[v0.Default].image = ("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v11);
            end;
        end;
        if v9 and v9.avatarInventoryItems then
            for _, v14 in v9.avatarInventoryItems do
                if v14.headShape then
                    local v15 = "rbxasset://headshapes/" .. v14.headShape .. ".png";
                    if l_FFlagAXAddFacesToHeadList_0 and v10 then
                        v15 = ("rbxthumb://type=Asset&id=%*&headshape=%*&w=150&h=150"):format(v10, v14.headShape);
                    end;
                    if l_FFlagAXFixTryOnHeadShapeThumbnail_0 and v11 then
                        v15 = ("rbxthumb://type=Asset&id=%*&headshape=%*&w=150&h=150"):format(v11, v14.headShape);
                    end;
                    v12[v14.headShape] = {
                        name = v14.headShape, 
                        assetId = v14.itemId, 
                        image = v15
                    };
                end;
            end;
        end;
        return v12;
    end;
end;
return v8;