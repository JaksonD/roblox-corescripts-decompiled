local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.Components.NotificationModalBase);
local v4 = nil;
local v5 = {};
local function _(v6) --[[ Line: 13 ]] --[[ Name: UpdateRoot ]]
    -- upvalues: v5 (ref), v4 (ref), v2 (copy), v3 (copy)
    if v5 and v5.ModalKey ~= v6.ModalKey and v5.Params and v5.Params.CloseCallback then
        v5.Params.CloseCallback();
    end;
    v5 = v6;
    v4:render(v2.createElement(v3, v6));
end;
local function v10(v8) --[[ Line: 22 ]]
    -- upvalues: v4 (ref), v5 (ref), v2 (copy), v3 (copy)
    if v4 and v8 == v5.ModalKey then
        local v9 = {};
        if v5 and v5.ModalKey ~= v9.ModalKey and v5.Params and v5.Params.CloseCallback then
            v5.Params.CloseCallback();
        end;
        v5 = v9;
        v4:render(v2.createElement(v3, v9));
    end;
end;
return {
    OpenModal = function(v11, v12, v13) --[[ Line: 28 ]]
        -- upvalues: v4 (ref), v1 (copy), v5 (ref), v2 (copy), v3 (copy)
        if not v4 then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "NotificationModals";
            l_Folder_0.Parent = game:GetService("CoreGui");
            v4 = v1.createRoot(l_Folder_0);
        end;
        local v17 = {
            ModalKey = v11, 
            Component = v12, 
            Params = v13, 
            CloseModal = function() --[[ Line: 40 ]] --[[ Name: CloseModal ]]
                -- upvalues: v11 (copy), v4 (ref), v5 (ref), v2 (ref), v3 (ref)
                local l_v11_0 = v11;
                if v4 and l_v11_0 == v5.ModalKey then
                    local v16 = {};
                    if v5 and v5.ModalKey ~= v16.ModalKey and v5.Params and v5.Params.CloseCallback then
                        v5.Params.CloseCallback();
                    end;
                    v5 = v16;
                    v4:render(v2.createElement(v3, v16));
                end;
            end
        };
        if v5 and v5.ModalKey ~= v17.ModalKey and v5.Params and v5.Params.CloseCallback then
            v5.Params.CloseCallback();
        end;
        v5 = v17;
        v4:render(v2.createElement(v3, v17));
        return true;
    end, 
    CloseModal = v10
};