

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Sellers HUB",
    Size = UDim2.fromOffset(550, 400),
    Theme = Mercury.Themes.Dark,
    Link = "MADE BY NICO"
}

game:GetService("UserInputService").MouseIconEnabled = true
game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default

local Tab = GUI:Tab{
	Name = "AUTO DROP",
	Icon = "rbxassetid://8569322835"
}

Tab:Textbox{
	Name = "Amount",
	Description = nil,
	Callback = function(text)
	 _G.DropAmount = (text)
end
}

local MyDropdown = Tab:Dropdown{
	Name = "Items",
	StartingText = "Select items...",
	Description = "Make sure you have the item",
	Items = {
        "Wipe Potion",
        "Perfect Crystal",
        "Muzan Blood",
        "Breath Indict",
        "Combat Potion",
        "Sun Ore",
        "Broken Nichirin",
        "Soup"
	},
	Callback = function(item)
    	_G.ITEM_NAME = item
return
end
}

Tab:Button{
	Name = "Start Dropping",
	Description = 'Once you pressed it will start dropping',
	Callback = function()
for i=1, _G.DropAmount do

wait(1)
local args = { 
   [1] = "HUD",
   [2] = "Inventory",
   [3] = "Drop",
   [4] = _G.ITEM_NAME
}

game:GetService("ReplicatedStorage").Remotes.Sync:InvokeServer(unpack(args))

end
end
}

Tab:Button{
	Name = "Spy Chat",
	Description = "This will allow you to see players chats",
	Callback = function()
	    
	      local Players, SGui = game:GetService("Players"), game:GetService("StarterGui");
local Client, NColor3, UD, UD2 = Players.LocalPlayer, Color3.new, UDim.new, UDim2.new

local function ChatSpy()
   local ChatSpyFrame = Client.PlayerGui.Chat.Frame
   ChatSpyFrame.ChatChannelParentFrame.Visible = true
   ChatSpyFrame.ChatBarParentFrame.Position = ChatSpyFrame.ChatChannelParentFrame.Position + UD2(UD(), ChatSpyFrame.ChatChannelParentFrame.Size.Y)
end -- brings back chat for games that remove it
ChatSpy()

getgenv().ShowHiddenMsg = function(T, C)
   SGui:SetCore("ChatMakeSystemMessage", {
       Text = T;
       Color = C;
   })
end
getgenv().Spy = function(Target)
   Target.Chatted:Connect(function(Msg)
       if string.find(Msg, "/e ") or string.find(Msg, "/w ") or string.find(Msg, "/whisper ") then
           ShowHiddenMsg("{SPY}: ".."["..tostring(Target).."]: "..Msg, NColor3(255,255,255)) -- https://www.rapidtables.com/web/color/RGB_Color.html if you want to change the color of the hidden msg's
       end
   end)
end

local GP = Players:GetPlayers()
for i = 1, #GP do
   local Plr = GP[i]
   if tostring(Plr) then
       Spy(Plr)
   end
end
Players.PlayerAdded:Connect(function(P)
   if tostring(P) then
       Spy(P)
   end
end)  
	    
	    end
}

Tab:Toggle{
	Name = "Pick Up Aura",
	StartingState = false,
	Description = "Auto Collects items near you",
	Callback = function(state)
while state do
    wait()
local args = {
    [1] = "Character",
    [2] = "Interaction",
    [3] = workspace.DropItem
}
        game:GetService("ReplicatedStorage").Remotes.Async:FireServer(unpack(args))
    end
end
}

GUI:Credit{
	Name = "Nico",
	Description = "For Creating the script And GUI.",
	V3rm = "Unavailable",
	Discord = "! Sayu Ogiwara.#0776"
}
