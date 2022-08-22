getgenv().autoWin = false
getgenv().antiafk = false


local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroIcon = "https://www.roblox.com/library/10677758875/DH", IntroText = "Demi Hub"})


local Tab = Window:MakeTab({
	Name = "Auto",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6022668888",
	PremiumOnly = false
})

Tab2:AddParagraph("                                             Credits", string.format("\nRace Clicker Script: Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddToggle({
	Name = "Win",
	Default = false,
	Callback = function(Value)
		autoWin = Value
		spawn(function()
		    while autoWin do
		        wait()
		        
		        for _, v in ipairs(game:GetService("Workspace").Environment:GetChildren()) do
		            if not autoWin then game.Players.LocalPlayer.Character:BreakJoints() return end
		            for _, v2 in pairs(v:GetDescendants()) do
		                if not autoWin then game.Players.LocalPlayer.Character:BreakJoints() return end
		                if v2.Name == "Sign" then
		                    
		                    game.Players.LocalPlayer.Character:MoveTo(v2.Position)
		                    wait(1)
		                elseif v2.Name == "Roof" then
		                    
		                    v2.CanCollide = false
		                end
		            end
		        end
	        end
		end)
	end    
})

Tab1:AddToggle({
    Name = "Anti Afk",
    Default = false,
    Callback = function(Value)
        local vu = game:GetService("VirtualUser")
        antiafk = Value
        
        spawn(function()
            while antiafk do
                wait(60)
                if not antiafk then return end
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                   wait(0.5)
                   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
            end
        end)
    end
})
