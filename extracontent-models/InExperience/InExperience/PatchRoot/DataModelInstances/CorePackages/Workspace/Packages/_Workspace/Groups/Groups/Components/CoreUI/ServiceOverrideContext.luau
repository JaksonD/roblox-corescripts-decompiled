local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_GroupService_0 = game:GetService("GroupService");
local l_GuiService_0 = game:GetService("GuiService");
return require(l_Parent_0.React).createContext({
    groupService = l_GroupService_0, 
    guiService = l_GuiService_0
});