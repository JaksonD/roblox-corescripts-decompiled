local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_UIBlox_0 = v1.UIBlox;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local v7 = require(l_script_FirstAncestor_0.User.getUserAvatarImage);
local v8 = require(script.Parent.PlayerName);
local _ = require(script.Parent.StyleTypes);
local v10 = require(script.Parent.Constants);
local function v11() --[[ Line: 16 ]]

end;
local v12 = {
    tileSize = v10.TILE_SIZE, 
    nameTopPadding = v10.NAME_TOP_PADDING, 
    contextualTopPadding = v10.CONTEXTUAL_TOP_PADDING
};
return function(v13) --[[ Line: 49 ]]
    -- upvalues: l_llama_0 (copy), v12 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), v7 (copy), v8 (copy), l_Interactable_0 (copy), v11 (copy)
    local v14 = l_llama_0.Dictionary.join(v12, v13);
    local l_tileSize_0 = v14.tileSize;
    local function _() --[[ Line: 53 ]]
        -- upvalues: v14 (copy)
        if v14.renderButtons then
            return (v14.renderButtons());
        else
            return nil;
        end;
    end;
    local function v17() --[[ Line: 59 ]]
        -- upvalues: v14 (copy), l_Roact_0 (ref), l_PlayerTile_0 (ref), v7 (ref)
        if v14.renderPlayerTile then
            return (v14.renderPlayerTile());
        else
            return (l_Roact_0.createElement(l_PlayerTile_0, {
                tileSize = UDim2.fromOffset(v14.tileSize, v14.tileSize), 
                thumbnail = v7(v14.userId), 
                onActivated = v14.onActivatedTile, 
                buttons = if v14.renderButtons then v14.renderButtons() else nil
            }));
        end;
    end;
    local function _() --[[ Line: 70 ]]
        -- upvalues: v14 (copy)
        if v14.renderContextualInfo then
            return (v14.renderContextualInfo());
        else
            return nil;
        end;
    end;
    local function v19() --[[ Line: 76 ]]
        -- upvalues: v14 (copy), l_Roact_0 (ref), v8 (ref)
        if v14.renderPlayerName then
            return (v14.renderPlayerName());
        else
            return v14.userName and l_Roact_0.createElement(v8, {
                name = v14.userName, 
                width = v14.tileSize
            }) or nil;
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.fromOffset(l_tileSize_0, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PlayerTileFrame = l_Roact_0.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
            BackgroundTransparency = 1
        }, {
            PlayerTile = v17()
        }), 
        NameTopPadding = if v14.nameTopPadding then l_Roact_0.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(0, v14.nameTopPadding), 
            BackgroundTransparency = 1
        }) else nil, 
        UserInfo = l_Roact_0.createElement(l_Interactable_0, {
            LayoutOrder = 3, 
            [l_Roact_0.Event.Activated] = v14.onActivatedContextual, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onStateChanged = v11, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PlayerNameFrame = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                PlayerName = v19()
            }), 
            ContextualTopPadding = if v14.contextualTopPadding then l_Roact_0.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v14.contextualTopPadding), 
                BackgroundTransparency = 1
            }) else nil, 
            ContextualInfoFrame = l_Roact_0.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ContextualInfo = if v14.renderContextualInfo then v14.renderContextualInfo() else nil
            })
        })
    });
end;