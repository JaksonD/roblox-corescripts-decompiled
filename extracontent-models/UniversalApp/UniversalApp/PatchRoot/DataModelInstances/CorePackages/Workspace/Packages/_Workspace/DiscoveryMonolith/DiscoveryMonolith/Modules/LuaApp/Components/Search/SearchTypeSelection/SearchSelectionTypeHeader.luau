local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local l_CollectionHeader_0 = require(l_Parent_0.CollectionViews).CollectionHeader;
local l_SearchSourceEvent_0 = require(l_Parent_0.DiscoveryTypes).SearchSourceEvent;
local v6 = require(script.Parent.Context);
return function(v7) --[[ Line: 20 ]] --[[ Name: SearchSelectionTypeHeader ]]
    -- upvalues: v1 (copy), v6 (copy), v3 (copy), v2 (copy), l_CollectionHeader_0 (copy), l_SearchSourceEvent_0 (copy)
    local v8 = v1.useContext(v6);
    v3.assert(v8 ~= nil, "Using selection header component outside of SearchTypeSelection context");
    if not v8 then
        return nil;
    else
        local v9 = v8.selections or {};
        local v11 = v2.List.filter(v9, function(v10) --[[ Line: 30 ]]
            -- upvalues: v7 (copy)
            return v10 and v10.name == v7.selectionType;
        end)[1];
        v3.assert(v11 ~= nil, "Trying to navigate to non existing selection");
        if not v11 then
            return nil;
        else
            return v1.createElement(l_CollectionHeader_0, {
                LayoutOrder = v7.LayoutOrder, 
                title = v11.text, 
                onActivate = function() --[[ Line: 42 ]] --[[ Name: onActivate ]]
                    -- upvalues: v11 (copy), l_SearchSourceEvent_0 (ref)
                    if v11.onActivated then
                        v11.onActivated(l_SearchSourceEvent_0.SeeAll);
                    end;
                end
            });
        end;
    end;
end;