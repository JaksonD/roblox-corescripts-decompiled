local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_PlayerTile_0 = v3.App.Tile.PlayerTile;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v7 = require(script.Parent.PlayerName);
local v8 = require(script.Parent.Constants);
local l_FFlagUseSizeInClipRect_0 = require(l_Parent_0.SharedFlags).FFlagUseSizeInClipRect;
local function v10() --[[ Line: 16 ]]

end;
local v11 = {
    tileSize = v8.TILE_SIZE, 
    nameTopPadding = v8.NAME_TOP_PADDING, 
    contextualTopPadding = v8.CONTEXTUAL_TOP_PADDING
};
return function(v12) --[[ Line: 51 ]]
    -- upvalues: v2 (copy), v11 (copy), v1 (copy), l_PlayerTile_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v7 (copy), l_FFlagUseSizeInClipRect_0 (copy), l_Interactable_0 (copy), v10 (copy)
    local v13 = v2.Dictionary.join(v11, v12);
    local l_tileSize_0 = v13.tileSize;
    local function _() --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        if v13.renderButtons then
            return (v13.renderButtons());
        else
            return nil;
        end;
    end;
    local function v16() --[[ Line: 59 ]]
        -- upvalues: v13 (copy), v1 (ref), l_PlayerTile_0 (ref), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
        if v13.renderPlayerTile then
            return (v13.renderPlayerTile());
        else
            return (v1.createElement(l_PlayerTile_0, {
                title = "", 
                tileSize = UDim2.fromOffset(v13.tileSize, v13.tileSize), 
                thumbnail = if v13.headshotImageUrl then v13.headshotImageUrl else l_getStandardSizeAvatarHeadShotRbxthumb_0(v13.userId), 
                onActivated = v13.onActivatedTile, 
                buttons = if v13.renderButtons then v13.renderButtons() else nil, 
                Selectable = true, 
                buttonRef = v13.buttonRef
            }));
        end;
    end;
    local function _() --[[ Line: 75 ]]
        -- upvalues: v13 (copy)
        if v13.renderContextualInfo then
            return (v13.renderContextualInfo());
        else
            return nil;
        end;
    end;
    local function v18() --[[ Line: 79 ]]
        -- upvalues: v13 (copy), v1 (ref), v7 (ref)
        if v13.renderPlayerName then
            return (v13.renderPlayerName());
        else
            return v13.userName and v1.createElement(v7, {
                name = v13.userName, 
                width = v13.tileSize
            }) or nil;
        end;
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v13.layoutOrder, 
        Size = if l_FFlagUseSizeInClipRect_0 then UDim2.new(0, l_tileSize_0, 1, 0) else UDim2.fromOffset(l_tileSize_0, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PlayerTileFrame = v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
            BackgroundTransparency = 1
        }, {
            PlayerTile = v16()
        }), 
        NameTopPadding = if v13.nameTopPadding then v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(0, v13.nameTopPadding), 
            BackgroundTransparency = 1
        }) else nil, 
        UserInfo = v1.createElement(l_Interactable_0, {
            LayoutOrder = 3, 
            [v1.Event.Activated] = v13.onActivatedContextual, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onStateChanged = v10, 
            BackgroundTransparency = 1, 
            Selectable = false
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PlayerNameFrame = v1.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                PlayerName = v18()
            }), 
            ContextualTopPadding = if v13.contextualTopPadding then v1.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v13.contextualTopPadding), 
                BackgroundTransparency = 1
            }) else nil, 
            ContextualInfoFrame = v1.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ContextualInfo = if v13.renderContextualInfo then v13.renderContextualInfo() else nil
            })
        })
    });
end;