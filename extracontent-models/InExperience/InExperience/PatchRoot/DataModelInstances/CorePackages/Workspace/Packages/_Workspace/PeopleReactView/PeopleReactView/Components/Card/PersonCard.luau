local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local v5 = require(l_Parent_0.Signals);
local v6 = require(l_Parent_0.SignalsReact);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v8 = require(l_Parent_0.PeopleService);
local v9 = require(l_script_FirstAncestor_0.Components.Card.CardDetails);
local v10 = require(l_script_FirstAncestor_0.Components.Card.CardThumbnail);
local v11 = require(l_script_FirstAncestor_0.Components.Card.CardTooltip);
local v12 = v8.getService("Flags");
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = v12.GetFFlagPeoplePageEnablePersonSignalStore;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v12.GetFFlagPeoplePageLazyRenderCards;
local l_GetFFlagFixPeoplePageCardTooltip_0 = v12.GetFFlagFixPeoplePageCardTooltip;
local l_FFlagPeopleCardsEnableVirtualizedGrid_0 = v12.FFlagPeopleCardsEnableVirtualizedGrid;
return v3.memo(function(v17) --[[ Line: 36 ]] --[[ Name: PersonCard ]]
    -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v6 (copy), v5 (copy), v4 (copy), v3 (copy), l_FFlagPeopleCardsEnableVirtualizedGrid_0 (copy), l_LocalPlayer_0 (copy), l_View_0 (copy), l_GetFFlagFixPeoplePageCardTooltip_0 (copy), v10 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), v9 (copy), v11 (copy)
    local v19 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v6.useSignalBinding(v5.createComputed(function(v18) --[[ Line: 38 ]]
        -- upvalues: v17 (copy)
        if type(v17.layoutOrder) == "function" then
            return v17.layoutOrder(v18);
        else
            return v17.layoutOrder or 0;
        end;
    end)) else nil;
    local v20 = nil;
    v20 = if v4.isBinding(v17.width) then v17.width:map(function(v21) --[[ Line: 48 ]]
        return UDim2.new(0, v21, 0, 0);
    end) else UDim2.new(0, v17.width, 0, 0);
    local v22, v23 = v3.useState(not l_FFlagPeopleCardsEnableVirtualizedGrid_0 and v17.showTooltip);
    if l_FFlagPeopleCardsEnableVirtualizedGrid_0 then
        v3.useEffect(function() --[[ Line: 60 ]]
            -- upvalues: v23 (copy), v17 (copy), l_LocalPlayer_0 (ref)
            v23(v17.showTooltip and l_LocalPlayer_0 ~= nil and v17.person.UserId == l_LocalPlayer_0.UserId);
        end, {
            v17.showTooltip, 
            v17.person
        });
    end;
    local v24 = v3.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v23 (copy), v17 (copy)
        v23(false);
        v17.onDismissTooltip();
    end, {});
    return v3.createElement(l_View_0, {
        tag = "auto-y", 
        Size = v20, 
        ZIndex = v22 and 2 or 1, 
        LayoutOrder = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v19 else v17.layoutOrder
    }, {
        CardContent = v3.createElement(l_View_0, {
            tag = l_GetFFlagFixPeoplePageCardTooltip_0() and "size-full-0 auto-y col bg-surface-100 radius-medium" or "size-full col bg-surface-100 radius-medium"
        }, {
            CardThumbnail = v3.createElement(v10, {
                person = v17.person, 
                shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v17.shouldShowMenu else nil, 
                layoutOrder = 1
            }), 
            CardDetails = v3.createElement(v9, {
                person = v17.person, 
                layoutOrder = 2
            })
        }), 
        CardTooltip = if v22 then v3.createElement(v11, {
            action = v24
        }) else nil
    });
end);