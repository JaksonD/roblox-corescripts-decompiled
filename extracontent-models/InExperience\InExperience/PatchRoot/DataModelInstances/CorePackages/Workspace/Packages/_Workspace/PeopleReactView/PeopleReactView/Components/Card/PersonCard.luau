local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.SignalsReact);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v7 = require(l_Parent_0.PeopleService);
local v8 = require(l_script_FirstAncestor_0.Components.Card.CardDetails);
local v9 = require(l_script_FirstAncestor_0.Components.Card.CardThumbnail);
local v10 = require(l_script_FirstAncestor_0.Components.Card.CardTooltip);
local v11 = v7.getService("Flags");
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = v11.GetFFlagPeoplePageEnablePersonSignalStore;
local l_GetFFlagPeoplePageLazyRenderCards_0 = v11.GetFFlagPeoplePageLazyRenderCards;
local l_GetFFlagFixPeoplePageCardTooltip_0 = v11.GetFFlagFixPeoplePageCardTooltip;
return v2.memo(function(v15) --[[ Line: 32 ]] --[[ Name: PersonCard ]]
    -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v5 (copy), v4 (copy), v3 (copy), v2 (copy), l_View_0 (copy), l_GetFFlagFixPeoplePageCardTooltip_0 (copy), v9 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), v8 (copy), v10 (copy)
    local v17 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v5.useSignalBinding(v4.createComputed(function(v16) --[[ Line: 34 ]]
        -- upvalues: v15 (copy)
        if type(v15.layoutOrder) == "function" then
            return v15.layoutOrder(v16);
        else
            return v15.layoutOrder or 0;
        end;
    end)) else nil;
    local v18 = nil;
    v18 = if v3.isBinding(v15.width) then v15.width:map(function(v19) --[[ Line: 44 ]]
        return UDim2.new(0, v19, 0, 0);
    end) else UDim2.new(0, v15.width, 0, 0);
    local v20, v21 = v2.useState(v15.showTooltip);
    local v22 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v21 (copy), v15 (copy)
        v21(false);
        v15.onDismissTooltip();
    end, {});
    return v2.createElement(l_View_0, {
        tag = "auto-y", 
        Size = v18, 
        ZIndex = v20 and 2 or 1, 
        LayoutOrder = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then v17 else v15.layoutOrder
    }, {
        CardContent = v2.createElement(l_View_0, {
            tag = l_GetFFlagFixPeoplePageCardTooltip_0() and "size-full-0 auto-y col bg-surface-100 radius-medium" or "size-full col bg-surface-100 radius-medium"
        }, {
            CardThumbnail = v2.createElement(v9, {
                person = v15.person, 
                shouldShowMenu = if l_GetFFlagPeoplePageLazyRenderCards_0() then v15.shouldShowMenu else nil, 
                layoutOrder = 1
            }), 
            CardDetails = v2.createElement(v8, {
                person = v15.person, 
                layoutOrder = 2
            })
        }), 
        CardTooltip = if v20 then v2.createElement(v10, {
            action = v22
        }) else nil
    });
end);