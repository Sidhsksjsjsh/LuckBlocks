-- DONT TOUCH (or do, no one is stoping you)
-- Where the sausage is made
getgenv().autoMoney = false;
getgenv().autoRebirth = false;
getgenv().autoBlocks = false;

local AsyncEgg = {}
for _,EggSync in pairs(game:GetService("Workspace").Core.Eggs:GetChildren()) do
    table.insert(AsyncEgg, EggSync.Name)
end

-- Variables holding time to wait (These are the default time values)
local moneyWait = 0.1
local rebirthWait = 0.1
local eggWait = 2
local ZombieNumber = 0

-- Variables for money and agg amount (These are the default amount values)
local moneyAmt = -9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
local eggAmt = 1
local _SyncNumber = 0
-- Variable to hold egg name
local eggName

-- Give money function
function doMoney(time)
   spawn(function()
       while autoMoney do
           local args = {
               [1] = "Hacked Egg",
               [2] = moneyAmt, -- Holy Smokes!
               [3] = {}
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("GivePlayerRandomPet"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end

function FarmZombie(ZN)
local args = {
    [1] = "Zombie_" .. ZN
}

game:GetService("ReplicatedStorage").Events.Remotes.ServerRemotes.AttackBoss:InvokeServer(unpack(args))
end

-- Trigger rebirth function
function doRebirth(time)
   spawn(function()
       while autoRebirth do
           local args = {
               [1] = True
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("Rebirth"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end


-- Egg buy function
function buyEgg(time)
   spawn(function()
       while wait() do
           if not autoBuyEgg then break end
           ;
           local args = {
               [1] = eggName,
               [2] = eggAmt,
               [3] = {}
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("GivePlayerRandomPet"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end


-- GUI for script
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local F = Window:MakeTab({
Name = "Farming",
Icon = "rbxassetid://12972185540",
PremiumOnly = false
})

local E = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://12972185540",
PremiumOnly = false
})

-- You have no enemies tho
-- Money input
F:AddTextbox({
Name = "Zombie Number",
Default = "0",
TextDisappear = true,
Callback = function(value)
    ZombieNumber = value
end
})

F:AddToggle({
Name = "Farm Zombie",
Default = false,
Callback = function(bool)
getgenv().autoBlocks = bool
    while wait() do
    if getgenv().autoBlocks == false then break end
    FarmZombie(ZombieNumber)
   end
end
})

F:AddTextbox({
Name = "money amount",
Default = "0",
TextDisappear = true,
Callback = function(value)
     moneyAmt = value
end
})

-- Wait slider for money

F:AddTextbox({
Name = "Seconds to wait (money)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   moneyWait = value
end
})


-- Auto money toggle

F:AddToggle({
Name = "Auto Money",
Default = false,
Callback = function(bool)
   getgenv().autoMoney = bool
   print('Auto money is: ', bool)
   if bool then
       doMoney(moneyWait);
   end
end
})

-- Wait slider for rebirths
F:AddTextbox({
Name = "Seconds to wait (Rebirths)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   rebirthWait = value
end
})

-- Auto rebirth togglea
F:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(bool)
   getgenv().autoRebirth = bool
   print('Auto rebirth is: ', bool)
   if bool then
       doRebirth(rebirthWait);
   end
end
})

-- Egg input
E:AddTextbox({
Name = "Egg Hatch Amount",
Default = "0",
TextDisappear = true,
Callback = function(value)
   eggAmt = math.abs(value)
end
})

-- Wait slider for eggs
E:AddTextbox({
Name = "Seconds to wait (Egg)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   eggWait = value
end
})

-- Egg dropdown

E:AddDropdown({
Name = "Select Egg",
Default = "Normal Egg",
Options = AsyncEgg,
Callback = function(mob)
   eggName = mob
end
})

-- Auto egg toggle
E:AddToggle({
Name = "Auto Buy Egg",
Default = false,
Callback = function(bool)
   getgenv().autoBuyEgg = bool
   print('Auto buy egg is: ', bool)
   if bool then
       buyEgg(eggWait);
   end
end
})
