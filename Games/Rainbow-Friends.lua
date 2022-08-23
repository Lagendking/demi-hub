getgenv().espM = false
getgenv().espI = false


local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroIcon = "https://www.roblox.com/library/10677758875/DH", IntroText = "Demi Hub"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6022668888",
	PremiumOnly = false
})

Tab3:AddParagraph("                                             Credits", string.format("\nRainbow Friends Script: Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddSection({
    Name = "esp"
})


Tab:AddToggle({
	Name = "Monsters",
	Default = false,
	Callback = function(Value)
		espM = Value
		spawn(function()
		    while espM do
		        wait()
		        
		        for _, v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
		            
		            if not v:FindFirstChild("Highlight") then
		            
    		            local esp = Instance.new("Highlight")
    		            esp.Parent = v
    		        end
		        end
		    end
            
            if not espM then
                
                for _, v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                    
                    for _, v2 in pairs(v:GetChildren()) do
                        
                        if v2.Name == "Highlight" then
                            
                            v2:Destroy()
                        end
                    end
                end
            end
        end)
	end
})


Tab:AddToggle({
	Name = "Items",
	Default = false,
	Callback = function(Value)
		espI = Value
		spawn(function()
		    
		    while espI do
		        wait()
		        
		        for _, v in pairs(workspace:GetChildren()) do
		            
		            if v.Name:sub(0, -2) == "Block" or v.Name:sub(0, -3) == "Block" or v.Name == "FoodPink" or v.Name == "FoodGreen" or v.Name == "FoodOrange" or v.Name:sub(0, -2) == "Fuse" or v.Name:sub(0, -3) == "Fuse" or v.Name == "Battery" then
		                
    		            local esp = Instance.new("Highlight")
    		            esp.Parent = v
    		        end
		        end
		    end
        
            if not espI then
                
		        for _, v in pairs(workspace:GetChildren()) do
		            
		            if v.Name:sub(0, -2) == "Block" or v.Name:sub(0, -3) == "Block" or v.Name == "FoodPink" or v.Name == "FoodGreen" or v.Name == "FoodOrange" or v.Name:sub(0, -2) == "Fuse" or v.Name:sub(0, -3) == "Fuse" or v.Name == "Battery" then
		                
    		            if v:FindFirstChild("Highlight") then
    		                
    		                v.Highlight:Destroy()
    		            end
    		        end
		        end
            end
        end)
	end
})


Tab:AddButton({
	Name = "Get Items",
	Callback = function(Value)
	    
		spawn(function()
	        wait(.5)
		        
	        for _, v in pairs(workspace:GetDescendants()) do
	            
	            if v.Name:sub(0, -2) == "Block" or v.Name:sub(0, -3) == "Block" or v.Name == "FoodPink" or v.Name == "FoodGreen" or v.Name == "FoodOrange" or v.Name:sub(0, -2) == "Fuse" or v.Name:sub(0, -3) == "Fuse" or v.Name == "Battery" then
	                
	                if v:FindFirstChild("TouchTrigger") then
	                    
		                v.TouchTrigger.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		                
	                elseif v:IsA("Tool") and not game.Players.LocalPlayer.Character:FindFirstChild(v.Name) then
	                    
	                    v:Clone().Parent = game.Players.LocalPlayer.Character
		            end
		        end
	        end
		end)
    end
})


Tab:AddButton({
	Name = "Theater tp",
	Callback = function(Value)
	    
		spawn(function()
		        
            game.Players.LocalPlayer.Character:MoveTo(game:GetService("Workspace")["Map_C1"].BlockTowerSpawn.Position)
		end)
    end
})
