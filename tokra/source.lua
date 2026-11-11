-- Names recovered by dark reel nico (!fix): 36 renamed from context, uncertain names left untouched
-- Deobfuscated by nico nico nii

tokraNormalizeOption = function(option)
	if type(option) ~= "table" then
		option = { CurrentOption = option }
	end

	local raw = option.CurrentOption
	local list = {}

	if type(raw) == "table" then
		for _, value in ipairs(raw) do
			if value ~= nil then
				list[#list + 1] = tostring(value)
			end
		end
	elseif type(raw) == "string" or type(raw) == "number" then
		list = { tostring(raw) }
	end

	if not option.MultipleOptions and #list > 1 then
		list = { list[1] }
	end

	option.CurrentOption = list

	return list
end

tokraSelectedText = function(list)
	if type(list) ~= "table" or #list == 0 then
		return "None"
	end

	if #list == 1 then
		return tostring(list[1])
	end

	return "Various"
end

tokraRefreshDropdown = function(option, element)
	local list = tokraNormalizeOption(option)
	local text = tokraSelectedText(list)

	if element and element.Selected then
		element.Selected.Text = text
	end

	return text
end

if game.PlaceId == 6961824067 then
	if not getgenv().TokraLoaded and not getgenv().TokraRan then
		task.delay(5, function()
			getgenv().TokraRan = nil
		end)

		getgenv().TokraRan = true

		if not game:IsLoaded() then
			game.Loaded:Wait()
		end

		local Players = game:GetService("Players")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		game:GetService("ReplicatedFirst")
		local Lighting = game:GetService("Lighting")
		local TextChatService = game:GetService("TextChatService")
		local UserInputService = game:GetService("UserInputService")
		local ContextActionService = game:GetService("ContextActionService")
		local RunService = game:GetService("RunService")
		local StarterGui = game:GetService("StarterGui")

		do
			local game = game
			local game2 = game
			local getService = game.GetService
			local countlz = bit32.countlz
			local n = 124256256
			local n2 = countlz(n) + 11
			getService(game2, "TweenService")
		end

		game:GetService("HttpService")
		local v = cloneref(game:GetService("CoreGui"))
		local localPlayer, mouse, inPlot, isHeld, currentReach, currentCamera, character, head, humanoid, humanoidRootPart
		local ragdolled, v2, v3

		do
			local v4 = cloneref(game:GetService("RbxAnalyticsService"))
			localPlayer = Players.LocalPlayer
			mouse = localPlayer:GetMouse()
			inPlot = localPlayer:WaitForChild("InPlot")
			isHeld = localPlayer:WaitForChild("IsHeld")
			currentReach = localPlayer:WaitForChild("CurrentReach")
			currentCamera = nil
			character = nil; head = nil; humanoid = nil
			humanoidRootPart = nil
			ragdolled = nil; v2 = nil; v3 = nil
			local genv = getgenv()
			local env = getfenv()
			if typeof(genv) ~= "table" or typeof(env) ~= "table" then
				return
			end
			local typeof = typeof
			if typeof("") ~= "string" or typeof(1) ~= "number" or typeof({}) ~= "table" then
				return
			end
			local tostring = tostring
			if typeof(tostring) ~= "function" or tostring(1) ~= "1" then
				return
			end
			local tonumber = tonumber
			if typeof(tonumber) ~= "function" then
				return
			end
			tonumber("1")
			local loadstring_ = genv.loadstring
			if not loadstring_ or typeof(loadstring_) ~= "function" then
				return
			end
			loadstring_("getgenv().TokraSetup = true")()
			wait()
			if not getgenv().TokraSetup then
				return
			end
			getgenv().TokraSetup = nil
			local tbl; tbl = {
				charset64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
				base64_encrypt = function(arg)
					local charset64 = tbl.charset64
					local str = ""
					local n = 0
					local n2 = 0

					for i = 1, #arg do
						n = n * 256 + arg:byte(i)
						n2 += 8

						while n2 >= 6 do
							n2 -= 6
							local floor = math.floor
							local flag = true
							local n3 = floor(n / 2 ^ n2) % 64
							str ..= charset64:sub(n3 + 1, n3 + 1)
							n %= 2 ^ n2
						end
					end

					if n2 > 0 then
						local n3 = n * 2 ^ (6 - n2) % 64
						str ..= charset64:sub(n3 + 1, n3 + 1)
					end

					for i = 1, (4 - #str % 4) % 4 do
						str ..= "="
					end

					return str
				end,
				base64_decrypt = function(arg)
					local charset64 = tbl.charset64
					local str = ""
					local n = 0
					local n2 = 0
					local str2 = arg:gsub("[^A-Za-z0-9+/]", ""):gsub("=+$", "")

					for i = 1, #str2 do
						local pos = charset64:find(str2:sub(i, i), 1, true)
						if not pos then
							return ""
						end
						n = n * 64 + pos - 1
						n2 += 6

						if n2 >= 8 then
							n2 -= 8
							str ..= string.char(math.floor(n / 2 ^ n2) % 256)
							n %= 2 ^ n2
						end
					end

					return str
				end,
				caesar_encrypt = function(arg, arg2)
					local str = ""
					local n = arg2 % 26

					for i = 1, #arg do
						local str2 = arg:sub(i, i)
						local v5 = str2:byte()

						if v5 >= 65 and v5 <= 90 then
							str ..= string.char((v5 - 65 + n) % 26 + 65)
						elseif v5 >= 97 and v5 <= 122 then
							str ..= string.char((v5 - 97 + n) % 26 + 97)
						else
							str ..= str2
						end
					end

					return str
				end,
			}

			local function caesarDecrypt(arg, arg2)
				return tbl.caesar_encrypt(arg, -arg2)
			end

			local countlz = bit32.countlz
			local countlz2 = bit32.countlz
			local len = 1
			local v5 = countlz2(len)
			local n = countlz(v5) + 69
			tbl.caesar_decrypt = caesarDecrypt

			tbl.tokra_encrypt = function(arg)
				local v6 = tbl.caesar_encrypt(tbl.base64_encrypt(arg), 9)
				local v7 = tbl.caesar_encrypt(tbl.base64_encrypt(v6), 17)
				return (tbl.base64_encrypt(v7))
			end

			tbl.tokra_decrypt = function(arg)
				local v6 = tbl.caesar_decrypt(tbl.base64_decrypt(arg), 17)
				local v7 = tbl.caesar_decrypt(tbl.base64_decrypt(v6), 9)
				return (tbl.base64_decrypt(v7))
			end

			_HttpGet = game.HttpGet
			local request = getgenv().request
			if not request then
				return
			end


		local rbxGeneral
		local textChannels = TextChatService:WaitForChild("TextChannels", 3)
		rbxGeneral = textChannels and textChannels:WaitForChild("RBXGeneral", 3)
		if not rbxGeneral or typeof(rbxGeneral) ~= "Instance" or not rbxGeneral:IsA("TextChannel") then
			return
		end
		local fn

		fn = function(arg)
			local service = game:GetService(arg)
			return (cloneref(service))
		end

		local fn2

		fn2 = function(arg, arg2)
			assert(type(arg) == "string", "Expected string, got " .. type(arg))
			local n = arg2 or 5
			local flag = false; local flag2 = false; local str = nil

			local thread = task.spawn(function()
				local ok, result = pcall(game.HttpGet, game, arg)

				if ok then
					if #result ~= 0 then
						local result2 = result

						local ok2, result3 = pcall(function()
							return loadstring(result2)()
						end)

						flag2 = ok2; str = result3; flag = true
						return
					end
				end

				if #result == 0 then
					result = "Empty response"
				end

				flag2 = false; str = result; flag = true
			end)

			local thread2 = task.delay(n, function()
				if not flag then
					local warn; warn = warn
					local str2 = ("Request for %* timed out after %* seconds"):format(arg, n)
					warn(str2)
					task.cancel(thread)
					str = "Request timed out"
					flag = true
				end
			end)

			while not flag do
				task.wait()
			end

			if coroutine.status(thread2) ~= "dead" then
				task.cancel(thread2)
			end

			if not flag2 then
				local warn; warn = warn
				local str2 = ("Failed to process %*: %*"):format(arg, str)
				warn(str2)
			end

			local v4

			if not flag2 then
				v4 = nil
			else
				v4 = str
			end

			return v4
		end

		local callback = "Rayfield/Configurations"
		local HttpService = fn("HttpService")
		local RunService2 = fn("RunService")
		local tbl = { Flags = {} }
		local theme = {}

		do
			local default = {
				TextColor = Color3.fromRGB(240, 240, 240),
				Background = Color3.fromRGB(25, 25, 25),
				Topbar = Color3.fromRGB(34, 34, 34),
				Shadow = Color3.fromRGB(20, 20, 20),
				NotificationBackground = Color3.fromRGB(20, 20, 20),
			}

			local Color3_ = Color3
			local bor = bit32.bor
			local v4 = 10
			local value = 368
			local n = bor(402, v4, value) - 464
			default.NotificationActionsBackground = Color3_.fromRGB(230, 230, 230)
			default.TabBackground = Color3.fromRGB(80, 80, 80)
			local n2 = 52
			default.TabStroke = Color3.fromRGB(85, 85, 85)
			default.TabBackgroundSelected = Color3.fromRGB(210, 210, 210)
			default.TabTextColor = Color3.fromRGB(240, 240, 240)
			default.SelectedTabTextColor = Color3.fromRGB(50, 50, 50)
			default.ElementBackground = Color3.fromRGB(35, 35, 35)
			default.ElementBackgroundHover = Color3.fromRGB(40, 40, 40)
			default.SecondaryElementBackground = Color3.fromRGB(25, 25, 25)
			default.ElementStroke = Color3.fromRGB(50, 50, 50)
			default.SecondaryElementStroke = Color3.fromRGB(40, 40, 40)
			default.SliderBackground = Color3.fromRGB(50, 138, 220)
			default.SliderProgress = Color3.fromRGB(50, 138, 220)
			default.SliderStroke = Color3.fromRGB(58, 163, 255)
			default.ToggleBackground = Color3.fromRGB(30, 30, 30)
			default.ToggleEnabled = Color3.fromRGB(0, 146, 214)
			default.ToggleDisabled = Color3.fromRGB(100, 100, 100)
			default.ToggleEnabledStroke = Color3.fromRGB(0, 170, 255)
			default.ToggleDisabledStroke = Color3.fromRGB(125, 125, 125)
			default.ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100)
			local bxor = bit32.bxor
			local flag = true
			local byte = string.byte("vG", 1, nil)
			local n3 = bxor(261, byte) - 319
			default.ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65)
			default.DropdownSelected = Color3.fromRGB(40, 40, 40)
			local flag2 = true
			local n4 = 65
			default.DropdownUnselected = Color3.fromRGB(30, 30, 30)
			default.InputBackground = Color3.fromRGB(30, 30, 30)
			default.InputStroke = Color3.fromRGB(65, 65, 65)
			default.PlaceholderColor = Color3.fromRGB(178, 178, 178)
			theme.Default = default
		end

		do
			local ocean = {
				TextColor = Color3.fromRGB(230, 240, 240),
				Background = Color3.fromRGB(20, 30, 30),
				Topbar = Color3.fromRGB(25, 40, 40),
				Shadow = Color3.fromRGB(15, 20, 20),
				NotificationBackground = Color3.fromRGB(25, 35, 35),
				NotificationActionsBackground = Color3.fromRGB(230, 240, 240),
				TabBackground = Color3.fromRGB(40, 60, 60),
				TabStroke = Color3.fromRGB(50, 70, 70),
				TabBackgroundSelected = Color3.fromRGB(100, 180, 180),
				TabTextColor = Color3.fromRGB(210, 230, 230),
				SelectedTabTextColor = Color3.fromRGB(20, 50, 50),
				ElementBackground = Color3.fromRGB(30, 50, 50),
			}

			local Color3_ = Color3
			local n = 42
			ocean.ElementBackgroundHover = Color3_.fromRGB(40, 60, 60)
			ocean.SecondaryElementBackground = Color3.fromRGB(30, 45, 45)
			ocean.ElementStroke = Color3.fromRGB(45, 70, 70)
			ocean.SecondaryElementStroke = Color3.fromRGB(40, 65, 65)
			ocean.SliderBackground = Color3.fromRGB(0, 110, 110)
			ocean.SliderProgress = Color3.fromRGB(0, 140, 140)
			ocean.SliderStroke = Color3.fromRGB(0, 160, 160)
			ocean.ToggleBackground = Color3.fromRGB(30, 50, 50)
			ocean.ToggleEnabled = Color3.fromRGB(0, 130, 130)
			ocean.ToggleDisabled = Color3.fromRGB(70, 90, 90)
			ocean.ToggleEnabledStroke = Color3.fromRGB(0, 160, 160)
			local n2 = 42
			ocean.ToggleDisabledStroke = Color3.fromRGB(85, 105, 105)
			ocean.ToggleEnabledOuterStroke = Color3.fromRGB(50, 100, 100)
			ocean.ToggleDisabledOuterStroke = Color3.fromRGB(45, 65, 65)
			ocean.DropdownSelected = Color3.fromRGB(30, 60, 60)
			local Color3_2 = Color3
			local bxor = bit32.bxor
			local byte = string.byte("\28f", 1, nil)
			local value = 457
			local value2 = 209
			local n3 = bxor(byte, value, value2) - 218
			ocean.DropdownUnselected = Color3_2.fromRGB(25, 40, 40)
			ocean.InputBackground = Color3.fromRGB(30, 50, 50)
			ocean.InputStroke = Color3.fromRGB(50, 70, 70)
			ocean.PlaceholderColor = Color3.fromRGB(140, 160, 160)
			theme.Ocean = ocean
		end

		do
			local amberGlow = {
				TextColor = Color3.fromRGB(255, 245, 230),
				Background = Color3.fromRGB(45, 30, 20),
				Topbar = Color3.fromRGB(55, 40, 25),
				Shadow = Color3.fromRGB(35, 25, 15),
				NotificationBackground = Color3.fromRGB(50, 35, 25),
				NotificationActionsBackground = Color3.fromRGB(245, 230, 215),
			}

			local color = Color3.fromRGB
			local rrotate = bit32.rrotate
			local bnot = bit32.bnot
			local v4 = 4
			local n = rrotate(bnot(v4), 10) - 4278190037
			amberGlow.TabBackground = color(75, 50, 35)
			amberGlow.TabStroke = Color3.fromRGB(90, 60, 45)
			amberGlow.TabBackgroundSelected = Color3.fromRGB(230, 180, 100)
			amberGlow.TabTextColor = Color3.fromRGB(250, 220, 200)
			local color2 = Color3.fromRGB
			local n2 = 42
			amberGlow.SelectedTabTextColor = color2(50, 30, 10)
			amberGlow.ElementBackground = Color3.fromRGB(60, 45, 35)
			amberGlow.ElementBackgroundHover = Color3.fromRGB(70, 50, 40)
			amberGlow.SecondaryElementBackground = Color3.fromRGB(55, 40, 30)
			amberGlow.ElementStroke = Color3.fromRGB(85, 60, 45)
			amberGlow.SecondaryElementStroke = Color3.fromRGB(75, 50, 35)
			amberGlow.SliderBackground = Color3.fromRGB(220, 130, 60)
			amberGlow.SliderProgress = Color3.fromRGB(250, 150, 75)
			amberGlow.SliderStroke = Color3.fromRGB(255, 170, 85)
			amberGlow.ToggleBackground = Color3.fromRGB(55, 40, 30)
			amberGlow.ToggleEnabled = Color3.fromRGB(240, 130, 30)
			amberGlow.ToggleDisabled = Color3.fromRGB(90, 70, 60)
			amberGlow.ToggleEnabledStroke = Color3.fromRGB(255, 160, 50)
			amberGlow.ToggleDisabledStroke = Color3.fromRGB(110, 85, 75)
			amberGlow.ToggleEnabledOuterStroke = Color3.fromRGB(200, 100, 50)
			amberGlow.ToggleDisabledOuterStroke = Color3.fromRGB(75, 60, 55)
			amberGlow.DropdownSelected = Color3.fromRGB(70, 50, 40)
			amberGlow.DropdownUnselected = Color3.fromRGB(55, 40, 30)
			amberGlow.InputBackground = Color3.fromRGB(60, 45, 35)
			amberGlow.InputStroke = Color3.fromRGB(90, 65, 50)
			amberGlow.PlaceholderColor = Color3.fromRGB(190, 150, 130)
			theme.AmberGlow = amberGlow
		end

		do
			local light = {
				TextColor = Color3.fromRGB(40, 40, 40),
				Background = Color3.fromRGB(245, 245, 245),
				Topbar = Color3.fromRGB(230, 230, 230),
				Shadow = Color3.fromRGB(200, 200, 200),
				NotificationBackground = Color3.fromRGB(250, 250, 250),
				NotificationActionsBackground = Color3.fromRGB(240, 240, 240),
				TabBackground = Color3.fromRGB(235, 235, 235),
				TabStroke = Color3.fromRGB(215, 215, 215),
				TabBackgroundSelected = Color3.fromRGB(255, 255, 255),
			}

			local color = Color3.fromRGB
			local lrotate = bit32.lrotate
			local value = 25
			local n = lrotate(91, value) - 3053453247
			light.TabTextColor = color(80, 80, 80)
			light.SelectedTabTextColor = Color3.fromRGB(0, 0, 0)
			light.ElementBackground = Color3.fromRGB(240, 240, 240)
			light.ElementBackgroundHover = Color3.fromRGB(225, 225, 225)
			light.SecondaryElementBackground = Color3.fromRGB(235, 235, 235)
			light.ElementStroke = Color3.fromRGB(210, 210, 210)
			local color2 = Color3.fromRGB(210, 210, 210)
			local bxor = bit32.bxor
			local n2 = 320
			local v4 = 4
			local n3 = bxor(n2, 99, v4) - 254
			light.SecondaryElementStroke = color2
			light.SliderBackground = Color3.fromRGB(150, 180, 220)
			light.SliderProgress = Color3.fromRGB(100, 150, 200)
			light.SliderStroke = Color3.fromRGB(120, 170, 220)
			light.ToggleBackground = Color3.fromRGB(220, 220, 220)
			light.ToggleEnabled = Color3.fromRGB(0, 146, 214)
			light.ToggleDisabled = Color3.fromRGB(150, 150, 150)
			light.ToggleEnabledStroke = Color3.fromRGB(0, 170, 255)
			light.ToggleDisabledStroke = Color3.fromRGB(170, 170, 170)
			light.ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100)
			local color3 = Color3.fromRGB
			local n4 = 43
			light.ToggleDisabledOuterStroke = color3(180, 180, 180)
			light.DropdownSelected = Color3.fromRGB(230, 230, 230)
			light.DropdownUnselected = Color3.fromRGB(220, 220, 220)
			light.InputBackground = Color3.fromRGB(240, 240, 240)
			light.InputStroke = Color3.fromRGB(180, 180, 180)
			light.PlaceholderColor = Color3.fromRGB(140, 140, 140)
			theme.Light = light
		end

		do
			local amethyst = {
				TextColor = Color3.fromRGB(240, 240, 240),
				Background = Color3.fromRGB(30, 20, 40),
				Topbar = Color3.fromRGB(40, 25, 50),
				Shadow = Color3.fromRGB(20, 15, 30),
				NotificationBackground = Color3.fromRGB(35, 20, 40),
				NotificationActionsBackground = Color3.fromRGB(240, 240, 250),
				TabBackground = Color3.fromRGB(60, 40, 80),
				TabStroke = Color3.fromRGB(70, 45, 90),
				TabBackgroundSelected = Color3.fromRGB(180, 140, 200),
				TabTextColor = Color3.fromRGB(230, 230, 240),
				SelectedTabTextColor = Color3.fromRGB(50, 20, 50),
				ElementBackground = Color3.fromRGB(45, 30, 60),
				ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
				SecondaryElementBackground = Color3.fromRGB(40, 30, 55),
				ElementStroke = Color3.fromRGB(70, 50, 85),
				SecondaryElementStroke = Color3.fromRGB(65, 45, 80),
				SliderBackground = Color3.fromRGB(100, 60, 150),
				SliderProgress = Color3.fromRGB(130, 80, 180),
				SliderStroke = Color3.fromRGB(150, 100, 200),
				ToggleBackground = Color3.fromRGB(45, 30, 55),
				ToggleEnabled = Color3.fromRGB(120, 60, 150),
				ToggleDisabled = Color3.fromRGB(94, 47, 117),
				ToggleEnabledStroke = Color3.fromRGB(140, 80, 170),
			}

			local color = Color3.fromRGB(124, 71, 150)
			local n = 42
			amethyst.ToggleDisabledStroke = color
			amethyst.ToggleEnabledOuterStroke = Color3.fromRGB(90, 40, 120)
			amethyst.ToggleDisabledOuterStroke = Color3.fromRGB(80, 50, 110)
			amethyst.DropdownSelected = Color3.fromRGB(50, 35, 70)
			local color2 = Color3.fromRGB
			local n2 = 43
			amethyst.DropdownUnselected = color2(35, 25, 50)
			amethyst.InputBackground = Color3.fromRGB(45, 30, 60)
			amethyst.InputStroke = Color3.fromRGB(80, 50, 110)
			amethyst.PlaceholderColor = Color3.fromRGB(178, 150, 200)
			theme.Amethyst = amethyst
		end

		do
			local green = {
				TextColor = Color3.fromRGB(30, 60, 30),
				Background = Color3.fromRGB(235, 245, 235),
				Topbar = Color3.fromRGB(210, 230, 210),
				Shadow = Color3.fromRGB(200, 220, 200),
				NotificationBackground = Color3.fromRGB(240, 250, 240),
			}

			local color = Color3.fromRGB
			local countrz = bit32.countrz
			local value = 439
			local n = countrz(value) + 65
			green.NotificationActionsBackground = color(220, 235, 220)
			green.TabBackground = Color3.fromRGB(215, 235, 215)
			green.TabStroke = Color3.fromRGB(190, 210, 190)
			local n2 = 52
			green.TabBackgroundSelected = Color3.fromRGB(245, 255, 245)
			green.TabTextColor = Color3.fromRGB(50, 80, 50)
			green.SelectedTabTextColor = Color3.fromRGB(20, 60, 20)
			green.ElementBackground = Color3.fromRGB(225, 240, 225)
			green.ElementBackgroundHover = Color3.fromRGB(210, 225, 210)
			green.SecondaryElementBackground = Color3.fromRGB(235, 245, 235)
			green.ElementStroke = Color3.fromRGB(180, 200, 180)
			green.SecondaryElementStroke = Color3.fromRGB(180, 200, 180)
			green.SliderBackground = Color3.fromRGB(90, 160, 90)
			green.SliderProgress = Color3.fromRGB(70, 130, 70)
			green.SliderStroke = Color3.fromRGB(100, 180, 100)
			green.ToggleBackground = Color3.fromRGB(215, 235, 215)
			green.ToggleEnabled = Color3.fromRGB(60, 130, 60)
			green.ToggleDisabled = Color3.fromRGB(150, 175, 150)
			green.ToggleEnabledStroke = Color3.fromRGB(80, 150, 80)
			green.ToggleDisabledStroke = Color3.fromRGB(130, 150, 130)
			green.ToggleEnabledOuterStroke = Color3.fromRGB(100, 160, 100)
			green.ToggleDisabledOuterStroke = Color3.fromRGB(160, 180, 160)
			green.DropdownSelected = Color3.fromRGB(225, 240, 225)
			local color2 = Color3.fromRGB
			local n3 = 85
			green.DropdownUnselected = color2(210, 225, 210)
			green.InputBackground = Color3.fromRGB(235, 245, 235)
			green.InputStroke = Color3.fromRGB(180, 200, 180)
			green.PlaceholderColor = Color3.fromRGB(120, 140, 120)
			theme.Green = green
		end

		do
			local bloom = {
				TextColor = Color3.fromRGB(60, 40, 50),
				Background = Color3.fromRGB(255, 240, 245),
				Topbar = Color3.fromRGB(250, 220, 225),
				Shadow = Color3.fromRGB(230, 190, 195),
				NotificationBackground = Color3.fromRGB(255, 235, 240),
				NotificationActionsBackground = Color3.fromRGB(245, 215, 225),
				TabBackground = Color3.fromRGB(240, 210, 220),
				TabStroke = Color3.fromRGB(230, 200, 210),
				TabBackgroundSelected = Color3.fromRGB(255, 225, 235),
				TabTextColor = Color3.fromRGB(80, 40, 60),
				SelectedTabTextColor = Color3.fromRGB(50, 30, 50),
				ElementBackground = Color3.fromRGB(255, 235, 240),
				ElementBackgroundHover = Color3.fromRGB(245, 220, 230),
				SecondaryElementBackground = Color3.fromRGB(255, 235, 240),
				ElementStroke = Color3.fromRGB(230, 200, 210),
				SecondaryElementStroke = Color3.fromRGB(230, 200, 210),
				SliderBackground = Color3.fromRGB(240, 130, 160),
				SliderProgress = Color3.fromRGB(250, 160, 180),
				SliderStroke = Color3.fromRGB(255, 180, 200),
				ToggleBackground = Color3.fromRGB(240, 210, 220),
				ToggleEnabled = Color3.fromRGB(255, 140, 170),
				ToggleDisabled = Color3.fromRGB(200, 180, 185),
				ToggleEnabledStroke = Color3.fromRGB(250, 160, 190),
				ToggleDisabledStroke = Color3.fromRGB(210, 180, 190),
				ToggleEnabledOuterStroke = Color3.fromRGB(220, 160, 180),
				ToggleDisabledOuterStroke = Color3.fromRGB(190, 170, 180),
			}

			local Color3_ = Color3
			local countlz = bit32.countlz
			local countrz = bit32.countrz
			local byte = string.byte("y\138\152Q", 2, nil)
			local v4 = countrz(byte)
			local n = countlz(v4) + 11
			local n2 = 42
			bloom.DropdownSelected = Color3_.fromRGB(250, 220, 225)
			bloom.DropdownUnselected = Color3.fromRGB(240, 210, 220)
			bloom.InputBackground = Color3.fromRGB(255, 235, 240)
			bloom.InputStroke = Color3.fromRGB(220, 190, 200)
			bloom.PlaceholderColor = Color3.fromRGB(170, 130, 140)
			theme.Bloom = bloom
		end

		do
			local darkBlue = { TextColor = Color3.fromRGB(230, 230, 230) }
			local Color3_ = Color3
			local n = 42
			darkBlue.Background = Color3_.fromRGB(20, 25, 30)
			darkBlue.Topbar = Color3.fromRGB(30, 35, 40)
			darkBlue.Shadow = Color3.fromRGB(15, 20, 25)
			darkBlue.NotificationBackground = Color3.fromRGB(25, 30, 35)
			darkBlue.NotificationActionsBackground = Color3.fromRGB(45, 50, 55)
			darkBlue.TabBackground = Color3.fromRGB(35, 40, 45)
			darkBlue.TabStroke = Color3.fromRGB(45, 50, 60)
			darkBlue.TabBackgroundSelected = Color3.fromRGB(40, 70, 100)
			darkBlue.TabTextColor = Color3.fromRGB(200, 200, 200)
			darkBlue.SelectedTabTextColor = Color3.fromRGB(255, 255, 255)
			darkBlue.ElementBackground = Color3.fromRGB(30, 35, 40)
			darkBlue.ElementBackgroundHover = Color3.fromRGB(40, 45, 50)
			darkBlue.SecondaryElementBackground = Color3.fromRGB(35, 40, 45)
			local flag = false
			darkBlue.ElementStroke = Color3.fromRGB(45, 50, 60)
			darkBlue.SecondaryElementStroke = Color3.fromRGB(40, 45, 55)
			darkBlue.SliderBackground = Color3.fromRGB(0, 90, 180)
			darkBlue.SliderProgress = Color3.fromRGB(0, 120, 210)
			darkBlue.SliderStroke = Color3.fromRGB(0, 150, 240)
			darkBlue.ToggleBackground = Color3.fromRGB(35, 40, 45)
			darkBlue.ToggleEnabled = Color3.fromRGB(0, 120, 210)
			darkBlue.ToggleDisabled = Color3.fromRGB(70, 70, 80)
			darkBlue.ToggleEnabledStroke = Color3.fromRGB(0, 150, 240)
			darkBlue.ToggleDisabledStroke = Color3.fromRGB(75, 75, 85)
			local color = Color3.fromRGB
			local rshift = bit32.rshift
			local band = bit32.band
			local byte = 35
			local n2 = rshift(band(byte), 20) + 45
			darkBlue.ToggleEnabledOuterStroke = color(20, 100, 180)
			darkBlue.ToggleDisabledOuterStroke = Color3.fromRGB(55, 55, 65)
			darkBlue.DropdownSelected = Color3.fromRGB(30, 70, 90)
			darkBlue.DropdownUnselected = Color3.fromRGB(25, 30, 35)
			darkBlue.InputBackground = Color3.fromRGB(25, 30, 35)
			darkBlue.InputStroke = Color3.fromRGB(45, 50, 60)
			darkBlue.PlaceholderColor = Color3.fromRGB(150, 150, 160)
			local n3 = 40
			theme.DarkBlue = darkBlue
		end

		do
			local serenity = {
				TextColor = Color3.fromRGB(50, 55, 60),
				Background = Color3.fromRGB(240, 245, 250),
				Topbar = Color3.fromRGB(215, 225, 235),
				Shadow = Color3.fromRGB(200, 210, 220),
				NotificationBackground = Color3.fromRGB(210, 220, 230),
				NotificationActionsBackground = Color3.fromRGB(225, 230, 240),
				TabBackground = Color3.fromRGB(200, 210, 220),
				TabStroke = Color3.fromRGB(180, 190, 200),
				TabBackgroundSelected = Color3.fromRGB(175, 185, 200),
				TabTextColor = Color3.fromRGB(50, 55, 60),
			}

			local color = Color3.fromRGB
			local countlz = bit32.countlz
			local byte = string.byte("\253V\21", 3, nil)
			local n = countlz(byte) + 38
			serenity.SelectedTabTextColor = color(30, 35, 40)
			serenity.ElementBackground = Color3.fromRGB(210, 220, 230)
			serenity.ElementBackgroundHover = Color3.fromRGB(220, 230, 240)
			serenity.SecondaryElementBackground = Color3.fromRGB(200, 210, 220)
			serenity.ElementStroke = Color3.fromRGB(190, 200, 210)
			local color2 = Color3.fromRGB
			local flag = false
			local n2 = 65
			serenity.SecondaryElementStroke = color2(180, 190, 200)
			serenity.SliderBackground = Color3.fromRGB(200, 220, 235)
			serenity.SliderProgress = Color3.fromRGB(70, 130, 180)
			serenity.SliderStroke = Color3.fromRGB(150, 180, 220)
			serenity.ToggleBackground = Color3.fromRGB(210, 220, 230)
			serenity.ToggleEnabled = Color3.fromRGB(70, 160, 210)
			serenity.ToggleDisabled = Color3.fromRGB(180, 180, 180)
			local color3 = Color3.fromRGB
			local flag2 = false
			serenity.ToggleEnabledStroke = color3(60, 150, 200)
			serenity.ToggleDisabledStroke = Color3.fromRGB(140, 140, 140)
			serenity.ToggleEnabledOuterStroke = Color3.fromRGB(100, 120, 140)
			serenity.ToggleDisabledOuterStroke = Color3.fromRGB(120, 120, 130)
			serenity.DropdownSelected = Color3.fromRGB(220, 230, 240)
			serenity.DropdownUnselected = Color3.fromRGB(200, 210, 220)
			serenity.InputBackground = Color3.fromRGB(220, 230, 240)
			local Color3 = Color3
			local countrz = bit32.countrz
			local value = 313
			local n3 = countrz(value) + 42
			serenity.InputStroke = Color3.fromRGB(180, 190, 200)
			serenity.PlaceholderColor = Color3.fromRGB(150, 150, 150)
			theme.Serenity = serenity
		end

		tbl.Theme = theme
		local flag, v4, tbl2

		do
			local UserInputService2 = fn("UserInputService")
			local TweenService = fn("TweenService")
			local Players2 = fn("Players")
			fn("CoreGui")
			local screenGui2 = game:GetObjects("rbxassetid://103345469862555")[1]
			flag = nil
			local flag2 = false
			screenGui2.Enabled = false
			screenGui2.Parent = gethui()
			local ipairs_ = ipairs
			local hui = gethui()

			for _, child in ipairs_(hui:GetChildren()) do
				if child.Name == screenGui2.Name and child ~= screenGui2 then
					child.Enabled = false
					child.Name = "Rayfield-Old"
				end
			end

			local vector2 = Vector2.new(1024, 768)
			local flag3 = nil

			if not (not (screenGui2.AbsoluteSize.X < vector2.X) or not (screenGui2.AbsoluteSize.Y < vector2.Y)) then
				flag3 = true
			end

			if UserInputService2.TouchEnabled then
				useMobilePrompt = true
			end

			local main = screenGui2.Main
			local prompt = screenGui2:FindFirstChild("Prompt")
			local topbar = main.Topbar
			local elements = main.Elements
			local loadingFrame = main.LoadingFrame
			local tabList = main.TabList
			local drag = screenGui2:FindFirstChild("Drag")

			if drag then
			end

			if drag then
			end

			screenGui2.DisplayOrder = 100
			loadingFrame.Version.Text = "Build 1.68"
			local lua = fn2("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/refs/heads/main/icons.lua")
			local fileName = nil
			local flag4 = false; local flag5 = false; local flag6 = false; local flag7 = false
			local flag8 = false
			local notifications = screenGui2.Notifications
			local default = tbl.Theme.Default

			local function fn3(arg)
				if typeof(arg) ~= "string" then
					if typeof(arg) == "table" then
						default = arg
					end
				else
					default = tbl.Theme[arg]
				end

				screenGui2.Main.BackgroundColor3 = default.Background
				screenGui2.Main.Topbar.BackgroundColor3 = default.Topbar
				screenGui2.Main.Topbar.CornerRepair.BackgroundColor3 = default.Topbar
				screenGui2.Main.Shadow.Image.ImageColor3 = default.Shadow
				screenGui2.Main.Topbar.ChangeSize.ImageColor3 = default.TextColor
				screenGui2.Main.Topbar.Hide.ImageColor3 = default.TextColor
				screenGui2.Main.Topbar.Search.ImageColor3 = default.TextColor
				main.Search.BackgroundColor3 = default.TextColor
				main.Search.Shadow.ImageColor3 = default.TextColor
				local search = main.Search
				local n = 3
				search.Search.ImageColor3 = default.TextColor
				main.Search.Input.PlaceholderColor3 = default.TextColor
				main.Search.UIStroke.Color = default.SecondaryElementStroke

				if main:FindFirstChild("Notice") then
					main.Notice.BackgroundColor3 = default.Background
				end

				for _, descendant in ipairs(screenGui2:GetDescendants()) do
					if descendant.Parent.Parent ~= notifications then
						if not (not descendant:IsA("TextLabel") and not descendant:IsA("TextBox")) then
							descendant.TextColor3 = default.TextColor
						end
					end
				end

				for _, child in ipairs(elements:GetChildren()) do
					for _, child2 in ipairs(child:GetChildren()) do
						if child2.ClassName == "Frame" then
							if child2.Name ~= "Placeholder" and child2.Name ~= "SectionSpacing" and child2.Name ~= "Divider" and child2.Name ~= "SectionTitle" and child2.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
								child2.BackgroundColor3 = default.ElementBackground
								child2.UIStroke.Color = default.ElementStroke
							end
						end
					end
				end
			end

			local function fn4(arg)
				if not lua then
					warn("Lucide Icons: Cannot use icons as icons library is not loaded")
					return
				end
				local v6 = string.match(string.lower(arg), "^%s*(.*)%s*$")
				local v7 = lua["48px"][v6]

				if not v7 then
					error(("Lucide Icons: Failed to find icon by the name of \"%*\""):format(v6), 2)
				end

				local v8 = v7[2]
				local v9 = v7[3]

				if type(v7[1]) ~= "number" or type(v8) ~= "table" or type(v9) ~= "table" then
					error("Lucide Icons: Internal error: Invalid auto-generated asset entry")
				end

				return {
					id = v7[1],
					imageRectSize = Vector2.new(v8[1], v8[2]),
					imageRectOffset = Vector2.new(v9[1], v9[2]),
				}
			end

			local function fn5(arg)
				local str = "rbxassetid://0"

				if type(arg) ~= "number" then
					if type(arg) == "string" then
						if not lua then
							warn("Rayfield | Cannot use Lucide icons as icons library is not loaded")
						else
							warn("Rayfield | The icon argument must either be an icon ID (number) or a Lucide icon name (string)")
						end

						return str
					end

					warn("Rayfield | The icon argument must either be an icon ID (number) or a Lucide icon name (string)")
					return str
				else
					str = "rbxassetid://" .. arg
				end

				return str
			end

			local function fn6(arg, arg2, arg3, arg4)
				local flag9 = false
				local n = nil
				local vector22 = Vector2.zero
				local screenGui = arg:FindFirstAncestorWhichIsA("ScreenGui")

				if not (not screenGui or not screenGui.IgnoreGuiInset) then
					vector22 += fn("GuiService"):GetGuiInset()
				end

				local function fn7()
					if not (not drag or not arg3) then
						drag.MouseEnter:Connect(function()
							if not flag9 and not flag6 then
								TweenService:Create(upv4, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.5, Size = UDim2.new(0, 120, 0, 4) }):Play()
							end
						end)

						drag.MouseLeave:Connect(function()
							if not flag9 and not flag6 then
								TweenService:Create(upv4, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.7, Size = UDim2.new(0, 100, 0, 4) }):Play()
							end
						end)
					end
				end

				fn7()
 game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
					if not gameProcessed then
						local name = input.UserInputType.Name

						if not (name ~= "MouseButton1" and name ~= "Touch") then
							flag9 = true
							n = arg.AbsolutePosition + arg.AbsoluteSize * arg.AnchorPoint - UserInputService2:GetMouseLocation()

							if arg3 then
								if not flag6 then
									TweenService:Create(upv4, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 110, 0, 4), BackgroundTransparency = 0 }):Play()
								end
							end
						end

						return
					end
				end)

				local connection = UserInputService2.InputEnded:Connect(function(input)
					if not flag9 then
						return
					end
					local name = input.UserInputType.Name

					if not (name ~= "MouseButton1" and name ~= "Touch") then
						flag9 = false
						fn7()

						if arg3 then
							if not flag6 then
								TweenService:Create(upv4, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 100, 0, 4), BackgroundTransparency = 0.7 }):Play()
							end
						end
					end
				end)

				local connection2 = RunService2.RenderStepped:Connect(function()
					if flag9 then
						if not flag6 then
							local n2 = UserInputService2:GetMouseLocation() + n + vector22

							if not arg3 or not arg4 then
								if not (not drag or not arg4) then
									drag.Position = UDim2.fromOffset(n2.X, n2.Y + (flag3 and arg4[2] or arg4[1]))
								end

								arg.Position = UDim2.fromOffset(n2.X, n2.Y)
							else
								TweenService:Create(arg, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(n2.X, n2.Y) }):Play()
								local TweenService2 = TweenService
								local create = TweenService.Create
								local bxor = bit32.bxor
								local bxor2 = bit32.bxor
								local byte = 126
								local value = 383
								local v6 = bxor2(byte, value)
								local n3 = bxor(v6) - 253
								create(TweenService2, arg2.Parent, TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(n2.X, n2.Y + (flag3 and arg4[2] or arg4[1])) }):Play()
							end
						end
					end
				end)

				arg.Destroying:Connect(function()
					if connection then
						connection:Disconnect()
					end

					if connection2 then
						connection2:Disconnect()
					end
				end)
			end

			local function fn7(arg)
				return { R = arg.R * 255, G = arg.G * 255, B = arg.B * 255 }
			end

			local function fn8(arg)
				return Color3.fromRGB(arg.R, arg.G, arg.B)
			end

			local function fn9(arg)
				local ok, result = pcall(function()
					return HttpService:JSONDecode(arg)
				end)

				local flag9 = nil
				if not ok then
					warn("Rayfield had an issue decoding the configuration file, please try delete the file and reopen Rayfield.")
					return
				end

				for k, flag10 in pairs(tbl.Flags) do
					local v6 = result[k]

					if not ((typeof(v6) ~= "boolean" or v6 ~= false) and not v6) then
						task.spawn(function()
							if flag10.Type ~= "ColorPicker" then
								if (flag10.CurrentValue or flag10.CurrentKeybind or flag10.CurrentOption or flag10.Color) ~= v6 then
									flag9 = true
									flag10:Set(v6)
								end
							else
								flag9 = true
								flag10:Set(fn8(v6))
							end
						end)
					end
				end

				return flag9
			end

			local function fn10()
				if not flag4 or not flag then
					return
				end
				local tbl3 = {}

				for k, flag9 in pairs(tbl.Flags) do
					if flag9.Type ~= "ColorPicker" then
						if typeof(flag9.CurrentValue) ~= "boolean" then
							tbl3[k] = flag9.CurrentValue or flag9.CurrentKeybind or flag9.CurrentOption or flag9.Color
						elseif flag9.CurrentValue ~= false then
							tbl3[k] = flag9.CurrentValue or flag9.CurrentKeybind or flag9.CurrentOption or flag9.Color
						else
							tbl3[k] = false
						end
					else
						tbl3[k] = fn7(flag9.Color)
					end
				end

				writefile(callback .. "/" .. fileName .. ".rfld", tostring(HttpService:JSONEncode(tbl3)))
			end

			tbl.Notify = function(arg, arg2)
				task.spawn(function()
					local clone = notifications.Template:Clone()
					clone.Name = arg2.Title or "No Title Provided"
					clone.Parent = notifications
					clone.LayoutOrder = #notifications:GetChildren()
					clone.Visible = false
					clone.Title.Text = arg2.Title or "Unknown Title"
					clone.Description.Text = arg2.Content or "Unknown Content"

					if not arg2.Image then
						clone.Icon.Image = "rbxassetid://0"
					elseif typeof(arg2.Image) ~= "string" or not lua then
						clone.Icon.Image = fn5(arg2.Image)
					else
						local v6 = fn4(arg2.Image)
						clone.Icon.Image = "rbxassetid://" .. v6.id
						clone.Icon.ImageRectOffset = v6.imageRectOffset
						clone.Icon.ImageRectSize = v6.imageRectSize
					end

					clone.Title.TextColor3 = default.TextColor
					clone.Description.TextColor3 = default.TextColor
					clone.BackgroundColor3 = default.Background
					clone.UIStroke.Color = default.TextColor
					clone.Icon.ImageColor3 = default.TextColor
					clone.BackgroundTransparency = 1
					clone.Title.TextTransparency = 1
					clone.Description.TextTransparency = 1
					clone.UIStroke.Transparency = 1
					clone.Shadow.ImageTransparency = 1
					clone.Size = UDim2.new(1, 0, 0, 800)
					clone.Icon.ImageTransparency = 1
					clone.Icon.BackgroundTransparency = 1
					task.wait()
					clone.Visible = true

					if arg2.Actions then
						warn("Rayfield | Not seeing your actions in notifications?")
						print("Notification Actions are being sunset for now, keep up to date on when they're back in the discord. (sirius.menu/discord)")
					end

					local tbl3 = { clone.Title.TextBounds.Y, clone.Description.TextBounds.Y }
					clone.Size = UDim2.new(1, -60, 0, -notifications:FindFirstChild("UIListLayout").Padding.Offset)
					clone.Icon.Size = UDim2.new(0, 32, 0, 32)
					clone.Icon.Position = UDim2.new(0, 20, 0.5, 0)
					local TweenService2 = TweenService
					local create = TweenService.Create
					local tweenInfo = TweenInfo.new
					local easingStyle = Enum.EasingStyle
					local lshift = bit32.lshift
					local flag9 = false
					local n = lshift(45, 4) - 712
					create(TweenService2, clone, tweenInfo(0.6, easingStyle.Exponential), { Size = UDim2.new(1, 0, 0, math.max(tbl3[1] + tbl3[2] + 31, 60)) }):Play()
					task.wait(0.15)
					TweenService:Create(clone, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.45 }):Play()
					TweenService:Create(clone.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
					task.wait(0.05)
					TweenService:Create(clone.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
					local task_ = task
					local bnot = bit32.bnot
					local byte = string.byte("\177?\144%\211", 5, nil)
					local n2 = bnot(byte) - 4294967071
					task_.wait(0.05)
					TweenService:Create(clone.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.35 }):Play()
					TweenService:Create(clone.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { Transparency = 0.95 }):Play()
					TweenService:Create(clone.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0.82 }):Play()
					local n3 = math.min(math.max(#clone.Description.Text * 0.1 + 2.5, 3), 10)
					task.wait(arg2.Duration or n3)
					clone.Icon.Visible = false
					TweenService:Create(clone, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
					TweenService:Create(clone.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
					TweenService:Create(clone.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
					TweenService:Create(clone.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
					local tween = TweenService:Create(clone.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 })
					local play = tween.Play
					local n4 = 95
					play(tween)
					TweenService:Create(clone, TweenInfo.new(1, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, -90, 0, 0) }):Play()
					task.wait(1)
					local TweenService3 = TweenService
					local create2 = TweenService.Create
					local tweenInfo2 = TweenInfo.new(1, Enum.EasingStyle.Exponential)
					local tbl4 = {}
					local udim2 = UDim2.new
					local n5 = -notifications:FindFirstChild("UIListLayout").Padding.Offset
					local flag10 = true
					local flag11 = false
					tbl4.Size = udim2(1, -90, 0, n5)
					create2(TweenService3, clone, tweenInfo2, tbl4):Play()
					clone.Visible = false
					clone:Destroy()
				end)
			end

			local function fn11()
				flag8 = true
				main.Search.BackgroundTransparency = 1
				main.Search.Shadow.ImageTransparency = 1
				main.Search.Input.TextTransparency = 1
				main.Search.Search.ImageTransparency = 1
				main.Search.UIStroke.Transparency = 1
				main.Search.Size = UDim2.new(1, 0, 0, 80)
				main.Search.Position = UDim2.new(0.5, 0, 0, 70)
				main.Search.Input.Interactable = true
				main.Search.Visible = true

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							child.Interact.Visible = false
							TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
							TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
							local TweenService2 = TweenService
							local flag9 = true
							TweenService2:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
							TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
						end
					end
				end

				main.Search.Input:CaptureFocus()
				TweenService:Create(main.Search.Shadow, TweenInfo.new(0.05, Enum.EasingStyle.Quint), { ImageTransparency = 0.95 }):Play()
				TweenService:Create(main.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Position = UDim2.new(0.5, 0, 0, 57), BackgroundTransparency = 0.9 }):Play()
				TweenService:Create(main.Search.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0.8 }):Play()
				TweenService:Create(main.Search.Input, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
				TweenService:Create(main.Search.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0.5 }):Play()
				TweenService:Create(main.Search, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, -35, 0, 35) }):Play()
			end

			local function fn12()
				flag8 = false
				TweenService:Create(main.Search, TweenInfo.new(0.35, Enum.EasingStyle.Quint), { BackgroundTransparency = 1, Size = UDim2.new(1, -55, 0, 30) }):Play()
				TweenService:Create(main.Search.Search, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
				TweenService:Create(main.Search.Shadow, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
				TweenService:Create(main.Search.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { Transparency = 1 }):Play()
				local tween = TweenService:Create(main.Search.Input, TweenInfo.new(0.15, Enum.EasingStyle.Quint), { TextTransparency = 1 })
				local play = tween.Play
				local band = bit32.band
				local n = 786432
				local n2 = band(n) - 786431
				play(tween)

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							child.Interact.Visible = true
							local text = child.Title.Text

							if tostring(elements.UIPageLayout.CurrentPage) == text then
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
								TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
								TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
							else
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.7 }):Play()
								TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 }):Play()
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
								local TweenService2 = TweenService
								local create = TweenService.Create
								local uiStroke = child.UIStroke
								local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
								local n3 = 13
								create(TweenService2, uiStroke, tweenInfo, { Transparency = 0.5 }):Play()
							end
						end
					end
				end

				main.Search.Input.Text = ""
				main.Search.Input.Interactable = false
			end

			local function fn13(arg)
				if prompt then
					prompt.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
					prompt.Position = UDim2.new(0.5, 0, 0, -50)
					prompt.Size = UDim2.new(0, 40, 0, 10)
					prompt.BackgroundTransparency = 1
					prompt.Title.TextTransparency = 1
					prompt.Visible = true
				end

				task.spawn(fn12)
				flag7 = true

				if arg then
					tbl:Notify({
						Title = "Interface Hidden",
						Content = "The interface has been hidden.",
						Duration = 7,
						Image = 4400697855,
					})
				end

				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 470, 0, 0) }):Play()
				local TweenService2 = TweenService
				local create = TweenService.Create
				local topbar2 = main.Topbar
				local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
				local tbl3 = {}
				local udim2 = UDim2.new
				local n = 11
				tbl3.Size = udim2(0, 470, 0, 45)
				create(TweenService2, topbar2, tweenInfo, tbl3):Play()
				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
				local TweenService3 = TweenService
				local countrz = bit32.countrz
				local len = 0
				local flag9 = countrz(len) > 45
				TweenService3:Create(main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
				TweenService:Create(topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
				TweenService:Create(upv7, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()

				if prompt then
					TweenService:Create(prompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
						Size = UDim2.new(0, 120, 0, 30),
						Position = UDim2.new(0.5, 0, 0, 20),
						BackgroundTransparency = 0.3,
					}):Play()

					TweenService:Create(prompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { TextTransparency = 0.3 }):Play()
				end

				for _, child in ipairs(topbar:GetChildren()) do
					if child.ClassName == "ImageButton" then
						TweenService:Create(child, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
					end
				end

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
							local TweenService4 = TweenService
							local n2 = 8
							TweenService4:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
							TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
							TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
						end
					end
				end

				upv9.Visible = false

				for _, child in ipairs(elements:GetChildren()) do
					if child.Name ~= "Template" then
						if child.ClassName == "ScrollingFrame" then
							if child.Name ~= "Placeholder" then
								for _, child2 in ipairs(child:GetChildren()) do
									if child2.ClassName == "Frame" then
										if child2.Name ~= "SectionSpacing" and child2.Name ~= "Placeholder" then
											if child2.Name ~= "SectionTitle" and child2.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
												if child2.Name ~= "Divider" then
													local n2 = 7
													TweenService:Create(child2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
													TweenService:Create(child2.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
													TweenService:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
												else
													TweenService:Create(child2.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
												end
											else
												TweenService:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
											end

											for _, child3 in ipairs(child2:GetChildren()) do
												if not (child3.ClassName ~= "Frame" and child3.ClassName ~= "TextLabel" and child3.ClassName ~= "TextBox" and child3.ClassName ~= "ImageButton" and child3.ClassName ~= "ImageLabel") then
													child3.Visible = false
												end
											end
										end
									end
								end
							end
						end
					end
				end

				task.wait(0.5)
				main.Visible = false
				flag7 = false
			end

			local function fn14()
				flag7 = true
				topbar.ChangeSize.Image = "rbxassetid://10137941941"
				TweenService:Create(topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
				local tween = TweenService:Create(main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { ImageTransparency = 0.6 })
				local lshift = bit32.lshift
				local len = 4
				local value = 10
				local n = lshift(len, value) - 4056
				tween:Play()
				TweenService:Create(topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(upv4, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.7 }):Play()
				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = flag3 and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475) }):Play()
				TweenService:Create(topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 500, 0, 45) }):Play()
				tabList.Visible = true
				task.wait(0.2)
				elements.Visible = true

				for _, child in ipairs(elements:GetChildren()) do
					if child.Name ~= "Template" then
						if child.ClassName == "ScrollingFrame" then
							if child.Name ~= "Placeholder" then
								for _, child2 in ipairs(child:GetChildren()) do
									if child2.ClassName == "Frame" then
										if child2.Name ~= "SectionSpacing" and child2.Name ~= "Placeholder" then
											if child2.Name ~= "SectionTitle" and child2.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
												if child2.Name ~= "Divider" then
													TweenService:Create(child2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
													TweenService:Create(child2.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
													TweenService:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
												else
													TweenService:Create(child2.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.85 }):Play()
												end
											else
												TweenService:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.4 }):Play()
											end

											for _, child3 in ipairs(child2:GetChildren()) do
												if child3.ClassName ~= "Frame" and child3.ClassName ~= "TextLabel" and child3.ClassName ~= "TextBox" and child3.ClassName ~= "ImageButton" then
													if child3.ClassName ~= "ImageLabel" then
														continue
													end
													local n2 = 13
												end

												child3.Visible = true
											end
										end
									end
								end
							end
						end
					end
				end

				task.wait(0.1)

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							local text = child.Title.Text

							if tostring(elements.UIPageLayout.CurrentPage) == text then
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
								local tween2 = TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0 })
								local play = tween2.Play
								local bxor = bit32.bxor
								local v6 = 5
								local flag9 = bxor(442, 450, v6) <= 106
								play(tween2)
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
								TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
							else
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.7 }):Play()
								local tween2 = TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 })
								local flag9 = true
								tween2:Play()
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
								TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0.5 }):Play()
							end
						end
					end
				end

				task.wait(0.5)
				flag7 = false
			end

			local function fn15()
				flag7 = true
				main.Position = UDim2.new(0.5, 0, 0.5, 0)
				main.Visible = true
				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = flag3 and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475) }):Play()
				TweenService:Create(main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 500, 0, 45) }):Play()
				TweenService:Create(main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.6 }):Play()
				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
				TweenService:Create(main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()

				if prompt then
					TweenService:Create(prompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
						Size = UDim2.new(0, 40, 0, 10),
						Position = UDim2.new(0.5, 0, 0, -50),
						BackgroundTransparency = 1,
					}):Play()

					TweenService:Create(prompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()

					task.spawn(function()
						task.wait(0.5)
						prompt.Visible = false
					end)
				end

				if flag5 then
					task.spawn(fn14)
				end

				drag.Position = flag3 and UDim2.new(0.5, 0, 0.5, 150) or UDim2.new(0.5, 0, 0.5, 255)
				upv8.Visible = true

				for _, child in ipairs(topbar:GetChildren()) do
					if child.ClassName == "ImageButton" then
						if child.Name ~= "Icon" then
							TweenService:Create(child, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.8 }):Play()
						else
							TweenService:Create(child, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
						end
					end
				end

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							local text = child.Title.Text

							if tostring(elements.UIPageLayout.CurrentPage) == text then
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
								TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
								TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
							else
								TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.7 }):Play()
								TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 }):Play()
								TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
								TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0.5 }):Play()
							end
						end
					end
				end

				for _, child in ipairs(elements:GetChildren()) do
					if child.Name ~= "Template" then
						if child.ClassName == "ScrollingFrame" then
							if child.Name ~= "Placeholder" then
								for _, child2 in ipairs(child:GetChildren()) do
									if child2.ClassName == "Frame" then
										if child2.Name ~= "SectionSpacing" and child2.Name ~= "Placeholder" then
											if child2.Name ~= "SectionTitle" and child2.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
												if child2.Name ~= "Divider" then
													TweenService:Create(child2, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
													TweenService:Create(child2.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
													local TweenService2 = TweenService
													local n = string.byte(",\3\216\200", 3, nil) - 151
													TweenService2:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
												else
													TweenService:Create(child2.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.85 }):Play()
												end
											else
												TweenService:Create(child2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0.4 }):Play()
											end

											for _, child3 in ipairs(child2:GetChildren()) do
												if not (child3.ClassName ~= "Frame" and child3.ClassName ~= "TextLabel" and child3.ClassName ~= "TextBox" and child3.ClassName ~= "ImageButton" and child3.ClassName ~= "ImageLabel") then
													child3.Visible = true
												end
											end
										end
									end
								end
							end
						end
					end
				end

				TweenService:Create(upv12, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.5 }):Play()
				task.wait(0.5)
				flag5 = false
				flag7 = false
			end

			local function fn16()
				flag7 = true
				topbar.ChangeSize.Image = "rbxassetid://11036884234"
				topbar.UIStroke.Color = default.ElementStroke
				task.spawn(fn12)

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
							TweenService:Create(child.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
							TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
							TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
						end
					end
				end

				for _, child in ipairs(elements:GetChildren()) do
					if child.Name ~= "Template" then
						if child.ClassName == "ScrollingFrame" then
							if child.Name ~= "Placeholder" then
								local v6, v7, v8 = ipairs(child:GetChildren())

								while true do
									local n = string.byte("\15\4q", 2, nil) + 122
									local args = table.pack(J_2())

									if not args[1] then
										break
									else
										local v9 = args[3]

										if v9.ClassName == "Frame" then
											if v9.Name ~= "SectionSpacing" and v9.Name ~= "Placeholder" then
												if v9.Name ~= "SectionTitle" and v9.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
													if v9.Name ~= "Divider" then
														TweenService:Create(v9, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
														TweenService:Create(v9.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
														TweenService:Create(v9.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
													else
														local band = bit32.band
														local flag9 = false
														local byte = string.byte("WG", 2, nil)
														local byte2 = 2
														local v10 = 3
														local n2 = band(byte, byte2, v10) + 5
														TweenService:Create(v9.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
													end
												else
													TweenService:Create(v9.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
												end

												for _, child2 in ipairs(v9:GetChildren()) do
													if not (child2.ClassName ~= "Frame" and child2.ClassName ~= "TextLabel" and child2.ClassName ~= "TextBox" and child2.ClassName ~= "ImageButton" and child2.ClassName ~= "ImageLabel") then
														child2.Visible = false
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end

				TweenService:Create(upv7, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
				TweenService:Create(main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
				TweenService:Create(topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				local TweenService2 = TweenService
				local create = TweenService.Create
				local divider = topbar.Divider
				local tweenInfo = TweenInfo.new
				local n = 13
				create(TweenService2, divider, tweenInfo(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
				TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 495, 0, 45) }):Play()
				TweenService:Create(topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 495, 0, 45) }):Play()
				task.wait(0.3)
				elements.Visible = false
				tabList.Visible = false
				task.wait(0.2)
				flag7 = false
			end

			tbl.CreateWindow = function(arg, arg2)
				if screenGui2:FindFirstChild("Loading") then
					screenGui2.Enabled = true
					screenGui2.Loading.Visible = true
					task.wait(1.4)
					screenGui2.Loading.Visible = false
				end

				local isfolder_

				if arg2.ToggleUIKeybind then
					local toggleUIKeybind = arg2.ToggleUIKeybind

					if type(toggleUIKeybind) ~= "string" then
						if typeof(toggleUIKeybind) ~= "EnumItem" then
							error("ToggleUIKeybind must be a string or KeyCode enum")
						else
							assert(toggleUIKeybind.EnumType == Enum.KeyCode, "ToggleUIKeybind must be a KeyCode enum")
						end
					else
						isfolder_ = string.upper(toggleUIKeybind)

						assert(pcall(function()
							return Enum.KeyCode[isfolder_]
						end), "ToggleUIKeybind must be a valid KeyCode")
					end
				end

				isfolder_ = isfolder
				isfolder_ = isfolder
				isfolder_ = isfolder_("Rayfield")

				if not isfolder_ then
					isfolder_ = makefolder
					isfolder_("Rayfield")
				end

				topbar.Title.Text = arg2.Name
				main.Size = UDim2.new(0, 420, 0, 100)
				main.Visible = true
				main.BackgroundTransparency = 1

				if main:FindFirstChild("Notice") then
					main.Notice.Visible = false
				end

				main.Shadow.Image.ImageTransparency = 1
				loadingFrame.Title.TextTransparency = 1
				loadingFrame.Subtitle.TextTransparency = 1

				if arg2.ShowText then
					prompt.Title.Text = "Show " .. arg2.ShowText
				end

				loadingFrame.Version.TextTransparency = 1
				loadingFrame.Title.Text = arg2.LoadingTitle or "Rayfield"
				loadingFrame.Subtitle.Text = arg2.LoadingSubtitle or "Interface Suite"

				if arg2.LoadingTitle ~= "Rayfield Interface Suite" then
					loadingFrame.Version.Text = "Rayfield UI"
				end

				if arg2.Icon then
					if arg2.Icon ~= 0 then
						if topbar:FindFirstChild("Icon") then
							topbar.Icon.Visible = true
							topbar.Title.Position = UDim2.new(0, 47, 0.5, 0)

							if not arg2.Icon then
								topbar.Icon.Image = "rbxassetid://0"
							elseif typeof(arg2.Icon) ~= "string" or not lua then
								topbar.Icon.Image = fn5(arg2.Icon)
							else
								local v6 = fn4(arg2.Icon)
								topbar.Icon.Image = "rbxassetid://" .. v6.id
								topbar.Icon.ImageRectOffset = v6.imageRectOffset
								topbar.Icon.ImageRectSize = v6.imageRectSize
							end
						end
					end
				end

				if drag then
					drag.Visible = false
					drag.Visible = true
				end

				if arg2.Theme then
					local ok, result = pcall(fn3, arg2.Theme)

					if not ok then
						local ok2, result2 = pcall(fn3, "Default")

						if not ok2 then
							warn("CRITICAL ERROR - NO DEFAULT THEME")
							print(result2)
						end

						warn("issue rendering theme. no theme on file")
						print(result)
					end
				end

				topbar.Visible = false
				elements.Visible = false
				loadingFrame.Visible = true
				local n = 52

				pcall(function()
					if not arg2.ConfigurationSaving.FileName then
						arg2.ConfigurationSaving.FileName = tostring(game.PlaceId)
					end

					if arg2.ConfigurationSaving.Enabled == nil then
						arg2.ConfigurationSaving.Enabled = false
					end

					fileName = arg2.ConfigurationSaving.FileName
					callback = arg2.ConfigurationSaving.FolderName or callback
					flag4 = arg2.ConfigurationSaving.Enabled

					if arg2.ConfigurationSaving.Enabled then
						if not isfolder(callback) then
							makefolder(callback)
						end
					end
				end)

				fn6(main, topbar, false, { 255, 150 })

				if drag then
					drag.Position = flag3 and UDim2.new(0.5, 0, 0.5, 150) or UDim2.new(0.5, 0, 0.5, 255)
					fn6(main, upv17, true, { 255, 150 })
				end

				for _, child in ipairs(tabList:GetChildren()) do
					if child.ClassName == "Frame" then
						if child.Name ~= "Placeholder" then
							child.BackgroundTransparency = 1
							child.Title.TextTransparency = 1
							child.Image.ImageTransparency = 1
							child.UIStroke.Transparency = 1
						end
					end
				end

				notifications.Template.Visible = false
				notifications.Visible = true
				screenGui2.Enabled = true
				task.wait(0.5)
				local TweenService2 = TweenService
				local create = TweenService.Create
				local main2 = main
				local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Exponential)
				local n2 = 40
				create(TweenService2, main2, tweenInfo, { BackgroundTransparency = 0 }):Play()
				local TweenService3 = TweenService
				local create2 = TweenService.Create
				local image = main.Shadow.Image
				local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Exponential)
				local n3 = -string.byte("\130", 1, nil) + 253
				create2(TweenService3, image, tweenInfo2, { ImageTransparency = 0.6 }):Play()
				task.wait(0.1)
				TweenService:Create(loadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
				task.wait(0.05)
				TweenService:Create(loadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
				task.wait(0.05)
				TweenService:Create(loadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
				elements.Template.LayoutOrder = 100000
				elements.Template.Visible = false
				elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
				tabList.Template.Visible = false
				local flag9 = false

				local tbl3 = { CreateTab = function(arg3, name, arg4, arg5)
					local flag10 = false
					local clone = tabList.Template:Clone()
					clone.Name = name
					clone.Title.Text = name
					clone.Parent = tabList
					clone.Title.TextWrapped = false
					clone.Size = UDim2.new(0, clone.Title.TextBounds.X + 30, 0, 30)

					if arg4 then
						if arg4 ~= 0 then
							if typeof(arg4) ~= "string" or not lua then
								clone.Image.Image = fn5(arg4)
							else
								local v6 = fn4(arg4)
								clone.Image.Image = "rbxassetid://" .. v6.id
								clone.Image.ImageRectOffset = v6.imageRectOffset
								clone.Image.ImageRectSize = v6.imageRectSize
							end

							clone.Title.AnchorPoint = Vector2.new(0, 0.5)
							clone.Title.Position = UDim2.new(0, 37, 0.5, 0)
							clone.Image.Visible = true
							clone.Title.TextXAlignment = Enum.TextXAlignment.Left
							clone.Size = UDim2.new(0, clone.Title.TextBounds.X + 52, 0, 30)
						end
					end

					clone.BackgroundTransparency = 1
					clone.Title.TextTransparency = 1
					clone.Image.ImageTransparency = 1
					clone.UIStroke.Transparency = 1
					clone.Visible = not arg5 or false
					local clone2 = elements.Template:Clone()
					clone2.Name = name
					clone2.Visible = true
					clone2.LayoutOrder = #elements:GetChildren() or arg5 and 10000

					for _, child in ipairs(clone2:GetChildren()) do
						if child.ClassName == "Frame" then
							if child.Name ~= "Placeholder" then
								child:Destroy()
							end
						end
					end

					clone2.Parent = elements

					if not flag9 and not arg5 then
						elements.UIPageLayout.Animated = false
						elements.UIPageLayout:JumpTo(clone2)
						elements.UIPageLayout.Animated = true
					end

					clone.UIStroke.Color = default.TabStroke

					if elements.UIPageLayout.CurrentPage == clone2 then
						clone.BackgroundColor3 = default.TabBackgroundSelected
						clone.Image.ImageColor3 = default.SelectedTabTextColor
						clone.Title.TextColor3 = default.SelectedTabTextColor
					else
						clone.BackgroundColor3 = default.TabBackground
						clone.Image.ImageColor3 = default.TabTextColor
						clone.Title.TextColor3 = default.TabTextColor
					end

					task.wait(0.1)

					if not flag9 and not arg5 then
						flag9 = name
						clone.BackgroundColor3 = default.TabBackgroundSelected
						clone.Image.ImageColor3 = default.SelectedTabTextColor
						clone.Title.TextColor3 = default.SelectedTabTextColor
						TweenService:Create(clone.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
						TweenService:Create(clone, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
						TweenService:Create(clone.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
					else
						clone.BackgroundColor3 = default.TabBackground
						clone.Image.ImageColor3 = default.TabTextColor
						clone.Title.TextColor3 = default.TabTextColor
						TweenService:Create(clone, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.7 }):Play()
						local TweenService4 = TweenService
						local n4 = 59
						TweenService4:Create(clone.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
						TweenService:Create(clone.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 }):Play()
						TweenService:Create(clone.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0.5 }):Play()
					end

					clone.Interact.MouseButton1Click:Connect(function()
						if not flag5 then
							TweenService:Create(clone, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
							TweenService:Create(clone.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
							TweenService:Create(clone.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
							local tbl3 = { BackgroundColor3 = default.TabBackgroundSelected }
							TweenService:Create(clone, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), tbl3):Play()
							local tbl4 = { TextColor3 = default.SelectedTabTextColor }
							TweenService:Create(clone.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), tbl4):Play()
							local tbl5 = { ImageColor3 = default.SelectedTabTextColor }
							TweenService:Create(clone.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), tbl5):Play()

							for _, child in ipairs(tabList:GetChildren()) do
								if child.Name ~= "Template" then
									if child.ClassName == "Frame" then
										if child ~= clone and child.Name ~= "Placeholder" then
											local TweenService4 = TweenService
											local create3 = TweenService.Create
											local tweenInfo3 = TweenInfo.new(0.7, Enum.EasingStyle.Exponential)
											local tbl6 = {}
											local n4 = 9
											tbl6.BackgroundColor3 = default.TabBackground
											create3(TweenService4, child, tweenInfo3, tbl6):Play()
											local tbl7 = { TextColor3 = default.TabTextColor }
											TweenService:Create(child.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), tbl7):Play()
											local tbl8 = { ImageColor3 = default.TabTextColor }
											TweenService:Create(child.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), tbl8):Play()
											TweenService:Create(child, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.7 }):Play()
											TweenService:Create(child.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0.2 }):Play()
											TweenService:Create(child.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 }):Play()
											TweenService:Create(child.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0.5 }):Play()
										end
									end
								end
							end

							if elements.UIPageLayout.CurrentPage ~= clone2 then
								elements.UIPageLayout:JumpTo(clone2)
							end

							return
						end
					end)

					local tbl3 = {
						CreateButton = function(arg6, arg7)
							local tbl3 = {}
							local clone3 = elements.Template.Button:Clone()
							clone3.Name = arg7.Name
							clone3.Title.Text = arg7.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							local TweenService4 = TweenService
							local create3 = TweenService.Create
							local n4 = 8
							create3(TweenService4, clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()

							clone3.Interact.MouseButton1Click:Connect(function()
								local ok, result = pcall(arg7.Callback)

								if not flag2 then
									if not ok then
										local TweenService5 = TweenService
										local create4 = TweenService.Create
										local clone4 = clone3
										local tweenInfo3 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential)
										local tbl4 = {}
										local color = Color3.fromRGB
										local n5 = 65
										tbl4.BackgroundColor3 = color(85, 0, 0)
										create4(TweenService5, clone4, tweenInfo3, tbl4):Play()
										TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
										TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
										clone3.Title.Text = "Callback Error"
										print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
										warn("Check docs.sirius.menu for help with Rayfield specific development.")
										task.wait(0.5)
										clone3.Title.Text = arg7.Name
										local tbl5 = { BackgroundColor3 = default.ElementBackground }
										TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl5):Play()
										TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 0.9 }):Play()
										TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
									else
										if not arg7.Ext then
											fn10(arg7.Name .. "\n")
										end

										local tbl4 = { BackgroundColor3 = default.ElementBackgroundHover }
										TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
										local tween = TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 1 })
										local play = tween.Play
										local countrz = bit32.countrz
										local countlz = bit32.countlz
										local value = 411
										local v6 = countlz(value)
										local n5 = countrz(v6) + 52
										play(tween)
										TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
										task.wait(0.2)
										local tbl5 = { BackgroundColor3 = default.ElementBackground }
										TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl5):Play()
										TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 0.9 }):Play()
										TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
									end

									return
								end
							end)

							clone3.MouseEnter:Connect(function()
								local tbl4 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
								TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 0.7 }):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl4 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
								TweenService:Create(clone3.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { TextTransparency = 0.9 }):Play()
							end)

							tbl3.Set = function(arg8, text)
								clone3.Title.Text = text
								clone3.Name = text
							end

							return tbl3
						end,
						CreateColorPicker = function(arg6, arg7)
							local band = bit32.band
							local n4 = 89
							local n5 = 3
							local n6 = band(n4, 274, n5) + 2
							local v6 = arg7
							v6.Type = "ColorPicker"
							local clone3 = elements.Template.ColorPicker:Clone()
							local cpBackground = clone3.CPBackground
							local display = cpBackground.Display
							local mainCP = cpBackground.MainCP
							local colorSlider = clone3.ColorSlider
							clone3.ClipsDescendants = true
							clone3.Name = v6.Name
							clone3.Title.Text = v6.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.Size = UDim2.new(1, -10, 0, 45)
							cpBackground.Size = UDim2.new(0, 39, 0, 22)
							display.BackgroundTransparency = 0
							mainCP.MainPoint.ImageTransparency = 1
							clone3.Interact.Size = UDim2.new(1, 0, 1, 0)
							clone3.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
							clone3.RGB.Position = UDim2.new(0, 17, 0, 70)
							clone3.HexInput.Position = UDim2.new(0, 17, 0, 90)
							mainCP.ImageTransparency = 1
							cpBackground.BackgroundTransparency = 1

							for _, child in ipairs(clone3.RGB:GetChildren()) do
								if child:IsA("Frame") then
									child.BackgroundColor3 = default.InputBackground
									child.UIStroke.Color = default.InputStroke
								end
							end

							clone3.HexInput.BackgroundColor3 = default.InputBackground
							clone3.HexInput.UIStroke.Color = default.InputStroke
							local flag11 = false
							local mouse2 = Players2.LocalPlayer:GetMouse()
							mainCP.Image = "http://www.roblox.com/asset/?id=11415645739"
							local flag12 = false
							local flag13 = false

							clone3.Interact.MouseButton1Down:Connect(function()
								task.spawn(function()
									local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									task.wait(0.2)
									local tbl4 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end)

								if not flag11 then
									flag11 = true
									TweenService:Create(cpBackground, TweenInfo.new(0.45, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 18, 0, 15) }):Play()
									task.wait(0.1)
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, -10, 0, 120) }):Play()
									TweenService:Create(cpBackground, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 173, 0, 86) }):Play()
									TweenService:Create(display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
									TweenService:Create(clone3.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Position = UDim2.new(0.289, 0, 0.5, 0) }):Play()
									TweenService:Create(clone3.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Exponential), { Position = UDim2.new(0, 17, 0, 40) }):Play()
									local tween = TweenService:Create(clone3.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Position = UDim2.new(0, 17, 0, 73) })
									local band2 = bit32.band
									local len = 1; local len2 = 1; local value = 161
									local flag14 = band2(len, len2, value) == 3
									tween:Play()
									TweenService:Create(clone3.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(0.574, 0, 1, 0) }):Play()
									TweenService:Create(mainCP.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local mainCP2 = mainCP
									local TweenInfo; TweenInfo = TweenInfo
									local rrotate = bit32.rrotate
									local value2 = 27
									local n7 = rrotate(334, value2) - 10682
									create3(TweenService4, mainCP2, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { ImageTransparency = default ~= tbl.Theme.Default and 0.25 or 0.1 }):Play()
									TweenService:Create(cpBackground, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
								else
									flag11 = false
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, -10, 0, 45) }):Play()
									TweenService:Create(cpBackground, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(0, 39, 0, 22) }):Play()
									local tween = TweenService:Create(clone3.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, 0, 1, 0) })
									local play = tween.Play
									local flag14 = true
									local n7 = 65
									play(tween)
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local interact = clone3.Interact
									local tweenInfo3 = TweenInfo.new
									local Enum_ = Enum
									local countrz = bit32.countrz
									local value = 146
									local n8 = countrz(value) + 5
									create3(TweenService4, interact, tweenInfo3(0.6, Enum_.EasingStyle.Exponential), { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
									TweenService:Create(clone3.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Position = UDim2.new(0, 17, 0, 70) }):Play()
									TweenService:Create(clone3.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { Position = UDim2.new(0, 17, 0, 90) }):Play()
									TweenService:Create(display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
									TweenService:Create(mainCP.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
									TweenService:Create(mainCP, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { ImageTransparency = 1 }):Play()
									TweenService:Create(cpBackground, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
								end
							end)

							UserInputService2.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
									if input.UserInputType == Enum.UserInputType.Touch then
										flag12 = false
										flag13 = false
									end

									return
								end

								flag12 = false
								flag13 = false
							end)

							mainCP.MouseButton1Down:Connect(function()
								if flag11 then
									flag12 = true
								end
							end)

							mainCP.MainPoint.MouseButton1Down:Connect(function()
								if flag11 then
									flag12 = true
								end
							end)

							colorSlider.MouseButton1Down:Connect(function()
								flag13 = true
							end)

							colorSlider.SliderPoint.MouseButton1Down:Connect(function()
								flag13 = true
							end)

							-- Fonction sécurisée pour extraire les valeurs HSV peu importe si c'est une fonction ou une propriété
local function safeGetHSV(colorSource)
    if not colorSource then return 0, 0, 0 end
    
    local col = colorSource
    -- Si c'est une fonction, on l'appelle
    if type(colorSource) == "function" then
        col = colorSource()
    end
    
    -- Si c'est un Color3 valide, on extrait le HSV
    if typeof(col) == "Color3" then
        return col:ToHSV()
    end
    
    -- Valeur par défaut si rien ne correspond
    return 0, 0, 0
end

-- Utilisation à la place de votre ancienne ligne :
local n7, n8, n9 = safeGetHSV(v6.Color)
							local color = Color3.fromHSV(n7, n8, n9)
							local text = string.format("#%02X%02X%02X", color.R * 255, color.G * 255, color.B * 255)
							clone3.HexInput.InputBox.Text = text

							local function fn17()
								mainCP.MainPoint.Position = UDim2.new(n8, -mainCP.MainPoint.AbsoluteSize.X / 2, 1 - n9, -mainCP.MainPoint.AbsoluteSize.Y / 2)
								mainCP.MainPoint.ImageColor3 = Color3.fromHSV(n7, n8, n9)
								cpBackground.BackgroundColor3 = Color3.fromHSV(n7, 1, 1)
								display.BackgroundColor3 = Color3.fromHSV(n7, n8, n9)
								colorSlider.SliderPoint.Position = UDim2.new(0, n7 * colorSlider.AbsoluteSize.X - colorSlider.SliderPoint.AbsoluteSize.X / 2, 0.5, 0)
								colorSlider.SliderPoint.ImageColor3 = Color3.fromHSV(n7, 1, 1)
								local color2 = Color3.fromHSV(n7, n8, n9)
								local n10 = math.floor(color2.R * 255 + 0.5)
								local n11 = math.floor(color2.G * 255 + 0.5)
								local n12 = math.floor(color2.B * 255 + 0.5)
								clone3.RGB.RInput.InputBox.Text = tostring(n10)
								clone3.RGB.GInput.InputBox.Text = tostring(n11)
								clone3.RGB.BInput.InputBox.Text = tostring(n12)
								text = string.format("#%02X%02X%02X", color2.R * 255, color2.G * 255, color2.B * 255)
								clone3.HexInput.InputBox.Text = text
							end

							fn17()
							local focusLost = clone3.HexInput.InputBox.FocusLost
							local bor = bit32.bor
							local n10 = 317
							local n11 = bor(n10) - 221

							focusLost:Connect(function()
								if not pcall(function()
									local v7, v8, v9 = string.match(clone3.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
									local tonumber; tonumber = tonumber
									local color2 = Color3.fromRGB(tonumber(v7, 16), tonumber(v8, 16), tonumber(v9, 16))
									local v10, v11, v12 = color2:ToHSV()
									n7 = v10; n8 = v11; n9 = v12
									text = clone3.HexInput.InputBox.Text
									fn17()
									v6.Color = color2
								end) then
									clone3.HexInput.InputBox.Text = text
								end

								pcall(function()
									v6.Callback(Color3.fromHSV(n7, n8, n9))
								end)

								local n12 = math.floor(n7 * 255 + 0.5)
								local n13 = math.floor(n8 * 255 + 0.5)
								local n14 = math.floor(n9 * 255 + 0.5)
								v6.Color = Color3.fromRGB(n12, n13, n14)

								if not v6.Ext then
									fn10()
								end
							end)

							local function fn18(arg8, arg9)
								local num = tonumber(arg8.Text)
								local color2 = Color3.fromHSV(n7, n8, n9)
								local n12 = math.floor(color2.R * 255 + 0.5)
								local n13 = math.floor(color2.G * 255 + 0.5)
								local n14 = math.floor(color2.B * 255 + 0.5)
								local v7

								if arg9 ~= "R" then
									if arg9 ~= "G" then
										v7 = n14
										n14 = num
									else
										v7 = n13
										n13 = num
									end
								else
									v7 = n12
									n12 = num
								end

								if not num then
									arg8.Text = tostring(v7)
								else
									math.clamp(num, 0, 255)
									local v8, v9, v10 = Color3.fromRGB(n12, n13, n14):ToHSV()
									n7 = v8; n8 = v9; n9 = v10
									fn17()
								end

								local n15 = math.floor(n7 * 255 + 0.5)
								local n16 = math.floor(n8 * 255 + 0.5)
								local n17 = math.floor(n9 * 255 + 0.5)
								v6.Color = Color3.fromRGB(n15, n16, n17)

								if not v6.Ext then
									local rshift = bit32.rshift
									local flag14 = false
									local n18 = rshift(379, 8) + 12
									fn10(v6.Flag .. "\n" .. tostring(v6.Color))
								end
							end

							clone3.RGB.RInput.InputBox.FocusLost:connect(function()
								fn18(clone3.RGB.RInput.InputBox, "R")

								pcall(function()
									v6.Callback(Color3.fromHSV(n7, n8, n9))
								end)
							end)

							clone3.RGB.GInput.InputBox.FocusLost:connect(function()
								fn18(clone3.RGB.GInput.InputBox, "G")

								pcall(function()
									v6.Callback(Color3.fromHSV(n7, n8, n9))
								end)
							end)

							clone3.RGB.BInput.InputBox.FocusLost:connect(function()
								fn18(clone3.RGB.BInput.InputBox, "B")

								pcall(function()
									v6.Callback(Color3.fromHSV(n7, n8, n9))
								end)
							end)

							RunService2.RenderStepped:connect(function()
								if flag12 then
									local n12 = math.clamp(mouse2.X - mainCP.AbsolutePosition.X, 0, mainCP.AbsoluteSize.X)
									local n13 = math.clamp(mouse2.Y - mainCP.AbsolutePosition.Y, 0, mainCP.AbsoluteSize.Y)
									mainCP.MainPoint.Position = UDim2.new(0, n12 - mainCP.MainPoint.AbsoluteSize.X / 2, 0, n13 - mainCP.MainPoint.AbsoluteSize.Y / 2)
									n8 = n12 / mainCP.AbsoluteSize.X
									n9 = 1 - n13 / mainCP.AbsoluteSize.Y
									display.BackgroundColor3 = Color3.fromHSV(n7, n8, n9)
									mainCP.MainPoint.ImageColor3 = Color3.fromHSV(n7, n8, n9)
									cpBackground.BackgroundColor3 = Color3.fromHSV(n7, 1, 1)
									local color2 = Color3.fromHSV(n7, n8, n9)
									local n14 = math.floor(color2.R * 255 + 0.5)
									local n15 = math.floor(color2.G * 255 + 0.5)
									local n16 = math.floor(color2.B * 255 + 0.5)
									clone3.RGB.RInput.InputBox.Text = tostring(n14)
									local inputBox = clone3.RGB.GInput.InputBox
									local text2 = tostring(n15)
									local flag14 = false
									inputBox.Text = text2
									clone3.RGB.BInput.InputBox.Text = tostring(n16)
									clone3.HexInput.InputBox.Text = string.format("#%02X%02X%02X", color2.R * 255, color2.G * 255, color2.B * 255)

									pcall(function()
										v6.Callback(Color3.fromHSV(n7, n8, n9))
									end)

									v6.Color = Color3.fromRGB(n14, n15, n16)

									if not v6.Ext then
										fn10()
									end
								end

								if flag13 then
									local n12 = math.clamp(mouse2.X - colorSlider.AbsolutePosition.X, 0, colorSlider.AbsoluteSize.X)
									n7 = n12 / colorSlider.AbsoluteSize.X
									display.BackgroundColor3 = Color3.fromHSV(n7, n8, n9)
									colorSlider.SliderPoint.Position = UDim2.new(0, n12 - colorSlider.SliderPoint.AbsoluteSize.X / 2, 0.5, 0)
									colorSlider.SliderPoint.ImageColor3 = Color3.fromHSV(n7, 1, 1)
									cpBackground.BackgroundColor3 = Color3.fromHSV(n7, 1, 1)
									mainCP.MainPoint.ImageColor3 = Color3.fromHSV(n7, n8, n9)
									local color2 = Color3.fromHSV(n7, n8, n9)
									local n13 = math.floor(color2.R * 255 + 0.5)
									local n14 = math.floor(color2.G * 255 + 0.5)
									local math; math = math
									local n15 = bit32.rrotate(string.byte("\185\231{", 3, nil), 10) - 515899386
									local v7 = math.floor(color2.B * 255 + 0.5)
									clone3.RGB.RInput.InputBox.Text = tostring(n13)
									clone3.RGB.GInput.InputBox.Text = tostring(n14)
									clone3.RGB.BInput.InputBox.Text = tostring(v7)
									clone3.HexInput.InputBox.Text = string.format("#%02X%02X%02X", color2.R * 255, color2.G * 255, color2.B * 255)

									pcall(function()
										v6.Callback(Color3.fromHSV(n7, n8, n9))
									end)

									v6.Color = Color3.fromRGB(n13, n14, v7)

									if not v6.Ext then
										fn10()
									end
								end
							end)

							if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not v6.Flag) then
								tbl.Flags[v6.Flag] = v6
							end

							v6.Set = function(arg8, color2)
								v6.Color = color2
								local v7, v8, v9 = v6.Color:ToHSV()
								n7 = v7; n8 = v8; n9 = v9
								color = Color3.fromHSV(n7, n8, n9)
								fn17()
							end

							clone3.MouseEnter:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								for _, child in ipairs(clone3.RGB:GetChildren()) do
									if child:IsA("Frame") then
										child.BackgroundColor3 = default.InputBackground
										child.UIStroke.Color = default.InputStroke
									end
								end

								clone3.HexInput.BackgroundColor3 = default.InputBackground
								clone3.HexInput.UIStroke.Color = default.InputStroke
							end)

							return v6
						end,
						CreateSection = function(arg6, text)
							local tbl3 = {}

							if flag10 then
								local clone3 = elements.Template.SectionSpacing:Clone()
								clone3.Visible = true
								clone3.Parent = clone2
							end

							local clone3 = elements.Template.SectionTitle:Clone()
							clone3.Title.Text = text
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.Title.TextTransparency = 1
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0.4 }):Play()

							tbl3.Set = function(arg7, text2)
								clone3.Title.Text = text2
							end

							flag10 = true
							return tbl3
						end,
						CreateDivider = function()
							local tbl3 = {}
							local clone3 = elements.Template.Divider:Clone()
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.Divider.BackgroundTransparency = 1
							TweenService:Create(clone3.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0.85 }):Play()

							tbl3.Set = function(arg6, visible)
								clone3.Visible = visible
							end

							return tbl3
						end,
						CreateLabel = function(arg6, text, arg7, backgroundColor3, arg8)
							local tbl3 = {}
							local clone3 = elements.Template.Label:Clone()
							clone3.Title.Text = text
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundColor3 = backgroundColor3 or default.SecondaryElementBackground
							clone3.UIStroke.Color = backgroundColor3 or default.SecondaryElementStroke

							if not arg7 then
								clone3.Icon.Image = "rbxassetid://0"
							elseif typeof(arg7) ~= "string" or not lua then
								clone3.Icon.Image = fn5(arg7)
							else
								local v6 = fn4(arg7)
								clone3.Icon.Image = "rbxassetid://" .. v6.id
								clone3.Icon.ImageRectOffset = v6.imageRectOffset
								clone3.Icon.ImageRectSize = v6.imageRectSize
							end

							if not (not arg7 or not clone3:FindFirstChild("Icon")) then
								clone3.Title.Position = UDim2.new(0, 45, 0.5, 0)
								clone3.Title.Size = UDim2.new(1, -100, 0, 14)

								if typeof(arg7) ~= "string" or not lua then
									clone3.Icon.Image = fn5(arg7)
								else
									local v6 = fn4(arg7)
									clone3.Icon.Image = "rbxassetid://" .. v6.id
									clone3.Icon.ImageRectOffset = v6.imageRectOffset
									clone3.Icon.ImageRectSize = v6.imageRectSize
								end

								clone3.Icon.Visible = true
							end

							clone3.Icon.ImageTransparency = 1
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							local TweenService4 = TweenService
							local create3 = TweenService.Create
							local clone4 = clone3
							local tweenInfo3 = TweenInfo.new
							local n4 = 59
							create3(TweenService4, clone4, tweenInfo3(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = backgroundColor3 and 0.8 or 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = backgroundColor3 and 0.7 or 0 }):Play()
							TweenService:Create(clone3.Icon, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.2 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = backgroundColor3 and 0.2 or 0 }):Play()

							tbl3.Set = function(arg9, text2, arg10, backgroundColor32)
								clone3.Title.Text = text2

								if backgroundColor32 then
									clone3.BackgroundColor3 = backgroundColor32
									clone3.UIStroke.Color = backgroundColor32
								end

								if not (not arg10 or not clone3:FindFirstChild("Icon")) then
									clone3.Title.Position = UDim2.new(0, 45, 0.5, 0)
									clone3.Title.Size = UDim2.new(1, -100, 0, 14)

									if typeof(arg10) ~= "string" or not lua then
										clone3.Icon.Image = fn5(arg10)
									else
										local v6 = fn4(arg10)
										clone3.Icon.Image = "rbxassetid://" .. v6.id
										clone3.Icon.ImageRectOffset = v6.imageRectOffset
										clone3.Icon.ImageRectSize = v6.imageRectSize
									end

									clone3.Icon.Visible = true
								end
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								clone3.BackgroundColor3 = arg8 and (backgroundColor3 or clone3.BackgroundColor3) or default.SecondaryElementBackground
								clone3.UIStroke.Color = arg8 and (backgroundColor3 or clone3.BackgroundColor3) or default.SecondaryElementStroke
							end)

							return tbl3
						end,
						CreateParagraph = function(arg6, arg7)
							local tbl3 = {}
							local clone3 = elements.Template.Paragraph:Clone()
							clone3.Title.Text = arg7.Title
							clone3.Content.Text = arg7.Content
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							clone3.Content.TextTransparency = 1
							clone3.BackgroundColor3 = default.SecondaryElementBackground
							clone3.UIStroke.Color = default.SecondaryElementStroke
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
							TweenService:Create(clone3.Content, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()

							tbl3.Set = function(arg8, arg9)
								clone3.Title.Text = arg9.Title
								clone3.Content.Text = arg9.Content
							end

							local signal = screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3")
							local connect = signal.Connect

							local function fn17()
								clone3.BackgroundColor3 = default.SecondaryElementBackground
								clone3.UIStroke.Color = default.SecondaryElementStroke
							end

							local n4 = 3
							connect(signal, fn17)
							return tbl3
						end,
						CreateInput = function(arg6, textBox)
							local clone3 = elements.Template.Input:Clone()
							clone3.Name = textBox.Name
							clone3.Title.Text = textBox.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							clone3.InputFrame.InputBox.Text = textBox.CurrentValue or ""
							local inputFrame = clone3.InputFrame
							local inputBackground = default.InputBackground
							local flag11 = true
							local n4 = 4
							inputFrame.BackgroundColor3 = inputBackground
							clone3.InputFrame.UIStroke.Color = default.InputStroke
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
							clone3.InputFrame.InputBox.PlaceholderText = textBox.PlaceholderText
							clone3.InputFrame.Size = UDim2.new(0, clone3.InputFrame.InputBox.TextBounds.X + 24, 0, 30)

							clone3.InputFrame.InputBox.FocusLost:Connect(function()
								local ok, result = pcall(function()
									textBox.Callback(clone3.InputFrame.InputBox.Text)
									textBox.CurrentValue = clone3.InputFrame.InputBox.Text
								end)

								if not ok then
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									clone3.Title.Text = "Callback Error"
									print("Rayfield | " .. textBox.Name .. " Callback Error " .. tostring(result))
									warn("Check docs.sirius.menu for help with Rayfield specific development.")
									task.wait(0.5)
									clone3.Title.Text = textBox.Name
									local tbl3 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									local n5 = 13
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								if textBox.RemoveTextAfterFocusLost then
									clone3.InputFrame.InputBox.Text = ""
								end

								if not textBox.Ext then
									fn10()
								end
							end)

							clone3.MouseEnter:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
								TweenService:Create(clone3.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Size = UDim2.new(0, clone3.InputFrame.InputBox.TextBounds.X + 24, 0, 30) }):Play()
							end)

							textBox.Set = function(arg8, text)
								clone3.InputFrame.InputBox.Text = text
								textBox.CurrentValue = text

								local ok, result = pcall(function()
									textBox.Callback(text)
								end)

								if not textBox.Ext then
									fn10()
								end
							end

							if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not textBox.Flag) then
								tbl.Flags[textBox.Flag] = textBox
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								clone3.InputFrame.BackgroundColor3 = default.InputBackground
								clone3.InputFrame.UIStroke.Color = default.InputStroke
							end)

							return textBox
						end,
						CreateDropdown = function(arg6, arg7)
							local clone3 = elements.Template.Dropdown:Clone()

							if not string.find(arg7.Name, "closed") then
								clone3.Name = arg7.Name
							else
								clone3.Name = "Dropdown"
							end

							clone3.Title.Text = arg7.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.List.Visible = false

							tokraRefreshDropdown(arg7, clone3)

							clone3.Toggle.ImageColor3 = default.TextColor
							local TweenService4 = TweenService
							local create3 = TweenService.Create
							local n4 = 9
							local tbl3 = { BackgroundColor3 = default.ElementBackground }
							create3(TweenService4, clone3, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), tbl3):Play()
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							clone3.Size = UDim2.new(1, -10, 0, 45)
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()

							for _, child in ipairs(clone3.List:GetChildren()) do
								if child.ClassName == "Frame" then
									if child.Name ~= "Placeholder" then
										child:Destroy()
									end
								end
							end

							clone3.Toggle.Rotation = 180

							clone3.Interact.MouseButton1Click:Connect(function()
								local tbl4 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), tbl4):Play()
								TweenService:Create(clone3.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
								task.wait(0.1)
								local tbl5 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), tbl5):Play()
								TweenService:Create(clone3.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()

								if not flag7 then
									if not clone3.List.Visible then
										local TweenService5 = TweenService
										local create4 = TweenService.Create
										local clone4 = clone3
										local tweenInfo3 = TweenInfo.new
										local exponential = Enum.EasingStyle.Exponential
										local n5 = 140
										create4(TweenService5, clone4, tweenInfo3(0.5, exponential), { Size = UDim2.new(1, -10, 0, 180) }):Play()
										clone3.List.Visible = true
										local TweenService6 = TweenService
										local create5 = TweenService.Create
										local list = clone3.List
										local tweenInfo4 = TweenInfo.new
										local easingStyle = Enum.EasingStyle
										local countrz = bit32.countrz
										local value = 295
										local n6 = countrz(value) + 59
										create5(TweenService6, list, tweenInfo4(0.3, easingStyle.Exponential), { ScrollBarImageTransparency = 0.7 }):Play()
										TweenService:Create(clone3.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Rotation = 0 }):Play()

										for _, child in ipairs(clone3.List:GetChildren()) do
											if child.ClassName == "Frame" then
												if child.Name ~= "Placeholder" then
													if child.Name ~= clone3.Selected.Text then
														TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
													end

													local n7 = 40
													TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
													TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
												end
											end
										end
									else
										flag7 = true
										local TweenService5 = TweenService
										local create4 = TweenService.Create
										local clone4 = clone3
										local tweenInfo3 = TweenInfo.new
										local n5 = 6
										create4(TweenService5, clone4, tweenInfo3(0.5, Enum.EasingStyle.Exponential), { Size = UDim2.new(1, -10, 0, 45) }):Play()

										for _, child in ipairs(clone3.List:GetChildren()) do
											if child.ClassName == "Frame" then
												if child.Name ~= "Placeholder" then
													TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
													TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
													TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
												end
											end
										end

										TweenService:Create(clone3.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ScrollBarImageTransparency = 1 }):Play()
										TweenService:Create(clone3.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Rotation = 180 }):Play()
										task.wait(0.35)
										clone3.List.Visible = false
										flag7 = false
									end

									return
								end

								local band = bit32.band
								local n5 = 225
								local len = 0
								local n6 = band(n5, 492, len) + 18
							end)

							clone3.MouseEnter:Connect(function()
								if not clone3.List.Visible then
									local tbl4 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
								end
							end)

							clone3.MouseLeave:Connect(function()
								local tbl4 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
							end)

							local function fn17()
    -- On s'assure que arg7.Options existe et est bien une table
    local options = arg7 and arg7.Options
    if type(options) ~= "table" then
        warn("Rayfield | arg7.Options est nil ou invalide pour l'élément : " .. tostring(arg7 and arg7.Name))
        return
    end

    for _, option in ipairs(options) do
        local clone4 = elements.Template.Dropdown.List.Template:Clone()
        clone4.Name = option
        clone4.Title.Text = option
        clone4.Parent = clone3.List
        clone4.Visible = true
        clone4.BackgroundTransparency = 1
        clone4.UIStroke.Transparency = 1
        clone4.Title.TextTransparency = 1
        clone4.Interact.ZIndex = 50

        clone4.Interact.MouseButton1Click:Connect(function()
            -- S'assure aussi que CurrentOption existe pour éviter d'autres erreurs
            arg7.CurrentOption = arg7.CurrentOption or {}

            if not arg7.MultipleOptions then
                if table.find(arg7.CurrentOption, option) then
                    return
                end
            end

            if not table.find(arg7.CurrentOption, option) then
                if not arg7.MultipleOptions then
                    table.clear(arg7.CurrentOption)
                end

                table.insert(arg7.CurrentOption, option)

                tokraRefreshDropdown(arg7, clone3)

                TweenService:Create(clone4.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
                local tbl4 = { BackgroundColor3 = default.DropdownSelected }
                TweenService:Create(clone4, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), tbl4):Play()
                flag7 = true
            else
                table.remove(arg7.CurrentOption, table.find(arg7.CurrentOption, option))

                tokraRefreshDropdown(arg7, clone3)
            end

            local ok, result = pcall(function()
                if type(arg7.Callback) == "function" then
                    arg7.Callback(arg7.CurrentOption)
                end
            end)

            if not ok then
                TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
                TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
                clone3.Title.Text = "Callback Error"
                print("Rayfield | " .. tostring(arg7.Name) .. " Callback Error " .. tostring(result))
                warn("Check docs.sirius.menu for help with Rayfield specific development.")
                task.wait(0.5)
                clone3.Title.Text = tostring(arg7.Name)
                local tbl4 = { BackgroundColor3 = default.ElementBackground }
                TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
                TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
            end

            for _, child in ipairs(clone3.List:GetChildren()) do
                if child.ClassName == "Frame" then
                    if child.Name ~= "Placeholder" and not table.find(arg7.CurrentOption, child.Name) then
                        local tbl4 = { BackgroundColor3 = default.DropdownUnselected }
                        TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), tbl4):Play()
                    end
                end
            end

            if not arg7.MultipleOptions then
                task.wait(0.1)
                local tbl4 = { Size = UDim2.new(1, -10, 0, 45) }
                TweenService:Create(clone3, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), tbl4):Play()

                for _, child in ipairs(clone3.List:GetChildren()) do
                    if child.ClassName == "Frame" then
                        if child.Name ~= "Placeholder" then
                            TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { BackgroundTransparency = 1 }):Play()
                            TweenService:Create(child.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
                            TweenService:Create(child.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { TextTransparency = 1 }):Play()
                        end
                    end
                end

                TweenService:Create(clone3.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), { ScrollBarImageTransparency = 1 }):Play()
                TweenService:Create(clone3.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Rotation = 180 }):Play()
                task.wait(0.35)
                clone3.List.Visible = false
            end

            flag7 = false

            if not arg7.Ext then
                fn10()
            end
        end)

        screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
            clone4.UIStroke.Color = default.ElementStroke
        end)
    end
end

							fn17()

							for _, child in ipairs(clone3.List:GetChildren()) do
								if child.ClassName == "Frame" then
									if child.Name ~= "Placeholder" then
										if not table.find(arg7.CurrentOption, child.Name) then
											child.BackgroundColor3 = default.DropdownUnselected
										else
											child.BackgroundColor3 = default.DropdownSelected
										end

										screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
											if not table.find(arg7.CurrentOption, child.Name) then
												child.BackgroundColor3 = default.DropdownUnselected
											else
												child.BackgroundColor3 = default.DropdownSelected
											end
										end)
									end
								end
							end

							arg7.Set = function(arg8, currentOption)
								arg7.CurrentOption = currentOption

								tokraRefreshDropdown(arg7, clone3)

								local ok, result = pcall(function()
									arg7.Callback(currentOption)
								end)

								if not ok then
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									clone3.Title.Text = "Callback Error"
									local print; print = print
									local name2 = arg7.Name
									local n5 = 8
									local n6 = 4
									print("Rayfield | " .. name2 .. " Callback Error " .. tostring(result))
									warn("Check docs.sirius.menu for help with Rayfield specific development.")
									task.wait(0.5)
									clone3.Title.Text = arg7.Name
									local TweenService5 = TweenService
									local flag11 = true
									local tbl4 = { BackgroundColor3 = default.ElementBackground }
									TweenService5:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								local bor = bit32.bor
								local bxor = bit32.bxor
								local v6 = 82
								local v7 = bxor(v6)
								local v8 = 22
								local v9 = 137
								local n5 = bor(v7, v8, v9) - 218

								for _, child in ipairs(clone3.List:GetChildren()) do
									if child.ClassName == "Frame" then
										if child.Name ~= "Placeholder" then
											if not table.find(arg7.CurrentOption, child.Name) then
												child.BackgroundColor3 = default.DropdownUnselected
											else
												child.BackgroundColor3 = default.DropdownSelected
											end
										end
									end
								end

								local n6 = 67
							end

							arg7.Refresh = function(arg8, options)
								arg7.Options = options

								for _, v6 in clone3.List:GetChildren() do
									if v6.ClassName == "Frame" then
										if v6.Name ~= "Placeholder" then
											v6:Destroy()
										end
									end
								end

								fn17()
							end

							if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not arg7.Flag) then
								tbl.Flags[arg7.Flag] = arg7
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								clone3.Toggle.ImageColor3 = default.TextColor
								local tbl4 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), tbl4):Play()
							end)

							return arg7
						end,
						CreateKeybind = function(arg6, arg7)
							local flag11 = false
							local clone3 = elements.Template.Keybind:Clone()
							clone3.Name = arg7.Name
							clone3.Title.Text = arg7.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							clone3.KeybindFrame.BackgroundColor3 = default.InputBackground
							clone3.KeybindFrame.UIStroke.Color = default.InputStroke
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
							clone3.KeybindFrame.KeybindBox.Text = arg7.CurrentKeybind
							clone3.KeybindFrame.Size = UDim2.new(0, clone3.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)

							clone3.KeybindFrame.KeybindBox.Focused:Connect(function()
								flag11 = true
								clone3.KeybindFrame.KeybindBox.Text = ""
							end)

							clone3.KeybindFrame.KeybindBox.FocusLost:Connect(function()
								flag11 = false

								if not (clone3.KeybindFrame.KeybindBox.Text ~= nil and clone3.KeybindFrame.KeybindBox.Text ~= "") then
									clone3.KeybindFrame.KeybindBox.Text = arg7.CurrentKeybind

									if not arg7.Ext then
										fn10()
									end
								end
							end)

							clone3.MouseEnter:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							UserInputService2.InputBegan:Connect(function(input, gameProcessed)
								if not flag11 then
									if not arg7.CallOnChange then
										local band = bit32.band
										local value = 288
										local n4 = band(value) - 275

										if arg7.CurrentKeybind ~= nil and input.KeyCode == Enum.KeyCode[arg7.CurrentKeybind] and not gameProcessed then
											local flag12 = true
											local connection = nil

											connection = input.Changed:Connect(function(arg8)
												if arg8 == "UserInputState" then
													connection:Disconnect()
													flag12 = false
												end
											end)

											if not arg7.HoldToInteract then
												local ok, result = pcall(arg7.Callback)

												if not ok then
													local TweenService4 = TweenService
													local create3 = TweenService.Create
													local clone4 = clone3
													local tweenInfo3 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential)
													local tbl3 = {}
													local color = Color3.fromRGB(85, 0, 0)
													local flag13 = false
													local n5 = 12
													tbl3.BackgroundColor3 = color
													create3(TweenService4, clone4, tweenInfo3, tbl3):Play()
													TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
													clone3.Title.Text = "Callback Error"
													print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
													warn("Check docs.sirius.menu for help with Rayfield specific development.")
													task.wait(0.5)
													clone3.Title.Text = arg7.Name
													local tbl4 = { BackgroundColor3 = default.ElementBackground }
													TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl4):Play()
													TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
												end
											else
												task.wait(0.25)

												if flag12 then
													local connection2 = nil

													connection2 = RunService2.Stepped:Connect(function()
														if not flag12 then
															arg7.Callback(false)
															connection2:Disconnect()
														else
															arg7.Callback(true)
														end
													end)
												end
											end
										end
									end
								elseif input.KeyCode ~= Enum.KeyCode.Unknown then
									local v6 = string.split(tostring(input.KeyCode), ".")[3]
									clone3.KeybindFrame.KeybindBox.Text = tostring(v6)
									arg7.CurrentKeybind = tostring(v6)
									clone3.KeybindFrame.KeybindBox:ReleaseFocus()

									if not arg7.Ext then
										fn10()
									end

									if arg7.CallOnChange then
										arg7.Callback(tostring(v6))
									end
								end
							end)

							clone3.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
								TweenService:Create(clone3.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Size = UDim2.new(0, clone3.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30) }):Play()
							end)

							arg7.Set = function(arg8, arg9)
								clone3.KeybindFrame.KeybindBox.Text = tostring(arg9)
								arg7.CurrentKeybind = tostring(arg9)
								clone3.KeybindFrame.KeybindBox:ReleaseFocus()

								if not arg7.Ext then
									fn10()
								end

								if arg7.CallOnChange then
									arg7.Callback(tostring(arg9))
								end
							end

							if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not arg7.Flag) then
								tbl.Flags[arg7.Flag] = arg7
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								clone3.KeybindFrame.BackgroundColor3 = default.InputBackground
								clone3.KeybindFrame.UIStroke.Color = default.InputStroke
							end)

							return arg7
						end,
						CreateToggle = function(arg6, arg7)
							local clone3 = elements.Template.Toggle:Clone()
							clone3.Name = arg7.Name
							clone3.Title.Text = arg7.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1
							clone3.Switch.BackgroundColor3 = default.ToggleBackground

							if default ~= tbl.Theme.Default then
								clone3.Switch.Shadow.Visible = false
							end

							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()

							if arg7.CurrentValue ~= true then
								clone3.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
								clone3.Switch.Indicator.UIStroke.Color = default.ToggleDisabledStroke
								clone3.Switch.Indicator.BackgroundColor3 = default.ToggleDisabled
								clone3.Switch.UIStroke.Color = default.ToggleDisabledOuterStroke
							else
								clone3.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
								local indicator = clone3.Switch.Indicator
								local n4 = 5
								local flag11 = false
								indicator.UIStroke.Color = default.ToggleEnabledStroke
								clone3.Switch.Indicator.BackgroundColor3 = default.ToggleEnabled
								clone3.Switch.UIStroke.Color = default.ToggleEnabledOuterStroke
							end

							clone3.MouseEnter:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.Interact.MouseButton1Click:Connect(function()
								if arg7.CurrentValue ~= true then
									arg7.CurrentValue = true
									local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(1, -20, 0.5, 0) }):Play()
									local tbl4 = { Color = default.ToggleEnabledStroke }
									TweenService:Create(clone3.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl4):Play()
									local tbl5 = { BackgroundColor3 = default.ToggleEnabled }
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl5):Play()
									local tbl6 = { Color = default.ToggleEnabledOuterStroke }
									TweenService:Create(clone3.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl6):Play()
									local tbl7 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl7):Play()
									local countrz = bit32.countrz
									local v6 = 3
									local n4 = countrz(v6) + 52
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								else
									local n4 = 13
									arg7.CurrentValue = false
									local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(1, -40, 0.5, 0) }):Play()
									local tbl4 = { Color = default.ToggleDisabledStroke }
									TweenService:Create(clone3.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl4):Play()
									local tbl5 = { BackgroundColor3 = default.ToggleDisabled }
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl5):Play()
									local tbl6 = { Color = default.ToggleDisabledOuterStroke }
									TweenService:Create(clone3.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl6):Play()
									local tbl7 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl7):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								local ok, result = pcall(function()
									arg7.Callback(arg7.CurrentValue)
								end)

								if not ok then
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local clone4 = clone3
									local flag11 = 196 - string.byte("i\20y(\16", 4, nil) > 144
									create3(TweenService4, clone4, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									clone3.Title.Text = "Callback Error"
									print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
									warn("Check docs.sirius.menu for help with Rayfield specific development.")
									task.wait(0.5)
									clone3.Title.Text = arg7.Name
									local tbl3 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								if not arg7.Ext then
									fn10()
								end
							end)

							arg7.Set = function(arg8, arg9)
								if arg9 ~= true then
									arg7.CurrentValue = false
									local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(1, -40, 0.5, 0) }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 12, 0, 12) }):Play()
									local tbl4 = { Color = default.ToggleDisabledStroke }
									TweenService:Create(clone3.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl4):Play()
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local indicator = clone3.Switch.Indicator
									local bor = bit32.bor
									local flag11 = false
									local n4 = bor(0, string.byte("zE", 1, nil), 176) - 244
									local tbl5 = { BackgroundColor3 = default.ToggleDisabled }
									create3(TweenService4, indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl5):Play()
									local tbl6 = { Color = default.ToggleDisabledOuterStroke }
									local tween = TweenService:Create(clone3.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl6)
									local n5 = 3
									tween:Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 17, 0, 17) }):Play()
									local tbl7 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl7):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								else
									arg7.CurrentValue = true
									local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(1, -20, 0.5, 0) }):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 12, 0, 12) }):Play()
									local tbl4 = { Color = default.ToggleEnabledStroke }
									TweenService:Create(clone3.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl4):Play()
									local tbl5 = { BackgroundColor3 = default.ToggleEnabled }
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), tbl5):Play()
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local uiStroke = clone3.Switch.UIStroke
									local tweenInfo3 = TweenInfo.new
									local exponential = Enum.EasingStyle.Exponential
									local Enum; Enum = Enum
									local n4 = 8
									local n5 = 71
									local tbl6 = { Color = default.ToggleEnabledOuterStroke }
									create3(TweenService4, uiStroke, tweenInfo3(0.55, exponential, Enum.EasingDirection.Out), tbl6):Play()
									TweenService:Create(clone3.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 17, 0, 17) }):Play()
									local TweenService5 = TweenService
									local create4 = TweenService.Create
									local clone4 = clone3
									local tweenInfo4 = TweenInfo.new
									local easingStyle = Enum.EasingStyle
									local flag11 = 195 - string.byte("8", 1, nil) <= 1
									local n6 = 8
									local tbl7 = { BackgroundColor3 = default.ElementBackground }
									create4(TweenService5, clone4, tweenInfo4(0.6, easingStyle.Exponential), tbl7):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								local ok, result = pcall(function()
									arg7.Callback(arg7.CurrentValue)
								end)

								if not ok then
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									clone3.Title.Text = "Callback Error"
									print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
									warn("Check docs.sirius.menu for help with Rayfield specific development.")
									task.wait(0.5)
									clone3.Title.Text = arg7.Name
									local tbl3 = { BackgroundColor3 = default.ElementBackground }
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								if not arg7.Ext then
									fn10()
								end
							end

							if not arg7.Ext then
								if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not arg7.Flag) then
									tbl.Flags[arg7.Flag] = arg7
								end
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								clone3.Switch.BackgroundColor3 = default.ToggleBackground

								if default ~= tbl.Theme.Default then
									clone3.Switch.Shadow.Visible = false
								end

								task.wait()

								if not arg7.CurrentValue then
									clone3.Switch.Indicator.UIStroke.Color = default.ToggleDisabledStroke
									clone3.Switch.Indicator.BackgroundColor3 = default.ToggleDisabled
									clone3.Switch.UIStroke.Color = default.ToggleDisabledOuterStroke
								else
									clone3.Switch.Indicator.UIStroke.Color = default.ToggleEnabledStroke
									clone3.Switch.Indicator.BackgroundColor3 = default.ToggleEnabled
									clone3.Switch.UIStroke.Color = default.ToggleEnabledOuterStroke
								end
							end)

							return arg7
						end,
						CreateSlider = function(arg6, arg7)
							local flag11 = false
							local clone3 = elements.Template.Slider:Clone()
							clone3.Name = arg7.Name
							clone3.Title.Text = arg7.Name
							clone3.Visible = true
							clone3.Parent = clone2
							clone3.BackgroundTransparency = 1
							clone3.UIStroke.Transparency = 1
							clone3.Title.TextTransparency = 1

							if default ~= tbl.Theme.Default then
								clone3.Main.Shadow.Visible = false
							end

							clone3.Main.BackgroundColor3 = default.SliderBackground
							clone3.Main.UIStroke.Color = default.SliderStroke
							clone3.Main.Progress.UIStroke.Color = default.SliderStroke
							clone3.Main.Progress.BackgroundColor3 = default.SliderProgress
							TweenService:Create(clone3, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { BackgroundTransparency = 0 }):Play()
							TweenService:Create(clone3.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
							TweenService:Create(clone3.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { TextTransparency = 0 }):Play()
							-- S'assure que arg7 existe et que Range est bien une table indexable
local range = arg7 and arg7.Range
if type(range) == "table" and range[1] and range[2] then
    local minVal, maxVal = range[1], range[2]
    local rangeSize = maxVal - minVal
    if rangeSize == 0 then rangeSize = 1 end

    local calculatedWidth = clone3.Main.AbsoluteSize.X * (arg7.CurrentValue or 0) / rangeSize
    local finalWidth = calculatedWidth > 5 and calculatedWidth or 5

    clone3.Main.Progress.Size = UDim2.new(0, finalWidth, 1, 0)
else
    warn("Erreur : arg7.Range n'est pas une table valide ou est une fonction !")
end

							if not arg7.Suffix then
								clone3.Main.Information.Text = tostring(arg7.CurrentValue)
							else
								local str = " " .. arg7.Suffix
								clone3.Main.Information.Text = tostring(arg7.CurrentValue) .. str
							end

							clone3.MouseEnter:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackgroundHover }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							clone3.MouseLeave:Connect(function()
								local tbl3 = { BackgroundColor3 = default.ElementBackground }
								TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
							end)

							local inputBegan = clone3.Main.Interact.InputBegan
							local bxor = bit32.bxor
							local value = 253
							local value2 = 44
							local n4 = bxor(495, value, value2) - 313

							inputBegan:Connect(function(arg8)
								if arg8.UserInputType ~= Enum.UserInputType.MouseButton1 then
									if arg8.UserInputType == Enum.UserInputType.Touch then
										local tween = TweenService:Create(clone3.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 })
										tween:Play()
										local tween2 = TweenService:Create(clone3.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 })
										tween2:Play()
										flag11 = true
									end

									return
								end

								TweenService:Create(clone3.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
								TweenService:Create(clone3.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
								flag11 = true
							end)

							clone3.Main.Interact.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
									if input.UserInputType == Enum.UserInputType.Touch then
										local tween = TweenService:Create(clone3.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0.4 })
										tween:Play()
										local tween2 = TweenService:Create(clone3.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0.3 })
										tween2:Play()
										flag11 = false
									end

									return
								end

								TweenService:Create(clone3.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0.4 }):Play()
								TweenService:Create(clone3.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0.3 }):Play()
								flag11 = false
							end)

							clone3.Main.Interact.MouseButton1Down:Connect(function(x)
								local n5 = clone3.Main.Progress.AbsolutePosition.X + clone3.Main.Progress.AbsoluteSize.X
								local v6 = n5; local x2 = x; local connection = nil

								connection = RunService2.Stepped:Connect(function()
									if not flag11 then
										local TweenService4 = TweenService
										local create3 = TweenService.Create
										local progress = clone3.Main.Progress
										local tweenInfo3 = TweenInfo.new
										local exponential = Enum.EasingStyle.Exponential
										local Enum; Enum = Enum
										local n6 = 7
										local n7 = 7

										create3(TweenService4, progress, tweenInfo3(0.3, exponential, Enum.EasingDirection.Out), {
											Size = UDim2.new(0, x2 - clone3.Main.AbsolutePosition.X > 5 and x2 - clone3.Main.AbsolutePosition.X or 5, 1, 0),
										}):Play()

										connection:Disconnect()
									else
										x2 = UserInputService2:GetMouseLocation().X
										n5 += 0.025 * (x2 - v6)

										if not (x2 < clone3.Main.AbsolutePosition.X) then
											if clone3.Main.AbsolutePosition.X + clone3.Main.AbsoluteSize.X < x2 then
												x2 = clone3.Main.AbsolutePosition.X + clone3.Main.AbsoluteSize.X
											end
										else
											x2 = clone3.Main.AbsolutePosition.X
										end

										if not (n5 < clone3.Main.AbsolutePosition.X + 5) then
											if clone3.Main.AbsolutePosition.X + clone3.Main.AbsoluteSize.X < n5 then
												n5 = clone3.Main.AbsolutePosition.X + clone3.Main.AbsoluteSize.X
											end
										else
											n5 = clone3.Main.AbsolutePosition.X + 5
										end

										if n5 <= x2 then
											if not (x2 - v6 < 0) then
												if x2 <= n5 then
													if x2 - v6 > 0 then
														v6 = x2
													end
												end
											else
												v6 = x2
											end
										elseif x2 <= n5 then
											if x2 - v6 > 0 then
												v6 = x2
											end
										end

										TweenService:Create(clone3.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), { Size = UDim2.new(0, n5 - clone3.Main.AbsolutePosition.X, 1, 0) }):Play()
										local floor = math.floor
										local n6 = (arg7.Range[1] + (x2 - clone3.Main.AbsolutePosition.X) / clone3.Main.AbsoluteSize.X * (arg7.Range[2] - arg7.Range[1])) / arg7.Increment + 0.5
										local n7 = 13
										local currentValue = math.clamp(floor(n6) * arg7.Increment * 10000000 / 10000000, arg7.Range[1], arg7.Range[2])

										if not arg7.Suffix then
											clone3.Main.Information.Text = tostring(currentValue)
											local lrotate = bit32.lrotate
											local flag12 = string.byte("?", 1, nil) <= 3
											local n8 = lrotate(225, 6) - 14387
										else
											local str = " " .. arg7.Suffix
											clone3.Main.Information.Text = tostring(currentValue) .. str
										end

										if arg7.CurrentValue ~= currentValue then
											local ok, result = pcall(function()
												arg7.Callback(currentValue)
											end)

											if not ok then
												TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
												TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
												clone3.Title.Text = "Callback Error"
												print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
												warn("Check docs.sirius.menu for help with Rayfield specific development.")
												task.wait(0.5)
												clone3.Title.Text = arg7.Name
												local tbl3 = { BackgroundColor3 = default.ElementBackground }
												TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
												TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
											end

											arg7.CurrentValue = currentValue

											if not arg7.Ext then
												fn10()
											end
										end
									end
								end)
							end)

							arg7.Set = function(arg8, arg9)
								local countrz = bit32.countrz
								local bnot = bit32.bnot
								local v6 = 12
								local v7 = bnot(v6)
								local n5 = countrz(v7) + 3
								local currentValue = math.clamp(arg9, arg7.Range[1], arg7.Range[2])

								TweenService:Create(clone3.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
									Size = UDim2.new(0, clone3.Main.AbsoluteSize.X * (currentValue + arg7.Range[1]) / (arg7.Range[2] - arg7.Range[1]) > 5 and clone3.Main.AbsoluteSize.X * currentValue / (arg7.Range[2] - arg7.Range[1]) or 5, 1, 0),
								}):Play()

								clone3.Main.Information.Text = tostring(currentValue) .. " " .. (arg7.Suffix or "")

								local ok, result = pcall(function()
									arg7.Callback(currentValue)
								end)

								if not ok then
									TweenService:Create(clone3, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { BackgroundColor3 = Color3.fromRGB(85, 0, 0) }):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 1 }):Play()
									clone3.Title.Text = "Callback Error"
									print("Rayfield | " .. arg7.Name .. " Callback Error " .. tostring(result))
									warn("Check docs.sirius.menu for help with Rayfield specific development.")
									task.wait(0.5)
									clone3.Title.Text = arg7.Name
									local TweenService4 = TweenService
									local create3 = TweenService.Create
									local clone4 = clone3
									local tweenInfo3 = TweenInfo.new
									local n6 = 11
									local tbl3 = { BackgroundColor3 = default.ElementBackground }
									create3(TweenService4, clone4, tweenInfo3(0.6, Enum.EasingStyle.Exponential), tbl3):Play()
									TweenService:Create(clone3.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { Transparency = 0 }):Play()
								end

								arg7.CurrentValue = currentValue

								if not arg7.Ext then
									fn10()
								end
							end

							if not (not arg2.ConfigurationSaving or not arg2.ConfigurationSaving.Enabled or not arg7.Flag) then
								tbl.Flags[arg7.Flag] = arg7
							end

							screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
								if default ~= tbl.Theme.Default then
									clone3.Main.Shadow.Visible = false
								end

								clone3.Main.BackgroundColor3 = default.SliderBackground
								clone3.Main.UIStroke.Color = default.SliderStroke
								clone3.Main.Progress.UIStroke.Color = default.SliderStroke
								clone3.Main.Progress.BackgroundColor3 = default.SliderProgress
							end)

							return arg7
						end,
					}

					screenGui2.Main:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
						clone.UIStroke.Color = default.TabStroke

						if elements.UIPageLayout.CurrentPage == clone2 then
							clone.BackgroundColor3 = default.TabBackgroundSelected
							clone.Image.ImageColor3 = default.SelectedTabTextColor
							clone.Title.TextColor3 = default.SelectedTabTextColor
						else
							clone.BackgroundColor3 = default.TabBackground
							clone.Image.ImageColor3 = default.TabTextColor
							clone.Title.TextColor3 = default.TabTextColor
						end
					end)

					return tbl3
				end }

				do
    local TweenInfoType = TweenInfo
    local UDim2Type = UDim2
    local tweenService = TweenService
    local easingStyle = Enum.EasingStyle.Exponential

    local function tween(object, duration, properties, direction)
        local animation = tweenService:Create(
            object,
            TweenInfoType.new(duration, easingStyle, direction or Enum.EasingDirection.Out),
            properties
        )
        animation:Play()
        return animation
    end

    elements.Visible = true
    task.wait(1.1)

    tween(main, 0.7, {
        Size = UDim2Type.new(0, 390, 0, 90),
    }, Enum.EasingDirection.InOut)

    task.wait(0.3)

    tween(loadingFrame.Title, 0.2, { TextTransparency = 1 })
    tween(loadingFrame.Subtitle, 0.2, { TextTransparency = 1 })
    tween(loadingFrame.Version, 0.2, { TextTransparency = 1 })

    task.wait(0.1)

    tween(main, 0.6, {
        Size = flag3 and UDim2Type.new(0, 500, 0, 275) or UDim2Type.new(0, 500, 0, 475),
    })
    tween(main.Shadow.Image, 0.5, { ImageTransparency = 0.6 })

    topbar.BackgroundTransparency = 1
    topbar.Divider.Size = UDim2Type.new(0, 0, 0, 1)
    topbar.Divider.BackgroundColor3 = default.ElementStroke
    topbar.CornerRepair.BackgroundTransparency = 1
    topbar.Title.TextTransparency = 1
    topbar.Search.ImageTransparency = 1
    topbar.ChangeSize.ImageTransparency = 1
    topbar.Hide.ImageTransparency = 1

    task.wait(0.5)

    topbar.Visible = true
    tween(topbar, 0.7, { BackgroundTransparency = 0 })
    tween(topbar.CornerRepair, 0.7, { BackgroundTransparency = 0 })

    task.wait(0.1)

    tween(topbar.Divider, 1, { Size = UDim2Type.new(1, 0, 0, 1) })
    tween(topbar.Title, 0.6, { TextTransparency = 0 })

    task.wait(0.05)
    tween(topbar.Search, 0.6, { ImageTransparency = 0.8 })

    task.wait(0.05)
    tween(topbar.ChangeSize, 0.6, { ImageTransparency = 0.8 })

    task.wait(0.05)
    tween(topbar.Hide, 0.6, { ImageTransparency = 0.8 })

    task.wait(0.3)

    if drag and upv9 then
        tween(upv9, 0.6, { BackgroundTransparency = 0.7 })
    end
end


				tbl3.ModifyTheme = function(arg3)
					if not pcall(fn3, arg3) then
						tbl:Notify({
							Title = "Unable to Change Theme",
							Content = "We are unable find a theme on file.",
							Image = 4400704299,
						})
					else
						tbl:Notify({
							Title = "Theme Changed",
							Content = "Successfully changed theme to " .. (typeof(arg3) == "string" and arg3 or "Custom Theme") .. ".",
							Image = 4483362748,
						})
					end
				end

				return tbl3
			end

			local function fn17(arg, arg2)
				if not flag7 then
					if not arg then
						flag6 = true
						fn13(arg2)
					else
						flag6 = false
						fn15()
					end

					return
				end
			end

			tbl.SetVisibility = function(arg, arg2)
				fn17(arg2, false)
			end

			tbl.IsVisible = function()
				return not flag6
			end

			local connection = nil

			tbl.Destroy = function()
				flag2 = true
				connection:Disconnect()
				screenGui2:Destroy()
			end

			topbar.ChangeSize.MouseButton1Click:Connect(function()
				if not flag7 then
					if not flag5 then
						flag5 = true
						fn16()
					else
						flag5 = false
						fn14()
					end

					return
				end
			end)

			local input = main.Search.Input
			local n = 85

			input:GetPropertyChangedSignal("Text"):Connect(function()
				if not (#main.Search.Input.Text > 0) then
					local searchTitleFsefsefesfsefesfesfTh = elements.UIPageLayout.CurrentPage:FindFirstChild("SearchTitle-fsefsefesfsefesfesfThanks")

					if searchTitleFsefsefesfsefesfesfTh then
						local n2 = bit32.countlz(string.byte("\180\177m{", 2, nil) + 156) - 10
						searchTitleFsefsefesfsefesfesfTh:Destroy()
					end
				elseif not elements.UIPageLayout.CurrentPage:FindFirstChild("SearchTitle-fsefsefesfsefesfesfThanks") then
					local clone = elements.Template.SectionTitle:Clone()
					clone.Parent = elements.UIPageLayout.CurrentPage
					clone.Name = "SearchTitle-fsefsefesfsefesfesfThanks"
					clone.LayoutOrder = -100
					clone.Title.Text = "Results from '" .. elements.UIPageLayout.CurrentPage.Name .. "'"
					clone.Visible = true
				end

				for _, child in ipairs(elements.UIPageLayout.CurrentPage:GetChildren()) do
					if child.ClassName ~= "UIListLayout" and child.Name ~= "Placeholder" and child.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
						if child.Name ~= "SectionTitle" then
							if not string.lower(child.Name):find(string.lower(main.Search.Input.Text), 1, true) then
								child.Visible = false
							else
								child.Visible = true
							end
						elseif #main.Search.Input.Text ~= 0 then
							child.Visible = false
						else
							child.Visible = true
						end
					end
				end
			end)

			main.Search.Input.FocusLost:Connect(function()
				if not (#main.Search.Input.Text ~= 0 or not flag8) then
					task.wait(0.12)
					fn12()
				end
			end)

			topbar.Search.MouseButton1Click:Connect(function()
				task.spawn(function()
					if not flag8 then
						fn11()
					else
						fn12()
					end
				end)
			end)

			topbar.Hide.MouseButton1Click:Connect(function()
				fn17(flag6, not flag3)
			end)

			connection = UserInputService2.InputBegan:Connect(function(input2, gameProcessed)
				if not gameProcessed then
					if input2.KeyCode == Enum.KeyCode.M then
						if flag7 then
							return
						end

						if not flag6 then
							flag6 = true
							fn13()
						else
							flag6 = false
							fn15()
						end
					end

					return
				end
			end)

			if prompt then
				prompt.Interact.MouseButton1Click:Connect(function()
					if not flag7 then
						if flag6 then
							flag6 = false
							fn15()
						end

						return
					end
				end)
			end

			for _, child in ipairs(topbar:GetChildren()) do
				if child.ClassName == "ImageButton" then
					if child.Name ~= "Icon" then
						child.MouseEnter:Connect(function()
							TweenService:Create(child, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0 }):Play()
						end)

						child.MouseLeave:Connect(function()
							TweenService:Create(child, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), { ImageTransparency = 0.8 }):Play()
						end)
					end
				end
			end

			tbl.LoadConfiguration = function()
				if flag4 then
					local v6 = nil
					local v7 = nil

					local ok, result = pcall(function()
						local folderPath = type(callback) == "function" and callback() or callback

if isfile(folderPath .. "/" .. fileName .. ".rfld") then
							v7 = fn9(readfile(callback .. "/" .. fileName .. ".rfld"))
						end
					end)

					if not ok or not v7 then
						if not ok and not v6 then
							warn("Rayfield Configurations Error | " .. tostring(result))

							tbl:Notify({
								Title = "Configuration",
								Content = [[We've encountered an issue loading your configuration correctly.

Check the Developer Console for more information.]],
								Image = 4384402990,
							})
						end
					elseif not v6 then
						tbl:Notify({
							Title = "Configuration",
							Content = "The configuration file for this script has been loaded from a previous session.",
							Image = 4384403532,
						})
					elseif not ok and not v6 then
						warn("Rayfield Configurations Error | " .. tostring(result))

						tbl:Notify({
							Title = "Configuration",
							Content = [[We've encountered an issue loading your configuration correctly.

Check the Developer Console for more information.]],
							Image = 4384402990,
						})
					end
				end

				flag = true
			end

			v4 = tbl
			tbl2 = {}
			local n2 = 1
			tbl2.Connections = {}
			tbl2.Coroutines = {}
			tbl2.GuiObjects = {}
			tbl2.GuiObjects.PlayerListDropdowns = {}
			tbl2.PlayerList = {}
			tbl2.Remotes = {}
			tbl2.LoggedList = {}
			tbl2.KickedQueue = {}
			tbl2.PlayersPlots = {}

			tbl2.Parts = {
				NetOwned = {},
				Mode = { Orbit = {}, Freeze = {}, Noclip = {} },
				Types = { PoisonHurtParts = {}, ExtinguishPart = nil },
			}

			tbl2.LocalDecoys = {}
			tbl2.Decoys = {}
			tbl2.Bombs = {}
			tbl2.Food = {}
			tbl2.StickyWelds = {}
			local tableAddon = {}

			local function frequency(arg)
				local tbl3 = {}
				local n3 = 0
				local v6 = nil

				for _, value in ipairs(arg) do
					tbl3[value] = (tbl3[value] or 0) + 1

					if n3 < tbl3[value] then
						n3 = tbl3[value]
						v6 = value
					end
				end

				return v6
			end

			local countlz = bit32.countlz
			local byte = 103
			local flag9 = countlz(byte) <= 300
			tableAddon.Frequency = frequency

			tableAddon.Reverse = function(arg)
				local tbl3 = {}

				for k, v6 in arg do
					tbl3[v6] = k
				end

				return tbl3
			end

			tableAddon.Length = function(arg)
				local n3 = 0

				for k in arg do
					n3 += 1
				end

				return n3
			end

			tbl2.TableAddon = tableAddon
			tbl2.ClientManager = {}
			tbl2.RemotesManager = {}
			tbl2.PlayerListManager = {}
			tbl2.AutoSpawnManager = {}
			tbl2.AuraManager = {}
			tbl2.BlobmanManager = {}
			tbl2.PossessionManager = {}
			tbl2.ToysManager = {}
			tbl2.PlotsManager = {}
			tbl2.BombsManager = {}
			tbl2.NetworkOwnership = {}
			callback = 75.680954
			local plotLocations = { Plot1 = Vector3.new(-539.954468, -7.35040379, callback) }
			callback = -151.618271
			local vector = Vector3.new(-486.261566, -7.35040379, callback)
			local flag10 = true
			plotLocations.Plot2 = vector
			callback = 443.769653
			plotLocations.Plot3 = Vector3.new(270.787781, -7.35040283, callback)
			local vector3 = Vector3.new
			callback = -356.375824
			local n3 = 85
			plotLocations.Plot4 = vector3(506.711334, 83.4617462, callback)
			callback = -91.2234955
			plotLocations.Plot5 = Vector3.new(550.806152, 124.138618, callback)
			tbl2.PlotLocations = plotLocations

			tbl2.Animations = {
				Crouch = 6980229055,
				Thrown = 7047322890,
				Hold = 9430230452,
				SlowWalk = 180435571,
				Lay = 282574440,
			}

			callback = "fly"
			flag = "uwu"
			flag2 = "tehe"
			flag3 = "banana"
			fileName = "one"
			flag4 = "oof"
			flag5 = "soda"
			flag6 = "three"
			flag7 = "two"
			flag8 = "yeehaw"

			tbl2.SoundWords = {
				"ew",
				"yay",
				"hooray",
				callback,
				"grr",
				"gun",
				"hm",
				"kick",
				"mommy",
				"mountain",
				"ooo",
				"ree",
				"sh",
				flag,
				flag2,
				"ahh",
				flag3,
				"bird",
				"cough",
				"cry",
				"daddy",
				"five",
				"four",
				"grab",
				"hi",
				"lick",
				"xd",
				"ahem",
				"om",
				fileName,
				flag4,
				flag5,
				flag6,
				flag7,
				flag8,
				"_",
			}
		end

		tbl2.BombToys = {
			BallSnowball = { Hitbox = "SoundPart", NetworkablePart = "SoundPart" },
			BombBalloon = { Hitbox = "Balloon", NetworkablePart = "Balloon" },
			BombDarkMatter = { Hitbox = "PartHitDetector", NetworkablePart = "Pyramid" },
			BombMissile = { Hitbox = "PartHitDetector", NetworkablePart = "Body" },
			FireworkMissile = { Hitbox = "PartHitDetector", NetworkablePart = "Hitbox" },
			PresentBig = { Hitbox = "Box", NetworkablePart = "Box" },
			PresentSmall = { Hitbox = "Box", NetworkablePart = "Box" },
		}

		tbl2.EffectToys = {
			Banana = { Toy = "FoodBanana", Hitbox = "BananaPeel" },
			Fire = { Toy = "Campfire", Hitbox = "FirePlayerPart" },
			Spray = { Toy = "SprayCanWD", Hitbox = "StickyRemoverPart" },
			Radiation = { Toy = "OvenMicrowaveWhite", Hitbox = "PaintPlayerPart" },
		}

		tbl2.PaintToys = {
			BucketPaint = { PaintPlayerPart = 6 },
			ToiletWhite = { PaintPlayerPart = 5 },
			ToiletGold = { PaintPlayerPart = 5 },
			FoodHotSauce = { PaintPlayerPart = 5, FirePlayerPart = 5 },
		}

		tbl2.Cleanup = {
			Disconnect = function(arg)
				if tbl2.Connections[arg] then
					tbl2.Connections[arg]:Disconnect()
					tbl2.Connections[arg] = nil
				end
			end,
			Close = function(arg)
				local v5 = tbl2.Coroutines[arg]

				if v5 then
					tbl2.coroutine_kill(v5)
					tbl2.Coroutines[arg] = nil
				end
			end,
		}

		tbl2.RemotesManager.Faked = {}

		tbl2.RemotesManager.Fake = function(arg, arg2)
			if not arg then
				return
			end

			if not arg2 then
				local v5 = tbl2.RemotesManager.Faked[arg]
				if not v5 then
					return
				end
				arg.Parent = v5.Parent
				tbl2.RemotesManager.Faked[arg]:Destroy()
				tbl2.RemotesManager.Faked[arg] = nil
			else
				local clone = arg:Clone()
				clone.Parent = arg.Parent
				arg.Parent = nil
				tbl2.RemotesManager.Faked[arg] = clone
			end
		end

		for _, v5 in ReplicatedStorage:GetDescendants() do
			callback = v5

			if not (not v5.IsA(callback, "RemoteEvent") and not v5:IsA("RemoteFunction")) then
				callback = v5.Name
				tbl2.Remotes[callback] = v5
			end
		end

		local tbl3 = {
			Grab = {
				Mode = {},
				Throw = { Toggle = false, Power = 800, Time = 1 },
				Extend = { Toggle = false, Distance = 40, Multiplier = 3 },
			},
			Defense = {
				AntiGrab = false,
				AntiFling = false,
				AntiBlobman = false,
				AntiGrabGucci = false,
				Invisibility = false,
				AntiGrabNoRagdoll = false,
				AntiRagdoll = false,
				AntiThrow = false,
				AntiNetworkOwnership = false,
				AntiKick = false,
				AntiLoop = false,
				AntiLagLine = false,
				AntiBanana = false,
				AntiExplosion = false,
				AntiPaint = false,
				AntiPoison = false,
				AntiStick = false,
				AntiVoid = false,
				AntiBurn = false,
				AntiAttacker = { Toggle = false, GrabMode = "Kill" },
				OceanWalk = false,
				SitLock = false,
				ExplodeBombs = false,
				AntiAFK = true,
			},
		}

		do
			local loop = {}
			local n = 31
			loop.Targets = {}
			loop.Toggle = false
			loop.GrabMode = "Kill"
			tbl3.Loop = loop
		end

		tbl3.Blobman = {
			Loop = {
				Targets = {},
				Method = "Kick",
				IgnorePlots = true,
				Toggle = { All = false, Targets = false },
			},
			Control = { AutoSit = false, AntiFling = false, FlyMode = { Toggle = false, Speed = 10 } },
			MethodSettings = { WalkSpeed = 16, JumpPower = 30, HipHeight = 0 },
			Manual = { Toggle = false, AutoUpdate = true, Method = "WalkSpeed" },
			Auras = { Toggle = false, Method = "Kill" },
		}

		tbl3.Lag = { Lines = { Toggle = false, Amount = 500 }, Shuriken = {} }

		tbl3.Decoys = {
			Toggle = false,
			Target = nil,
			Follow = false,
			Jump = false,
			Speed = 16,
			JumpPower = 50,
			Teleport = false,
			Fling = false,
		}

		tbl3.Bombs = { Target = nil, Loop = false, Delay = 0 }
		tbl3.Auras = { Player = {}, Other = {} }

		tbl3.CustomWhitelist = {
			Whitelist = { Toggle = true, List = {} },
			FriendList = { Toggle = true, List = {} },
			ImmunityList = {
				Toggle = true,
				List = {
					[7241922128] = true,
					[7209574321] = true,
					[2389077862] = true,
					[506523325] = true,
				},
			},
			AdminList = {
				Toggle = true,
				List = {
					[7241922128] = true,
					[7209574321] = true,
					[506523325] = true,
					[3889852487] = true,
					[2389077862] = true,
					[9136503085] = true,
					[8077610134] = true,
				},
			},
		}

		tbl3.Visual = { Map = { Colors = {} }, Graphics = { Preset = "Cartoon" } }
		callback = 0

		do
			local esp = {
				Character = {
					Toggle = false,
					Color = Color3.fromRGB(callback, 255, 0),
					Transparency = 0,
					Avatars = false,
					Usernames = false,
					Distances = false,
				},
			}

			callback = 0
			callback = 0

			local pcld = {
				Toggle = false,
				Self = false,
				Color3 = Color3.fromRGB(callback, 0, 0),
				SurfaceColor3 = Color3.fromRGB(callback, 0, 0),
			}

			local n = 69
			pcld.Transparency = 0
			pcld.SurfaceTransparency = 0.5
			pcld.LineThickness = 0.1
			pcld.Tracers = false
			esp.PCLD = pcld
			tbl3.ESP = esp
		end

		tbl3.Saver = { Theme = {}, BuiltInTheme = "Tokra" }

		tbl3.Misc = {
			Auto = { PlotSaver = true, AutoFarm = true },
			Wings = { Toggle = false, FlyMode = false, Speed = 5, Angle = 30, Segments = 4 },
		}

		tbl3.Secret = getgenv().TokraSecret or {}
		callback = 250; callback = 8; callback = 12; callback = 3
		callback = 20; callback = 230; callback = 10

		do
			local tokraTheme = {
				{ Name = "TextColor", Value = Color3.fromRGB(callback, 250, 250) },
				{ Name = "Background", Value = Color3.fromRGB(callback, 8, 8) },
				{ Name = "Topbar", Value = Color3.fromRGB(callback, 12, 12) },
				{ Name = "Shadow", Value = Color3.fromRGB(callback, 3, 3) },
				{ Name = "NotificationBackground", Value = Color3.fromRGB(callback, 20, 20) },
				{ Name = "NotificationActionsBackground", Value = Color3.fromRGB(callback, 230, 230) },
				{ Name = "TabBackground", Value = Color3.fromRGB(callback, 10, 10) },
			}

			callback = 4
			tokraTheme[8] = { Name = "TabStroke", Value = Color3.fromRGB(callback, 4, 4) }
			callback = 255
			tokraTheme[9] = { Name = "TabBackgroundSelected", Value = Color3.fromRGB(callback, 255, 255) }
			callback = 225
			tokraTheme[10] = { Name = "TabTextColor", Value = Color3.fromRGB(callback, 225, 225) }
			callback = 10
			tokraTheme[11] = { Name = "SelectedTabTextColor", Value = Color3.fromRGB(callback, 10, 10) }
			callback = 10
			tokraTheme[12] = { Name = "ElementBackground", Value = Color3.fromRGB(callback, 10, 10) }
			callback = 40
			tokraTheme[13] = { Name = "ElementBackgroundHover", Value = Color3.fromRGB(callback, 40, 40) }
			callback = 7
			tokraTheme[14] = { Name = "SecondaryElementBackground", Value = Color3.fromRGB(callback, 7, 7) }
			callback = 4
			tokraTheme[15] = { Name = "ElementStroke", Value = Color3.fromRGB(callback, 4, 4) }
			callback = 4
			tokraTheme[16] = { Name = "SecondaryElementStroke", Value = Color3.fromRGB(callback, 4, 4) }
			callback = 78
			tokraTheme[17] = { Name = "SliderBackground", Value = Color3.fromRGB(callback, 78, 78) }
			callback = 125
			tokraTheme[18] = { Name = "SliderProgress", Value = Color3.fromRGB(callback, 125, 125) }
			callback = 40
			tokraTheme[19] = { Name = "SliderStroke", Value = Color3.fromRGB(callback, 40, 40) }
			callback = 30
			tokraTheme[20] = { Name = "ToggleBackground", Value = Color3.fromRGB(callback, 30, 30) }
			callback = 255
			tokraTheme[21] = { Name = "ToggleEnabled", Value = Color3.fromRGB(callback, 255, 255) }
			callback = 100
			tokraTheme[22] = { Name = "ToggleDisabled", Value = Color3.fromRGB(callback, 100, 100) }
			callback = 255
			tokraTheme[23] = { Name = "ToggleEnabledStroke", Value = Color3.fromRGB(callback, 255, 255) }
			callback = 78
			tokraTheme[24] = { Name = "ToggleDisabledStroke", Value = Color3.fromRGB(callback, 78, 78) }
			callback = 15
			tokraTheme[25] = { Name = "ToggleEnabledOuterStroke", Value = Color3.fromRGB(callback, 15, 15) }
			callback = 15
			tokraTheme[26] = { Name = "ToggleDisabledOuterStroke", Value = Color3.fromRGB(callback, 15, 15) }
			callback = 100
			tokraTheme[27] = { Name = "DropdownSelected", Value = Color3.fromRGB(callback, 100, 100) }
			callback = 10
			tokraTheme[28] = { Name = "DropdownUnselected", Value = Color3.fromRGB(callback, 10, 10) }
			callback = 12
			tokraTheme[29] = { Name = "InputBackground", Value = Color3.fromRGB(callback, 12, 12) }
			local tbl4 = { Name = "InputStroke" }
			local n = 34
			callback = 65
			tbl4.Value = Color3.fromRGB(callback, 65, 65)
			tokraTheme[30] = tbl4
			callback = 150
			tokraTheme[31] = { Name = "PlaceholderColor", Value = Color3.fromRGB(callback, 150, 150) }
			tbl2.TokraTheme = tokraTheme
		end

		do
			local theme2 = v4.Theme
			callback = 255; callback = 15; callback = 33; callback = 15
			callback = 15; callback = 255; callback = 48; callback = 50

			local wexort = {
				TextColor = Color3.fromRGB(callback, 232, 235),
				Background = Color3.fromRGB(callback, 15, 15),
				Topbar = Color3.fromRGB(callback, 28, 28),
				Shadow = Color3.fromRGB(callback, 15, 15),
				NotificationBackground = Color3.fromRGB(callback, 15, 15),
				NotificationActionsBackground = Color3.fromRGB(callback, 232, 235),
				TabBackground = Color3.fromRGB(callback, 41, 41),
				TabStroke = Color3.fromRGB(callback, 43, 43),
			}

			callback = 255
			wexort.TabBackgroundSelected = Color3.fromRGB(callback, 51, 58)
			callback = 255
			wexort.TabTextColor = Color3.fromRGB(callback, 232, 235)
			callback = 33
			wexort.SelectedTabTextColor = Color3.fromRGB(callback, 28, 28)
			callback = 33
			wexort.ElementBackground = Color3.fromRGB(callback, 28, 28)
			callback = 40
			wexort.ElementBackgroundHover = Color3.fromRGB(callback, 35, 35)
			callback = 15
			wexort.SecondaryElementBackground = Color3.fromRGB(callback, 15, 15)
			callback = 48
			wexort.ElementStroke = Color3.fromRGB(callback, 41, 41)
			callback = 40
			wexort.SecondaryElementStroke = Color3.fromRGB(callback, 35, 35)
			callback = 48
			wexort.SliderBackground = Color3.fromRGB(callback, 41, 41)
			callback = 255
			wexort.SliderProgress = Color3.fromRGB(callback, 51, 58)
			callback = 255
			wexort.SliderStroke = Color3.fromRGB(callback, 51, 58)
			callback = 33
			wexort.ToggleBackground = Color3.fromRGB(callback, 28, 28)
			callback = 255
			wexort.ToggleEnabled = Color3.fromRGB(callback, 51, 58)
			callback = 48
			wexort.ToggleDisabled = Color3.fromRGB(callback, 41, 41)
			callback = 255
			wexort.ToggleEnabledStroke = Color3.fromRGB(callback, 51, 58)
			callback = 60
			wexort.ToggleDisabledStroke = Color3.fromRGB(callback, 55, 55)
			callback = 48
			wexort.ToggleEnabledOuterStroke = Color3.fromRGB(callback, 41, 41)
			callback = 40
			wexort.ToggleDisabledOuterStroke = Color3.fromRGB(callback, 35, 35)
			callback = 40
			wexort.DropdownSelected = Color3.fromRGB(callback, 35, 35)
			callback = 33
			wexort.DropdownUnselected = Color3.fromRGB(callback, 28, 28)
			local Color3 = Color3
			local n = 36
			callback = 33
			wexort.InputBackground = Color3.fromRGB(callback, 28, 28)
			callback = 48
			wexort.InputStroke = Color3.fromRGB(callback, 41, 41)
			callback = 150
			wexort.PlaceholderColor = Color3.fromRGB(callback, 150, 150)
			theme2.Wexort = wexort
		end

		local theme2 = {}
		callback = nil

		for _, v5 in tbl2.TokraTheme, nil, callback do
			theme2[v5.Name] = v5.Value
		end

		tbl3.Saver.Theme = theme2
		v4.Theme.Tokra = tbl3.Saver.Theme

		callback = {
			Name = "Tokra Script v1.2",
			Icon = 0,
			LoadingTitle = "Tokra Script",
			LoadingSubtitle = "by VF_Owner",
			Theme = v4.Theme.Tokra,
			ToggleUIKeybind = "M",
			ConfigurationSaving = { Enabled = true, FolderName = "TokraScript", FileName = "Tokra_FlingThingsAndPeople" },
			Discord = { Enabled = false, Invite = "tokrascript", RememberJoins = true },
		}

		tbl2.GuiObjects.Window = v4:CreateWindow(callback)
		tbl2.BlobmanManager.Controllers = {}

		tbl2.BlobmanManager.Setup = function(arg)
			local humanoidCreature = arg and arg:WaitForChild("HumanoidCreature", 3)
			local humanoidRootPart2 = humanoidCreature and arg:WaitForChild("HumanoidRootPart", 3)
			local vehicleSeat = humanoidRootPart2 and arg:WaitForChild("VehicleSeat", 3)
			local vehicleSeat2 = vehicleSeat

			if vehicleSeat2 then
				local n = 5
				vehicleSeat2 = arg:WaitForChild("BlobmanSeatAndOwnerScript", 3)
			end

			if not vehicleSeat2 then
				return
			end

			local tbl4 = {
				Model = arg,
				Humanoid = humanoidCreature,
				Root = humanoidRootPart2,
				Seat = vehicleSeat,
				CreatureActions = {},
				Detectors = {},
				Welds = {},
			}

			for _, v5 in { "Grab", "Drop", "Release" } do
				tbl4.CreatureActions[v5] = vehicleSeat2:WaitForChild("Creature" .. v5, 3)
			end

			for _, v5 in { "Left", "Right" } do
				tbl4.Detectors[v5] = arg:WaitForChild(v5 .. "Detector", 3)
			end

			for k, v5 in tbl4.Detectors do
				local n = 59
				tbl4.Welds[k] = v5:WaitForChild(k .. "Weld")
			end

			tbl4.Grab = function(arg2, arg3, arg4)
				tbl4.CreatureActions.Grab:FireServer(tbl4.Detectors[arg2], arg3, tbl4.Welds[arg2])

				if arg4 then
					local rootAttachment = arg3:FindFirstChild("RootAttachment")

					if not (not rootAttachment or not tbl2.WaitProperty(tbl4.Welds[arg2], "Attachment0", rootAttachment, 1)) then
						arg4()
					end
				end
			end

			tbl4.Drop = function(arg2)
				tbl4.CreatureActions.Drop:FireServer(tbl4.Welds[arg2])
			end

			tbl4.Release = function(arg2)
				tbl4.CreatureActions.Release:FireServer(tbl4.Welds[arg2])
			end

			tbl4.GetGrabbedRoot = function(arg2)
				local attachment0 = tbl4.Welds[arg2].Attachment0
				if not attachment0 then
					return
				end
				return attachment0.Parent
			end

			if not arg:IsDescendantOf(workspace) then
				return
			end
			tbl2.BlobmanManager.Controllers[arg] = tbl4
			return tbl4
		end

		tbl2.BlobmanManager.GetController = function(arg)
			local player = arg or localPlayer
			local character2 = player and player.Character
			local humanoid2 = character2 and character2:FindFirstChildWhichIsA("Humanoid")
			local seatPart = humanoid2 and humanoid2.SeatPart
			local model = seatPart and seatPart:FindFirstAncestorWhichIsA("Model")
			return model and model.Name == "CreatureBlobman" and tbl2.BlobmanManager.Controllers[model]
		end

		tbl2.BlobmanManager.ApplyMethod = {
			Kick = function(arg, character2)
				local humanoidRootPart2 = character2.HumanoidRootPart
				local humanoid2 = character2.Humanoid

				tbl2.NetworkOwnership.SetNetworkOwner(humanoidRootPart2, function()
					tbl2.NetworkOwnership.LoseNetworkOwner(humanoidRootPart2)
					tbl2.NetworkOwnership.StopVelocity(humanoidRootPart2, 2)
					humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.CFrame.Position + Vector3.new(0, 50, 0))
					humanoid2.Sit = false
					arg.Grab("Left", humanoidRootPart2)
					task.wait()
					arg.Grab("Left", humanoidRootPart)
					task.wait()
				end)
			end,
			Kill = function(arg, character2)
				local humanoid2 = character2.Humanoid
				tbl2.BlobmanManager.ApplyMethod.NetOwn(arg, character2)
				task.spawn(tbl2.NetworkOwnership.SafeKill, humanoid2)
			end,
			Void = function(arg, character2)
				tbl2.BlobmanManager.ApplyMethod.NetOwn(arg, character2)
				tbl2.ModifyDescendants(character2.Model, { BasePart = { CanCollide = false, CanTouch = false } })
				task.spawn(tbl2.ApplyGrabMode, nil, character2.HumanoidRootPart, "Void", true)
			end,
			Fling = function(arg, character2)
				arg.Grab("Left", character2.HumanoidRootPart)
				task.wait()
				arg.Grab("Left", humanoidRootPart)
			end,
			NetOwn = function(arg, character2)
				local humanoidRootPart2 = character2.HumanoidRootPart
				arg.Grab("Right", humanoidRootPart2)
				arg.Grab("Right", humanoidRootPart)
				task.wait(0.1)
				arg.Release("Right")
				arg.Grab("Left", humanoidRootPart2)
				task.wait(0.1)
				arg.Drop("Left")
			end,
		}

		tbl2.ClientManager.OnGrab = {}

		do
			local clientManager = tbl2.ClientManager
			local n = 30
			clientManager.UpdateOldBlobman = {}
		end

		tbl2.ClientManager.UpdateNewBlobman = {}

		tbl2.ClientManager.SendMessage = function(arg)
			if not arg or typeof(arg) ~= "string" then
				return
			end
			rbxGeneral:SendAsync(arg)
		end

		tbl2.ClientManager.UpdateSeatPart = function()
			local v5 = v2
			v2 = tbl2.BlobmanManager.GetController()

			for _, v6 in tbl2.ClientManager.UpdateNewBlobman do
				task.spawn(v6, v2)
			end

			if v5 then
				for _, v6 in tbl2.ClientManager.UpdateOldBlobman do
					task.spawn(v6, v5)
				end
			end

			tbl2.ClientManager.LastBlobmanController = v2
		end

		tbl2.ClientManager.UpdateCharacter = function()
			character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			if character.Name ~= localPlayer.Name then
				return
			end
			currentCamera = workspace.CurrentCamera
			head = character:WaitForChild("Head", 3)
			humanoid = character:WaitForChild("Humanoid", 3)
			humanoidRootPart = character:WaitForChild("HumanoidRootPart", 3)
			ragdolled = humanoid and humanoid:WaitForChild("Ragdolled", 3)
			tbl2.Cleanup.Disconnect("UpdateSeatPart")
			tbl2.Connections.UpdateSeatPart = humanoid:GetPropertyChangedSignal("SeatPart"):Connect(tbl2.ClientManager.UpdateSeatPart)
			tbl2.ClientManager.UpdateSeatPart()
		end

		tbl2.ClientManager.UpdateCharacter()
		callback = tbl2.ClientManager
		callback = callback.UpdateCharacter
		tbl2.Connections.UpdateCharacter = localPlayer.CharacterAdded:Connect(callback)

		tbl2.ClientManager.Occupy = function(arg, arg2)
			local humanoid2 = humanoid
			if not humanoid2 then
				return
			end
			local flag2 = true

			if not (not arg2 or typeof(arg2) ~= "number") then
				task.delay(arg2, function()
					flag2 = false
				end)
			end

			while not (not flag2 or not (humanoid2.Health > 0) or not humanoid2:IsDescendantOf(workspace) or not arg:IsDescendantOf(workspace)) do
				if humanoid2.SeatPart ~= arg then
					task.spawn(arg.Sit, arg, humanoid2)
					wait()
					continue
				end

				break
			end
		end

		tbl2.NetworkOwnership.IsNetworkOwned = function(arg)
			if not arg then
				return
			end

			if not arg:IsA("Model") then
				return arg.ReceiveAge == 0 and arg.CanQuery and not arg.Anchored
			end

			for _, v5 in arg:GetDescendants() do
				if not v5:IsA("BasePart") or not v5.CanQuery then
					continue
				end

				if not tbl2.NetworkOwnership.IsNetworkOwned(v5) then
					return false
				end
			end

			return true
		end

		tbl2.NetworkOwnership.GetNetworkablePart = function(arg)
			if not arg then
				return
			end
			local primaryPart = nil

			if not arg.PrimaryPart or not arg.PrimaryPart.CanQuery then
				for _, v5 in arg:GetDescendants() do
					if v5:IsA("BasePart") then
						if v5.Name ~= "Button" and not v5.Anchored then
							if v5.CanQuery then
								primaryPart = v5
								break
							end
						end
					end
				end
			else
				primaryPart = arg.PrimaryPart
			end

			return primaryPart
		end

		tbl2.PlayerListManager = {
			CharacterAdded = {},
			CharacterRemoving = {},
			Format = function(arg, arg2)
				if not arg or typeof(arg) ~= "table" then
					return
				end
				local tbl4 = {}

				for _, v5 in arg do
					local match = v5:match("%(@([^)]+)%)")
					local player = Players:FindFirstChild(match)

					if player then
						if arg2 ~= "id" then
							tbl4[player] = tbl2.PlayerList[player]
						else
							tbl4[player.UserId] = true
						end
					end
				end

				if typeof(arg2) == "number" then
					local n = 0

					for k in tbl4 do
						n += 1
						if n == arg2 then
							return k
						end
					end
				end

				return tbl4
			end,
			Pattern = function(arg)
				return arg and arg.DisplayName .. " (@" .. arg.Name .. ")"
			end,
			Setup = function(arg)
				if not arg or typeof(arg) ~= "table" then
					return
				end
				local tbl4 = {}

				for _, v5 in arg do
					tbl4[#tbl4 + 1] = tbl2.PlayerListManager.Pattern(v5)
				end

				return tbl4
			end,
			UpdatePlayerDropdowns = function()
				local tbl4 = {}
				local tbl5 = {}

				for k, v5 in tbl2.PlayerList do
					local v6 = tbl2.PlayerListManager.Pattern(k)

					if v5.IsFriend then
						tbl5[#tbl5 + 1] = v6
					end

					tbl4[#tbl4 + 1] = v6
				end

				for k in tbl2.GuiObjects.PlayerListDropdowns do
					task.spawn(tbl2.GuiObjects.PlayerListDropdowns[k].Refresh, tbl2.GuiObjects.PlayerListDropdowns[k], tbl4)
				end

				task.spawn(tbl2.GuiObjects.FriendList.Refresh, tbl2.GuiObjects.FriendList, tbl5)
				task.spawn(tbl2.GuiObjects.FriendList.Set, tbl2.GuiObjects.FriendList, tbl5)
			end,
			FriendStatus = function(arg)
				if not arg then
					return
				end
				local v5 = nil
				local userId = arg.UserId

				while arg:IsDescendantOf(Players) do
					if v5 == nil and not pcall(function()
						v5 = localPlayer:IsFriendsWith(userId)
					end) then
						wait(0.1)
						continue
					end

					break
				end

				return v5
			end,
			ImmuneStatus = function(arg)
				if arg == localPlayer then
					return true
				end

				for _, v5 in tbl3.CustomWhitelist do
					if not v5.Toggle or not v5.List[arg.UserId] then
						continue
					end
					return true
				end

				return false
			end,
			UpdateStauses = function()
				for k in tbl2.PlayerList do
					if tbl2.PlayerList[k] then
						tbl2.PlayerList[k].IsImmune = tbl2.PlayerListManager.ImmuneStatus(k)
					end
				end
			end,
			UpdateCharacter = function(arg, arg2)
				if not arg2 or not arg2:IsDescendantOf(workspace) or not tbl2.PlayerList[arg] then
					return
				end
				tbl2.Cleanup.Close("PLM_UC_" .. arg.UserId)

				tbl2.Coroutines["PLM_UC_" .. arg.UserId] = coroutine.create(function()
					tbl2.PlayerList[arg].Character = {}
					local character2 = { Model = arg2 }

					for _, v5 in { "Head", "Torso", "Humanoid", "HumanoidRootPart" } do
						character2[v5] = arg2:WaitForChild(v5, 3)
					end

					character2.Ragdolled = character2.Humanoid:WaitForChild("Ragdolled", 3)
					if not tbl2.PlayerList[arg] then
						return
					end
					tbl2.PlayerList[arg].Character = character2

					if character2.Humanoid then
						local ragdolled2 = character2.Humanoid:WaitForChild("Ragdolled", 3)

						if ragdolled2 then
							if tbl2.PlayerList[arg].Character == character2 then
								tbl2.PlayerList[arg].Character.Ragdolled = ragdolled2
							end
						end
					end
				end)

				coroutine.resume(tbl2.Coroutines["PLM_UC_" .. arg.UserId])
			end,
			Register = function(arg)
				if not arg then
					return
				end
				tbl2.PlayerListManager.Unregister(arg)

				tbl2.Coroutines["PLM_R_" .. arg.UserId] = coroutine.create(function()
					local tbl4 = {
						Values = {},
						Character = {},
						IsFriend = tbl2.PlayerListManager.FriendStatus(arg),
						IsImmune = tbl2.PlayerListManager.ImmuneStatus(arg),
						CharacterCoroutines = {},
					}

					for _, v5 in { "IsHeld", "InPlot", "InOwnedPlot" } do
						tbl4.Values[v5] = arg:WaitForChild(v5, 3)
					end

					tbl2.PlayerList[arg] = tbl4
					tbl2.PlayerListManager.UpdatePlayerDropdowns()

					tbl2.Connections["PLM_CA_" .. arg.UserId] = arg.CharacterAdded:Connect(function(character2)
						task.spawn(tbl2.PlayerListManager.UpdateCharacter, arg, character2)

						for _, v5 in tbl2.PlayerListManager.CharacterAdded do
							local thread = coroutine.create(v5)
							tbl4.CharacterCoroutines = thread
							coroutine.resume(thread, character2)
						end
					end)

					tbl2.Connections["PLM_CR_" .. arg.UserId] = arg.CharacterRemoving:Connect(function(character2)
						for k, v5 in tbl4.CharacterCoroutines do
							tbl2.coroutine_kill(v5)
							tbl4.CharacterCoroutines[k] = nil
						end

						for _, v5 in tbl2.PlayerListManager.CharacterRemoving do
							task.spawn(v5, character2)
						end
					end)

					tbl2.PlayerListManager.UpdateCharacter(arg, arg.Character)
				end)

				coroutine.resume(tbl2.Coroutines["PLM_R_" .. arg.UserId])
			end,
			Unregister = function(arg)
				if not tbl2.PlayerList[arg] then
					return
				end
				local userId = arg.UserId
				tbl2.Cleanup.Close("PLM_R_" .. userId)
				tbl2.Cleanup.Close("PLM_UC_" .. userId)
				tbl2.Cleanup.Disconnect("PLM_CA_" .. userId)
				tbl2.Cleanup.Disconnect("PLM_CR_" .. userId)
				tbl2.PlayerList[arg] = nil
				tbl2.PlayerListManager.UpdatePlayerDropdowns()
			end,
		}

		if tbl3.Secret.DisableImmunity then
			tbl2.PlayerListManager.ImmuneStatus = function(arg)
				return arg == localPlayer
			end
		end

		tbl2.ClientManager.Desync = function(cFrame)
			if not (not humanoidRootPart or not currentCamera) then
				local cFrame2 = humanoidRootPart.CFrame
				humanoidRootPart.CFrame = cFrame
				RunService.RenderStepped:Wait()
				currentCamera.CFrame = currentCamera.CFrame - humanoidRootPart.Position - cFrame2.Position
				humanoidRootPart.CFrame = cFrame2
			end
		end

		tbl2.NetworkOwnership.ActiveParts = {}

		tbl2.NetworkOwnership.SetNetworkOwner = function(arg, arg2, arg3)
			if not (not arg or not arg.CanQuery) then
				if not arg.Anchored and not tbl2.NetworkOwnership.ActiveParts[arg] then
					if humanoidRootPart then
						if not arg3 then
							tbl2.NetworkOwnership.ActiveParts[arg] = true
							local now = time()

							while time() - now <= 3 and (arg.CFrame.Position - humanoidRootPart.CFrame.Position).Magnitude <= currentReach.Value do
								if arg:IsDescendantOf(workspace) then
									tbl2.Remotes.SetNetworkOwner:FireServer(arg, tbl2.NetworkOwnership.NetownPosition(arg))
									task.wait(0.1)

									if not tbl2.NetworkOwnership.IsNetworkOwned(arg) then
										continue
									else
										tbl2.Parts.NetOwned[arg] = true

										if arg2 then
											task.spawn(arg2)
										end

										break
									end
								end

								break
							end

							local bor = bit32.bor
							local byte = 63
							local n = bor(byte) + 68
							tbl2.NetworkOwnership.ActiveParts[arg] = nil
							return true
						end

						if (arg.CFrame.Position - humanoidRootPart.CFrame.Position).Magnitude <= currentReach.Value then
							if arg:IsDescendantOf(workspace) then
								tbl2.Remotes.SetNetworkOwner:FireServer(arg, tbl2.NetworkOwnership.NetownPosition(arg))

								if arg2 then
									task.spawn(arg2)
								end

								tbl2.NetworkOwnership.ActiveParts[arg] = nil
								return false
							end
						end

						return
					end

					tbl2.NetworkOwnership.ActiveParts[arg] = nil
					return false
				end
			end
		end

		tbl2.NetworkOwnership.NetownPosition = function(arg, arg2)
			if not arg2 then
				local random = math.random
				return CFrame.new(arg.Position + Vector3.new(math.random(-5, 5), math.random(-5, 0), random(-5, 5)), arg.Position)
			end
			return CFrame.new(currentCamera.CFrame.Position, arg.CFrame.Position)
		end

		tbl2.NetworkOwnership.LoseNetworkOwner = function(arg)
			tbl2.Remotes.DestroyGrabLine:FireServer(arg)
		end

		tbl2.coroutine_kill = function(arg)
			while not pcall(coroutine.close, arg) do
				wait()
			end
		end

		tbl2.WaitProperty = function(arg, arg2, arg3, arg4)
			local now = time()

			while time() - now <= arg4 do
				if arg[arg2] == arg3 then
					return true
				end
				task.wait()
			end

			return false
		end

		tbl2.ModifyDescendants = function(arg, arg2)
			local v5

			for _, v6 in arg:GetDescendants() do
				local exitTo = nil

				for k in arg2 do
					if v6:IsA(k) then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					for k, v7 in v5 do
						pcall(function()
							v6[k] = v7
						end)
					end
				end
			end
		end

		tbl2.ClientManager.GetLimbs = function(arg)
			local arg2 = arg or localPlayer.Character
			if not arg2 then
				return {}
			end

			return {
				["Right Arm"] = arg2:FindFirstChild("Right Arm"),
				["Left Arm"] = arg2:FindFirstChild("Left Arm"),
				["Right Leg"] = arg2:FindFirstChild("Right Leg"),
				["Left Leg"] = arg2:FindFirstChild("Left Leg"),
			}
		end

		tbl2.ClientManager.GetRagdollLimbs = function(arg)
			local arg2 = arg or localPlayer.Character
			if not arg2 then
				return {}
			end
			local tbl4 = {}

			for k, v5 in tbl2.ClientManager.GetLimbs(arg2) do
				if v5 then
					tbl4[k] = v5:FindFirstChild("RagdollLimbPart")
				end
			end

			return tbl4
		end

		tbl2.NetworkOwnership.StopVelocity = function(parent, arg)
			if not parent or not parent:IsDescendantOf(workspace) then
				return
			end
			parent.AssemblyLinearVelocity = Vector3.zero
			parent.AssemblyAngularVelocity = Vector3.zero
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Name = "#StopVelocity"
			bodyVelocity.MaxForce = Vector3.new("inf", "inf", "inf")
			bodyVelocity.Velocity = Vector3.zero
			bodyVelocity.Parent = parent

			if arg then
				task.delay(arg, function()
					bodyVelocity:Destroy()
				end)
			end
		end

		tbl2.NetworkOwnership.SafeDeaths = {}

		tbl2.NetworkOwnership.SafeKill = function(arg)
			if arg then
				if not tbl2.NetworkOwnership.SafeDeaths[arg] then
					tbl2.NetworkOwnership.SafeDeaths[arg] = arg.Health
					arg.BreakJointsOnDeath = false
					arg.RequiresNeck = false
					arg.Health = 0
					arg:ChangeState(Enum.HumanoidStateType.Dead)
					task.wait(5)
					arg.Health = tbl2.NetworkOwnership.SafeDeaths[arg]
					arg.RequiresNeck = false
					arg.BreakJointsOnDeath = false
					tbl2.NetworkOwnership.SafeDeaths[arg] = nil
					return
				end
			end
		end

		tbl2.PlotsManager.GetPlotTime = function(arg)
			local arg2 = arg or localPlayer
			local v5 = arg2 and tbl2.PlayersPlots[arg2.Name]
			local display = v5 and v5.Display
			local timeRemaining = display and display:FindFirstChild("TimeRemaining")

			if not (not timeRemaining or not timeRemaining.Text) then
				if not timeRemaining.Visible then
					return 90
				end
				local match = timeRemaining.Text:match("%d+")
				if match then
					return tonumber(match)
				end
			end
		end

		tbl2.ToysManager.GetFolder = function(arg)
			local arg2 = arg or localPlayer
			if not arg2.InOwnedPlot.Value then
				return workspace:FindFirstChild(arg2.Name .. "SpawnedInToys")
			end
			local v5 = tbl2.PlayersPlots[arg2.Name]
			if not v5 then
				return
			end
			return v5.PlotItems
		end

		local v5 = tbl2.ToysManager.GetFolder()

		localPlayer:WaitForChild("InOwnedPlot"):GetPropertyChangedSignal("Value"):Connect(function()
			v5 = tbl2.ToysManager.GetFolder()
		end)

		tbl2.ToysManager.SpawnToy = function(arg, arg2)
			local v6 = v5
			local n = (humanoidRootPart or currentCamera).CFrame * CFrame.new(0, 0, 10)
			local v7 = nil
			local connection = nil

			local function fn3()
				if connection then
					connection:Disconnect()
					connection = nil
				end
			end

			task.delay(1, function()
				task.spawn(fn3)
			end)

			connection = v6.ChildAdded:Connect(function(child)
				if child.Name == arg then
					v7 = child
					task.spawn(fn3)
				end
			end)

			task.spawn(function()
				while connection do
					ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, n, Vector3.zero)
					wait(0.1)
				end
			end)

			while connection do
				task.wait()
				if not v7 then
					continue
				end
				break
			end

			if not (not v7 or not arg2) then
				task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, tbl2.NetworkOwnership.GetNetworkablePart(v7))
			end

			return v7
		end

		tbl2.ToysManager.DestroyToy = function(arg)
			if not (not arg or not arg:IsDescendantOf(workspace)) then
				tbl2.Remotes.DestroyToy:FireServer(arg)
			end
		end

		tbl2.ToysManager.HasToy = function(arg)
			return localPlayer.PlayerGui.MenuGui.Menu.TabContents.Toys.Contents:FindFirstChild(arg)
		end

		tbl2.ApplyGrabMode = function(arg, parent, arg2, arg3)
			if not arg and not parent then
				arg = workspace:WaitForChild("GrabParts", 1)
				local grabPart = arg and arg:WaitForChild("GrabPart", 3)
				local grabPart2 = grabPart

				if grabPart2 then
					local n = 13
					grabPart2 = grabPart:WaitForChild("WeldConstraint", 3)
				end

				parent = grabPart2 and grabPart2.Part1
			end

			if not (not parent or not parent.CanQuery) then
				if not parent.Anchored then
					local tbl4 = {}
					local humanoid2 = nil
					local humanoidRootPart2 = nil
					local model = parent:FindFirstAncestorWhichIsA("Model")

					if model then
						humanoid2 = model:FindFirstChildWhichIsA("Humanoid")
						humanoidRootPart2 = model:FindFirstChild("HumanoidRootPart")
					end

					local connection

					if not arg then
						task.delay(3, function()
							for _, v6 in tbl4 do
								v6:Destroy()
							end
						end)
					else
						connection = nil

						connection = arg.AncestryChanged:Connect(function()
							if not arg:IsDescendantOf(workspace) then
								connection:Disconnect()

								for _, v6 in tbl4 do
									v6:Destroy()
								end
							end
						end)
					end

					if arg2 ~= "Grab" then
						if arg2 ~= "Line" then
							if arg2 ~= "Extend" then
								if arg2 ~= "Kick" then
									if arg2 ~= "Kill" then
										if arg2 ~= "Void" then
											if arg2 ~= "Fling" then
												if arg2 ~= "Noclip" then
													if arg2 ~= "Ragdoll" then
														if arg2 ~= "Unragdollable" then
															if arg2 ~= "Spam" then
																if arg2 ~= "SoftLock" then
																	if arg2 ~= "Spin" then
																		if arg2 ~= "Crazy" then
																			if arg2 ~= "Swing" then
																				if arg2 ~= "Orbit" then
																					if arg2 ~= "Strong" then
																						if arg2 ~= "Freeze" then
																							if arg2 ~= "Unstick" then
																								if not (arg2 ~= "Invisible" or not arg) then
																									if not arg3 then
																										connection = tbl2.Remotes
																										connection = connection.CreateGrabLine
																										local connection2 = connection
																										connection = connection.FireServer
																										connection(connection2, parent, parent.CFrame)
																									else
																										connection = tbl2.Remotes
																										connection = connection.CreateGrabLine
																										local connection2 = connection
																										connection = connection.FireServer
																										connection(connection2)
																									end
																								end
																							elseif model then
																								connection = tbl2.StickyWelds

																								for k, v6 in connection do
																									local part1 = k.Part1
																									local part = part1 and part1:IsDescendantOf(model) and tbl2.NetworkOwnership.GetNetworkablePart(v6)

																									if part then
																										if (part.CFrame.Position - humanoidRootPart.CFrame.Position).Magnitude <= currentReach.Value then
																											tbl2.NetworkOwnership.SetNetworkOwner(part, function()
																												tbl2.ModifyDescendants(v6, { BasePart = { CanCollide = false, CanQuery = false, CanTouch = false, Transparency = 1 } })
																												part.AssemblyLinearVelocity = Vector3.new(0, -1000, 0)
																											end)
																										end
																									end
																								end
																							end
																						elseif not humanoid2 then
																							if model then
																								connection = tbl2.Parts
																								connection = connection.Mode
																								connection = connection.Freeze
																								connection[parent] = nil
																								connection = model.GetDescendants

																								for _, v6 in connection(model) do
																									if not (v6.Name ~= "Freeze_BP" and v6.Name ~= "Freeze_BG") then
																										v6:Destroy()
																									end
																								end
																							end

																							if not (not arg3 or not arg) then
																								repeat
																									connection = task
																									connection = connection.wait
																									connection()
																									connection = arg.IsDescendantOf
																									connection = connection(arg, workspace)
																								until not connection

																								connection = Instance
																								connection = connection.new
																								connection = connection("BodyPosition")
																								connection.Name = "Freeze_BP"
																								connection.P = 15000
																								connection.D = 200
																								connection.MaxForce = Vector3.one * math.huge
																								connection.Position = parent.Position
																								connection.Parent = parent
																								local bodyGyro = Instance.new("BodyGyro")
																								bodyGyro.Name = "Freeze_BG"
																								bodyGyro.P = 15000
																								bodyGyro.D = 200
																								bodyGyro.MaxTorque = Vector3.one * math.huge
																								bodyGyro.CFrame = parent.CFrame
																								bodyGyro.Parent = parent
																								tbl2.Parts.Mode.Freeze[parent] = 0
																							end
																						end
																					elseif arg then
																						connection = arg.WaitForChild
																						connection = connection(arg, "DragPart", 1)
																						local alignPosition = connection:WaitForChild("AlignPosition", 1)
																						local alignOrientation = connection:WaitForChild("AlignOrientation", 1)

																						if not arg3 then
																							alignPosition.MaxForce = 60000
																							alignPosition.Responsiveness = 40
																							alignOrientation.MaxTorque = 600000
																							alignOrientation.Responsiveness = 30
																						else
																							alignPosition.MaxForce = math.huge
																							alignPosition.Responsiveness = 200
																							alignOrientation.MaxTorque = math.huge
																							alignOrientation.Responsiveness = 200
																						end
																					end
																				elseif model then
																					connection = tbl2.Parts
																					connection = connection.Mode
																					connection = connection.Orbit
																					connection[parent] = nil
																					connection = model.GetDescendants

																					for _, v6 in connection(model) do
																						if not (v6.Name ~= "Orbit_BP" and v6.Name ~= "Orbit_BG") then
																							v6:Destroy()
																						end
																					end

																					if arg3 then
																						connection = Instance
																						connection = connection.new
																						connection = connection("BodyPosition")
																						connection.Name = "Orbit_BP"
																						connection.P = 10000
																						connection.D = 100
																						connection.MaxForce = Vector3.one * math.huge
																						connection.Position = parent.Position
																						connection.Parent = parent
																						local bodyGyro = Instance.new("BodyGyro")
																						bodyGyro.Name = "Orbit_BG"
																						bodyGyro.P = 10000
																						bodyGyro.D = 100
																						bodyGyro.MaxTorque = Vector3.one * math.huge
																						bodyGyro.CFrame = parent.CFrame
																						bodyGyro.Parent = parent

																						tbl2.Parts.Mode.Orbit[parent] = {
																							Position = connection,
																							Gyro = bodyGyro,
																						}

																						if not tbl2.Coroutines.Orbit then
																							tbl2.Coroutines.Orbit = coroutine.create(function()
																								local now = tick()

																								while RunService.RenderStepped:Wait() do
																									local n = 0
																									local v6 = tbl2.TableAddon.Length(tbl2.Parts.Mode.Orbit)
																									local now3 = tick()
																									local n2 = 14
																									local n3 = (now3 - now) * 2

																									for k, v7 in tbl2.Parts.Mode.Orbit do
																										if not k:IsDescendantOf(workspace) or not tbl2.NetworkOwnership.IsNetworkOwned(k) then
																											v7.Position:Destroy()
																											v7.Gyro:Destroy()
																											tbl2.Parts.Mode.Orbit[k] = nil
																										else
																											n += 1
																											local n4 = n3 + (n - 1) * 2 * math.pi / math.max(1, v6)
																											local position = humanoidRootPart.CFrame.Position
																											v7.Position.Position = position + Vector3.new(math.cos(n4) * 50, 0, math.sin(n4) * 50)
																											v7.Gyro.CFrame = CFrame.new(k.Position, position)
																										end
																									end

																									if n ~= 0 then
																										continue
																									end
																									break
																								end

																								tbl2.Cleanup.Close("Orbit")
																							end)

																							coroutine.resume(tbl2.Coroutines.Orbit)
																						end
																					end
																				end
																			elseif not (not arg3 or not arg) then
																				connection = currentCamera.CFrame
																				connection = connection.LookVector

																				local thread = coroutine.create(function()
																					while arg:IsDescendantOf(workspace) do
																						connection = currentCamera.CFrame.LookVector
																						task.wait(0.1)
																					end
																				end)

																				coroutine.resume(thread)

																				while arg:IsDescendantOf(workspace) do
																					task.wait()
																				end

																				tbl2.coroutine_kill(thread)
																				local n = (connection - currentCamera.CFrame.LookVector).Magnitude * 10
																				parent.AssemblyLinearVelocity = parent.AssemblyLinearVelocity + parent.AssemblyLinearVelocity * n
																				parent.AssemblyAngularVelocity = parent.AssemblyAngularVelocity + parent.AssemblyAngularVelocity * n
																			end
																		elseif not arg3 then
																			connection = parent.FindFirstChild
																			connection = connection(parent, "#BodyPosition")

																			if connection then
																				connection:Destroy()
																			end
																		else
																			connection = Instance
																			connection = connection.new
																			connection = connection("BodyPosition")
																			local vector = Vector3.new
																			local n = 2
																			connection.MaxForce = vector("inf", "inf", "inf")
																			connection.Parent = parent
																			tbl4[#tbl4 + 1] = connection

																			while not (not parent:IsDescendantOf(workspace) or not connection:IsDescendantOf(workspace)) do
																				local random = math.random
																				connection.Position = parent.CFrame:ToWorldSpace(CFrame.new(Vector3.new(math.random(-5, 5), math.random(-5, 5), random(-5, 5)) * 100)).Position
																				task.wait()
																			end

																			connection:Destroy()
																		end
																	elseif not arg3 then
																		connection = parent.FindFirstChild
																		connection = connection(parent, "#SpinVelocity")

																		if connection then
																			connection:Destroy()
																		end
																	else
																		connection = Instance
																		connection = connection.new
																		connection = connection("BodyAngularVelocity")
																		connection.Name = "#SpinVelocity"
																		connection.MaxTorque = Vector3.new(0, "inf", 0)
																		connection.AngularVelocity = Vector3.new(0, 25, 0)
																		connection.Parent = parent
																		tbl4[#tbl4 + 1] = connection
																	end
																else
																	connection = humanoidRootPart
																	local ragdolled2 = humanoidRootPart2 and humanoid2 and humanoid2.Health > 0 and humanoid2:FindFirstChild("Ragdolled")

																	if not (not connection or not ragdolled2) then
																		tbl2.Cleanup.Close("SoftLock")
																		tbl2.Cleanup.Disconnect("AccessoryRemoved")
																		tbl2.SoftLockTarget = nil
																		task.wait()
																		local countrz = bit32.countrz
																		local rshift = bit32.rshift
																		local value = 8
																		local value2 = 5
																		local v6 = rshift(value, value2)
																		local n = countrz(v6) + 27
																		tbl2.SoftLockTarget = model
																		local flag2 = false

																		tbl2.Connections.AccessoryRemoved = model.ChildRemoved:Connect(function(child)
																			if child:IsA("Accessory") then
																				tbl2.Cleanup.Disconnect("AccessoryRemoved")
																				flag2 = true
																			end
																		end)

																		local cFrame = humanoidRootPart2.CFrame

																		tbl2.Coroutines.SoftLock = coroutine.create(function()
																			while tbl3.Grab.Mode.SoftLock do
																				if tbl2.SoftLockTarget == model then
																					if not (not humanoidRootPart2:IsDescendantOf(workspace) or not connection:IsDescendantOf(workspace)) then
																						if not flag2 then
																							tbl2.NetworkOwnership.SetNetworkOwner(humanoidRootPart2, function()
																								tbl2.NetworkOwnership.StopVelocity(humanoidRootPart2, 1)
																								humanoidRootPart2.CFrame = cFrame
																							end, true)

																							if tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart2) then
																								if not ragdolled2.Value then
																									tbl2.ApplyGrabMode(nil, humanoidRootPart2, "Ragdoll", true)
																								end
																							end

																							task.wait(0.05)
																							continue
																						end
																					end
																				end

																				break
																			end

																			tbl2.Cleanup.Disconnect("AccessoryRemoved")
																			tbl2.SoftLockTarget = nil
																		end)

																		coroutine.resume(tbl2.Coroutines.SoftLock)
																	end
																end
															elseif not arg3 then
																connection = parent.SetAttribute
																connection(parent, "Grab_Spam", nil)
															else
																tbl2.SpamGrabTarget = parent
																connection = parent.SetAttribute
																connection(parent, "Grab_Spam", 1)

																while true do
																	connection = tbl3.Grab
																	connection = connection.Mode
																	connection = connection.Spam

																	if not connection or not tbl2.SpamGrabTarget then
																		break
																	else
																		connection = parent.GetAttribute
																		connection = connection(parent, "Grab_Spam")

																		if connection then
																			connection = tbl2.SpamGrabTarget

																			if connection == parent then
																				if parent:IsDescendantOf(workspace) then
																					tbl2.NetworkOwnership.StopVelocity(parent, 0)
																					tbl2.NetworkOwnership.SetNetworkOwner(parent, nil, true)
																					local flag2 = true
																					task.wait()
																					tbl2.NetworkOwnership.LoseNetworkOwner(parent)
																					task.wait()
																					continue
																				end
																			end
																		end

																		break
																	end
																end
															end
														else
															connection = humanoid2 and humanoidRootPart2

															if connection then
																connection = humanoidRootPart2.FindFirstChild
																connection = connection(humanoidRootPart2, "RagdollTouchedHitbox")
															end

															if connection then
																for i = 1, 10 do
																	humanoid2.Sit = not arg3
																	connection.CanTouch = not arg3

																	if arg3 then
																		local touchInterest = connection:FindFirstChild("TouchInterest")

																		if touchInterest then
																			touchInterest:Destroy()
																		end
																	end

																	wait()
																end
															end
														end
													elseif not (not humanoidRootPart2 or not humanoid2 or not arg3) then
														connection = tbl2.Ragdoller
														local soundPart, bodyVelocity, vector, n

														if not connection or not tbl2.Ragdoller.SoundPart then
															connection = nil
															tbl2.Ragdoller = connection

															while true do
																connection = tbl2.Ragdoller

																if not connection then
																	connection = tbl2.ToysManager
																	connection = connection.SpawnToy
																	connection = connection("PalletLightBrown", true)
																	soundPart = connection and connection:WaitForChild("SoundPart", 3)

																	if soundPart then
																		tbl2.NetworkOwnership.SetNetworkOwner(soundPart)

																		if not tbl2.NetworkOwnership.IsNetworkOwned(soundPart) then
																			tbl2.ToysManager.DestroyToy(connection)
																		else
																			bodyVelocity = Instance.new("BodyVelocity")
																			bodyVelocity.Name = "RagdollerVelocity"
																			bodyVelocity.Velocity = Vector3.zero
																			vector = Vector3.new(0, math.huge, 0)
																			n = 10
																			bodyVelocity.MaxForce = vector
																			bodyVelocity.Parent = soundPart
																			soundPart.CFrame = CFrame.new(Vector3.new(soundPart.CFrame.Position.X, -50, soundPart.CFrame.Position.Z))

																			task.spawn(function()
																				for i = 1, 5 do
																					tbl2.ModifyDescendants(connection, { BasePart = { CanCollide = false, CanTouch = true, Transparency = 1, Size = Vector3.one } })
																					wait()
																				end
																			end)

																			tbl2.Ragdoller = {
																				Pallet = connection,
																				SoundPart = soundPart,
																				RagdollerVelocity = bodyVelocity,
																			}
																		end
																	end

																	wait()
																else
																	break
																end
															end
														else
															connection = tbl2.Ragdoller
															connection = connection.SoundPart
															local connection2 = connection
															connection = connection.IsDescendantOf
															connection = connection(connection2, workspace)

															if not connection then
																connection = nil
																tbl2.Ragdoller = connection

																while true do
																	connection = tbl2.Ragdoller

																	if not connection then
																		connection = tbl2.ToysManager
																		connection = connection.SpawnToy
																		connection = connection("PalletLightBrown", true)
																		soundPart = connection and connection:WaitForChild("SoundPart", 3)

																		if soundPart then
																			tbl2.NetworkOwnership.SetNetworkOwner(soundPart)

																			if not tbl2.NetworkOwnership.IsNetworkOwned(soundPart) then
																				tbl2.ToysManager.DestroyToy(connection)
																			else
																				bodyVelocity = Instance.new("BodyVelocity")
																				bodyVelocity.Name = "RagdollerVelocity"
																				bodyVelocity.Velocity = Vector3.zero
																				vector = Vector3.new(0, math.huge, 0)
																				n = 10
																				bodyVelocity.MaxForce = vector
																				bodyVelocity.Parent = soundPart
																				soundPart.CFrame = CFrame.new(Vector3.new(soundPart.CFrame.Position.X, -50, soundPart.CFrame.Position.Z))

																				task.spawn(function()
																					for i = 1, 5 do
																						tbl2.ModifyDescendants(connection, { BasePart = { CanCollide = false, CanTouch = true, Transparency = 1, Size = Vector3.one } })
																						wait()
																					end
																				end)

																				tbl2.Ragdoller = {
																					Pallet = connection,
																					SoundPart = soundPart,
																					RagdollerVelocity = bodyVelocity,
																				}
																			end
																		end

																		wait()
																	else
																		break
																	end
																end
															else
																connection = tbl2.NetworkOwnership
																connection = connection.IsNetworkOwned
																connection = connection(tbl2.Ragdoller.SoundPart)

																if not connection then
																	connection = nil
																	tbl2.Ragdoller = connection

																	while true do
																		connection = tbl2.Ragdoller

																		if not connection then
																			connection = tbl2.ToysManager
																			connection = connection.SpawnToy
																			connection = connection("PalletLightBrown", true)
																			soundPart = connection and connection:WaitForChild("SoundPart", 3)

																			if soundPart then
																				tbl2.NetworkOwnership.SetNetworkOwner(soundPart)

																				if not tbl2.NetworkOwnership.IsNetworkOwned(soundPart) then
																					tbl2.ToysManager.DestroyToy(connection)
																				else
																					bodyVelocity = Instance.new("BodyVelocity")
																					bodyVelocity.Name = "RagdollerVelocity"
																					bodyVelocity.Velocity = Vector3.zero
																					vector = Vector3.new(0, math.huge, 0)
																					n = 10
																					bodyVelocity.MaxForce = vector
																					bodyVelocity.Parent = soundPart
																					soundPart.CFrame = CFrame.new(Vector3.new(soundPart.CFrame.Position.X, -50, soundPart.CFrame.Position.Z))

																					task.spawn(function()
																						for i = 1, 5 do
																							tbl2.ModifyDescendants(connection, { BasePart = { CanCollide = false, CanTouch = true, Transparency = 1, Size = Vector3.one } })
																							wait()
																						end
																					end)

																					tbl2.Ragdoller = {
																						Pallet = connection,
																						SoundPart = soundPart,
																						RagdollerVelocity = bodyVelocity,
																					}
																				end
																			end

																			wait()
																		else
																			break
																		end
																	end
																end
															end
														end

														connection = humanoidRootPart2.FindFirstChild
														connection = connection(humanoidRootPart2, "RagdollTouchedHitbox")
														local ragdolled2 = connection and humanoid2:FindFirstChild("Ragdolled")
														local n2 = 116
														local ragdoller = ragdolled2 and not ragdolled2.Value and tbl2.Ragdoller
														local soundPart2 = ragdoller and ragdoller.SoundPart
														if not soundPart2 or not soundPart2:IsDescendantOf(workspace) or not tbl2.NetworkOwnership.IsNetworkOwned(soundPart2) then
															return
														end
														ragdoller.RagdollerVelocity.Velocity = Vector3.new(0, 1000, 0)
														local flag2 = true

														task.delay(3, function()
															flag2 = false
														end)

														while true do
															local cframe, vector2, cFrame, n3

															if not flag2 then
																task.wait(0.1)
																ragdoller.RagdollerVelocity.Velocity = Vector3.zero
																cframe = CFrame.new
																vector2 = Vector3.new
																cFrame = soundPart2.CFrame
																n3 = 65
																soundPart2.CFrame = cframe(vector2(cFrame.Position.X, -50, soundPart2.CFrame.Position.Z))
																return
															else
																if not ragdolled2.Value then
																	if not soundPart2:IsDescendantOf(workspace) then
																		break
																	end
																	soundPart2.CFrame = connection.CFrame
																	task.wait()
																	continue
																end

																task.wait(0.1)
																ragdoller.RagdollerVelocity.Velocity = Vector3.zero
																cframe = CFrame.new
																vector2 = Vector3.new
																cFrame = soundPart2.CFrame
																n3 = 65
																soundPart2.CFrame = cframe(vector2(cFrame.Position.X, -50, soundPart2.CFrame.Position.Z))
																return
															end
														end

														return
													end
												elseif model then
													if not arg3 then
														connection = model.GetDescendants

														for _, v6 in connection(model) do
															if not (not v6:IsA("BasePart") or not tbl2.Parts.Mode.Noclip[v6]) then
																tbl2.Parts.Mode.Noclip[v6] = nil
																v6.CanCollide = true
															end
														end
													else
														connection = {}

														for _, v6 in model:GetDescendants() do
															if v6:IsA("BasePart") then
																connection[#connection + 1] = v6
															end
														end

														local function fn3()
															for i = 1, 10 do
																for _, v6 in connection do
																	if v6.CanCollide then
																		tbl2.Parts.Mode.Noclip[v6] = true
																	end

																	v6.CanCollide = false
																end

																wait()
															end
														end

														task.spawn(fn3)
														local ragdolled2 = humanoid2 and humanoid2:FindFirstChild("Ragdolled")

														if ragdolled2 then
															if not ragdolled2.Value then
																local connection2 = nil
																local connection3 = nil

																local tbl5 = { f = function()
																	if connection2 then
																		connection2:Disconnect()
																		connection2 = nil
																	end

																	if connection3 then
																		connection3:Disconnect()
																		connection3 = nil
																	end
																end }

																connection3 = ragdolled2:GetPropertyChangedSignal("Value"):Connect(function()
																	task.spawn(tbl5.f)
																	if not tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart2) then
																		return
																	end
																	task.spawn(fn3)
																end)

																connection2 = model.AncestryChanged:Connect(function()
																	task.spawn(tbl5.f)
																end)
															end
														end
													end
												end
											elseif not arg3 then
												connection = parent.FindFirstChild
												connection = connection(parent, "#FlingVelocity")

												if connection then
													local n = 9
													connection:Destroy()
												end
											else
												connection = currentCamera.CFrame
												connection = connection.LookVector
												local bodyVelocity = Instance.new("BodyVelocity")
												bodyVelocity.Name = "#FlingVelocity"
												bodyVelocity.MaxForce = Vector3.new("inf", "inf", "inf")
												bodyVelocity.Velocity = Vector3.new(connection.X, 0, connection.Z) * 5000 + Vector3.new(0, 2500, 0)
												local n = 22
												bodyVelocity.Parent = parent
												tbl4[#tbl4 + 1] = bodyVelocity
											end
										elseif model then
											if not arg3 then
												connection = parent.FindFirstChild
												connection = connection(parent, "#VoidVelocity")

												if connection then
													connection:Destroy()
												end
											else
												if humanoid2 then
													connection = task
													connection = connection.spawn
													connection(tbl2.ApplyGrabMode, nil, parent, "Unragdollable", true)
												end

												connection = Instance
												connection = connection.new
												connection = connection("BodyVelocity")
												connection.MaxForce = Vector3.one * math.huge
												connection.Velocity = Vector3.new(0, -100, 0)
												connection.Name = "#VoidVelocity"
												connection.Parent = parent
												local tbl5 = {}

												for _, v6 in model:GetDescendants() do
													if v6:IsA("BasePart") then
														tbl5[#tbl5 + 1] = v6
													end
												end

												for i = 1, 10 do
													if not parent:IsDescendantOf(workspace) then
														return
													end
													connection.Velocity = connection.Velocity - Vector3.new(0, 100, 0)

													for _, v6 in tbl5 do
														v6.CanCollide = false
														v6.CanTouch = false
													end

													wait(0.1)
												end
											end
										end
									elseif not (not arg3 or not model or not humanoidRootPart2 or not humanoid2 or not (humanoid2.Health > 0)) then
										connection = task
										connection = connection.spawn
										connection(tbl2.ApplyGrabMode, nil, parent, "Unragdollable", true)
										connection = tbl2.NetworkOwnership
										connection = connection.LoseNetworkOwner
										connection(humanoidRootPart2)
										connection = tbl2.NetworkOwnership
										connection = connection.SetNetworkOwner
										connection(humanoidRootPart2, nil, true)

										if arg then
											while true do
												connection = arg.IsDescendantOf
												connection = connection(arg, workspace)

												if not connection then
													break
												else
													connection = humanoid2.IsDescendantOf
													connection = connection(humanoid2, workspace)

													if connection then
														connection = wait
														connection(0.1)
														connection = tbl2.NetworkOwnership
														connection = connection.IsNetworkOwned
														connection = connection(humanoidRootPart2)
														if not connection then
															continue
														end
													end

													break
												end
											end

											connection = arg.Destroy
											connection(arg)
										end

										connection = tbl2.NetworkOwnership
										connection = connection.LoseNetworkOwner
										connection(humanoidRootPart2)
										connection = task
										connection = connection.spawn
										connection(tbl2.NetworkOwnership.SafeKill, humanoid2)
									end
								elseif not (not humanoidRootPart2 or not humanoid2 or not (humanoid2.Health > 0)) then
									connection = tbl2.NetworkOwnership
									connection = connection.LoseNetworkOwner
									connection(humanoidRootPart2)

									if arg then
										connection = arg.Destroy
										connection(arg)
										connection = task
										connection = connection.wait
										connection(0.1)
										connection = tbl2.NetworkOwnership
										connection = connection.SetNetworkOwner
										connection(humanoidRootPart2, nil, true)
									end

									connection = tbl2.NetworkOwnership
									connection = connection.StopVelocity
									connection(humanoidRootPart2, 0)
									connection = humanoidRootPart2.CFrame
									connection += Vector3.new(0, 1e15, 0)
									humanoidRootPart2.CFrame = connection
									connection = task
									connection = connection.wait
									connection()
									connection = Vector3
									connection = connection.new
									connection = connection(0, 100, 0)
									humanoidRootPart2.AssemblyLinearVelocity = connection
								end
							else
								tbl2.ExtendDistance = 0
								connection = tbl2.Cleanup
								connection = connection.Disconnect
								connection("ExtendDrag")
								connection = tbl2.Cleanup
								connection = connection.Disconnect
								connection("ExtendWheel")

								if arg3 then
									connection = arg

									if connection then
										connection = arg.WaitForChild
										connection = connection(arg, "DragPart", 1)
									end

									if connection then
										tbl2.ExtendDistance = (currentCamera.CFrame.Position - parent.CFrame.Position).Magnitude

										tbl2.Connections.ExtendWheel = UserInputService.InputChanged:Connect(function(input)
											if not tbl3.Grab.Extend.Toggle then
												return
											end

											if input.UserInputType == Enum.UserInputType.MouseWheel then
												if not (input.Position.Z > 0) then
													if input.Position.Z < 0 then
														tbl2.ExtendDistance = math.max(tbl2.ExtendDistance - tbl3.Grab.Extend.Multiplier, 0)
													end
												else
													tbl2.ExtendDistance = math.min(tbl2.ExtendDistance + tbl3.Grab.Extend.Multiplier, tbl3.Grab.Extend.Distance)
												end
											end
										end)

										tbl2.Connections.ExtendDrag = RunService.RenderStepped:Connect(function()
											connection.Position = currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * tbl2.ExtendDistance
										end)
									end
								end
							end
						elseif not arg3 then
							connection = tbl2.Remotes
							connection = connection.CreateGrabLine
							local connection2 = connection
							connection = connection.FireServer
							connection(connection2)
						else
							connection = task
							connection = connection.spawn
							connection(CreateGrabLine, parent)
						end
					elseif not arg3 then
						connection = tbl2.NetworkOwnership
						connection = connection.LoseNetworkOwner
						connection(parent)
					else
						connection = tbl2.NetworkOwnership
						connection = connection.SetNetworkOwner
						connection(parent, nil, true)
					end

					return
				end
			end
		end

		tbl2.AuraManager.Start = function(arg)
			if not arg then
				local flag2 = true

				for _, v6 in tbl3.Auras.Player do
					if v6 then
						flag2 = false
						break
					end
				end

				if flag2 then
					tbl2.GrabAurasActive = nil
				end
			else
				if tbl2.GrabAurasActive then
					return
				end
				tbl2.GrabAurasActive = true
				local tbl4 = {}

				while tbl2.GrabAurasActive do
					if not (not humanoidRootPart or not humanoid) then
						for _, player in tbl2.PlayerList do
							if not player.IsImmune then
								local character2 = player.Character
								local model = character2.Model

								if model then
									if not tbl4[model] then
										local humanoid2 = character2.Humanoid
										local humanoidRootPart2 = character2.HumanoidRootPart

										if not (not humanoid2 or not humanoidRootPart2 or not (humanoid2.Health > 0)) then
											if (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude <= currentReach.Value then
												task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, humanoidRootPart2, function()
													tbl4[model] = true

													for k, v7 in tbl3.Auras.Player do
														if v7 then
															task.spawn(tbl2.ApplyGrabMode, nil, humanoidRootPart2, k, true)
														end
													end

													task.wait(1)
													tbl4[model] = nil
												end)
											end
										end
									end
								end
							end
						end
					end

					RunService.RenderStepped:Wait()
				end

				tbl2.GrabAurasActive = nil
			end
		end

		tbl2.PossessionManager.Target = nil

		tbl2.PossessionManager.Possess = function(character2)
			if not character2 or not character2:IsDescendantOf(workspace) then
				return
			end
			local character3 = character
			local humanoid2 = humanoid
			local humanoidRootPart2 = humanoidRootPart
			if not character or not humanoid or not humanoidRootPart then
				return
			end
			local humanoid3 = character2:FindFirstChildWhichIsA("Humanoid")
			local rootPart = humanoid3 and humanoid3.RootPart
			local head2 = rootPart and character2:FindFirstChild("Head")
			if not rootPart or not head2 or not tbl2.NetworkOwnership.IsNetworkOwned(rootPart) then
				return
			end

			if head2:FindFirstChild("PartOwner") then
				tbl2.NetworkOwnership.LoseNetworkOwner(rootPart)
			end

			local flag2 = false
			local playerFromCharacter = Players:GetPlayerFromCharacter(character2)

			if playerFromCharacter then
				if playerFromCharacter.Name ~= localPlayer.Name then
					return
				end
				flag2 = true
			end

			local currentCamera2 = currentCamera
			tbl2.Cleanup.Close("Possession_Follow")
			tbl2.PossessionManager.Target = nil
			currentCamera2.CameraSubject = humanoid3
			localPlayer.Character = character2

			if not flag2 then
				tbl2.PossessionManager.Target = character2

				local function fn3(cFrame)
					if isHeld.Value then
						tbl2.Remotes.Struggle:FireServer()
						wait(0.1)
					end

					tbl2.NetworkOwnership.StopVelocity(humanoidRootPart2, 0.1)
					humanoidRootPart2.CFrame = cFrame
				end

				local flag3 = true
				local flag4 = false

				while tbl2.PossessionManager.Target == character2 do
					if not (not (humanoid2.Health > 0) or not humanoidRootPart2:IsDescendantOf(workspace)) then
						if not tbl2.NetworkOwnership.IsNetworkOwned(rootPart) and not flag4 then
							flag4 = true
							local cFrame = humanoidRootPart2.CFrame

							task.spawn(function()
								while not (not flag4 or not flag3) do
									if not tbl2.NetworkOwnership.IsNetworkOwned(rootPart) then
										fn3(rootPart.CFrame * CFrame.new(Vector3.new(0, -10, 0)))

										tbl2.NetworkOwnership.SetNetworkOwner(rootPart, function()
											tbl2.NetworkOwnership.LoseNetworkOwner(rootPart)
											tbl2.NetworkOwnership.StopVelocity(rootPart, 1)
											rootPart.Massless = true
											wait(1)
											tbl2.NetworkOwnership.StopVelocity(rootPart, 0)
											rootPart.Massless = false
										end)

										continue
									end

									break
								end

								fn3(cFrame)
							end)
						end

						if not rootPart:IsDescendantOf(workspace) or not (humanoid3.Health > 0) then
							v4:Notify({
								Title = "NPC Possession",
								Content = "The possessed NPC just died/was destroyed.",
								Duration = 3,
								Image = "user-minus",
							})

							break
						else
							RunService.RenderStepped:Wait()
							continue
						end
					end

					break
				end

				flag3 = false
				local possessionManager = tbl2.PossessionManager
				local n = 2
				possessionManager.Target = nil
				currentCamera2.CameraSubject = humanoid2
				localPlayer.Character = character3
				return
			end
		end

		tbl2.BombsManager.Explode = function(arg, arg2, arg3)
			local v6 = tbl2.Bombs[arg]

			if v6 then
				local hitbox = arg2 or v6.Hitbox
				tbl2.Remotes.BombExplode:FireServer({ Hitbox = v6.Hitbox, PositionPart = hitbox }, arg3 or hitbox.CFrame.Position)
			end
		end

		tbl2.GuiObjects.AutoSpawn = {}

		tbl2.AutoSpawnManager.Clean = function(arg)
			for k in tbl2.GuiObjects.AutoSpawn do
				if k ~= arg then
					if tbl2.GuiObjects.AutoSpawn[k].CurrentValue then
						task.spawn(tbl2.GuiObjects.AutoSpawn[k].Set, tbl2.GuiObjects.AutoSpawn[k], false)

						v4:Notify({
							Title = "Auto-Spawn",
							Content = k .. " was disabled.",
							Duration = 3,
							Image = "alert-circle",
						})
					end
				end
			end
		end

		tbl2.AutoSpawnManager.Create = function(arg, arg2, arg3, arg4, arg5)
			if not arg or typeof(arg) ~= "table" or not arg2 or typeof(arg2) ~= "string" or not arg4 or typeof(arg4) ~= "number" or not arg3 or typeof(arg3) ~= "string" and typeof(arg3) ~= "table" then
				return
			end
			local v6 = nil
			local n = math.floor(arg4 / 2)
			local tbl4 = {}
			arg:CreateSection("Auto-Spawn")

			tbl2.GuiObjects.AutoSpawn[arg2] = arg:CreateToggle({
				Name = "Auto-Spawn " .. arg2,
				CurrentValue = false,
				Callback = function(arg6)
					tbl2.AutoSpawnManager.Clean(arg2)

					if arg6 then
						tbl2.Cleanup.Close("AutoSpawn")

						tbl2.Coroutines.AutoSpawn = coroutine.create(function()
							while true do
								local n2 = 1

								if not tbl2.GuiObjects.AutoSpawn[arg2].CurrentValue then
									break
								else
									if humanoidRootPart then
										if not tbl2.SavingPlot or not tbl2.SpinningSlot then
											if not tbl2.ToysManager.HasToy(v6) then
												if not tbl4[v6] then
													task.delay(10, function()
														tbl4[v6] = nil
													end)

													tbl4[v6] = true

													v4:Notify({
														Title = arg2 .. " Auto-Spawn",
														Content = v6 .. " isn't bought",
														Duration = 3,
														Image = "alert-circle",
													})
												end
											else
												local tbl5 = {}

												for _, v7 in v5:GetChildren() do
													if v7.Name == v6 then
														tbl5[#tbl5 + 1] = v7
													end
												end

												if #tbl5 < n then
													local v7 = tbl2.ToysManager.SpawnToy(v6)

													if v7 then
														task.spawn(function()
															local v8 = tbl2.NetworkOwnership.GetNetworkablePart(v7)

															if v8 then
																tbl2.NetworkOwnership.SetNetworkOwner(v8)
																if tbl2.NetworkOwnership.IsNetworkOwned(v7) then
																	arg5(v7)
																	return
																end
															end

															tbl2.ToysManager.DestroyToy(v7)
														end)
													end
												end

												wait(0.1)
											end
										end
									end

									RunService.RenderStepped:Wait()
								end
							end
						end)

						coroutine.resume(tbl2.Coroutines.AutoSpawn)
					end
				end,
			})

			if typeof(arg3) ~= "table" then
				if typeof(arg3) == "string" then
					v6 = arg3
				end
			else
				local n2 = 9
				v6 = arg3[1]

				tbl2.GuiObjects.AutoSpawn["Dropdown_" .. arg2] = arg:CreateDropdown({
					Name = "Toy To Spawn",
					Options = arg3,
					CurrentOption = { arg3[1] },
					MultipleOptions = false,
					Callback = function(arg6)
						v6 = arg6[1]
					end,
				})
			end

			arg:CreateSlider({
				Name = "Spawn Amount",
				Range = { 1, arg4 },
				Increment = 1,
				CurrentValue = n,
				Flag = arg2 .. "Amount",
				Callback = function(arg6)
					n = arg6
				end,
			})
		end

		tbl2.GuiObjects.Tabs = {}
		callback = "Grab"
		tbl2.GuiObjects.Tabs.Grab = tbl2.GuiObjects.Window:CreateTab(callback, "hand")

		do
			local tabs = tbl2.GuiObjects.Tabs
			local window = tbl2.GuiObjects.Window
			local flag2 = true
			local n = 36
			callback = "Defense"
			tabs.Defense = window:CreateTab(callback, "shield")
		end

		callback = "Loop"
		tbl2.GuiObjects.Tabs.Loop = tbl2.GuiObjects.Window:CreateTab(callback, "recycle")
		callback = "Blobman (BETA)"
		tbl2.GuiObjects.Tabs.Blobman = tbl2.GuiObjects.Window:CreateTab(callback, 7733916988)

		do
			local tabs = tbl2.GuiObjects.Tabs
			local window = tbl2.GuiObjects.Window
			local window2 = window
			local createTab = window.CreateTab
			local n = 35
			callback = "Lag"
			tabs.Lag = createTab(window2, callback, "turtle")
		end

		callback = "Auras"
		tbl2.GuiObjects.Tabs.Auras = tbl2.GuiObjects.Window:CreateTab(callback, "shield-ellipsis")
		callback = "Decoys"
		tbl2.GuiObjects.Tabs.Decoys = tbl2.GuiObjects.Window:CreateTab(callback, "user-2")
		callback = "Bombs"
		tbl2.GuiObjects.Tabs.Bombs = tbl2.GuiObjects.Window:CreateTab(callback, "bomb")
		callback = "ESP"
		tbl2.GuiObjects.Tabs.ESP = tbl2.GuiObjects.Window:CreateTab(callback, "scan-eye")
		callback = "Visual"
		tbl2.GuiObjects.Tabs.Visual = tbl2.GuiObjects.Window:CreateTab(callback, "eye")
		callback = "Whitelist"
		tbl2.GuiObjects.Tabs.Whitelist = tbl2.GuiObjects.Window:CreateTab(callback, "list-checks")
		callback = "Interface"
		tbl2.GuiObjects.Tabs.Interface = tbl2.GuiObjects.Window:CreateTab(callback, "paint-bucket")
		callback = "Misc"
		tbl2.GuiObjects.Tabs.Misc = tbl2.GuiObjects.Window:CreateTab(callback, "box")
		tbl2.GuiObjects.Tabs.Grab:CreateSection("Grab Modifications")

		do
    tbl3.Grab = tbl3.Grab or {}
    tbl3.Grab.Mode = tbl3.Grab.Mode or {}

    local grabTab = tbl2.GuiObjects.Tabs.Grab

    for _, name in ipairs({
        "Kick",
        "Kill",
        "Void",
        "Fling",
        "Swing",
        "Strong",
        "Spam",
        "SoftLock",
        "Invisible",
        "Noclip",
        "Ragdoll",
        "Unstick",
        "Freeze",
        "Crazy",
        "Spin",
        "Orbit",
    }) do
        local modeName = name
        tbl3.Grab.Mode[modeName] = false

        tbl2.GuiObjects[modeName .. "Grab"] = grabTab:CreateToggle({
            Name = modeName .. " Grab",
            Flag = "Grab_" .. modeName,
            Callback = function(value)
                tbl3.Grab.Mode[modeName] = value
                task.spawn(tbl2.ApplyGrabMode, nil, nil, modeName, value)
            end,
        })
    end
end

    tbl3.Grab = tbl3.Grab or {}
    tbl3.Grab.Mode = tbl3.Grab.Mode or {}

    local guiObjects = tbl2.GuiObjects
    local grabTab = guiObjects and guiObjects.Tabs and guiObjects.Tabs.Grab
    local applyGrabMode = tbl2.ApplyGrabMode

    if not grabTab or type(grabTab.CreateToggle) ~= "function" then
        error("Create tbl2.GuiObjects.Tabs.Grab before creating the grab mode toggles.")
    end
    if type(applyGrabMode) ~= "function" then
        error("Define tbl2.ApplyGrabMode before creating the grab mode toggles.")
    end

    
	for _, modeName in ipairs(GrabModes or {}) do
	tbl3.Grab.Mode[modeName] = false

	guiObjects[modeName .. "Grab"] = grabTab:CreateToggle({
		Name = modeName .. " Grab",
		Flag = "Grab_" .. modeName,
		Callback = function(value)
			tbl3.Grab.Mode[modeName] = value
			if type(applyGrabMode) == "function" then
				task.spawn(applyGrabMode, nil, nil, modeName, value)
			end
		end,
	})
end


		do
			local grab = tbl2.GuiObjects.Tabs.Grab
			local grab2 = grab
			local createKeybind = grab.CreateKeybind

			local tbl4 = {
				Name = "Freeze Grab: Unfreeze All",
				CurrentKeybind = "V",
				HoldToInteract = false,
				Flag = "Bind_Unfreeze_All",
			}

			callback = function()
				for k in tbl2.Parts.Mode.Freeze do
					tbl2.Parts.Mode.Freeze[k] = nil
					local freezeBp = k:FindFirstChild("Freeze_BP")
					local freezeBg = k:FindFirstChild("Freeze_BG")

					if freezeBp then
						freezeBp:Destroy()
					end

					if freezeBg then
						freezeBg:Destroy()
					end
				end
			end

			local countlz = bit32.countlz
			local byte = string.byte("t\243", 2, nil)
			local n = countlz(byte) - string.byte("K\251?\144", 4, nil) + 155
			tbl4.Callback = callback
			createKeybind(grab2, tbl4)
		end

		callback = function()
			for k in tbl2.Parts.Mode.Orbit do
				tbl2.Parts.Mode.Orbit[k] = nil
				local orbitBp = k:FindFirstChild("Orbit_BP")
				local orbitBg = k:FindFirstChild("Orbit_BG")

				if orbitBp then
					orbitBp:Destroy()
				end

				if orbitBg then
					orbitBg:Destroy()
				end
			end
		end

		tbl2.GuiObjects.Tabs.Grab:CreateKeybind({
			Name = "Orbit Grab: Stop",
			CurrentKeybind = "B",
			HoldToInteract = false,
			Flag = "Bind_Orbit",
			Callback = callback,
		})

		tbl2.GuiObjects.Tabs.Grab:CreateSection("Throw Strength")

		do
			local tabs = tbl2.GuiObjects.Tabs
			local n = bit32.rshift(string.byte("U&f", 2, nil), 24) + 32

			callback = function(toggle)
				tbl3.Grab.Throw.Toggle = toggle
			end

			tabs.Grab:CreateToggle({ Name = "Stronger Throw", Flag = "Throw_Toggle", Callback = callback })
		end

		do
			local grab = tbl2.GuiObjects.Tabs.Grab
			local grab2 = grab
			local createSlider = grab.CreateSlider
			local flag2 = true
			local n = bit32.rshift(274 - string.byte("\178\1626", 2, nil), 12) + 1
			callback = { 0, 10000 }
			callback = tbl3.Grab
			callback = callback.Throw
			callback = callback.Power

			callback = function(power)
				tbl3.Grab.Throw.Power = power
			end

			createSlider(grab2, {
				Name = "Throw Power",
				Range = callback,
				Increment = 10,
				CurrentValue = callback,
				Flag = "Throw_Power",
				Callback = callback,
			})
		end

		callback = { 0.05, 10 }
		callback = tbl3.Grab
		callback = callback.Throw
		callback = callback.Time

		callback = function(time_)
			tbl3.Grab.Throw.Time = time_
		end

		tbl2.GuiObjects.Tabs.Grab:CreateSlider({
			Name = "Throw Time",
			Range = callback,
			Increment = 0.05,
			CurrentValue = callback,
			Flag = "Throw_Time",
			Callback = callback,
		})

		tbl2.GuiObjects.Tabs.Grab:CreateSection("Grab Line Extend")

		callback = function(toggle)
			tbl3.Grab.Extend.Toggle = toggle
			task.spawn(tbl2.ApplyGrabMode, nil, nil, "Extend", toggle)
		end

		tbl2.GuiObjects.Tabs.Grab:CreateToggle({ Name = "Further Extend", Flag = "Extend_Toggle", Callback = callback })

		do
			local grab = tbl2.GuiObjects.Tabs.Grab
			local grab2 = grab
			local createSlider = grab.CreateSlider
			callback = { 0, 1000 }
			local tbl4 = { Name = "Extend Distance", Range = callback, Increment = 1 }
			callback = tbl3.Grab
			local rshift = bit32.rshift
			local value = 9
			local n = rshift(0, value) + 35
			callback = callback.Extend
			callback = callback.Distance
			tbl4.CurrentValue = callback
			tbl4.Flag = "Extend_Distance"

			callback = function(distance)
				tbl3.Grab.Extend.Distance = distance
			end

			tbl4.Callback = callback
			createSlider(grab2, tbl4)
		end

		local flag2 = true; local flag3 = false; local n = 32

		do
			local lshift = bit32.lshift
			local band = bit32.band
			local value = 55; local v9 = 3; local value2 = 258
			local n2 = lshift(band(value, v9, value2), 22) - 8388578
		end

		do
			local grab = tbl2.GuiObjects.Tabs.Grab
			local grab2 = grab
			local createSlider = grab.CreateSlider
			callback = { 1, 10 }
			local tbl4 = { Name = "Extend Multiplier", Range = callback, Increment = 1 }
			callback = tbl3.Grab
			local n2 = 35
			callback = callback.Extend
			callback = callback.Multiplier
			tbl4.CurrentValue = callback
			tbl4.Flag = "Extend_Distance"

			callback = function(multiplier)
				tbl3.Grab.Extend.Multiplier = multiplier
			end

			tbl4.Callback = callback
			createSlider(grab2, tbl4)
		end

		tbl2.GuiObjects.Tabs.Defense:CreateSection("Invincibility")

		callback = function(antiGrab)
			tbl3.Defense.AntiGrab = antiGrab

			if not antiGrab then
				tbl2.ClientManager.OnGrab.AntiGrab = nil
			else
				tbl2.ClientManager.OnGrab.AntiGrab = function()
					task.spawn(function()
						while isHeld.Value do
							if humanoid.Ragdolled.Value then
								head.CanCollide = false

								for _, v9 in tbl2.ClientManager.GetRagdollLimbs() do
									if v9 then
										v9.CanCollide = false
									end
								end
							end

							ContextActionService:UnbindAction("JumpRemover")
							humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
							humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
							humanoid.PlatformStand = false
							humanoid.AutoRotate = true
							task.wait()
						end
					end)

					task.spawn(function()
						while isHeld.Value do
							tbl2.NetworkOwnership.StopVelocity(humanoidRootPart, 0)
							tbl2.Remotes.Struggle:FireServer()
							tbl2.Remotes.RagdollRemote:FireServer(humanoidRootPart, 0)
							humanoidRootPart.Anchored = true
							humanoid.Sit = false
							task.wait()
						end

						humanoidRootPart.Anchored = false
					end)

					task.spawn(function()
						while humanoidRootPart.Anchored do
							if humanoid.MoveDirection.Magnitude > 0 then
								humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoid.MoveDirection * 0.2
							end

							task.wait()
						end
					end)
				end

				task.spawn(tbl2.ClientManager.OnGrab.AntiGrab)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Grab", Flag = "Anti_Grab", Callback = callback })

		callback = function(antiGrabGucci)
			tbl3.Defense.AntiGrabGucci = antiGrabGucci

			if not antiGrabGucci then
				tbl2.Cleanup.Disconnect("AGG_CharacterAdded")
				tbl2.Cleanup.Close("AntiGrabGucci")

				if humanoid then
					humanoid.Sit = true
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
					wait()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
					humanoid.Sit = false
				end
			else
				local v9 = nil
				local pivot = nil

				local tbl4 = { f = function()
					local character2 = localPlayer.Character
					local humanoid2 = character2 and character2:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = humanoid2 and character2:WaitForChild("HumanoidRootPart", 3)
					local ragdolled2 = humanoidRootPart2 and humanoid2:WaitForChild("Ragdolled", 3)
					if not ragdolled2 and not tbl2.WaitProperty(ragdolled2, "Value", false, 1) then
						return
					end
					local n2 = 5
					wait(0.1)
					local v10 = v5
					local creatureBlobman = v9 and v9:IsDescendantOf(workspace) and v9 or v10:FindFirstChild("CreatureBlobman") or tbl2.ToysManager.SpawnToy("CreatureBlobman")
					local humanoidRootPart3 = creatureBlobman and creatureBlobman:WaitForChild("HumanoidRootPart")
					local vehicleSeat = humanoidRootPart3 and creatureBlobman:WaitForChild("VehicleSeat", 3)

					if vehicleSeat then
						if not vehicleSeat.Occupant then
							if not pivot then
								pivot = creatureBlobman:GetPivot()

								if not v10.Name:find("Plot") then
									pivot += Vector3.new(0, 100000, 0)
								end
							end

							if not humanoidRootPart3:FindFirstChild("StopPosition") then
								local bodyPosition = Instance.new("BodyPosition")
								bodyPosition.Name = "StopPosition"
								bodyPosition.D = 100
								bodyPosition.MaxForce = Vector3.one * math.huge
								bodyPosition.Position = pivot.Position
								bodyPosition.Parent = humanoidRootPart3
								wait(1)
							end

							tbl2.Coroutines.AntiGrabGucci = coroutine.create(function()
								humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
								task.wait(0.1)
								local cFrame = humanoidRootPart2.CFrame
								local flag4 = true

								task.defer(function()
									while flag4 do
										tbl2.Remotes.RagdollRemote:FireServer(humanoidRootPart2, 0.095)
										task.wait()
									end
								end)

								local now = tick()

								while true do
									if not (tick() - now < 1) then
										local localCreatureControl = character2:FindFirstChild("LocalCreatureControl")

										if localCreatureControl then
											localCreatureControl:Destroy()
										end

										local grabbingScript = character2:FindFirstChild("GrabbingScript")

										if grabbingScript then
											grabbingScript.Enabled = false
											grabbingScript.Enabled = true
										end

										v9 = creatureBlobman
										flag4 = false
										humanoidRootPart2.CFrame = cFrame
										return
									else
										local n3 = 40
										local n4 = 5
										if not vehicleSeat:IsDescendantOf(workspace) then
											break
										end
										vehicleSeat:Sit(humanoid2)

										if not humanoid2.SeatPart then
											humanoidRootPart2.CFrame = cFrame
										else
											humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
										end

										task.wait()
									end
								end

								flag4 = false
							end)

							coroutine.resume(tbl2.Coroutines.AntiGrabGucci)
							return
						end
					end
				end }

				task.spawn(tbl4.f)
				tbl2.Connections.AGG_CharacterAdded = localPlayer.CharacterAppearanceLoaded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Grab Gucci", Flag = "Anti_Grab_Gucci", Callback = callback })

		callback = function(invisibility)
			tbl3.Defense.Invisibility = invisibility
			tbl2.GuiObjects.InvisibleGrab:Set(invisibility)

			if not invisibility then
				tbl2.Cleanup.Disconnect("IV_CharacterAdded")
				tbl2.Cleanup.Close("SetupInvisibility")
				local humanoid2 = humanoid

				if humanoid2 then
					humanoid2.Sit = true
					humanoid2:ChangeState(Enum.HumanoidStateType.Running)
					wait()
					humanoid2:ChangeState(Enum.HumanoidStateType.Running)
					humanoid2.Sit = false
				end
			else
				local v9 = nil
				local pivot = nil

				local tbl4 = { f = function()
					local character2 = localPlayer.Character
					local humanoid2 = character2 and character2:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = humanoid2 and character2:WaitForChild("HumanoidRootPart", 3)
					local ragdolled2 = humanoidRootPart2 and humanoid2:WaitForChild("Ragdolled", 3)
					if not ragdolled2 and not tbl2.WaitProperty(ragdolled2, "Value", false, 1) then
						return
					end
					wait(0.1)
					local v10 = v5
					local tractorGreen = v9 and v9:IsDescendantOf(workspace) and v9 or v10:FindFirstChild("TractorGreen") or tbl2.ToysManager.SpawnToy("TractorGreen")
					local main = tractorGreen and tractorGreen:WaitForChild("Main")
					local vehicleSeat = main and tractorGreen:WaitForChild("VehicleSeat", 3)

					if vehicleSeat then
						if not vehicleSeat.Occupant then
							if not pivot then
								pivot = tractorGreen:GetPivot()

								if not v10.Name:find("Plot") then
									pivot += Vector3.new(0, 100000, 0)
								end
							end

							if not main:FindFirstChild("StopPosition") then
								local bodyPosition = Instance.new("BodyPosition")
								bodyPosition.Name = "StopPosition"
								bodyPosition.D = 100
								bodyPosition.MaxForce = Vector3.one * math.huge
								bodyPosition.Position = pivot.Position
								bodyPosition.Parent = main
								wait(1)
							end

							tbl2.Coroutines.SetupInvisibility = coroutine.create(function()
								humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
								task.wait(0.1)
								local cFrame = humanoidRootPart2.CFrame
								local flag4 = true

								task.defer(function()
									while flag4 do
										tbl2.Remotes.RagdollRemote:FireServer(humanoidRootPart2, 0.095)
										task.wait()
									end
								end)

								local now = tick()

								while true do
									if not (tick() - now < 1) then
										v9 = tractorGreen
										flag4 = false
										humanoidRootPart2.CFrame = cFrame
										return
									else
										if not vehicleSeat:IsDescendantOf(workspace) then
											break
										end
										vehicleSeat:Sit(humanoid2)

										if not humanoid2.SeatPart then
											humanoidRootPart2.CFrame = cFrame
										else
											humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
										end

										task.wait()
									end
								end

								flag4 = false
							end)

							coroutine.resume(tbl2.Coroutines.SetupInvisibility)
							return
						end
					end
				end }

				task.spawn(tbl4.f)
				tbl2.Connections.IV_CharacterAdded = localPlayer.CharacterAppearanceLoaded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Invisibility", Flag = "Invisibility", Callback = callback })

		callback = function(antiBlobman)
			tbl3.Defense.AntiBlobman = antiBlobman

			if character then
				local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
				local typingKeyboardMyWorld = character:FindFirstChild("TypingKeyboardMyWorld")
				local handle = typingKeyboardMyWorld and typingKeyboardMyWorld:FindFirstChild("Handle")
				if not humanoidRootPart2 or not handle then
					return
				end

				if tbl2.RA then
					local bxor = bit32.bxor
					local flag4 = true
					local value = 306
					local n2 = bxor(13, 403, value) - 29
					tbl2.RA.Parent = humanoidRootPart2
					tbl2.RA = nil
				end

				if tbl2.KA then
					tbl2.KA.Parent = handle
					tbl2.KA = nil
				end

				if tbl2.FRA then
					tbl2.FRA:Destroy()
					tbl2.FRA = nil
				end

				if tbl2.FKA then
					tbl2.FKA:Destroy()
					tbl2.FKA = nil
				end
			end

			if not antiBlobman then
				tbl2.Cleanup.Disconnect("AB_IsHeld")
				tbl2.Cleanup.Disconnect("AB_Massless")
				tbl2.Cleanup.Disconnect("AB_Massless2")
				tbl2.Cleanup.Disconnect("AB_Root")
				tbl2.Cleanup.Disconnect("AB_Keyboard")
			else
				local tbl4 = { f = function(arg)
					if not arg or not arg:IsDescendantOf(workspace) then
						return
					end
					local head2 = arg:WaitForChild("Head", 3)
					local humanoid2 = arg:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = arg:WaitForChild("HumanoidRootPart", 3)
					local typingKeyboardMyWorld = arg:WaitForChild("TypingKeyboardMyWorld", 3)
					local handle = typingKeyboardMyWorld and typingKeyboardMyWorld:WaitForChild("Handle")
					if not head2 or not humanoid2 or not humanoidRootPart2 or not handle then
						return
					end
					local rootAttachment = humanoidRootPart2:WaitForChild("RootAttachment", 3)
					local rootAttachment2 = handle:WaitForChild("RootAttachment", 3)
					local ragdolled2 = humanoid2:WaitForChild("Ragdolled", 3)
					if not rootAttachment or not rootAttachment2 or not ragdolled2 then
						return
					end
					rootAttachment.Parent = nil
					rootAttachment2.Parent = nil
					local weldConstraint = Instance.new("WeldConstraint")
					weldConstraint.Name = "RootAttachment"
					weldConstraint.Parent = humanoidRootPart2
					local weldConstraint2 = Instance.new("WeldConstraint")
					weldConstraint2.Name = "RootAttachment"
					weldConstraint2.Parent = handle
					tbl2.RA = rootAttachment
					tbl2.KA = rootAttachment2
					tbl2.FRA = weldConstraint
					tbl2.FKA = weldConstraint2
					local tbl4 = {}

					local tbl5 = { f = function(arg2)
						if not arg2 or not arg2:IsA("Attachment") then
							return
						end
						local constraints = arg2:GetConstraints()
						if #constraints <= 0 then
							return
						end

						for _, v9 in constraints do
							v9.Enabled = false

							if not tbl4[v9] then
								task.spawn(function()
									tbl4[v9] = true
									local model = v9:FindFirstAncestorWhichIsA("Model")
									local model2 = model and tbl2.BlobmanManager.Controllers[model]

									if model2 then
										model2.CreatureActions.Drop:FireServer(v9)
										local root = model2.Root
										local humanoid3 = model2.Humanoid

										if not (not root or not humanoid3 or not ((root.CFrame.Position - humanoidRootPart2.CFrame.Position).Magnitude < currentReach.Value)) then
											local seat = model2.Seat
											local n2 = 5
											local occupant = seat and seat.Occupant
											local model3 = occupant and occupant ~= humanoid2 and occupant:FindFirstAncestorWhichIsA("Model")
											local humanoidRootPart3 = model3 and model3:FindFirstChild("HumanoidRootPart")

											if not Players:GetPlayerFromCharacter(model3) or not model2.IsImmune then
												task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, humanoidRootPart3, function()
													task.spawn(tbl2.ApplyGrabMode, nil, humanoidRootPart3, "Kill", true)
												end)

												task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, root, function()
													tbl2.WaitProperty(seat, "SeatPart", nil, 0.5)
													task.spawn(tbl2.ApplyGrabMode, nil, root, "Void", true)
													humanoid3.Health = 0
												end)
											end
										end
									end

									tbl4[v9] = nil
								end)
							end
						end

						humanoidRootPart2.Massless = false
					end }

					tbl2.Cleanup.Disconnect("AB_IsHeld")
					tbl2.Cleanup.Disconnect("AB_Massless")
					tbl2.Cleanup.Disconnect("AB_Massless2")
					tbl2.Cleanup.Disconnect("AB_Root")
					local disconnect = tbl2.Cleanup.Disconnect
					local n2 = 9
					disconnect("AB_Keyboard")

					tbl2.Connections.AB_IsHeld = isHeld:GetPropertyChangedSignal("Value"):Connect(function()
						while isHeld.Value do
							tbl2.Remotes.RagdollRemote:FireServer(humanoidRootPart2, 0)
							tbl2.Remotes.Struggle:FireServer()

							for _, v9 in tbl2.ClientManager.GetRagdollLimbs() do
								if v9 then
									v9.CanCollide = false
								end
							end

							head2.CanCollide = false
							ragdolled2.Value = false
							ContextActionService:UnbindAction("JumpRemover")
							humanoid2:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
							humanoid2.AutoRotate = true
							humanoid2.Sit = false
							task.wait()
						end
					end)

					tbl2.Connections.AB_Massless = humanoidRootPart2:GetPropertyChangedSignal("Massless"):Connect(function()
						if humanoidRootPart2.Massless then
							humanoidRootPart2.Massless = false
							task.spawn(tbl5.f, rootAttachment, humanoidRootPart2)
							task.spawn(tbl5.f, rootAttachment2, handle)
						end
					end)

					tbl2.Connections.AB_Massless2 = RunService.Heartbeat:Connect(function()
						if humanoidRootPart2.Massless then
							humanoidRootPart2.Massless = false
							task.spawn(tbl5.f, rootAttachment, humanoidRootPart2)
							task.spawn(tbl5.f, rootAttachment2, handle)
						end
					end)

					tbl2.Connections.AB_Root = RunService.Heartbeat:Connect(function()
						task.spawn(tbl5.f, rootAttachment, humanoidRootPart2)
					end)

					tbl2.Connections.AB_Keyboard = RunService.Heartbeat:Connect(function()
						task.spawn(tbl5.f, rootAttachment2, handle)
					end)
				end }

				tbl4.f(localPlayer.Character)
				localPlayer.CharacterAdded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Blobman", Flag = "Anti_Blobman", Callback = callback })

		callback = function(antiGrabNoRagdoll)
			tbl3.Defense.AntiGrabNoRagdoll = antiGrabNoRagdoll

			if not antiGrabNoRagdoll then
				tbl2.ClientManager.OnGrab.AntiGrabNoRagdoll = nil
				tbl2.Cleanup.Close("AG_Struggle")
			else
				tbl2.ClientManager.OnGrab.AntiGrabNoRagdoll = function()
					if isHeld.Value then
						task.spawn(function()
							while isHeld.Value do
								tbl2.NetworkOwnership.StopVelocity(humanoidRootPart, 0)
								tbl2.Remotes.Struggle:FireServer()
								humanoidRootPart.Anchored = true
								humanoid:ChangeState(Enum.HumanoidStateType.Running)
								humanoid.Sit = false
								task.wait()
							end

							humanoidRootPart.Anchored = false
						end)

						task.spawn(function()
							while not (not humanoidRootPart or not humanoidRootPart.Anchored) do
								if humanoid.MoveDirection.Magnitude > 0 then
									humanoidRootPart.CFrame = humanoidRootPart.CFrame + humanoid.MoveDirection * 0.2
								end

								task.wait()
							end
						end)
					end
				end

				task.spawn(tbl2.ClientManager.OnGrab.AntiGrabNoRagdoll)

				tbl2.Coroutines.AG_Struggle = coroutine.create(function()
					while tbl3.Defense.AntiGrabNoRagdoll do
						if humanoid then
							for _, v9 in humanoid:GetPlayingAnimationTracks() do
								if v9.Animation.AnimationId == "rbxassetid://" .. tbl2.Animations.Thrown then
									v9:Stop()
								end
							end
						end

						wait()
					end
				end)

				coroutine.resume(tbl2.Coroutines.AG_Struggle)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Grab (No Ragdoll)", Flag = "Anti_Grab_No_Ragdoll", Callback = callback })

		callback = function(antiThrow)
			tbl3.Defense.AntiThrow = antiThrow

			if not antiThrow then
				tbl2.ClientManager.OnGrab.AntiThrow = nil
			else
				tbl2.ClientManager.OnGrab.AntiThrow = function()
					if isHeld.Value then
						local cFrame = humanoidRootPart.CFrame

						while isHeld.Value do
							task.wait()
						end

						tbl2.NetworkOwnership.StopVelocity(humanoidRootPart, 0)
						humanoidRootPart.CFrame = cFrame
					end
				end

				task.spawn(tbl2.ClientManager.OnGrab.AntiThrow)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Throw (Teleport Back)", Flag = "Anti_Throw", Callback = callback })

		callback = function(antiRagdoll)
			tbl3.Defense.AntiRagdoll = antiRagdoll

			if not antiRagdoll then
				tbl2.Cleanup.Disconnect("AR_CharacterAdded")
				tbl2.Cleanup.Disconnect("AR_Sit")
			else
				local tbl4 = { f = function()
					if not character or not character:IsDescendantOf(workspace) then
						return
					end
					local humanoid2 = character:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = humanoid2 and character:WaitForChild("HumanoidRootPart", 3)
					local ragdollTouchedHitbox = humanoidRootPart2 and humanoidRootPart2:WaitForChild("RagdollTouchedHitbox", 3)
					if not ragdollTouchedHitbox then
						return
					end
					tbl2.Cleanup.Disconnect("AR_Sit")

					tbl2.Connections.AR_Sit = humanoid2:GetPropertyChangedSignal("Sit"):Connect(function()
						wait()

						if isHeld.Value then
							if not tbl2.BlobmanManager.GetController() then
								humanoid2.Sit = false
								ragdollTouchedHitbox.CanTouch = false
							end
						end
					end)
				end }

				task.spawn(tbl4.f, localPlayer.Character)
				tbl2.Connections.AR_CharacterAdded = localPlayer.CharacterAdded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Ragdoll (On Grab)", Flag = "Anti_Ragdoll", Callback = callback })

		do
			local tabs = tbl2.GuiObjects.Tabs
			local lshift = bit32.lshift
			local n2 = 77
			local value = 27
			local n3 = lshift(n2, value) - 1744830432

			callback = function(antiNetworkOwnership)
				tbl3.Defense.AntiNetworkOwnership = antiNetworkOwnership
				tbl2.RemotesManager.Fake(tbl2.Remotes.EndGrabEarly, antiNetworkOwnership)
				local grabbingScript = character and character:WaitForChild("GrabbingScript", 1)

				if grabbingScript then
					grabbingScript.Enabled = false
					grabbingScript.Enabled = true

					for _, v9 in workspace:GetChildren() do
						if v9.Name == "GrabParts" then
							v9:Destroy()
						end
					end
				end

				if not antiNetworkOwnership then
					tbl2.Cleanup.Close("ANO_Loop")
					tbl2.Cleanup.Close("ANO_Hamburger")
					tbl2.Cleanup.Disconnect("ANO_Held")
				else
					tbl2.Coroutines.ANO_Loop = coroutine.create(function()
						while tbl3.Defense.AntiNetworkOwnership do
							if humanoidRootPart then
								if not isHeld.Value then
									humanoidRootPart.Massless = false

									if not tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart) then
										tbl2.NetworkOwnership.SetNetworkOwner(humanoidRootPart, nil, true)
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ANO_Loop)

					tbl2.Coroutines.ANO_Hamburger = coroutine.create(function()
						while tbl3.Defense.AntiNetworkOwnership do
							local character2 = character
							local FoodHamburger = character2 and tbl2.ToysManager.SpawnToy("FoodHamburger")

							if FoodHamburger then
								wait()
								local holdPart = FoodHamburger:WaitForChild("HoldPart", 3)

								if holdPart then
									for _, v9 in FoodHamburger:GetChildren() do
										if v9:IsA("BasePart") then
											if v9 ~= holdPart then
												v9:Destroy()
											end
										end
									end

									local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 3)
									local dropItemRemoteFunction = holdPart:WaitForChild("DropItemRemoteFunction", 3)
									local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 3)

									if not (not holdItemRemoteFunction or not dropItemRemoteFunction or not rigidConstraint) then
										tbl2.Connections.ANO_Held = rigidConstraint:GetPropertyChangedSignal("Attachment1"):Connect(function()
											local attachment1 = rigidConstraint.Attachment1

											if attachment1 then
												if not attachment1:IsDescendantOf(character2) then
													tbl2.ToysManager.DestroyToy(FoodHamburger)
												end
											end
										end)

										while not (not holdPart:IsDescendantOf(workspace) or not character2:IsDescendantOf(workspace) or not tbl3.Defense.AntiNetworkOwnership) do
											task.spawn(holdItemRemoteFunction.InvokeServer, holdItemRemoteFunction, FoodHamburger, character2)
											local wait; wait = wait
											local countlz = bit32.countlz
											local len = 0
											local n4 = countlz(len) + string.byte("\212\228\253", 3, nil) - 162
											wait(0.1)
											task.spawn(dropItemRemoteFunction.InvokeServer, dropItemRemoteFunction, FoodHamburger, FoodHamburger:GetPivot() + Vector3.new(0, 10, 0), FoodHamburger:GetPivot() + Vector3.new(0, 10, 0))
											wait(0.1)
										end

										tbl2.Cleanup.Disconnect("ANO_Held")
									end

									tbl2.ToysManager.DestroyToy(FoodHamburger)
								end
							end

							task.wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ANO_Hamburger)
				end
			end

			tabs.Defense:CreateToggle({ Name = "Anti-Network Ownership", Flag = "Anti_Network_Ownership", Callback = callback })
		end

		callback = function(antiKick)
			tbl3.Defense.AntiKick = antiKick

			if not antiKick then
				tbl2.Cleanup.Disconnect("AK_CharacterAdded")
				tbl2.Cleanup.Disconnect("AK_Detected")
				tbl2.Cleanup.Disconnect("AK_Unsticked")
				tbl2.Cleanup.Disconnect("AK_Removed")

				for _, v9 in v5:GetChildren() do
					if not (not v9:IsA("Model") or v9.Name ~= "NinjaKunai" or not v9:GetAttribute("Antikick")) then
						tbl2.ToysManager.DestroyToy(v9)
					end
				end
			else
				local tbl4; tbl4 = { f = function()
					local character2 = character
					local humanoid2 = character2 and humanoid
					local humanoidRootPart2 = humanoid2 and humanoidRootPart
					if not humanoidRootPart2 then
						return
					end

					while not (not tbl3.Defense.AntiGrabGucci or not character2:GetAttribute("Setup_AntiGrabGucci")) do
						wait()
					end

					tbl2.Cleanup.Disconnect("AK_Detected")
					local n2 = 0

					tbl2.Connections.AK_Detected = ReplicatedStorage.GameCorrectionEvents.GameCorrectionsNotify.OnClientEvent:Connect(function(arg)
						if arg:lower() == "flying" then
							n2 += 1

							if n2 >= 2 then
								humanoid2:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
								humanoid2:ChangeState(Enum.HumanoidStateType.Dead)
								humanoid2.Health = 0
								tbl2.Cleanup.Disconnect("AK_Detected")

								v4:Notify({
									Title = "Anti-Kick",
									Content = "You got 2 anti-cheat warnings.",
									Duration = 3,
									Image = "alert-circle",
								})
							end
						end
					end)

					if not tbl2.ToysManager.HasToy("NinjaKunai") then
						v4:Notify({
							Title = "Anti-Kick",
							Content = "Please buy NinjaKunai for proper setup.",
							Duration = 5,
							Image = "alert-circle",
						})

						return
					end

					local tbl4; tbl4 = { f = function()
						if not tbl3.Defense.AntiKick then
							return
						end
						tbl2.Cleanup.Disconnect("AK_Unsticked")
						tbl2.Cleanup.Disconnect("AK_Removed")
						local humanoidRootPart3 = humanoidRootPart2
						local humanoid3 = humanoid2
						local ragdollTouchedHitbox = humanoidRootPart3 and humanoid3 and humanoidRootPart3:WaitForChild("RagdollTouchedHitbox", 3)
						local NinjaKunai = ragdollTouchedHitbox and tbl2.ToysManager.SpawnToy("NinjaKunai", true)
						local stickyPart = NinjaKunai and NinjaKunai:WaitForChild("StickyPart", 3)
						local stickyWeld = stickyPart and stickyPart:WaitForChild("StickyWeld", 3)

						if stickyWeld then
							tbl2.NetworkOwnership.SetNetworkOwner(stickyPart)
							local flag4

							if tbl2.NetworkOwnership.IsNetworkOwned(stickyPart) then
								stickyPart.CanTouch = false
								local cframe = CFrame.Angles
								local rad = math.rad
								tbl2.Remotes.StickyPartEvent:FireServer(stickyPart, ragdollTouchedHitbox, CFrame.new(0, -1, 0) * cframe(0, math.rad(90), rad(90)))
								stickyWeld:Destroy()
								flag4 = true
								local delay = task.delay
								local n3 = 8

								delay(3, function()
									flag4 = false
								end)

								while true do
									if not flag4 or not ragdollTouchedHitbox:IsDescendantOf(workspace) or not stickyPart:IsDescendantOf(workspace) then
										flag4 = tbl2.ToysManager
										flag4 = flag4.DestroyToy
										flag4(NinjaKunai)
										flag4 = task
										flag4 = flag4.spawn
										flag4(tbl4.f)
										return
									else
										if stickyWeld.Part1 == ragdollTouchedHitbox then
											break
										end
										wait()
									end
								end

								tbl2.Connections.AK_Unsticked = stickyWeld:GetPropertyChangedSignal("Part1"):Connect(function()
									if stickyWeld.Part1 ~= ragdollTouchedHitbox then
										tbl2.ToysManager.DestroyToy(NinjaKunai)
										task.spawn(tbl4.f)
									end
								end)

								tbl2.Connections.AK_Removed = stickyPart.AncestryChanged:Connect(function()
									if not NinjaKunai:IsDescendantOf(workspace) or not stickyPart:IsDescendantOf(workspace) then
										if not (not humanoidRootPart3:IsDescendantOf(workspace) or not (humanoid3.Health > 0)) then
											tbl2.ToysManager.DestroyToy(NinjaKunai)
											task.spawn(tbl4.f)
										end
									end
								end)

								tbl2.ModifyDescendants(NinjaKunai, { BasePart = { CanCollide = false, Transparency = 1 } })
								NinjaKunai:SetAttribute("Antikick", true)
								return
							end

							flag4 = tbl2.ToysManager
							flag4 = flag4.DestroyToy
							flag4(NinjaKunai)
							flag4 = task
							flag4 = flag4.spawn
							flag4(tbl4.f)
						end
					end }

					task.spawn(tbl4.f)
				end }

				task.spawn(tbl4.f)
				tbl2.Connections.AK_CharacterAdded = localPlayer.CharacterAdded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Kick", Flag = "Anti_Kick", Callback = callback })

		callback = function(antiLoop)
			tbl3.Defense.AntiLoop = antiLoop

			if not antiLoop then
				tbl2.Cleanup.Disconnect("AL_InPlot")
			else
				local tbl4 = { f = function()
					if not inPlot.Value then
						local v9 = v3
						local cframe = CFrame.new(v9 and tbl2.PlotLocations[v9.Name] or tbl2.PlotLocations["Plot" .. math.random(1, 5)])

						while not inPlot.Value do
							local character2 = localPlayer.Character

							if character2 then
								character2:PivotTo(cframe)

								if humanoidRootPart then
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
								end
							end

							task.wait()
						end

						return
					end
				end }

				task.spawn(tbl4.f)
				tbl2.Connections.AL_InPlot = inPlot:GetPropertyChangedSignal("Value"):Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Loop", Flag = "Anti_Loop", Callback = callback })

		callback = function(antiLagLine)
			tbl3.Defense.AntiLagLine = antiLagLine

			pcall(function()
				localPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = not antiLagLine
			end)
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Lag (Line)", Flag = "Anti_Lag_Line", Callback = callback })

		callback = function(antiBanana)
			tbl3.Defense.AntiBanana = antiBanana

			if not antiBanana then
				tbl2.Cleanup.Disconnect("AB_BananaAdded")
			else
				local tbl4 = { f = function(arg)
					if arg.Parent == v5 then
						return
					end
					local holdPart = arg:WaitForChild("HoldPart", 3)

					if holdPart then
						local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 3)
						local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 3)
						local waitForChild = holdPart.WaitForChild
						local n2 = 85
						local dropItemRemoteFunction = waitForChild(holdPart, "DropItemRemoteFunction", 3)

						if not (not rigidConstraint or not holdItemRemoteFunction or not dropItemRemoteFunction) then
							while not (not arg:IsDescendantOf(workspace) or not tbl3.Defense.AntiBanana) do
								if not rigidConstraint.Attachment1 then
									holdItemRemoteFunction:InvokeServer(arg, localPlayer.Character)
									local cframe = CFrame.new
									local vector = Vector3.new
									local n3 = -math.huge
									dropItemRemoteFunction:InvokeServer(arg, CFrame.new(Vector3.new(0, -math.huge, 0)), cframe(vector(0, n3, 0)))
								end

								task.wait(0.25)
							end
						end
					end
				end }

				tbl2.Connections.AB_BananaAdded = workspace.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "FoodBanana" then
						tbl4.f(descendant)
					end
				end)

				for _, v9 in workspace:GetDescendants() do
					if v9.Name == "FoodBanana" then
						task.spawn(tbl4.f, v9)
					end
				end
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Banana", Flag = "Anti_Banana", Callback = callback })
		local n2 = 30

		callback = function(antiExplosion)
			tbl3.Defense.AntiExplosion = antiExplosion

			if not antiExplosion then
				tbl2.Cleanup.Disconnect("AE_BombExplode")
			else
				tbl2.Connections.AE_BombExplode = workspace.ChildAdded:Connect(function(child)
					if not (not localPlayer.Character or not child:IsA("Part") or not child:FindFirstChild("BillboardGui") and not child:FindFirstChild("SnowPoof") or not ((humanoidRootPart.Position - child.Position).Magnitude < 20)) then
						task.defer(function()
							humanoidRootPart.Anchored = true
							task.wait()
							humanoidRootPart.Anchored = false
						end)

						if not (not humanoid or not humanoidRootPart or not head) then
							task.defer(function()
								wait()

								if not ragdolled.Value then
									ragdolled:GetPropertyChangedSignal("Value"):Wait()
								end

								ragdolled.Value = false
								humanoid.Sit = false
								humanoid.AutoRotate = true
								head.CanCollide = false

								for _, v9 in tbl2.ClientManager.GetRagdollLimbs() do
									if v9 then
										v9.CanCollide = false
									end
								end
							end)
						end
					end
				end)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Explosion", Flag = "Anti_Explosion", Callback = callback })

		callback = function(antiBurn)
			tbl3.Defense.AntiBurn = antiBurn

			pcall(function()
				localPlayer.PlayerGui.ScreenOverlayGui.ScreenOverlayPlacer.Enabled = not antiBurn
				localPlayer.PlayerGui.ScreenOverlayGui.FireFade.Visible = false
			end)

			if not antiBurn then
				tbl2.Cleanup.Disconnect("AB_FireAdded")
			else
				local function fn3(arg)
					if not arg or not arg:IsDescendantOf(workspace) then
						return
					end
					local humanoidRootPart2 = humanoidRootPart
					arg.Enabled = false
					tbl2.Parts.Types.Extinguish.Size = Vector3.one
					tbl2.Parts.Types.Extinguish.Transparency = 1

					while not (not tbl3.Defense.AntiBurn or not arg:IsDescendantOf(workspace) or not humanoidRootPart2:IsDescendantOf(workspace)) do
						tbl2.Parts.Types.Extinguish.Part.AssemblyAngularVelocity = Vector3.one * math.random(-100, 100)
						tbl2.Parts.Types.Extinguish.Part.CFrame = humanoidRootPart2.CFrame
						wait(0.1)
					end

					for k, v9 in tbl2.Parts.Types.Extinguish.Properties do
						tbl2.Parts.Types.Extinguish.Part[k] = v9
					end
				end

				tbl2.Connections.AB_FireAdded = workspace.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "FireLight" then
						if descendant.Parent == humanoidRootPart then
							fn3(descendant)
						end
					end
				end)

				task.spawn(fn3, humanoidRootPart and humanoidRootPart:FindFirstChild("FireLight"))
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Burn", Flag = "Anti_Burn", Callback = callback })

		do
			local defense = tbl2.GuiObjects.Tabs.Defense
			local n3 = 40

			callback = function(antiPoison)
				tbl3.Defense.AntiPoison = antiPoison

				for _, v9 in tbl2.Parts.Types.PoisonHurtParts do
					v9.CanTouch = not antiPoison
				end
			end

			defense:CreateToggle({ Name = "Anti-Poison", Flag = "Anti_Poison", Callback = callback })
		end

		callback = function(antiPaint)
			tbl3.Defense.AntiPaint = antiPaint

			if not antiPaint then
				tbl2.Cleanup.Disconnect("AP_ToyAdded")
				tbl2.Cleanup.Close("AP_")
			else
				local tbl4 = {}

				local function fn3(arg)
					for k, v9 in tbl2.PaintToys[arg.Name] do
						for i = 1, v9 do
							local v10 = arg:WaitForChild(k, 1)

							if v10 then
								v10.Name = "#" .. v10.Name
								tbl4[v10] = v10:FindFirstChildWhichIsA("BoolValue") or { Value = true }
							end
						end
					end
				end

				tbl2.Connections.AP_ToyAdded = workspace.DescendantAdded:Connect(function(descendant)
					if not descendant:IsA("Model") or not tbl2.PaintToys[descendant.Name] then
						return
					end
					fn3(descendant)
				end)

				for _, v9 in workspace:GetDescendants() do
					if not (not v9:IsA("Model") or not tbl2.PaintToys[v9.Name]) then
						task.spawn(fn3, v9)
					end
				end

				while tbl3.Defense.AntiPaint do
					for k in tbl4 do
						k.CanTouch = false
					end

					task.wait()
				end

				for k, v9 in tbl4 do
					k.Name = k.Name:sub(2)
					k.CanTouch = v9.Value
				end
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Paint", Flag = "Anti_Paint", Callback = callback })

		callback = function(antiVoid)
			tbl3.Defense.AntiVoid = antiVoid

			if not antiVoid then
				workspace.FallenPartsDestroyHeight = -100
			else
				workspace.FallenPartsDestroyHeight = "nan"
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Void", Flag = "Anti_Void", Callback = callback })

		do
			local defense = tbl2.GuiObjects.Tabs.Defense
			local defense2 = defense
			local createToggle = defense.CreateToggle
			local tbl4 = { Name = "Anti-Attacker" }
			local n3 = 34
			tbl4.Flag = "Anti_Attacker_Toggle"

			callback = function(toggle)
				tbl3.Defense.AntiAttacker.Toggle = toggle

				if not toggle then
					tbl2.ClientManager.OnGrab.AntiAttacker = nil
				else
					tbl2.ClientManager.OnGrab.AntiAttacker = function(arg)
						local character2 = arg and arg.Character
						local humanoidRootPart2 = character2 and character2:FindFirstChildWhichIsA("Humanoid") and character2:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart2 then
							return
						end

						tbl2.NetworkOwnership.SetNetworkOwner(humanoidRootPart2, function()
							task.spawn(tbl2.ApplyGrabMode, nil, humanoidRootPart2, tbl3.Defense.AntiAttacker.GrabMode, true)
						end)
					end
				end
			end

			tbl4.Callback = callback
			createToggle(defense2, tbl4)
		end

		do
			local defense = tbl2.GuiObjects.Tabs.Defense
			local defense2 = defense
			local createDropdown = defense.CreateDropdown
			local tbl4 = { Name = "Anti-Attacker: Grab Mode" }
			callback = { "Kick", "Kill", "Void", "Fling" }
			local band = bit32.band
			local v9 = 16
			local value = 364
			local n3 = band(225, v9, value) + 81
			tbl4.Options = callback
			callback = {}
			local defense3 = tbl3.Defense
			local countlz = bit32.countlz
			local flag4 = true
			local n4 = countlz(44) + 33
			callback[1] = defense3.AntiAttacker.GrabMode
			tbl4.CurrentOption = callback
			tbl4.MultipleOptions = false
			tbl4.Flag = "Anti_Attacker_Action"

			callback = function(arg)
				tbl3.Defense.AntiAttacker.GrabMode = arg[1]
			end

			tbl4.Callback = callback
			createDropdown(defense2, tbl4)
		end

		tbl2.GuiObjects.Tabs.Defense:CreateSection("Other")

		do
			local tabs = tbl2.GuiObjects.Tabs
			local flag4 = 50 ~= string.byte("\0Uks\178", 5, nil)
			local flag5 = false
			local n3 = 32
			callback = tbl3.Defense
			callback = callback.AntiAFK

			callback = function(antiAFK)
				tbl3.Defense.AntiAFK = antiAFK

				if not antiAFK then
					tbl2.Cleanup.Disconnect("AntiAFK")
				else
					local v9 = cloneref(game:GetService("VirtualUser"))

					tbl2.Connections.AntiAFK = Players.LocalPlayer.Idled:Connect(function()
						v9:CaptureController()
						v9:ClickButton2(Vector2.new())
					end)
				end
			end

			tabs.Defense:CreateToggle({ Name = "Anti-AFK", Flag = "Anti_AFK", CurrentValue = callback, Callback = callback })
		end

		callback = function(antiFling)
			tbl3.Defense.AntiFling = antiFling

			if not antiFling then
				tbl2.Cleanup.Close("AF_Noclip")
				tbl2.Cleanup.Disconnect("AF_CharacterAdded")

				pcall(function()
					character.Head.CanCollide = true
					character.Torso.CanCollide = true
				end)
			else
				local tbl4 = { f = function(arg)
					if not arg then
						return
					end
					arg:WaitForChild("Humanoid", 3)
					local tbl4 = {}

					for _, v9 in { "Head", "Torso", "HumanoidRootPart" } do
						tbl4[#tbl4 + 1] = arg:WaitForChild(v9, 3)
					end

					for _, v9 in tbl2.ClientManager.GetRagdollLimbs() do
						tbl4[#tbl4 + 1] = v9
					end

					tbl2.Coroutines.AF_Noclip = coroutine.create(function()
						while tbl3.Defense.AntiFling do
							for _, v9 in tbl4 do
								v9.CanCollide = false
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.AF_Noclip)
				end }

				task.spawn(tbl4.f, localPlayer.Character)
				tbl2.Connections.AF_CharacterAdded = localPlayer.CharacterAppearanceLoaded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Anti-Fling (Noclip)", Flag = "Anti_Fling", Callback = callback })
		callback = tbl3.Defense
		callback = callback.OceanWalk

		callback = function(oceanWalk)
			tbl3.Defense.OceanWalk = oceanWalk

			for _, v9 in workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel:GetChildren() do
				v9.CanCollide = oceanWalk
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Ocean Walk", Flag = "Ocean_Walk", CurrentValue = callback, Callback = callback })

		callback = function(sitLock)
			tbl3.Defense.SitLock = sitLock

			if not sitLock then
				tbl2.Cleanup.Disconnect("SL_CharacterAdded")
				tbl2.Cleanup.Disconnect("SL_StateChanged")
				tbl2.Cleanup.Disconnect("SL_Sit")

				if not (not humanoid or not humanoid.Sit) then
					if not humanoid.SeatPart then
						humanoid.Sit = false
					end
				end
			else
				local tbl4 = { f = function(arg)
					if not arg or not arg:IsDescendantOf(workspace) then
						return
					end
					local humanoid2 = arg:WaitForChild("Humanoid", 3)
					if not humanoid2 then
						return
					end
					tbl2.Cleanup.Disconnect("SL_StateChanged")
					tbl2.Cleanup.Disconnect("SL_Sit")

					tbl2.Connections.SL_Sit = humanoid2:GetPropertyChangedSignal("Sit"):Connect(function()
						if not humanoid2.Sit then
							humanoid2.Sit = true
						end
					end)

					tbl2.Connections.SL_StateChanged = humanoid2.StateChanged:Connect(function(old, new)
						if not isHeld.Value then
							if new == Enum.HumanoidStateType.Seated and not humanoid2.SeatPart then
								humanoid2:ChangeState(Enum.HumanoidStateType.Running)
							elseif new == Enum.HumanoidStateType.Freefall then
								humanoid2:ChangeState(Enum.HumanoidStateType.Jumping)
							end

							return
						end
					end)

					humanoid2.Sit = true
				end }

				task.spawn(tbl4.f, localPlayer.Character)
				tbl2.Connections.SL_CharacterAdded = localPlayer.CharacterAdded:Connect(tbl4.f)
			end
		end

		tbl2.GuiObjects.Tabs.Defense:CreateToggle({ Name = "Sit Lock", Flag = "SitLock", Callback = callback })

		callback = {
			Name = "Explode Spawned Bombs (Oven)",
			Flag = "ExplodeBombs",
			Callback = function(explodeBombs)
				if explodeBombs then
					if not tbl2.ToysManager.HasToy("OvenDarkGray") then
						task.spawn(tbl2.GuiObjects.ExplodeBombs.Set, tbl2.GuiObjects.ExplodeBombs, false)

						v4:Notify({
							Title = "Explode Spawned Bombs",
							Content = "OvenDarkGray isn't bought",
							Duration = 3,
							Image = "alert-circle",
						})

						return
					end
				end

				tbl3.Defense.ExplodeBombs = explodeBombs

				if not explodeBombs then
					tbl2.Cleanup.Close("ExplodeBombs")
					tbl2.Cleanup.Disconnect("DB_BombAdded")
				else
					tbl2.Coroutines.ExplodeBombs = coroutine.create(function()
						while tbl3.Defense.ExplodeBombs do
							local OvenDarkGray = tbl2.ToysManager.SpawnToy("OvenDarkGray", true)
							wait(0.1)

							if OvenDarkGray then
								local buttonOven = OvenDarkGray:WaitForChild("ButtonOven", 3)
								local v9 = nil

								for _, v10 in OvenDarkGray:GetChildren() do
									if not (v10.Name ~= "FirePlayerPart" or not v10:IsA("BasePart") or not (v10.Color.R < 100)) then
										v9 = v10
										break
									end
								end

								if v9 then
									v9.Size = Vector3.one * 10
									tbl2.NetworkOwnership.StopVelocity(tbl2.NetworkOwnership.GetNetworkablePart(OvenDarkGray))
									tbl2.NetworkOwnership.SetNetworkOwner(buttonOven, nil, true)
									local n3 = math.random(1000, 2500)

									while not (not OvenDarkGray:IsDescendantOf(workspace) or not tbl3.Defense.ExplodeBombs) do
										local v10 = v5

										for k in tbl2.Bombs do
											local flag4 = not k:IsDescendantOf(v10) and tbl2.NetworkOwnership.GetNetworkablePart(k)

											if flag4 then
												flag4.CFrame = v9.CFrame
												firetouchinterest(v9, flag4, 0.1)
											end
										end

										local random = math.random
										OvenDarkGray:PivotTo(CFrame.new(Vector3.new(math.random(-250, 250), n3, random(-250, 250))))
										RunService.RenderStepped:Wait()
									end
								end

								local n3 = -string.byte("\201\254", 2, nil) + 267
								tbl2.ToysManager.DestroyToy(OvenDarkGray)
							end

							wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ExplodeBombs)
				end
			end,
		}

		tbl2.GuiObjects.ExplodeBombs = tbl2.GuiObjects.Tabs.Defense:CreateToggle(callback)
		tbl2.GuiObjects.Tabs.Loop:CreateSection("Activation")
		tbl2.LoopTargets = {}

		do
			local playerListDropdowns = tbl2.GuiObjects.PlayerListDropdowns
			local guiObjects = tbl2.GuiObjects
			local n3 = 33

			callback = {
				Name = "Targets",
				Options = {},
				CurrentOption = {},
				MultipleOptions = true,
				Callback = function(arg)
					tbl3.Loop.Targets = tbl2.PlayerListManager.Format(arg)
				end,
			}

			playerListDropdowns.Loop_Targets = guiObjects.Tabs.Loop:CreateDropdown(callback)
		end

		callback = "Void"
		tbl2.LoopGrabModes = { "Kick", "Kill", callback, "Fling" }

		callback = {
			Name = "Grab Mode",
			Options = tbl2.LoopGrabModes,
			CurrentOption = { tbl3.Loop.GrabMode },
			MultipleOptions = false,
			Flag = "Loop_Action",
			Callback = function(arg)
				tbl3.Loop.GrabMode = arg[1]
			end,
		}

		tbl2.GuiObjects.Loop_GrabMode = tbl2.GuiObjects.Tabs.Loop:CreateDropdown(callback)

		callback = {
			Name = "Loop",
			Callback = function(toggle)
				tbl3.Loop.Toggle = toggle

				if not toggle then
					tbl2.Cleanup.Close("GrabLoop")
					tbl2.LoopApplying = false
				else
					tbl2.GuiObjects.Blobman_Loop_Targets:Set(false)
					tbl2.GuiObjects.Blobman_Loop_All:Set(false)

					tbl2.Coroutines.GrabLoop = coroutine.create(function()
						local n3 = currentReach.Value - 5
						local tbl4 = {}
						local tbl5 = {}

						while tbl3.Loop.Toggle do
							local grabMode = tbl3.Loop.GrabMode

							for k, player in tbl3.Loop.Targets do
								if not player.IsImmune then
									if not player.Values.InPlot.Value then
										local character2 = player.Character
										local humanoid2 = character2.Humanoid
										local humanoidRootPart2 = character2.HumanoidRootPart
										local ragdolled2 = character2.Ragdolled
										local humanoid3 = humanoid
										local humanoidRootPart3 = humanoidRootPart
										local cFrame = humanoidRootPart3.CFrame

										if not (not humanoid3 or not humanoidRootPart3 or not humanoid2 or not humanoidRootPart2 or not ragdolled2 or not humanoidRootPart3:IsDescendantOf(workspace) or not humanoidRootPart2:IsDescendantOf(workspace) or not (humanoid3.Health > 0) or not ((humanoidRootPart2.CFrame.Position - humanoidRootPart3.CFrame.Position).Magnitude < 10000)) then
											if humanoidRootPart2.AssemblyLinearVelocity.Magnitude <= 300 then
												if not (humanoid2.Health > 0) then
													if not ragdolled2.Value then
														continue
													end
												elseif tbl5[humanoidRootPart2] then
													if not ragdolled2.Value then
														continue
													end
												end

												task.delay(1.5, function()
													tbl5[humanoidRootPart2] = nil
												end)

												tbl5[humanoidRootPart2] = true
												local cFrame2 = cFrame
												tbl2.LoopApplying = true
												local now = time()

												while time() - now < 1 do
													local random = math.random
													humanoidRootPart3.CFrame = CFrame.new(humanoidRootPart2.CFrame.Position + Vector3.new(math.random(-n3, n3), -15, random(-n3, n3)))
													local networkOwnership = tbl2.NetworkOwnership
													local bnot = bit32.bnot
													local countlz = bit32.countlz
													local len = 0
													local v10 = countlz(len)
													local n4 = bnot(v10) - 4294967186
													networkOwnership.StopVelocity(humanoidRootPart3, 0.1)
													tbl2.Remotes.SetNetworkOwner:FireServer(humanoidRootPart2, tbl2.NetworkOwnership.NetownPosition(humanoidRootPart2))

													if not player.Values.IsHeld.Value or not tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart2) then
														task.wait()
													else
														task.spawn(tbl2.ApplyGrabMode, nil, humanoidRootPart2, grabMode, true)
														break
													end
												end

												tbl2.LoopApplying = false
												humanoidRootPart3.CFrame = cFrame2
												tbl2.NetworkOwnership.StopVelocity(humanoidRootPart3, 0.1)
												task.wait()
											end
										end
									elseif not tbl4[k] then
										task.spawn(function()
											tbl4[k] = true

											task.delay(5, function()
												tbl4[k] = nil
											end)

											v4:Notify({ Title = "Grab Loop", Content = k.Name .. " is in plot.", Duration = 3, Image = "shield-alert" })
										end)
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.GrabLoop)
				end
			end,
		}

		tbl2.GuiObjects.Grab_Loop_Toggle = tbl2.GuiObjects.Tabs.Loop:CreateToggle(callback)
		tbl2.GuiObjects.Tabs.Blobman:CreateSection("Blobman Loop")

		do
			local playerListDropdowns = tbl2.GuiObjects.PlayerListDropdowns
			local blobman = tbl2.GuiObjects.Tabs.Blobman
			local blobman2 = blobman
			local createDropdown = blobman.CreateDropdown
			callback = { Name = "Targets", Options = {} }
			local n3 = 1
			callback.CurrentOption = {}
			callback.MultipleOptions = true

			callback.Callback = function(arg)
				tbl3.Blobman.Loop.Targets = tbl2.PlayerListManager.Format(arg)
			end

			playerListDropdowns.Blobman_Loop_Target = createDropdown(blobman2, callback)
		end

		callback = { "Kick", "Kill", "Void", "Fling" }
		callback = { tbl3.Blobman.Loop.Method }

		callback = function(arg)
			tbl3.Blobman.Loop.Method = arg[1]
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateDropdown({
			Name = "Method",
			Options = callback,
			CurrentOption = callback,
			MultipleOptions = false,
			Flag = "Blobman_Loop_Method",
			Callback = callback,
		})

		callback = tbl3.Blobman
		callback = callback.Loop
		callback = callback.IgnorePlots

		callback = function(ignorePlots)
			tbl3.Blobman.Loop.IgnorePlots = ignorePlots
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({
			Name = "Ignore Plots",
			Flag = "Blobman_Loop_Ignore_Plots",
			CurrentValue = callback,
			Callback = callback,
		})

		do
			local band = bit32.band
			local flag4 = true
			local n3 = band(491) - 432
		end

		do
			local guiObjects = tbl2.GuiObjects
			local blobman = tbl2.GuiObjects.Tabs.Blobman
			local blobman2 = blobman
			local createToggle = blobman.CreateToggle
			callback = {}
			local n3 = 69
			callback.Name = "Loop Targets"

			callback.Callback = function(targets)
				tbl3.Blobman.Loop.Toggle.Targets = targets

				if not targets then
					tbl2.Cleanup.Close("BlobmanLoopTargets")
					tbl2.LoopApplying = false
				else
					tbl2.GuiObjects.Grab_Loop_Toggle:Set(false)
					tbl2.GuiObjects.Blobman_Loop_All:Set(false)

					tbl2.Coroutines.BlobmanLoopTargets = coroutine.create(function()
						local n4 = currentReach.Value - 5
						local tbl4 = {}
						local tbl5 = {}
						local pivot = nil

						while tbl3.Blobman.Loop.Toggle.Targets do
							local method = tbl3.Blobman.Loop.Method
							local ignorePlots = tbl3.Blobman.Loop.IgnorePlots
							local v9 = v2

							if v9 then
								local model = v9.Model
								local root = v9.Root
								local seat = v9.Seat

								for k, player in tbl3.Blobman.Loop.Targets do
									if not player.IsImmune then
										if not ignorePlots or not player.Values.InPlot.Value then
											local character2 = player.Character
											local humanoid2 = character2.Humanoid
											local humanoidRootPart2 = character2.HumanoidRootPart
											local humanoid3 = humanoid
											local humanoidRootPart3 = humanoidRootPart

											if not (not humanoid3 or not humanoidRootPart3 or not humanoid2 or not humanoidRootPart2) then
												if not tbl5[humanoidRootPart2] and not humanoidRootPart2.Massless then
													if humanoid3.SeatPart then
														if humanoid3.SeatPart == seat then
															if not (not (humanoid3.Health > 0) or not ((humanoidRootPart2.CFrame.Position - humanoidRootPart3.CFrame.Position).Magnitude < 10000)) then
																if humanoidRootPart2.AssemblyLinearVelocity.Magnitude <= 300 and method ~= "Kill" then
																	if humanoid2.Health > 0 then
																		tbl2.LoopApplying = true
																		tbl5[humanoidRootPart2] = true

																		task.delay(3, function()
																			tbl5[humanoidRootPart2] = nil
																		end)

																		pivot = pivot or model:GetPivot()
																		local now = time()

																		while time() - now < 1 do
																			tbl2.NetworkOwnership.StopVelocity(root, 0.1)
																			local random = math.random
																			model:PivotTo(CFrame.new(humanoidRootPart2.CFrame.Position + Vector3.new(math.random(-n4, n4), -15, random(-n4, n4)), humanoidRootPart2.CFrame.Position))
																			v9.Grab("Right", humanoidRootPart2)

																			if v9.GetGrabbedRoot("Right") == humanoidRootPart2 then
																				v9.Drop("Right")
																				tbl2.BlobmanManager.ApplyMethod[method](v9, character2)
																				break
																			else
																				task.wait()
																			end
																		end

																		tbl2.LoopApplying = false
																	end
																end
															end
														end
													end
												end
											end
										elseif not tbl4[k] then
											task.spawn(function()
												tbl4[k] = true

												task.delay(5, function()
													tbl4[k] = nil
												end)

												v4:Notify({
													Title = "Blobman Loop",
													Content = k.Name .. " is in plot.",
													Duration = 3,
													Image = "shield-alert",
												})
											end)
										end
									end
								end

								if pivot then
									tbl2.NetworkOwnership.StopVelocity(root, 0.1)
									model:PivotTo(pivot)
								end
							end

							pivot = nil
							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.BlobmanLoopTargets)
				end
			end

			guiObjects.Blobman_Loop_Targets = createToggle(blobman2, callback)
		end

		do
			local guiObjects = tbl2.GuiObjects
			local guiObjects2 = tbl2.GuiObjects
			local n3 = 33

			callback = {
				Name = "Loop All",
				Callback = function(all)
					tbl3.Blobman.Loop.Toggle.All = all

					if not all then
						tbl2.Cleanup.Close("BlobmanLoopAll")
						tbl2.LoopApplying = false
					else
						tbl2.GuiObjects.Grab_Loop_Toggle:Set(false)
						tbl2.GuiObjects.Blobman_Loop_Targets:Set(false)

						tbl2.Coroutines.BlobmanLoopAll = coroutine.create(function()
							local n4 = currentReach.Value - 5
							local tbl4 = {}
							local pivot = nil

							while tbl3.Blobman.Loop.Toggle.All do
								local method = tbl3.Blobman.Loop.Method
								local ignorePlots = tbl3.Blobman.Loop.IgnorePlots
								local v9 = v2

								if v9 then
									local model = v9.Model
									local root = v9.Root
									local seat = v9.Seat

									for _, player in tbl2.PlayerList do
										if not player.IsImmune and (not ignorePlots or not player.Values.InPlot.Value) then
											local character2 = player.Character
											local humanoid2 = character2.Humanoid
											local humanoidRootPart2 = character2.HumanoidRootPart
											local humanoid3 = humanoid
											local humanoidRootPart3 = humanoidRootPart

											if not (not humanoid3 or not humanoidRootPart3 or not humanoid2 or not humanoidRootPart2) then
												if not tbl4[humanoidRootPart2] and not humanoidRootPart2.Massless then
													if humanoid3.SeatPart then
														if humanoid3.SeatPart == seat then
															if not (not (humanoid3.Health > 0) or not ((humanoidRootPart2.CFrame.Position - humanoidRootPart3.CFrame.Position).Magnitude < 10000)) then
																if humanoidRootPart2.AssemblyLinearVelocity.Magnitude <= 300 and method ~= "Kill" then
																	if humanoid2.Health > 0 then
																		tbl2.LoopApplying = true
																		tbl4[humanoidRootPart2] = true

																		task.delay(3, function()
																			tbl4[humanoidRootPart2] = nil
																		end)

																		pivot = pivot or model:GetPivot()
																		local now = time()

																		while time() - now < 1 do
																			tbl2.NetworkOwnership.StopVelocity(root, 0.1)
																			local pivotTo = model.PivotTo
																			local cframe = CFrame.new
																			local position = humanoidRootPart2.CFrame.Position
																			local vector = Vector3.new
																			local n5 = math.random(-n4, n4)
																			local random = math.random
																			local lrotate = bit32.lrotate
																			local value = 21
																			local n6 = lrotate(483, value) - 1012924390
																			pivotTo(model, cframe(position + vector(n5, -15, random(-n4, n4)), humanoidRootPart2.CFrame.Position))
																			v9.Grab("Right", humanoidRootPart2)

																			if v9.GetGrabbedRoot("Right") == humanoidRootPart2 then
																				v9.Drop("Right")
																				tbl2.BlobmanManager.ApplyMethod[method](v9, character2)
																				break
																			else
																				task.wait()
																			end
																		end

																		tbl2.LoopApplying = false
																	end
																end
															end
														end
													end
												end
											end
										end
									end

									if pivot then
										tbl2.NetworkOwnership.StopVelocity(root, 0.1)
										model:PivotTo(pivot)
									end
								end

								pivot = nil
								RunService.RenderStepped:Wait()
							end
						end)

						coroutine.resume(tbl2.Coroutines.BlobmanLoopAll)
					end
				end,
			}

			guiObjects.Blobman_Loop_All = guiObjects2.Tabs.Blobman:CreateToggle(callback)
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateSection("Control")

		callback = function(autoSit)
			tbl3.Blobman.Control.AutoSit = autoSit

			if not autoSit then
				tbl2.Cleanup.Close("AutoSit")
			else
				tbl2.Coroutines.AutoSit = coroutine.create(function()
					while tbl3.Blobman.Control.AutoSit do
						if not tbl2.BlobmanManager.GetController() then
							local humanoid2 = humanoid

							if not (not humanoid2 or not (humanoid2.Health > 0)) then
								local flag4 = true

								for _, v9 in v5:GetChildren() do
									if not v9:IsA("Model") or v9.Name ~= "CreatureBlobman" then
										continue
									else
										local vehicleSeat = v9:FindFirstChild("VehicleSeat")
										local occupant = vehicleSeat and vehicleSeat.Occupant

										if not occupant then
											flag4 = false

											if vehicleSeat then
												tbl2.ClientManager.Occupy(vehicleSeat, 1)
											end
										elseif occupant ~= humanoid2 then
											tbl2.ToysManager.DestroyToy(v9)
										else
											flag4 = false

											if vehicleSeat then
												tbl2.ClientManager.Occupy(vehicleSeat, 1)
											end
										end

										if not humanoid2.SeatPart then
											continue
										end
									end

									break
								end

								if flag4 then
									tbl2.ToysManager.SpawnToy("CreatureBlobman")
								end
							end
						end

						RunService.RenderStepped:Wait()
					end
				end)

				coroutine.resume(tbl2.Coroutines.AutoSit)
			end
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({ Name = "Auto-Sit", Flag = "Blobman_Control_Auto_Sit", Callback = callback })

		callback = function(antiFling)
			tbl3.Blobman.Control.AntiFling = antiFling

			if not antiFling then
				tbl2.Cleanup.Close("BAF_Noclip")

				if tbl2.ClientManager.UpdateOldBlobman.AF_Clip then
					task.spawn(tbl2.ClientManager.UpdateOldBlobman.AF_Clip, v2)
				end

				tbl2.ClientManager.UpdateOldBlobman.AF_Clip = nil
				tbl2.ClientManager.UpdateNewBlobman.AF_Noclip = nil
			else
				tbl2.ClientManager.UpdateOldBlobman.AF_Clip = function(arg)
					if not arg then
						return
					end

					if arg.Root then
						arg.Root.CanCollide = true
					end
				end

				tbl2.ClientManager.UpdateNewBlobman.AF_Noclip = function(arg)
					if not arg then
						return
					end
					tbl2.Cleanup.Close("BAF_Noclip")
					local tbl4 = {}

					tbl2.Coroutines.BAF_Noclip = coroutine.create(function()
						while tbl3.Defense.AntiFling do
							for _, v9 in tbl4 do
								v9.CanCollide = false
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.BAF_Noclip)

					for i = 1, 5 do
						for _, v9 in arg.Model:GetDescendants() do
							if v9:IsA("BasePart") then
								tbl4[#tbl4 + 1] = v9
							end
						end

						wait(0.1)
						if arg.Seat.Occupant then
							continue
						end
						break
					end
				end

				task.spawn(tbl2.ClientManager.UpdateNewBlobman.AF_Noclip)
			end
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({ Name = "Anti-Fling (Noclip)", Flag = "Blobman_Control_Anti_Fling", Callback = callback })
		tbl2.GuiObjects.Tabs.Blobman:CreateSection("Method Settings")

		tbl2.BlobmanManager.UpdateMethodSettings = function()
			for _, player in tbl2.PlayerList do
				if not player.IsImmune then
					local character2 = player.Character

					if character2 then
						local humanoid2 = character2.Humanoid
						local humanoidRootPart2 = character2.HumanoidRootPart

						if not (not humanoid2 or not (humanoid2.Health > 0) or not humanoidRootPart2 or not tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart2)) then
							for k, v10 in tbl3.Blobman.MethodSettings do
								humanoid2[k] = v10
							end
						end
					end
				end
			end
		end

		callback = tbl3.Blobman
		callback = callback.Manual
		callback = callback.AutoUpdate

		callback = function(autoUpdate)
			tbl3.Blobman.Manual.AutoUpdate = autoUpdate

			if tbl3.Blobman.Manual.AutoUpdate then
				task.spawn(tbl2.BlobmanManager.UpdateMethodSettings)
			end
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({
			Name = "Auto-Update On Change",
			Flag = "Blobman_MS_Auto_Update",
			CurrentValue = callback,
			Callback = callback,
		})

		for k, v9 in tbl3.Blobman.MethodSettings do
			callback = tbl2.BlobmanManager
			callback = callback.ApplyMethod

			callback[k] = function(arg, character2)
				tbl2.BlobmanManager.ApplyMethod.NetOwn(arg, character2)
				character2.Humanoid[k] = tbl3.Blobman.MethodSettings[k]
			end

			callback = "Blobman_MS_" .. k

			tbl2.GuiObjects[callback] = tbl2.GuiObjects.Tabs.Blobman:CreateInput({
				Name = k,
				CurrentValue = v9,
				PlaceholderText = k,
				RemoveTextAfterFocusLost = false,
				Flag = callback,
				Callback = function(arg)
					local num = tonumber(arg)

					if not num then
						tbl2.GuiObjects[callback]:Set("0")
					else
						tbl3.Blobman.MethodSettings[k] = num

						if tbl3.Blobman.Manual.AutoUpdate then
							task.spawn(tbl2.BlobmanManager.UpdateMethodSettings)
						end
					end
				end,
			})
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateSection("Manual")

		do
			local blobman = tbl2.GuiObjects.Tabs.Blobman
			local blobman2 = blobman
			local createDropdown = blobman.CreateDropdown
			local tbl4 = { Name = "Method" }
			callback = {}
			local n3 = 36
			callback[1] = "Kick"
			callback[2] = "Kill"
			callback[3] = "Void"
			callback[4] = "Fling"
			callback[5] = "WalkSpeed"
			callback[6] = "JumpPower"
			callback[7] = "HipHeight"
			tbl4.Options = callback
			callback = { tbl3.Blobman.Manual.Method }
			tbl4.CurrentOption = callback
			tbl4.MultipleOptions = false
			tbl4.Flag = "Blobman_Manual_Method"

			callback = function(arg)
				tbl3.Blobman.Manual.Method = arg[1]
			end

			tbl4.Callback = callback
			createDropdown(blobman2, tbl4)
		end

		callback = function(toggle)
			tbl3.Blobman.Manual.Toggle = toggle

			if not toggle then
				tbl2.ClientManager.UpdateNewBlobman.Manual = nil
				tbl2.Cleanup.Disconnect("ManualLeft")
				tbl2.Cleanup.Disconnect("ManualRight")
			else
				tbl2.ClientManager.UpdateNewBlobman.Manual = function()
					local v9 = v2
					if not v9 then
						return
					end
					tbl2.Cleanup.Disconnect("ManualLeft")
					tbl2.Cleanup.Disconnect("ManualRight")
					local tbl4 = {}

					local tbl5 = { f = function()
						wait()

						for _, v10 in { "Left", "Right" } do
							task.spawn(function()
								local attachment0 = v9.Welds.Left.Attachment0

								if attachment0 then
									if not tbl4[attachment0] then
										local model = attachment0:FindFirstAncestorWhichIsA("Model")
										local playerFromCharacter = model and Players:GetPlayerFromCharacter(model)
										local character2 = playerFromCharacter and tbl2.PlayerList[playerFromCharacter].Character

										if not (not character2 or not character2.Humanoid or not character2.Humanoid.Sit) then
											if not character2.Humanoid.AutoRotate then
												local n3 = 13
												tbl4[attachment0] = true
												v9.Drop(v10)
												tbl2.NetworkOwnership.LoseNetworkOwner(character2.HumanoidRootPart)
												tbl2.WaitProperty(character2.Humanoid, "Sit", false, 0.5)
												tbl2.WaitProperty(character2.Humanoid, "AutoRotate", true, 0.5)
												task.wait(0.75)

												if v9 then
													if (character2.HumanoidRootPart.CFrame.Position - v9.Root.CFrame.Position).Magnitude <= currentReach.Value then
														tbl2.BlobmanManager.ApplyMethod[tbl3.Blobman.Manual.Method](v9, character2)
													end
												end

												task.wait(1)
												tbl4[attachment0] = nil
											end
										end
									end
								end
							end)
						end
					end }

					task.spawn(tbl5.f)
					tbl2.Connections.ManualLeft = v9.Welds.Left:GetPropertyChangedSignal("Attachment0"):Connect(tbl5.f)
					tbl2.Connections.ManualRight = v9.Welds.Right:GetPropertyChangedSignal("Attachment0"):Connect(tbl5.f)
				end

				task.spawn(tbl2.ClientManager.UpdateNewBlobman.Manual)
			end
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({ Name = "Apply On Blobman Grab", Flag = "Blobman_Manual_Toggle", Callback = callback })
		tbl2.GuiObjects.Tabs.Blobman:CreateSection("Aura")

		do
			local blobman = tbl2.GuiObjects.Tabs.Blobman
			local blobman2 = blobman
			local createDropdown = blobman.CreateDropdown
			local tbl4 = { Name = "Method" }
			callback = {}
			local rrotate = bit32.rrotate
			local bnot = bit32.bnot
			local v9 = 4
			local n3 = rrotate(bnot(v9), 19) - 4294934489
			callback[1] = "Kick"
			callback[2] = "Kill"
			callback[3] = "Void"
			callback[4] = "Fling"
			callback[5] = "WalkSpeed"
			callback[6] = "JumpPower"
			callback[7] = "HipHeight"
			tbl4.Options = callback
			callback = { tbl3.Blobman.Auras.Method }
			tbl4.CurrentOption = callback
			tbl4.MultipleOptions = false
			tbl4.Flag = "Blobman_Aura_Method"

			callback = function(arg)
				tbl3.Blobman.Auras.Method = arg[1]
			end

			tbl4.Callback = callback
			createDropdown(blobman2, tbl4)
		end

		callback = function(toggle)
			tbl3.Blobman.Auras.Toggle = toggle

			if not toggle then
				tbl2.Cleanup.Close("BlobmanAura")
			else
				tbl2.Coroutines.BlobmanAura = coroutine.create(function()
					local tbl4 = {}

					while tbl3.Blobman.Auras.Toggle do
						for _, player in tbl2.PlayerList do
							if not player.IsImmune then
								local v10 = v2
								local character2 = player.Character
								local model = character2.Model

								if not (not v10 or not model) then
									if not tbl4[model] then
										local humanoid2 = character2.Humanoid
										local humanoidRootPart2 = character2.HumanoidRootPart

										if not (not humanoid2 or not humanoidRootPart2) then
											if (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude <= currentReach.Value then
												if not humanoid2.SeatPart then
													v10.Grab("Right", humanoidRootPart2, function()
														v10.Drop("Right")
														tbl4[model] = true

														task.delay(3, function()
															tbl4[model] = nil
														end)

														tbl2.BlobmanManager.ApplyMethod[tbl3.Blobman.Auras.Method](v10, character2)
													end)
												else
													task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, humanoidRootPart2, nil, true)
												end
											end
										end
									end
								end
							end
						end

						RunService.RenderStepped:Wait()
					end
				end)

				coroutine.resume(tbl2.Coroutines.BlobmanAura)
			end
		end

		tbl2.GuiObjects.Tabs.Blobman:CreateToggle({ Name = "Blobman Aura", Callback = callback })
		tbl2.GuiObjects.Tabs.Lag:CreateSection("Lines (Low FPS)")

		callback = function(toggle)
			tbl3.Lag.Lines.Toggle = toggle

			if not toggle then
				tbl2.Cleanup.Close("Lag_Lines")
			else
				tbl2.Coroutines.Lag_Lines = coroutine.create(function()
					local spawnLocation = workspace:FindFirstChild("SpawnLocation")
					if not spawnLocation then
						return
					end

					while tbl3.Lag.Lines.Toggle do
						for i = 1, tbl3.Lag.Lines.Amount do
							tbl2.Remotes.CreateGrabLine:FireServer(spawnLocation, spawnLocation.CFrame)
						end

						wait(1)
					end

					tbl2.Remotes.DestroyGrabLine:FireServer(spawnLocation)
				end)

				coroutine.resume(tbl2.Coroutines.Lag_Lines)
			end
		end

		tbl2.GuiObjects.Tabs.Lag:CreateToggle({ Name = "Spam Lines", Callback = callback })
		callback = { 1, 1000 }
		callback = tbl3.Lag
		callback = callback.Lines
		callback = callback.Amount

		callback = function(amount)
			tbl3.Lag.Lines.Amount = amount
		end

		tbl2.GuiObjects.Tabs.Lag:CreateSlider({
			Name = "Lines Amount",
			Range = callback,
			Increment = 1,
			CurrentValue = callback,
			Flag = "Lag_Lines",
			Callback = callback,
		})

		tbl2.GuiObjects.Tabs.Auras:CreateSection("Player Auras")

		for _, value in ipairs({
			"Grab",
			"Line",
			"Kick",
			"Kill",
			"Void",
			"Fling",
			"Noclip",
			"Unstick",
			"Crazy",
			"Spin",
			"Orbit",
		}) do
			callback = tbl3.Auras
			callback = callback.Player
			callback[value] = false
			callback = tbl2.GuiObjects

			callback[value .. "Aura"] = tbl2.GuiObjects.Tabs.Auras:CreateToggle({
				Name = value .. " Aura",
				Callback = function(arg)
					tbl3.Auras.Player[value] = arg
					task.spawn(tbl2.AuraManager.Start, arg)
				end,
			})
		end

		callback = function()
			local tbl4 = { "Kill", "Kick", "Void", "Fling", "Noclip", "Crazy" }
			local v9 = tbl4[math.random(1, #tbl4)]

			if not (not humanoidRootPart or not humanoid) then
				for _, player in tbl2.PlayerList do
					if not player.IsImmune then
						local character2 = player.Character

						if character2 and character2.Model then
							local humanoid2 = character2.Humanoid
							local humanoidRootPart2 = character2.HumanoidRootPart

							if not (not humanoid2 or not humanoidRootPart2 or not (humanoid2.Health > 0)) then
								if (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude <= currentReach.Value then
									task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, humanoidRootPart2, function()
										task.spawn(tbl2.ApplyGrabMode, nil, humanoidRootPart2, v9, true)
									end)
								end
							end
						end
					end
				end
			end
		end

		tbl2.GuiObjects.Tabs.Auras:CreateKeybind({
			Name = "One-Time Aura",
			CurrentKeybind = "C",
			HoldToInteract = false,
			Flag = "Bind_OneTime_Aura",
			Callback = callback,
		})

		tbl2.GuiObjects.Tabs.Auras:CreateSection("Other Auras")
		tbl3.Auras.Other.Food = false

		callback = {
			Name = "Food Aura",
			Flag = "Auras_Food",
			Callback = function(food)
				tbl3.Auras.Other.Food = food

				if not food then
					tbl2.Cleanup.Close("FoodAura")

					for k, v9 in tbl2.Food do
						local dropItemRemoteFunction = v9:FindFirstChild("DropItemRemoteFunction")
						local rigidConstraint = dropItemRemoteFunction and v9:FindFirstChildWhichIsA("RigidConstraint")
						local attachment1 = rigidConstraint and rigidConstraint.Attachment1

						if not (not attachment1 or not attachment1:IsDescendantOf(character)) then
							local cframe = CFrame.new
							local vector = Vector3.new
							local n3 = -math.huge
							dropItemRemoteFunction:InvokeServer(k, CFrame.new(Vector3.new(0, -math.huge, 0)), cframe(vector(0, n3, 0)))
						end
					end

					local n3 = 13
				else
					local tbl4 = {}

					tbl2.Coroutines.FoodAura = coroutine.create(function()
						while tbl3.Auras.Other.Food do
							for k, v9 in tbl2.Food do
								if humanoidRootPart then
									local n3 = string.byte("\0\19\220", 1, nil) + 13

									if not tbl4[k] and (humanoidRootPart.CFrame.Position - v9.CFrame.Position).Magnitude <= 50 then
										local holdItemRemoteFunction = v9:FindFirstChild("HoldItemRemoteFunction")
										local dropItemRemoteFunction = v9:FindFirstChild("DropItemRemoteFunction")
										local rigidConstraint = holdItemRemoteFunction and dropItemRemoteFunction and v9:FindFirstChildWhichIsA("RigidConstraint")

										if rigidConstraint then
											if not rigidConstraint.Attachment1 then
												tbl4[k] = true
												holdItemRemoteFunction:InvokeServer(k, character)
												tbl2.Remotes.Use:FireServer(k)

												task.delay(k.Name == "FoodMushroomPoison" and 1 or 3, function()
													tbl4[k] = false

													if k:IsDescendantOf(workspace) then
														local cframe = CFrame.new
														local vector = Vector3.new
														local n4 = -math.huge
														dropItemRemoteFunction:InvokeServer(k, CFrame.new(Vector3.new(0, -math.huge, 0)), cframe(vector(0, n4, 0)))
													end
												end)
											end
										end
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.FoodAura)
				end
			end,
		}

		tbl2.GuiObjects.FoodAura = tbl2.GuiObjects.Tabs.Auras:CreateToggle(callback)
		tbl3.Auras.Other.FearDecoy = false

		callback = {
			Name = "Fear Decoys Aura",
			Flag = "Auras_FearDecoy",
			Callback = function(fearDecoy)
				tbl3.Auras.Other.FearDecoy = fearDecoy

				if not fearDecoy then
					tbl2.Cleanup.Close("FearDecoyAura")
				else
					local tbl4 = {}

					tbl2.Coroutines.FearDecoyAura = coroutine.create(function()
						while tbl3.Auras.Other.FearDecoy do
							for k, character2 in tbl2.Decoys do
								if not tbl4[k] then
									if humanoidRootPart then
										if (humanoidRootPart.CFrame.Position - character2.RootPart.CFrame.Position).Magnitude <= currentReach.Value then
											if not tbl2.NetworkOwnership.IsNetworkOwned(character2.RootPart) then
												task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, character2.RootPart, nil, true)
											else
												tbl4[k] = true

												if character2.Humanoid.Sit then
													character2.RTH.CanTouch = false
													character2.Humanoid.Sit = false
													tbl2.NetworkOwnership.StopVelocity(character2.RootPart, 1.5)
													tbl2.NetworkOwnership.LoseNetworkOwner(character2.RootPart)
												end

												local n3 = -(humanoidRootPart.CFrame.Position - character2.RootPart.CFrame.Position).Unit
												local n4 = 59
												local n5 = character2.RootPart.CFrame.Position + n3 * 50
												local walkSpeed = character2.Humanoid.WalkSpeed
												character2.Humanoid.WalkSpeed = 50
												character2.Humanoid:MoveTo(n5)

												task.delay(1, function()
													tbl4[k] = false

													if character2.Humanoid.WalkSpeed ~= 50 then
														character2.Humanoid.WalkSpeed = 50
													else
														character2.Humanoid.WalkSpeed = walkSpeed
													end
												end)
											end
										end
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.FearDecoyAura)
				end
			end,
		}

		tbl2.GuiObjects.FearDecoy = tbl2.GuiObjects.Tabs.Auras:CreateToggle(callback)
		tbl3.Auras.Other.Explode = false

		do
			local guiObjects = tbl2.GuiObjects
			local auras = tbl2.GuiObjects.Tabs.Auras
			local auras2 = auras
			local createToggle = auras.CreateToggle
			callback = { Name = "Explode Aura", Flag = "Auras_ExplodeBombs" }

			local function callback2(explode)
				tbl3.Auras.Other.Explode = explode

				if not explode then
					tbl2.Cleanup.Close("ExplodeAura")
				else
					tbl2.Coroutines.ExplodeAura = coroutine.create(function()
						while tbl3.Auras.Other.Explode do
							for k, v9 in tbl2.Bombs do
								if humanoidRootPart then
									if (humanoidRootPart.CFrame.Position - v9.Hitbox.CFrame.Position).Magnitude <= currentReach.Value then
										task.spawn(tbl2.NetworkOwnership.SetNetworkOwner, v9.NetworkablePart, function()
											tbl2.NetworkOwnership.StopVelocity(v9.NetworkablePart, 1)
											local n3 = humanoidRootPart.CFrame.Position + -(humanoidRootPart.CFrame.Position - v9.Hitbox.CFrame.Position).Unit * 100
											k:PivotTo(CFrame.new(n3))
											task.wait(0.1)
											tbl2.BombsManager.Explode(k, nil, n3)
										end)
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ExplodeAura)
				end
			end

			local bor = bit32.bor
			local value = 367
			local n3 = bor(7424, 159, value) - 7649
			callback.Callback = callback2
			guiObjects.ExplodeAura = createToggle(auras2, callback)
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateSection("Setup")
		tbl2.GuiObjects.DecoyFlags = {}

		callback = function(toggle)
			tbl3.Decoys.Toggle = toggle

			if not toggle then
				tbl2.Cleanup.Disconnect("DecoyAdded")
				tbl2.LocalDecoys = {}

				for k in tbl2.GuiObjects.DecoyFlags do
					task.defer(function()
						tbl2.GuiObjects.DecoyFlags[k]:Set(false)
					end)
				end
			else
				local tbl4 = { f = function(arg)
					local humanoid2 = arg:WaitForChild("Humanoid", 3)
					local humanoidRootPart2 = arg:WaitForChild("HumanoidRootPart", 3)

					if humanoid2 then
						humanoid2:WaitForChild("Ragdolled")
					end

					local ragdollTouchedHitbox = humanoidRootPart2 and humanoidRootPart:WaitForChild("RagdollTouchedHitbox")
					if not ragdollTouchedHitbox then
						return
					end
					tbl2.NetworkOwnership.StopVelocity(humanoidRootPart2, 3)
					humanoid2.WalkSpeed = tbl3.Decoys.Speed
					humanoid2.UseJumpPower = true
					humanoid2.JumpPower = tbl3.Decoys.JumpPower
					local touchInterest = ragdollTouchedHitbox:FindFirstChild("TouchInterest")

					if touchInterest then
						touchInterest:Destroy()
					end

					ragdollTouchedHitbox.CanTouch = false

					tbl2.NetworkOwnership.SetNetworkOwner(humanoidRootPart2, function()
						humanoid2.Sit = false
						tbl2.NetworkOwnership.LoseNetworkOwner(humanoidRootPart2)
					end)

					task.wait(2)

					if not tbl2.NetworkOwnership.IsNetworkOwned(humanoidRootPart2) then
						local flag4 = 236 >= string.byte("\209\213\26\190", 4, nil)
						tbl2.ToysManager.DestroyToy(arg)
					end

					if tbl3.Decoys.Fling then
						wait()
						local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
						bodyAngularVelocity.Name = "FlingBAV"
						bodyAngularVelocity.Parent = humanoidRootPart2
						bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
						bodyAngularVelocity.AngularVelocity = Vector3.new(0, 10000, 0)
						bodyAngularVelocity.P = math.huge
						tbl2.ModifyDescendants(arg, { BasePart = { CanCollide = false } })
					end

					if not tbl3.Decoys.Toggle then
						return
					end
					tbl2.LocalDecoys[arg] = { Humanoid = humanoid2, RootPart = humanoidRootPart2 }
				end }

				tbl2.Connections.DecoyAdded = workspace.DescendantAdded:Connect(function(descendant)
					if not (descendant.Name ~= "YouDecoy" or not descendant:IsDescendantOf(v5)) then
						tbl4.f(descendant)
					end
				end)

				for _, v9 in v5:GetChildren() do
					if v9.Name == "YouDecoy" then
						tbl4.f(v9)
					end
				end
			end
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateToggle({ Name = "Control Decoys", Flag = "Control_Decoys", Callback = callback })

		callback = {
			Name = "Target",
			Options = {},
			CurrentOption = {},
			MultipleOptions = false,
			Callback = function(arg)
				tbl3.Decoys.Target = tbl2.PlayerListManager.Format(arg, 1)
			end,
		}

		tbl2.GuiObjects.PlayerListDropdowns.NPC_Target = tbl2.GuiObjects.Tabs.Decoys:CreateDropdown(callback)
		tbl2.GuiObjects.Tabs.Decoys:CreateSection("Movement")

		callback = {
			Name = "Follow",
			Flag = "NPC_Follow",
			Callback = function(follow)
				tbl3.Decoys.Follow = follow

				if not follow then
					tbl2.Cleanup.Close("NPC_Follow")
				else
					if not tbl3.Decoys.Toggle then
						tbl2.GuiObjects.DecoyFlags.NPC_Follow:Set(false)
						return
					end

					tbl2.Coroutines.NPC_Follow = coroutine.create(function()
						while tbl3.Decoys.Follow do
							local target = tbl3.Decoys.Target
							local character2 = target and target.Character
							local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart2 then
								local cFrame = humanoidRootPart2.CFrame

								for _, character3 in tbl2.LocalDecoys do
									if (cFrame.Position - character3.RootPart.CFrame.Position).Magnitude >= 5 then
										character3.Humanoid:MoveTo(humanoidRootPart2.CFrame.Position)
									end
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.NPC_Follow)
				end
			end,
		}

		tbl2.GuiObjects.DecoyFlags.NPC_Follow = tbl2.GuiObjects.Tabs.Decoys:CreateToggle(callback)

		callback = {
			Name = "Should Jump",
			Flag = "NPC_Jump",
			Callback = function(jump)
				tbl3.Decoys.Jump = jump

				if not jump then
					tbl2.Cleanup.Close("NPC_Jump")
				else
					if not tbl3.Decoys.Toggle then
						tbl2.GuiObjects.DecoyFlags.NPC_Jump:Set(false)
						return
					end

					tbl2.Coroutines.NPC_Jump = coroutine.create(function()
						while tbl3.Decoys.Jump do
							for _, character2 in tbl2.LocalDecoys do
								character2.Humanoid.Jump = true
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.NPC_Jump)
				end
			end,
		}

		tbl2.GuiObjects.DecoyFlags.NPC_Jump = tbl2.GuiObjects.Tabs.Decoys:CreateToggle(callback)
		callback = { 0, 200 }
		callback = tbl3.Decoys
		callback = callback.Speed

		callback = function(speed)
			tbl3.Decoys.Speed = speed

			for _, character2 in tbl2.LocalDecoys do
				character2.Humanoid.WalkSpeed = speed
			end
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateSlider({
			Name = "Walk Speed",
			Range = callback,
			Increment = 1,
			CurrentValue = callback,
			Flag = "NPC_Speed",
			Callback = callback,
		})

		do
			local decoys = tbl2.GuiObjects.Tabs.Decoys
			local decoys2 = decoys
			local createSlider = decoys.CreateSlider
			callback = { 0, 300 }
			callback = tbl3.Decoys
			callback = callback.JumpPower

			local tbl4 = {
				Name = "Jump Power",
				Range = callback,
				Increment = 1,
				CurrentValue = callback,
				Flag = "NPC_JumpPower",
			}

			callback = function(jumpPower)
				tbl3.Decoys.JumpPower = jumpPower

				for _, character2 in tbl2.LocalDecoys do
					character2.Humanoid.JumpPower = jumpPower
				end
			end

			local n3 = 65
			tbl4.Callback = callback
			createSlider(decoys2, tbl4)
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateSection("Other")

		callback = {
			Name = "Loop Teleport",
			Flag = "NPC_Loop_Teleport",
			Callback = function(teleport)
				tbl3.Decoys.Teleport = teleport

				if not teleport then
					tbl2.Cleanup.Close("NPC_Loop_Teleport")
				else
					if not tbl3.Decoys.Toggle then
						tbl2.GuiObjects.DecoyFlags.NPC_Loop_Teleport:Set(false)
						return
					end

					tbl2.Coroutines.NPC_Loop_Teleport = coroutine.create(function()
						while tbl3.Decoys.Teleport do
							local target = tbl3.Decoys.Target
							local character2 = target and target.Character
							local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart2 then
								for _, v9 in tbl2.LocalDecoys do
									tbl2.NetworkOwnership.StopVelocity(v9.RootPart, 0.1)
									v9.RootPart.CFrame = humanoidRootPart2.CFrame
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.NPC_Loop_Teleport)
				end
			end,
		}

		tbl2.GuiObjects.DecoyFlags.NPC_Loop_Teleport = tbl2.GuiObjects.Tabs.Decoys:CreateToggle(callback)

		callback = {
			Name = "Fling",
			Flag = "NPC_Fling",
			Callback = function(fling)
				tbl3.Decoys.Fling = fling

				if not fling then
					for _, v9 in tbl2.LocalDecoys do
						for _, v10 in v9.RootPart:GetChildren() do
							if v10.Name == "FlingBAV" then
								v10:Destroy()
							end
						end
					end
				else
					if not tbl3.Decoys.Toggle then
						tbl2.GuiObjects.DecoyFlags.NPC_Fling:Set(false)
						return
					end

					for k, v9 in tbl2.LocalDecoys do
						local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
						bodyAngularVelocity.Name = "FlingBAV"
						bodyAngularVelocity.Parent = v9.RootPart
						bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
						bodyAngularVelocity.AngularVelocity = Vector3.new(0, 10000, 0)
						bodyAngularVelocity.P = math.huge
						tbl2.ModifyDescendants(k, { BasePart = { CanCollide = false } })
					end
				end
			end,
		}

		tbl2.GuiObjects.DecoyFlags.NPC_Fling = tbl2.GuiObjects.Tabs.Decoys:CreateToggle(callback)

		callback = function()
			v4:Notify({
				Title = "NPC Possession",
				Content = "Grab any type of NPC to possess it in next 5 seconds!",
				Duration = 5,
				Image = "timer",
			})

			tbl2.Cleanup.Close("NP_Choosing")
			tbl2.NP_Choosing_NPC = true

			tbl2.Coroutines.NP_Choosing = coroutine.create(function()
				task.wait(5)
				tbl2.NP_Choosing_NPC = nil
			end)

			coroutine.resume(tbl2.Coroutines.NP_Choosing)
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateButton({ Name = "Possess a NPC", Callback = callback })

		callback = function()
			if tbl2.PossessionManager.Target then
				v4:Notify({
					Title = "NPC Possession",
					Content = "Dispossessed " .. tbl2.PossessionManager.Target.Name,
					Duration = 3,
					Image = "user-minus",
				})

				tbl2.PossessionManager.Target = nil
				tbl2.Cleanup.Close("NP_Choosing")
			end
		end

		tbl2.GuiObjects.Tabs.Decoys:CreateButton({ Name = "Dispossess Current NPC", Callback = callback })

		do
			local decoys = tbl2.GuiObjects.Tabs.Decoys
			local decoys2 = decoys
			local createKeybind = decoys.CreateKeybind
			local lshift = bit32.lshift
			local flag4 = false
			local n3 = lshift(120, 18) - 31457246

			callback = function()
				if not tbl2.PossessionManager.Target then
					local target = mouse.Target
					local model = target and target:FindFirstAncestorWhichIsA("Model")

					if model and model:FindFirstChildWhichIsA("Humanoid") then
						tbl2.NP_Choosing_NPC = false
						task.spawn(tbl2.PossessionManager.Possess, model)
						tbl2.NetworkOwnership.StopVelocity(target, 1)
						tbl2.NetworkOwnership.LoseNetworkOwner(target)
						tbl2.Cleanup.Close("NP_Choosing")
					end
				else
					v4:Notify({
						Title = "NPC Possession",
						Content = "Dispossessed " .. tbl2.PossessionManager.Target.Name,
						Duration = 3,
						Image = "user-minus",
					})

					tbl2.PossessionManager.Target = nil
					tbl2.Cleanup.Close("NP_Choosing")
				end
			end

			createKeybind(decoys2, {
				Name = "Possess/Dispossess NPC",
				CurrentKeybind = "K",
				HoldToInteract = false,
				Flag = "Bind_Possession",
				Callback = callback,
			})
		end

		do
			local create = tbl2.AutoSpawnManager.Create
			local bombs = tbl2.GuiObjects.Tabs.Bombs

			callback = {
				"BallSnowball",
				"BombBalloon",
				"BombDarkMatter",
				"BombMissile",
				"FireworkMissile",
				"PresentBig",
				"PresentSmall",
			}

			local flag4 = false
			local n3 = 96

			create(bombs, "Bombs", callback, 20, function(arg)
				task.spawn(function()
					for i = 1, 5 do
						tbl2.ModifyDescendants(arg, { BasePart = { CanCollide = false, CanTouch = false } })
						wait()
					end
				end)

				local v9 = arg:WaitForChild(tbl2.BombToys[arg.Name].Hitbox, 3)
				if not tbl2.NetworkOwnership.IsNetworkOwned(arg) then
					return
				end
				local position = arg:GetPivot().Position
				arg:PivotTo(CFrame.new(position + Vector3.new(0, 10000, 0)))
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Velocity = Vector3.new(0, 25000, 0)
				bodyVelocity.MaxForce = Vector3.one * math.huge
				bodyVelocity.Parent = v9
				wait(0.25)

				if math.abs(position.Y - arg:GetPivot().Position.Y) <= 1000 then
					tbl2.ToysManager.DestroyToy(arg)
				end
			end)
		end

		tbl2.GuiObjects.Tabs.Bombs:CreateSection("Bomb Target")

		callback = {
			Name = "Target",
			Options = {},
			CurrentOption = {},
			MultipleOptions = false,
			Callback = function(arg)
				tbl3.Bombs.Target = tbl2.PlayerListManager.Format(arg, 1)
			end,
		}

		tbl2.GuiObjects.PlayerListDropdowns.Bombs = tbl2.GuiObjects.Tabs.Bombs:CreateDropdown(callback)

		callback = function(loop)
			tbl3.Bombs.Loop = loop

			if not loop then
				tbl2.Cleanup.Close(tbl2.Coroutines.LoopExplode)
			else
				tbl2.Coroutines.LoopExplode = coroutine.create(function()
					while tbl3.Bombs.Loop do
						local target = tbl3.Bombs.Target
						local character2 = target and not Controller.IsImmune and target.Character
						local humanoidRootPart2 = character2 and character2:FindFirstChildWhichIsA("Humanoid") and character2:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 then
							local tbl4 = {}

							for k, v9 in tbl2.Bombs do
								if not (not k:IsDescendantOf(v5) or not tbl2.NetworkOwnership.IsNetworkOwned(v9.NetworkablePart)) then
									tbl4[#tbl4 + 1] = k
								end
							end

							for k in tbl4 do
								if not (tbl3.Bombs.Delay > 0) then
									for _, v9 in tbl4 do
										tbl2.BombsManager.Explode(v9, humanoidRootPart2)
									end
								else
									for _, v9 in tbl4 do
										tbl2.BombsManager.Explode(v9, humanoidRootPart2)
										task.wait(tbl3.Bombs.Delay)
									end
								end
							end
						end

						RunService.RenderStepped:Wait()
						local bxor = bit32.bxor
						local byte = string.byte("le3", 2, nil)
						local value = 409
						local n3 = bxor(byte, 94, value) - 405
					end
				end)

				coroutine.resume(tbl2.Coroutines.LoopExplode)
			end
		end

		tbl2.GuiObjects.Tabs.Bombs:CreateToggle({ Name = "Loop Explode", Flag = "Bombs_Loop", Callback = callback })
		callback = { 0, 1 }
		callback = tbl3.Bombs
		callback = callback.Delay

		callback = function(delay)
			tbl3.Bombs.Delay = delay
		end

		tbl2.GuiObjects.Tabs.Bombs:CreateSlider({
			Name = "Explosion Delay",
			Range = callback,
			Increment = 0.05,
			CurrentValue = callback,
			Flag = "Bombs_Delay",
			Callback = callback,
		})

		tbl2.ESPModule = {}
		tbl2.ESPModule.Character = { Controllers = {} }
		tbl2.ESPModule.PCLD = { Controllers = {} }

		tbl2.ESPModule.Character.Cleanup = function(arg)
			if not (not arg or not tbl2.ESPModule.Character.Controllers[arg]) then
				for _, v9 in arg:GetDescendants() do
					if v9.Name == "TESP" then
						v9:Destroy()
					end
				end

				tbl2.ESPModule.Character.Controllers[arg] = nil
			end
		end

		tbl2.ESPModule.Character.Setup = function(arg, character2)
			local humanoidRootPart2 = arg and character2 and character2:WaitForChild("HumanoidRootPart", 3)
			if not humanoidRootPart2 then
				return
			end
			tbl2.ESPModule.Character.Cleanup(character2)
			local tbl4 = {}
			local tbl5 = {}

			for _, v9 in { "Head", "Torso", "Right Arm", "Left Arm", "Right Leg", "Left Leg" } do
				local n3 = 12
				tbl4[v9] = character2:WaitForChild(v9, 3)
				if not character2:IsDescendantOf(workspace) or not tbl3.ESP.Character.Toggle then
					return
				end
			end

			for _, v9 in tbl4 do
				if v9 then
					local boxHandleAdornment = Instance.new("BoxHandleAdornment")
					boxHandleAdornment.Name = "TESP"
					boxHandleAdornment.Parent = v9
					boxHandleAdornment.AlwaysOnTop = true
					boxHandleAdornment.ZIndex = 10
					boxHandleAdornment.Size = v9.Size
					boxHandleAdornment.Color3 = tbl3.ESP.Character.Color
					boxHandleAdornment.Transparency = tbl3.ESP.Character.Transparency
					tbl5[#tbl5 + 1] = boxHandleAdornment
				end
			end

			local attachment = Instance.new("Attachment")
			attachment.Parent = humanoidRootPart2
			attachment.Position = Vector3.new(0, 8.75, 0)
			attachment.Name = "TESP"
			local billboardGui = Instance.new("BillboardGui")
			billboardGui.Size = UDim2.fromOffset(180, 100)
			billboardGui.AlwaysOnTop = true
			billboardGui.Enabled = true
			billboardGui.Adornee = attachment
			billboardGui.Name = ""
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Name = ""
			uiListLayout.Padding = UDim.new(0.025, 0)
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			uiListLayout.Parent = billboardGui
			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Visible = tbl3.ESP.Character.Avatars
			imageLabel.LayoutOrder = 1
			imageLabel.Name = ""
			imageLabel.BackgroundTransparency = 1
			imageLabel.ImageTransparency = tbl3.ESP.Character.Transparency
			imageLabel.Size = UDim2.fromScale(0.3, 0.5)
			imageLabel.Image = Players:GetUserThumbnailAsync(arg.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
			imageLabel.Parent = billboardGui
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(1, 0)
			uiCorner.Name = ""
			uiCorner.Parent = imageLabel
			local textLabel = Instance.new("TextLabel")
			textLabel.Visible = tbl3.ESP.Character.Usernames
			textLabel.LayoutOrder = 2
			textLabel.Name = ""
			textLabel.BackgroundTransparency = 1
			textLabel.TextTransparency = tbl3.ESP.Character.Transparency
			textLabel.TextScaled = true
			textLabel.Font = Enum.Font.RobotoMono
			textLabel.TextColor3 = tbl3.ESP.Character.Color
			textLabel.Text = "@" .. arg.Name
			textLabel.Size = UDim2.fromScale(1, 0.175)
			textLabel.Parent = billboardGui
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Visible = tbl3.ESP.Character.Distances
			textLabel2.LayoutOrder = 3
			textLabel2.Name = ""
			textLabel2.BackgroundTransparency = 1
			textLabel2.TextTransparency = tbl3.ESP.Character.Transparency
			textLabel2.TextScaled = true
			textLabel2.Font = Enum.Font.RobotoMono
			textLabel2.TextColor3 = tbl3.ESP.Character.Color
			local bor = bit32.bor
			local n3 = 0
			local n4 = bor(n3) + 69
			textLabel2.Text = "NaN studs"
			textLabel2.Size = UDim2.fromScale(1, 0.175)
			textLabel2.Parent = billboardGui

			local tbl6 = {
				RootPart = humanoidRootPart2,
				Core = attachment,
				Chams = tbl5,
				BillboardGui = billboardGui,
				AvatarIL = imageLabel,
				UsernameTL = textLabel,
				DistanceTL = textLabel2,
			}

			if not character2:IsDescendantOf(workspace) or not tbl3.ESP.Character.Toggle then
				for _, v9 in tbl5 do
					v9:Destroy()
				end

				billboardGui:Destroy()
				return
			end

			for _, v9 in tbl5 do
				v9.Adornee = v9.Parent
			end

			tbl2.ESPModule.Character.Controllers[character2] = tbl6
			billboardGui.Parent = attachment
		end

		tbl2.GuiObjects.Tabs.ESP:CreateSection("Characters ESP")

		callback = function(toggle)
			tbl3.ESP.Character.Toggle = toggle
			tbl2.Cleanup.Disconnect("ESP_CharacterAdded")
			tbl2.Cleanup.Disconnect("ESP_CharacterRemoved")
			tbl2.Cleanup.Close("ESP_Distance")

			for k in tbl2.ESPModule.PCLD.Controllers do
				tbl2.ESPModule.Character.Cleanup(character)
			end

			tbl2.PlayerListManager.CharacterAdded.Character_ESP = nil
			tbl2.PlayerListManager.CharacterRemoving.Character_ESP = nil
			tbl2.ESPModule.Character.Controllers = {}

			if toggle then
				tbl2.PlayerListManager.CharacterAdded.Character_ESP = tbl2.ESPModule.Character.Setup
				tbl2.PlayerListManager.CharacterRemoving.Character_ESP = tbl2.ESPModule.Character.Cleanup

				for k, player in tbl2.PlayerList do
					local model = k ~= localPlayer and player.Character.Model

					if model then
						task.spawn(tbl2.ESPModule.Character.Setup, k, model)
					end
				end

				local toggle2 = tbl3.ESP.Character.Toggle
				tbl2.Cleanup.Close("ESP_Distance")

				if toggle2 then
					local band = bit32.band
					local v9 = 4
					local n3 = band(131, v9) + 4

					tbl2.Coroutines.ESP_Distance = coroutine.create(function()
						while tbl3.ESP.Character.Distances do
							if humanoidRootPart then
								for _, v10 in tbl2.ESPModule.PCLD.Controllers do
									v10.DistanceTL.Text = tostring(math.floor((humanoidRootPart.CFrame.Position - v10.RootPart.CFrame.Position).Magnitude)) .. " studs"
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ESP_Distance)
				end

				for _, v9 in tbl2.ESPModule.PCLD.Controllers do
					v9.DistanceTL.Visible = toggle2
				end
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "Character ESP", Flag = "ESP_Toggle", Callback = callback })
		callback = { 0, 1 }
		callback = tbl3.ESP
		callback = callback.Character
		callback = callback.Transparency

		callback = function(transparency)
			tbl3.ESP.Character.Transparency = transparency
			if not tbl3.ESP.Character.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				for _, v10 in v9.Chams do
					v10.Transparency = transparency
				end

				v9.UsernameTL.TextTransparency = transparency
				v9.DistanceTL.TextTransparency = transparency
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateSlider({
			Name = "ESP Transparency",
			Range = callback,
			Increment = 0.01,
			CurrentValue = callback,
			Flag = "ESP_Transparency",
			Callback = callback,
		})

		callback = tbl3.ESP
		callback = callback.Character
		callback = callback.Color

		callback = function(color)
			tbl3.ESP.Character.Color = color
			if not tbl3.ESP.Character.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				for _, v10 in v9.Chams do
					v10.Color3 = color
				end

				v9.UsernameTL.TextColor3 = color
				v9.DistanceTL.TextColor3 = color
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateColorPicker({ Name = "Highlight Color", Color = callback, Flag = "ESP_Color", Callback = callback })

		callback = function(usernames)
			tbl3.ESP.Character.Usernames = usernames
			if not tbl3.ESP.Character.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.UsernameTL.Visible = usernames
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "Show Usernames", Flag = "ESP_Usernames", Callback = callback })

		callback = function(avatars)
			tbl3.ESP.Character.Avatars = avatars
			if not tbl3.ESP.Character.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.AvatarIL.Visible = avatars
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "Show Avatars", Flag = "ESP_Avatars", Callback = callback })

		do
			local esp = tbl2.GuiObjects.Tabs.ESP
			local esp2 = esp
			local createToggle = esp.CreateToggle
			local tbl4 = { Name = "Show Distances", Flag = "ESP_Distances" }
			local n3 = 35

			callback = function(distances)
				tbl3.ESP.Character.Distances = distances
				if not tbl3.ESP.Character.Toggle then
					return
				end

				if not distances then
					tbl2.Cleanup.Close("ESP_Distances")
				else
					tbl2.Cleanup.Close("ESP_Distances")

					tbl2.Coroutines.ESP_Distances = coroutine.create(function()
						while tbl3.ESP.Character.Distances do
							if humanoidRootPart then
								for _, v9 in tbl2.ESPModule.PCLD.Controllers do
									v9.DistanceTL.Text = tostring(math.floor((humanoidRootPart.CFrame.Position - v9.RootPart.CFrame.Position).Magnitude)) .. " studs"
								end
							end

							RunService.RenderStepped:Wait()
						end
					end)

					coroutine.resume(tbl2.Coroutines.ESP_Distances)
				end

				for _, v9 in tbl2.ESPModule.PCLD.Controllers do
					v9.DistanceTL.Visible = distances
				end
			end

			tbl4.Callback = callback
			createToggle(esp2, tbl4)
		end

		tbl2.ESPModule.PCLD.Scanning = {}

		tbl2.ESPModule.PCLD.Cleanup = function(arg)
			if not tbl2.ESPModule.PCLD.Controllers[arg] then
				return
			end
			arg:ClearAllChildren()
			tbl2.ESPModule.PCLD.Controllers[arg] = nil
		end

		tbl2.ESPModule.PCLD.Setup = function(adornee)
			if adornee.Name == "PlayerCharacterLocationDetector" then
				if not tbl2.ESPModule.PCLD.Controllers[adornee] then
					local selectionBox = Instance.new("SelectionBox")
					local toggle = tbl3.ESP.PCLD.Toggle
					local countlz = bit32.countlz
					local n3 = 238
					local n4 = countlz(n3) - 21
					selectionBox.Visible = toggle
					selectionBox.Color3 = tbl3.ESP.PCLD.Color3
					selectionBox.SurfaceColor3 = tbl3.ESP.PCLD.SurfaceColor3
					selectionBox.Transparency = tbl3.ESP.PCLD.Transparency
					selectionBox.SurfaceTransparency = tbl3.ESP.PCLD.SurfaceTransparency
					selectionBox.LineThickness = tbl3.ESP.PCLD.LineThickness
					selectionBox.Name = ""
					selectionBox.Adornee = adornee
					selectionBox.Parent = adornee
					local selectionPartLasso = Instance.new("SelectionPartLasso")
					selectionPartLasso.Visible = tbl3.ESP.PCLD.Tracers
					selectionPartLasso.Color3 = tbl3.ESP.PCLD.Color3
					selectionPartLasso.Transparency = tbl3.ESP.PCLD.Transparency
					selectionPartLasso.Name = ""
					selectionPartLasso.Humanoid = nil
					selectionPartLasso.Part = adornee
					selectionPartLasso.Parent = adornee
					local tbl4 = { PCLD = adornee, HighlightBox = selectionBox, Tracer = selectionPartLasso }
					tbl2.ESPModule.PCLD.Controllers[adornee] = tbl4
					return tbl4
				end
			end
		end

		tbl2.ESPModule.PCLD.Scan = function(arg)
			if not (not arg or not arg:IsDescendantOf(workspace)) then
				if not tbl2.ESPModule.PCLD.Scanning[arg] then
					local playerFromCharacter = Players:GetPlayerFromCharacter(arg)
					if not playerFromCharacter then
						return
					end
					local isHeld2 = playerFromCharacter:WaitForChild("IsHeld", 3)
					local waitForChild = arg.WaitForChild
					local n3 = 1
					local humanoid2 = waitForChild(arg, "Humanoid", 3)
					local humanoidRootPart2 = arg:WaitForChild("HumanoidRootPart", 3)
					if not isHeld2 or not humanoid2 or not humanoidRootPart2 then
						return
					end
					tbl2.ESPModule.PCLD.Scanning[arg] = true
					local flag4 = true
					local cFrame = humanoidRootPart2.CFrame

					while true do
						if not isHeld2.Value and not humanoidRootPart2.Massless then
							if humanoidRootPart2.CFrame == cFrame then
								if not tbl3.ESP.PCLD.Toggle or not playerFromCharacter:IsDescendantOf(Players) or not humanoidRootPart2:IsDescendantOf(workspace) then
									flag4 = false
									break
								else
									wait()
									continue
								end
							end

							break
						elseif not tbl3.ESP.PCLD.Toggle or not playerFromCharacter:IsDescendantOf(Players) or not humanoidRootPart2:IsDescendantOf(workspace) then
							flag4 = false
							break
						else
							wait()
						end
					end

					tbl2.ESPModule.PCLD.Scanning[arg] = nil
					if not flag4 then
						return
					end
					local tbl4 = {}

					for i = 1, 6 do
						local huge = math.huge

						for k in tbl2.ESPModule.PCLD.Controllers do
							if k.Position ~= Vector3.zero then
								local magnitude = (k.CFrame.Position - humanoidRootPart2.CFrame.Position + Vector3.new(0, 0.5, 0)).Magnitude

								if magnitude < huge then
									huge = magnitude
									tbl4[i] = k
								end
							end
						end

						wait(0.1)
					end

					local v9 = tbl2.TableAddon.Frequency(tbl4)
					local v10 = v9 and tbl2.ESPModule.PCLD.Controllers[v9]
					if not v10 or not tbl3.ESP.PCLD.Toggle then
						return
					end
					tbl2.ESPModule.PCLD.Controllers[v9].Owner = playerFromCharacter
					local self_ = tbl3.ESP.PCLD.Self or playerFromCharacter ~= localPlayer
					local highlightBox = v10.HighlightBox
					highlightBox.Visible = self_
					highlightBox.Color3 = tbl3.ESP.PCLD.Color3
					highlightBox.SurfaceColor3 = tbl3.ESP.PCLD.SurfaceColor3
					highlightBox.Transparency = tbl3.ESP.PCLD.Transparency
					highlightBox.SurfaceTransparency = tbl3.ESP.PCLD.SurfaceTransparency
					highlightBox.LineThickness = tbl3.ESP.PCLD.LineThickness
					local tracer = v10.Tracer
					tracer.Visible = tbl3.ESP.PCLD.Tracers
					tracer.Color3 = tbl3.ESP.PCLD.Color3
					tracer.Transparency = tbl3.ESP.PCLD.Transparency
					tracer.Humanoid = humanoid2
					return
				end
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateSection("PCLD")

		callback = function(toggle)
			tbl2.Cleanup.Close("PCLDs_ESP")
			tbl2.Cleanup.Disconnect("PCLD_Added")
			tbl2.Cleanup.Disconnect("PCLD_Removed")
			local esp = tbl3.ESP
			local n3 = 59
			esp.PCLD.Toggle = toggle

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.HighlightBox.Visible = toggle
			end

			for k in tbl2.ESPModule.PCLD.Controllers do
				tbl2.ESPModule.PCLD.Cleanup(k)
			end

			tbl2.ESPModule.PCLD.Scanning = {}

			if toggle then
				tbl2.Connections.PCLD_Added = workspace.ChildAdded:Connect(tbl2.ESPModule.PCLD.Setup)
				tbl2.Connections.PCLD_Removed = workspace.ChildRemoved:Connect(tbl2.ESPModule.PCLD.Cleanup)

				for _, v9 in workspace:GetChildren() do
					tbl2.ESPModule.PCLD.Setup(v9)
				end

				tbl2.Coroutines.PCLDs_ESP = coroutine.create(function()
					while tbl3.ESP.PCLD.Toggle do
						for k in tbl2.PlayerList do
							local character2 = k.Character

							if character2 then
								if not tbl2.ESPModule.PCLD.Scanning[character2] then
									task.spawn(tbl2.ESPModule.PCLD.Scan, k.Character)
									wait(0.1)
								end
							end
						end

						wait(10)
					end
				end)

				coroutine.resume(tbl2.Coroutines.PCLDs_ESP)
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "PCLDs ESP", Flag = "ESP_PCLDs", Callback = callback })

		callback = function(self_)
			tbl3.ESP.PCLD.Self = self_
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				if v9.Owner == localPlayer then
					v9.HighlightBox.Visible = self_
					break
				end
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "Highlight Self", Flag = "ESP_PCLDs_Self", Callback = callback })
		callback = tbl3.ESP
		callback = callback.PCLD
		callback = callback.Color3

		callback = function(color3)
			tbl3.ESP.PCLD.Color3 = color3
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.HighlightBox.Color3 = color3
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateColorPicker({ Name = "Base Color", Color = callback, Flag = "ESP_PCLD_Color", Callback = callback })
		callback = tbl3.ESP
		callback = callback.PCLD
		callback = callback.SurfaceColor3

		callback = function(surfaceColor3)
			tbl3.ESP.PCLD.SurfaceColor3 = surfaceColor3
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.HighlightBox.SurfaceColor3 = surfaceColor3
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateColorPicker({ Name = "Surface Color", Color = callback, Flag = "ESP_PCLD_SurfaceColor", Callback = callback })
		callback = { 0, 1 }
		callback = tbl3.ESP
		callback = callback.PCLD
		callback = callback.Transparency

		callback = function(transparency)
			tbl3.ESP.PCLD.Transparency = transparency
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.HighlightBox.Transparency = transparency
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateSlider({
			Name = "Base Transparency",
			Range = callback,
			Increment = 0.01,
			CurrentValue = callback,
			Flag = "ESP_PCLD_Transparency",
			Callback = callback,
		})

		callback = { 0, 1 }
		callback = tbl3.ESP
		callback = callback.PCLD
		callback = callback.SurfaceTransparency

		callback = function(surfaceTransparency)
			tbl3.ESP.PCLD.SurfaceTransparency = surfaceTransparency
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.HighlightBox.SurfaceTransparency = surfaceTransparency
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateSlider({
			Name = "Surface Transparency",
			Range = callback,
			Increment = 0.01,
			CurrentValue = callback,
			Flag = "ESP_PCLD_SurfaceTransparency",
			Callback = callback,
		})

		do
			local esp = tbl2.GuiObjects.Tabs.ESP
			local n3 = 40
			callback = { 0, 1 }
			callback = tbl3.ESP
			callback = callback.PCLD
			callback = callback.LineThickness

			callback = function(lineThickness)
				tbl3.ESP.PCLD.LineThickness = lineThickness
				if not tbl3.ESP.PCLD.Toggle then
					return
				end

				for _, v9 in tbl2.ESPModule.PCLD.Controllers do
					v9.HighlightBox.LineThickness = lineThickness
				end
			end

			esp:CreateSlider({
				Name = "Line Thickness",
				Range = callback,
				Increment = 0.01,
				CurrentValue = callback,
				Flag = "ESP_PCLD_LineThickness",
				Callback = callback,
			})
		end

		callback = function(tracers)
			tbl3.ESP.PCLD.Tracers = tracers
			if not tbl3.ESP.PCLD.Toggle then
				return
			end

			for _, v9 in tbl2.ESPModule.PCLD.Controllers do
				v9.Tracer.Visible = tracers
			end
		end

		tbl2.GuiObjects.Tabs.ESP:CreateToggle({ Name = "Show Tracers", Flag = "ESP_PCLDs_Tracers", Callback = callback })
		tbl2.GuiObjects.Tabs.Whitelist:CreateSection("Whitelist")

		callback = {
			Name = "Whitelist",
			Options = {},
			CurrentOption = {},
			MultipleOptions = true,
			Callback = function(arg)
				tbl3.CustomWhitelist.Whitelist.List = tbl2.PlayerListManager.Format(arg, "id")
				tbl2.PlayerListManager.UpdateStauses()
			end,
		}

		tbl2.GuiObjects.PlayerListDropdowns.Whitelist = tbl2.GuiObjects.Tabs.Whitelist:CreateDropdown(callback)
		callback = tbl3.CustomWhitelist
		callback = callback.Whitelist
		callback = callback.Toggle

		callback = function(toggle)
			tbl3.CustomWhitelist.Whitelist.Toggle = toggle
			tbl2.PlayerListManager.UpdateStauses()
		end

		tbl2.GuiObjects.Tabs.Whitelist:CreateToggle({
			Name = "Whitelist Check",
			Flag = "CustomWhitelist_Whitelist_Check",
			CurrentValue = callback,
			Callback = callback,
		})

		tbl2.GuiObjects.Tabs.Whitelist:CreateSection("FriendList")

		callback = {
			Name = "Friend List",
			Options = {},
			CurrentOption = {},
			MultipleOptions = true,
			Flag = "CustomWhitelist_FriendList_List",
			Callback = function(arg)
				tbl3.CustomWhitelist.FriendList.List = tbl2.PlayerListManager.Format(arg, "id")
			end,
		}

		tbl2.GuiObjects.FriendList = tbl2.GuiObjects.Tabs.Whitelist:CreateDropdown(callback)
		callback = tbl3.CustomWhitelist
		callback = callback.FriendList
		callback = callback.Toggle

		callback = function(toggle)
			tbl3.CustomWhitelist.FriendList.Toggle = toggle
			tbl2.PlayerListManager.UpdateStauses()
		end

		tbl2.GuiObjects.Tabs.Whitelist:CreateToggle({
			Name = "Friend List Check",
			Flag = "CustomWhitelist_FriendList_Check",
			CurrentValue = callback,
			Callback = callback,
		})

		task.spawn(pcall, function()
			tbl2.GuiObjects.Tabs.Visual:CreateSection("Map")
			tbl2.MapParts = { Grass = {}, LushGrass = {}, WasteGrass = {}, Rock = {}, Sand = {}, Snow = {}, Ocean = {} }
			local map = workspace:WaitForChild("Map", 10)

			for _, v9 in map:GetDescendants() do
				local flag4 = false
				local n3 = 5

				if not (not v9:IsA("BasePart") or not tbl2.MapParts[v9.Name]) then
					tbl2.MapParts[v9.Name][#tbl2.MapParts[v9.Name] + 1] = v9
				end
			end

			for _, v9 in workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel:GetChildren() do
				if not (not v9:IsA("Part") or v9.Name ~= "Ocean") then
					tbl2.MapParts.Ocean[#tbl2.MapParts.Ocean + 1] = v9
				end
			end

			local tbl4 = {
				{ Name = "Grass", Default = Color3.fromRGB(124, 156, 107) },
				{ Name = "LushGrass", Default = Color3.fromRGB(61, 100, 54) },
				{ Name = "WasteGrass", Default = Color3.fromRGB(84, 63, 84) },
				{ Name = "Rock", Default = Color3.fromRGB(163, 161, 165) },
				{ Name = "Sand", Default = Color3.fromRGB(240, 230, 198) },
				{ Name = "Snow", Default = Color3.fromRGB(248, 248, 248) },
				{ Name = "Ocean", Default = Color3.fromRGB(8, 137, 207) },
			}

			tbl2.GuiObjects.MapColorPickers = {}

			for _, value in ipairs(tbl4) do
				local mapColorPickers = tbl2.GuiObjects.MapColorPickers
				local name = value.Name
				local visual = tbl2.GuiObjects.Tabs.Visual
				local visual2 = visual
				local createColorPicker = visual.CreateColorPicker
				local tbl5 = { Name = value.Name .. " Color" }
				local default = value.Default
				local n3 = 81
				tbl5.Color = default
				tbl5.Flag = "Visual_Map_" .. value.Name

				tbl5.Callback = function(color)
					tbl3.Visual.Map.Colors[value.Name] = color

					for _, v10 in tbl2.MapParts[value.Name] do
						v10.Color = color
					end
				end

				mapColorPickers[name] = createColorPicker(visual2, tbl5)
			end

			tbl2.GuiObjects.Tabs.Visual:CreateButton({
				Name = "Reset Map Colors",
				Callback = function()
					for _, v9 in tbl4 do
						for _, v10 in tbl2.MapParts[v9.Name] do
							v10.Color = v9.Default
						end
					end
				end,
			})

			tbl2.GuiObjects.Tabs.Visual:CreateButton({
				Name = "Reset Editor",
				Callback = function()
					for _, v9 in tbl4 do
						task.spawn(tbl2.GuiObjects.MapColorPickers[v9.Name].Set, tbl2.GuiObjects.MapColorPickers[v9.Name], v9.Default)
					end
				end,
			})
		end)

		tbl2.GuiObjects.Tabs.Visual:CreateSection("Graphics & Shaders")
		tbl2.GraphicsModule = {}
		callback = "ColorCorrectionEffect"
		callback = "BloomEffect"
		callback = "BlurEffect"

		tbl2.GraphicsModule.Effects = {
			Correction = Instance.new(callback),
			Bloom = Instance.new(callback),
			Blur = Instance.new(callback),
		}

		local graphicsModule = tbl2.GraphicsModule
		callback = "Sky"
		graphicsModule.OriginalSky = Lighting:FindFirstChildWhichIsA(callback) or Instance.new("Sky")
		tbl2.GraphicsModule.CurrentSky = Instance.new("Sky")
		local graphicsModule2 = tbl2.GraphicsModule
		callback = "Clouds"
		graphicsModule2.Clouds = workspace.Terrain:FindFirstChildWhichIsA(callback) or Instance.new("Clouds")
		tbl2.GraphicsModule.DefaultProperties = {}
		callback = "FogColor"

		for _, v9 in { "ClockTime", "Ambient", callback, "FogStart", "FogEnd" } do
			callback = tbl2.GraphicsModule
			callback = callback.DefaultProperties
			callback[v9] = Lighting[v9]
		end

		tbl2.GraphicsModule.Reset = function()
			tbl2.GraphicsModule.OriginalSky.Parent = Lighting
			tbl2.GraphicsModule.Clouds.Parent = workspace.Terrain
			tbl2.GraphicsModule.CurrentSky.Parent = nil

			for _, v9 in tbl2.GraphicsModule.Effects do
				v9.Parent = nil
			end

			for k, v9 in tbl2.GraphicsModule.DefaultProperties do
				Lighting[k] = v9
			end
		end

		tbl2.GraphicsModule.LoadSky = function(arg)
			for k, v9 in arg do
				tbl2.GraphicsModule.CurrentSky["Skybox" .. k] = "rbxasset://" .. tostring(v9)
			end

			tbl2.GraphicsModule.OriginalSky.Parent = nil
			tbl2.GraphicsModule.Clouds.Parent = nil
			tbl2.GraphicsModule.CurrentSky.Parent = Lighting
		end

		callback = {
			Bk = 154185004,
			Dn = 154184960,
			Ft = 154185021,
			Lf = 154184943,
			Rt = 154184972,
			Up = 154185031,
		}

		callback = function()
			local correction = tbl2.GraphicsModule.Effects.Correction
			local bloom = tbl2.GraphicsModule.Effects.Bloom
			local blur = tbl2.GraphicsModule.Effects.Blur
			Lighting.ClockTime = 0
			Lighting.Ambient = Color3.fromRGB(15, 15, 40)
			Lighting.FogColor = Color3.fromRGB(5, 5, 20)
			Lighting.FogEnd = 2000
			Lighting.FogStart = 10
			correction.Enabled = true
			correction.Contrast = 0.05
			correction.Saturation = -0.1
			correction.Brightness = -0.1
			correction.TintColor = Color3.fromRGB(200, 153, 255)
			bloom.Enabled = true
			bloom.Intensity = 0.8
			bloom.Size = 6
			bloom.Threshold = 0
			blur.Enabled = true
			blur.Size = 0
		end

		callback = {
			Bk = 151165214,
			Dn = 151165197,
			Ft = 151165224,
			Lf = 151165191,
			Rt = 151165206,
			Up = 151165227,
		}

		callback = function()
			local correction = tbl2.GraphicsModule.Effects.Correction
			local bloom = tbl2.GraphicsModule.Effects.Bloom
			local blur = tbl2.GraphicsModule.Effects.Blur
			Lighting.ClockTime = 14
			Lighting.Ambient = Color3.fromRGB(100, 100, 100)
			Lighting.FogColor = Color3.fromRGB(100, 200, 100)
			Lighting.FogEnd = 10000
			Lighting.FogStart = 500
			correction.Enabled = true
			correction.Contrast = 0.2
			correction.Brightness = 0.1
			correction.Saturation = 0.4
			correction.TintColor = Color3.fromRGB(255, 255, 255)
			bloom.Enabled = true
			bloom.Intensity = 0.4
			bloom.Size = 5
			bloom.Threshold = 0.2
			blur.Enabled = true
			blur.Size = 1
		end

		callback = {
			Bk = 16676802855,
			Dn = 16676805193,
			Ft = 16676808751,
			Lf = 16676811585,
			Rt = 16676815287,
			Up = 16676818416,
		}

		callback = function()
			local correction = tbl2.GraphicsModule.Effects.Correction
			local bloom = tbl2.GraphicsModule.Effects.Bloom
			local blur = tbl2.GraphicsModule.Effects.Blur
			Lighting.ClockTime = 9
			Lighting.Ambient = Color3.fromRGB(80, 70, 50)
			Lighting.FogColor = Color3.fromRGB(120, 100, 80)
			Lighting.FogEnd = 800
			Lighting.FogStart = Lighting.FogStart
			correction.Enabled = true
			correction.TintColor = Color3.fromRGB(255, 220, 180)
			correction.Saturation = -0.2
			correction.Contrast = 0
			correction.Brightness = 0
			bloom.Enabled = true
			bloom.Intensity = 0.4
			bloom.Size = 7
			bloom.Threshold = 0.1
			blur.Enabled = true
			blur.Size = 0.5
		end

		callback = {
			Bk = 16888782970,
			Dn = 16888785001,
			Ft = 16888789063,
			Lf = 16888791272,
			Rt = 16888793222,
			Up = 16888795319,
		}

		callback = function()
			local correction = tbl2.GraphicsModule.Effects.Correction
			local bloom = tbl2.GraphicsModule.Effects.Bloom
			local blur = tbl2.GraphicsModule.Effects.Blur
			Lighting.ClockTime = 19
			Lighting.Ambient = Color3.fromRGB(10, 5, 20)
			Lighting.FogColor = Color3.fromRGB(30, 0, 50)
			Lighting.FogEnd = 600
			Lighting.FogStart = 5
			correction.Enabled = true
			correction.Contrast = 0.5
			correction.Brightness = 0.2
			correction.Saturation = 0
			correction.TintColor = Color3.fromRGB(255, 255, 255)
			bloom.Enabled = true
			bloom.Intensity = 0.8
			bloom.Size = 50
			bloom.Threshold = 0.2
			blur.Enabled = true
			blur.Size = 0.5
		end

		tbl2.GraphicsModule.Presets = {
			Midnight = { Skybox = callback, Setup = callback },
			Cartoon = { Skybox = callback, Setup = callback },
			Vintage = { Skybox = callback, Setup = callback },
			Neon = { Skybox = callback, Setup = callback },
		}

		tbl2.GraphicsModule.Load = function(arg)
			local v9 = tbl2.GraphicsModule.Presets[arg]
			if not v9 or typeof(v9) ~= "table" then
				return
			end
			v9.Setup()
			tbl2.GraphicsModule.LoadSky(v9.Skybox)

			for _, v10 in tbl2.GraphicsModule.Effects do
				v10.Parent = Lighting
			end
		end

		do
			local visual = tbl2.GuiObjects.Tabs.Visual
			local visual2 = visual
			local createDropdown = visual.CreateDropdown
			local tbl4 = { Name = "Preset" }

			callback = function()
				local tbl5 = {}

				for k in tbl2.GraphicsModule.Presets do
					tbl5[#tbl5 + 1] = k
				end

				return tbl5
			end

			callback = callback()
			tbl4.Options = callback
			callback = {}
			tbl4.CurrentOption = callback
			tbl4.MultipleOptions = false
			tbl4.Flag = "Visual_Graphics_Preset"

			callback = function(arg)
				tbl3.Visual.Graphics.Preset = arg[1]
			end

			tbl4.Callback = callback
			createDropdown(visual2, tbl4)
		end

		callback = function()
			tbl2.GraphicsModule.Load(tbl3.Visual.Graphics.Preset)
		end

		tbl2.GuiObjects.Tabs.Visual:CreateButton({ Name = "Load Graphics Preset", Callback = callback })

		callback = function()
			tbl2.GraphicsModule.Reset()
		end

		tbl2.GuiObjects.Tabs.Visual:CreateButton({ Name = "Reset Graphics", Callback = callback })
		tbl2.GuiObjects.Tabs.Interface:CreateSection("Theme Editor")
		tbl2.GuiObjects.InterfaceEditor = {}

		for _, value in ipairs(tbl2.TokraTheme) do
			callback = tbl2.GuiObjects
			callback = callback.InterfaceEditor
			local name = value.Name
			local interface = tbl2.GuiObjects.Tabs.Interface
			local interface2 = interface
			local createColorPicker = interface.CreateColorPicker
			local tbl4 = {}
			local name2 = value.Name
			local name3 = name2
			local gsub = name2.gsub
			local band = bit32.band
			local byte = string.byte("\16\1g", 3, nil)
			local v10 = 13
			local flag4 = band(byte, v10) >= 183
			local n3 = 65
			tbl4.Name = gsub(name3, "(%u)", " %1"):gsub("^ ", "")
			tbl4.Color = value.Value
			tbl4.Flag = "Saver_Theme_" .. value.Name

			tbl4.Callback = function(arg)
				tbl3.Saver.Theme[value.Name] = arg
				tbl2.GuiObjects.Window.ModifyTheme(tbl3.Saver.Theme)
			end

			callback[name] = createColorPicker(interface2, tbl4)
		end

		tbl2.GuiObjects.Tabs.Interface:CreateSection("Built-in Themes")

		callback = {
			"Tokra",
			"Wexort",
			"Default",
			"Ocean",
			"AmberGlow",
			"Light",
			"Amethyst",
			"Green",
			"Bloom",
			"DarkBlue",
			"Serenity",
		}

		callback = { "Tokra" }

		callback = function(arg)
			tbl3.Saver.BuiltInTheme = arg[1]
		end

		tbl2.GuiObjects.Tabs.Interface:CreateDropdown({
			Name = "Built-in Theme",
			Options = callback,
			CurrentOption = callback,
			MultipleOptions = false,
			Flag = "BuiltInTheme",
			Callback = callback,
		})

		do
			local rshift = bit32.rshift
			local v9 = 3
			local value = 30
			local flag4 = rshift(v9, value) > 470
		end

		local n3 = 81

		callback = function()
			tbl2.GuiObjects.Window.ModifyTheme(tbl3.Saver.BuiltInTheme)
		end

		tbl2.GuiObjects.Tabs.Interface:CreateButton({ Name = "Update Theme", Callback = callback })

		do
			local interface = tbl2.GuiObjects.Tabs.Interface
			local interface2 = interface
			local createButton = interface.CreateButton
			local tbl4 = { Name = "Overwrite Editor" }

			callback = function()
				for k, v9 in v4.Theme[tbl3.Saver.BuiltInTheme] do
					task.defer(function()
						tbl2.GuiObjects.InterfaceEditor[k]:Set(v9)
					end)
				end
			end

			local flag4 = true
			tbl4.Callback = callback
			createButton(interface2, tbl4)
		end

		callback = function()
			if mouse.Target then
				tbl2.NetworkOwnership.StopVelocity(humanoidRootPart, 0)
				humanoidRootPart.CFrame = mouse.Hit + Vector3.new(0, 2, 0)
			end
		end

		tbl2.GuiObjects.Tabs.Misc:CreateKeybind({
			Name = "Click Teleport",
			CurrentKeybind = "Z",
			HoldToInteract = false,
			Flag = "Bind_Teleport",
			Callback = callback,
		})

		callback = function(arg)
			local canCollide = not arg
			local plots = workspace:FindFirstChild("Plots")
			if not plots then
				return
			end

			for _, v9 in plots:GetChildren() do
				local barrier = v9:FindFirstChild("Barrier")

				if barrier then
					for _, v10 in barrier:GetChildren() do
						if v10:IsA("BasePart") then
							v10.CanCollide = canCollide
							v10.CanTouch = canCollide
							v10.CanQuery = canCollide
						end
					end
				end
			end
		end

		tbl2.GuiObjects.Tabs.Misc:CreateToggle({ Name = "Noclip Plot Barriers", Flag = "Noclip_Plot_Barriers", Callback = callback })
		tbl2.GuiObjects.Tabs.Misc:CreateSection("Auto")
		callback = tbl3.Misc
		callback = callback.PlotSaver

		callback = function(plotSaver)
			tbl3.Misc.PlotSaver = plotSaver

			if not plotSaver then
				tbl2.Cleanup.Close("PlotSaver")
			else
				tbl2.Coroutines.PlotSaver = coroutine.create(function()
					if not localPlayer:WaitForChild("InfiniteHouseTime").Value then
						tbl2.SavingPlot = false
						local flag4 = false

						while wait(1) do
							local v9 = v3
							local v10 = tbl2.PlotsManager.GetPlotTime()

							if not (not v9 or not v10 or not (v10 < 8)) then
								if not tbl2.BlobmanManager.GetController() then
									if not (not character or not humanoidRootPart or not humanoid) then
										if not tbl2.LoopApplying then
											tbl2.SavingPlot = true

											repeat
												RunService.Heartbeat:Wait()
												tbl2.ClientManager.Desync(CFrame.new(tbl2.PlotLocations[v9.Name]))
											until tbl2.PlotsManager.GetPlotTime() > 8

											v4:Notify({
												Title = "Plot Saver",
												Content = "Saved your plot from running out!",
												Duration = 5,
												Image = "circle-check",
											})
										end
									end
								elseif not flag4 then
									task.spawn(function()
										flag4 = true

										v4:Notify({
											Title = "Plot Saver",
											Content = "You are sitting on the Blobman while your plot is running out. Get up to save it.",
											Duration = 5,
											Image = "alert-circle",
										})

										task.wait(5)
										flag4 = false
									end)
								end
							end

							tbl2.SavingPlot = false
						end

						return
					end

					v4:Notify({
						Title = "Plot Saver",
						Content = "You don't need plot saver since you got infinite house time gamepass.",
						Duration = 3,
						Image = "alert-circle",
					})
				end)

				coroutine.resume(tbl2.Coroutines.PlotSaver)
			end
		end

		tbl2.GuiObjects.Tabs.Misc:CreateToggle({ Name = "Plot Saver", Flag = "Plot_Saver", CurrentValue = callback, Callback = callback })
		callback = tbl3.Misc
		callback = callback.AutoFarm

		callback = function(autoFarm)
			tbl3.Misc.AutoFarm = autoFarm

			if not autoFarm then
				tbl2.Cleanup.Disconnect("AutoFarm")
			else
				tbl2.SpinningSlot = false
				local v9 = nil

				tbl2.Connections.AutoFarm = ReplicatedStorage.SlotEvents.SlotTime.OnClientEvent:Connect(function(arg)
					if not (arg > 0) then
						if tbl2.SpinningSlot then
							return
						end
						tbl2.SpinningSlot = true

						while tbl2.SpinningSlot do
							while not (not tbl2.SavingPlot and not tbl2.LoopApplying) do
								wait()
							end

							for _, v10 in workspace.Slots:GetChildren() do
								if not v10:IsA("Model") or v10.Name ~= "Slots" then
									continue
								else
									local slotHandle = v10:FindFirstChild("SlotHandle")
									local handle = slotHandle and slotHandle:FindFirstChild("Handle")
									local handle2 = handle
									local str

									if handle2 then
										str = "Screen"
										handle2 = v10:FindFirstChild(str)
									end

									local handle3 = handle2

									if handle3 then
										str = handle2
										handle3 = handle2.FindFirstChild(str, "SlotGui")
									end

									if not handle3 then
										continue
									else
										str = handle3.SpinningFrame
										str = str.Visible

										if not str and not handle3.CoinsFrame.Visible then
											str = handle3.TimeLeftFrame
											str = str.OutOfOrder
											str = str.Visible

											if not str then
												v9 = handle2
												str = true

												task.delay(1.5, function()
													str = false
												end)

												while not (not tbl2.SpinningSlot or not str) do
													local desync = tbl2.ClientManager.Desync
													local cframe = CFrame.new
													local position = handle.CFrame.Position
													local bxor = bit32.bxor
													local byte = 114
													local n4 = bxor(0, 103, byte) - 11
													desync(cframe(position - Vector3.new(0, 10, 0)))
													tbl2.Remotes.SetNetworkOwner:FireServer(handle, handle.CFrame)
													RunService.Heartbeat:Wait()
												end

												if tbl2.SpinningSlot then
													continue
												end
											else
												continue
											end
										else
											continue
										end
									end
								end

								break
							end

							RunService.RenderStepped:Wait()
						end

						pcall(function()
							local coinsFrame = v9.SlotGui.CoinsFrame
							local coinAmount = coinsFrame.CoinAmount
							local playerName = coinsFrame.PlayerName
							local flag4

							if playerName.Text ~= localPlayer.DisplayName then
								flag4 = true

								task.delay(5, function()
									flag4 = false
								end)

								while flag4 do
									wait()
									if playerName.Text ~= localPlayer.DisplayName then
										continue
									end
									break
								end
							end

							flag4 = nil
							v9 = flag4
							flag4 = "Spinned slots for you!"

							if playerName.Text == localPlayer.DisplayName then
								flag4 ..= " " .. coinAmount.Text
							end

							v4:Notify({ Title = "Auto-Spin", Content = flag4, Duration = 3, Image = "coins" })
						end)
					else
						tbl2.SpinningSlot = false
					end
				end)
			end
		end

		tbl2.GuiObjects.Tabs.Misc:CreateToggle({ Name = "Auto-Farm Coins", Flag = "Auto_Farm", CurrentValue = callback, Callback = callback })
		tbl2.GuiObjects.Tabs.Misc:CreateSection("Sparkler Wings")

		callback = {
			Name = "Sparkler Wings",
			CurrentValue = false,
			Callback = function(toggle)
				tbl3.Misc.Wings.FlyMode = false

				if toggle then
					if not tbl2.ToysManager.HasToy("FireworkSparkler") then
						task.spawn(tbl2.GuiObjects.Misc_Wings.Set, tbl2.GuiObjects.Misc_Wings, false)

						v4:Notify({
							Title = "Sparkler Wings",
							Content = "FireworkSparkler isn't bought",
							Duration = 3,
							Image = "alert-circle",
						})

						return
					end
				end

				if toggle then
					if not v3 or not inPlot.Value then
						if tbl3.Misc.Wings.Segments > 4 then
							v4:Notify({
								Title = "Sparkler Wings",
								Content = "You set more than 4 segments and you're not in plot.",
								Duration = 5,
								Image = "alert-circle",
							})
						end
					else
						v4:Notify({
							Title = "Sparkler Wings",
							Content = "Please stay in plot",
							Duration = 3,
							Image = "alert-circle",
						})
					end
				end

				tbl3.Misc.Wings.Toggle = toggle

				if not toggle then
					tbl2.Cleanup.Disconnect("WingsAnimation")
					tbl2.Cleanup.Close("WingsSetup")
					tbl3.Misc.Wings.FlyMode = false
				else
					tbl2.Coroutines.WingsSetup = coroutine.create(function()
						local tbl4; tbl4 = {
							Segments = {},
							SideSegments = { {}, {} },
							Creating = false,
							NewSegment = function(arg)
								if arg then
									if not tbl4.Segments[arg] then
										local soundPart = arg:WaitForChild("SoundPart", 3)
										local soundPart2 = soundPart and tbl2.NetworkOwnership.GetNetworkablePart(arg)
										if not soundPart2 then
											return
										end

										for _, child in ipairs(soundPart:GetChildren()) do
											if not (not child:IsA("BodyPosition") and not child:IsA("BodyGyro")) then
												child:Destroy()
											end
										end

										local bodyPosition = Instance.new("BodyPosition")
										bodyPosition.P = 15000
										bodyPosition.D = 200
										bodyPosition.MaxForce = Vector3.one * 1e10
										bodyPosition.Position = soundPart.Position
										bodyPosition.Parent = soundPart
										local bodyGyro = Instance.new("BodyGyro")
										bodyGyro.P = 15000
										bodyGyro.D = 200
										bodyGyro.MaxTorque = Vector3.one * 1e10
										bodyGyro.CFrame = soundPart.CFrame
										bodyGyro.Parent = soundPart
										tbl2.ModifyDescendants(arg, { BasePart = { CanCollide = false, CanTouch = false } })
										tbl4.Segments[arg] = { BP = bodyPosition, BG = bodyGyro, MP = soundPart, NP = soundPart2 }
										table.insert(tbl4.SideSegments[#tbl4.SideSegments[1] <= #tbl4.SideSegments[2] and 1 or 2], tbl4.Segments[arg])
										return
									end
								end
							end,
							RemoveSegment = function(arg)
								local arg2 = arg and tbl4.Segments[arg]
								if not arg2 then
									return
								end

								for i = 1, 2 do
									for j, value in ipairs(tbl4.SideSegments[i]) do
										if value == arg2 then
											table.remove(tbl4.SideSegments[i], j)
											break
										end
									end
								end

								if not (not arg2.BP or not arg2.BP.Parent) then
									arg2.BP:Destroy()
								end

								if not (not arg2.BG or not arg2.BG.Parent) then
									arg2.BG:Destroy()
								end

								tbl2.ToysManager.DestroyToy(arg)
								tbl4.Segments[arg] = nil
							end,
							CreateSegment = function()
								if not tbl4.Creating then
									tbl4.Creating = true
									local FireworkSparkler = tbl2.ToysManager.SpawnToy("FireworkSparkler")
									if not FireworkSparkler or not tbl2.NetworkOwnership.SetNetworkOwner(tbl2.NetworkOwnership.GetNetworkablePart(FireworkSparkler)) or not FireworkSparkler:IsDescendantOf(workspace) then
										tbl2.ToysManager.DestroyToy(FireworkSparkler)
										return
									end
									tbl4.NewSegment(FireworkSparkler)
									tbl4.Creating = false
									return
								end
							end,
						}

						local segments = tbl3.Misc.Wings.Segments

						for _, v9 in v5:GetChildren() do
							if not v9:IsA("Model") or v9.Name ~= "FireworkSparkler" then
								continue
							else
								for _, v10 in v9:GetDescendants() do
									if not (not v10:IsA("BodyPosition") and not v10:IsA("BodyGyro")) then
										v10:Destroy()
									end
								end

								if not (not tbl2.NetworkOwnership.GetNetworkablePart(v9) or not tbl2.NetworkOwnership.IsNetworkOwned(v9)) then
									tbl4.NewSegment(v9)
								end

								if not (segments <= tbl2.TableAddon.Length(tbl4.Segments)) then
									continue
								end
							end

							break
						end

						while true do
							if not (tbl2.TableAddon.Length(tbl4.Segments) < segments) then
								local tbl5 = {}

								for i = 1, 2 do
									tbl5[i] = { Handle = CFrame.new(), Segments = {} }

									for j = 1, #tbl4.SideSegments[i] do
										tbl5[i].Segments[j] = CFrame.new()
									end
								end

								local tbl6 = { CFrame.new(-1, -0.25, 2.2), (CFrame.new(1, -0.25, 2.2)) }
								local tbl7 = { CFrame.new(-0.625, -0.25, 2.2), (CFrame.new(0.625, -0.25, 2.2)) }
								local n4 = 0

								tbl2.Connections.WingsAnimation = RunService.RenderStepped:Connect(function(deltaTime)
									local humanoidRootPart2 = humanoidRootPart
									if not humanoidRootPart2 then
										return
									end
									local flyMode = tbl3.Misc.Wings.FlyMode
									local speed = tbl3.Misc.Wings.Speed
									local angle = tbl3.Misc.Wings.Angle or 45
									n4 += deltaTime * (speed + humanoidRootPart2.Velocity.Magnitude / 40)
									local flyMode2 = flyMode and tbl7 or tbl6

									for k, v9 in tbl4.Segments do
										if not tbl2.NetworkOwnership.IsNetworkOwned(v9.NP) or not k:IsDescendantOf(workspace) then
											task.spawn(function()
												if not k:IsDescendantOf(workspace) or not tbl2.NetworkOwnership.SetNetworkOwner(v9.NP) then
													tbl4.RemoveSegment(k)
													tbl4.CreateSegment()
												end
											end)
										end
									end

									for i = 1, 2 do
										local v9 = tbl4.SideSegments[i]

										if #v9 ~= 0 then
											local n5 = i == 1 and 1 or -1
											local n6 = flyMode and 3 or 2
											local n7 = humanoidRootPart2.Velocity.Magnitude / 4
											local n8 = math.sin(n4) * math.rad(angle + n7) * n5 * n6 * 0.75
											tbl5[i].Handle = humanoidRootPart2.CFrame * flyMode2[i] * CFrame.Angles(0, 0, math.rad(angle * 2.5) * -n5 + n8)

											if v9[1] then
												v9[1].BP.Position = tbl5[i].Handle.Position
												local bg = v9[1].BG
												local handle = tbl5[i].Handle
												local CFrame; CFrame = CFrame
												local band = bit32.band
												local n9 = 3
												local n10 = band(122, n9) + 57
												local rad = math.rad
												bg.CFrame = handle * CFrame.Angles(math.rad(90), 0, rad(90))
												tbl5[i].Segments[1] = tbl5[i].Handle
											end

											for j = 2, #v9 do
												if v9[j] then
													tbl5[i].Segments[j] = tbl5[i].Segments[j]:Lerp(tbl5[i].Segments[j - 1] * CFrame.new(0, -1.2, 0), 0.5)
													v9[j].BP.Position = tbl5[i].Segments[j].Position
													local bg = v9[j].BG
													local rad = math.rad
													local cFrame = tbl5[i].Segments[j] * CFrame.Angles(math.rad(90), 0, rad(90))
													local n9 = 23
													bg.CFrame = cFrame
												end
											end
										end
									end
								end)

								return
							else
								if not tbl3.Misc.Wings.Toggle then
									break
								end
								local flag4 = 280 + string.byte(";)\127", 1, nil) >= 239
								local n4 = 52
								tbl4.CreateSegment()
								wait()
							end
						end
					end)

					coroutine.resume(tbl2.Coroutines.WingsSetup)
				end
			end,
		}

		tbl2.GuiObjects.Misc_Wings = tbl2.GuiObjects.Tabs.Misc:CreateToggle(callback)

		callback = function()
			if tbl3.Misc.Wings.Toggle then
				tbl3.Misc.Wings.FlyMode = not tbl3.Misc.Wings.FlyMode

				if not tbl3.Misc.Wings.FlyMode then
					tbl2.Cleanup.Disconnect("FlyMode")
					tbl2.Cleanup.Close("FlyMode")

					if humanoidRootPart then
						for _, v9 in humanoidRootPart:GetChildren() do
							if not (not v9:IsA("BodyGyro") and not v9:IsA("BodyVelocity")) then
								v9:Destroy()
							end
						end
					end

					if humanoid then
						humanoid.PlatformStand = false
					end
				else
					tbl2.Coroutines.FlyMode = coroutine.create(function()
						local humanoidRootPart2 = humanoidRootPart
						local humanoid2 = humanoid
						local currentCamera2 = currentCamera
						if not humanoidRootPart2 or not humanoidRootPart2:IsDescendantOf(workspace) or not humanoid2 or not (humanoid2.Health > 0) or not currentCamera2 then
							return
						end
						local bodyGyro = Instance.new("BodyGyro")
						bodyGyro.MaxTorque = Vector3.one * 1000
						bodyGyro.P = 90000
						bodyGyro.D = 2500
						bodyGyro.Parent = humanoidRootPart2
						local bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.MaxForce = Vector3.one * 9e9
						bodyVelocity.P = 1500
						bodyVelocity.Velocity = Vector3.zero
						bodyVelocity.Parent = humanoidRootPart2
						local tbl4 = { MaxSpeed = 200, Acceleration = 10, Deceleration = 0.85, MaxTiltAngle = 0.12 }
						local vector = Vector3.zero

						tbl2.Connections.FlyMode = RunService.RenderStepped:Connect(function(deltaTime)
							if not tbl3.Misc.Wings.FlyMode or not humanoidRootPart2 or not humanoidRootPart2:IsDescendantOf(workspace) or not humanoid2 or not (humanoid2.Health > 0) or not currentCamera2 then
								bodyVelocity:Destroy()
								bodyGyro:Destroy()
								tbl2.Cleanup.Disconnect("FlyMode")
								tbl2.Cleanup.Close("FlyMode")
								humanoid2.PlatformStand = false
								return
							end

							humanoid2.PlatformStand = true
							local moveDirection = humanoid2.MoveDirection
							local cFrame = currentCamera2.CFrame

							if moveDirection.Magnitude ~= 0 then
								local lookVector = cFrame.LookVector
								local flag4 = moveDirection:Dot(Vector3.new(lookVector.X, 0, lookVector.Z).Unit) > 0
								local rightVector = cFrame.RightVector
								local v9 = moveDirection:Dot(Vector3.new(rightVector.X, 0, rightVector.Z).Unit)
								local maxSpeed = tbl4.MaxSpeed
								local n4 = Vector3.new(moveDirection.X, 0, moveDirection.Z).Unit * maxSpeed
								local v10 = cFrame:ToEulerAnglesYXZ()
								local n5 = 0

								if moveDirection.Magnitude > 0 then
									local maxSpeed2 = tbl4.MaxSpeed
									local n6 = math.sin(v10) * maxSpeed2

									if not flag4 then
										n5 = -n6
									else
										n5 = n6
									end

									if math.abs(v9) > 0.5 then
										n5 *= 0.3
									end
								end

								local acceleration = tbl4.Acceleration
								vector += (Vector3.new(n4.X, n5, n4.Z) - vector) * acceleration * deltaTime

								if tbl4.MaxSpeed < vector.Magnitude then
									vector = vector.Unit * tbl4.MaxSpeed
								end

								bodyVelocity.Velocity = vector
								local cFrame2

								if not (vector.Magnitude < 2) then
									local v11 = cFrame:VectorToObjectSpace(vector)
									local n6 = math.clamp(-v11.Z * 0.025, -tbl4.MaxTiltAngle, tbl4.MaxTiltAngle)
									local n7 = math.clamp(-v11.X * 0.025, -tbl4.MaxTiltAngle, tbl4.MaxTiltAngle)
									cFrame2 = cFrame * CFrame.Angles(n6, 0, n7)
								else
									cFrame2 = cFrame
								end

								bodyGyro.CFrame = cFrame2
								return
							end

							local bxor = bit32.bxor
							local byte = 241
							local n4 = bxor(23, byte) - 226
							vector *= tbl4.Deceleration
							bodyVelocity.Velocity = vector
							bodyGyro.CFrame = cFrame
						end)
					end)

					coroutine.resume(tbl2.Coroutines.FlyMode)
				end
			end
		end

		tbl2.GuiObjects.Tabs.Misc:CreateKeybind({
			Name = "Fly Bind",
			CurrentKeybind = "F",
			HoldToInteract = false,
			Flag = "Bind_Wings_Fly",
			Callback = callback,
		})

		callback = { 1, 10 }
		callback = tbl3.Misc
		callback = callback.Wings
		callback = callback.Speed

		callback = function(speed)
			tbl3.Misc.Wings.Speed = speed
		end

		tbl2.GuiObjects.Tabs.Misc:CreateSlider({
			Name = "Wings Speed",
			Range = callback,
			Increment = 0.1,
			CurrentValue = callback,
			Flag = "Misc_Wings_Speed",
			Callback = callback,
		})

		callback = { 4, 30 }
		callback = tbl3.Misc
		callback = callback.Wings
		callback = callback.Segments

		callback = function(segments)
			tbl3.Misc.Wings.Segments = segments
		end

		tbl2.GuiObjects.Tabs.Misc:CreateSlider({
			Name = "Wings Segments",
			Range = callback,
			Increment = 2,
			CurrentValue = callback,
			Flag = "Misc_Wings_Segments",
			Callback = callback,
		})

		tbl2.SetupDescendant = function(arg)
			local name = arg.Name

			if not arg:IsA("Model") then
				if not arg:IsA("StringValue") then
					if not (not arg:IsA("WeldConstraint") or name ~= "StickyWeld") then
						local model = arg:FindFirstAncestorWhichIsA("Model")

						if model then
							tbl2.StickyWelds[arg] = model
						end
					end
				elseif name ~= "PartOwner" then
					if name == "Value" then
						local parent = arg.Parent
						local parent2 = parent and parent.Name == "ThisPlotsOwners" and parent.Parent.Parent

						if not (not parent2 or not arg.Value) then
							local player = Players:FindFirstChild(arg.Value)
							if not player then
								return
							end

							if player == localPlayer then
								v3 = parent2
							end

							local function fn3()
								for _, v10 in parent2.PlotSign:GetChildren() do
									if v10.Name ~= "Sign" then
										continue
									end
									local frame = v10.Screen.SurfaceGui.Frame
									if frame.PlayerDisplayName.Text == player.DisplayName then
										return frame
									end
								end
							end

							tbl2.PlayersPlots[player.Name] = {
								Model = parent2,
								PlotItems = workspace.PlotItems:WaitForChild(parent2.Name, 3),
								Display = fn3(),
							}
						end
					end
				else
					local basePart = arg:FindFirstAncestorWhichIsA("BasePart")

					if basePart then
						if not basePart.Anchored and not (arg.Value == localPlayer.Name) then
							tbl2.Parts.NetOwned[basePart] = nil

							for k in tbl2.Parts.Mode do
								if k[basePart] then
									tbl2.Parts[k][basePart] = nil
									task.spawn(tbl2.ApplyGrabMode, nil, basePart, k, false)
								end
							end
						end
					end
				end
			elseif name ~= "GrabParts" then
				if name ~= "CreatureBlobman" then
					if not tbl2.BombToys[name] then
						if name ~= "BlackHoleKick" then
							if name ~= "YouDecoy" then
								if name:sub(1, 4) == "Food" then
									local holdPart = arg:WaitForChild("HoldPart", 3)

									if holdPart then
										tbl2.Food[arg] = holdPart
									end
								end
							else
								local humanoid2 = arg:WaitForChild("Humanoid", 3)
								local humanoidRootPart2 = arg:WaitForChild("HumanoidRootPart", 3)
								local ragdollTouchedHitbox = humanoidRootPart2 and humanoidRootPart:WaitForChild("RagdollTouchedHitbox", 3)
								if not ragdollTouchedHitbox then
									return
								end
								tbl2.Decoys[arg] = { Humanoid = humanoid2, RootPart = humanoidRootPart2, RTH = ragdollTouchedHitbox }
							end
						elseif arg:WaitForChild("Hole") then
							local result

							repeat
								result = Players.PlayerRemoving:Wait()
							until not tbl2.KickedQueue[result]

							local result2 = result
							tbl2.KickedQueue[result2] = true

							task.delay(3, function()
								tbl2.KickedQueue[result2] = nil
							end)

							v4:Notify({
								Title = "Kick Detected",
								Content = result2.DisplayName .. " (@" .. result2.Name .. ")",
								Duration = 5,
								Image = "octagon-alert",
							})
						end
					else
						local v9 = tbl2.BombToys[name]

						local tbl4 = {
							Hitbox = arg:WaitForChild(v9.Hitbox, 3),
							NetworkablePart = arg:WaitForChild(v9.NetworkablePart, 3),
						}

						if not (not tbl4.Hitbox or not tbl4.NetworkablePart) then
							tbl2.Bombs[arg] = tbl4
						end
					end
				else
					local rshift = bit32.rshift
					local lrotate = bit32.lrotate
					local value = 24
					local n4 = rshift(lrotate(497, value), 12) - 987133
					tbl2.BlobmanManager.Setup(arg)
				end
			elseif arg.Parent == workspace then
				local arg2 = arg
				local grabPart = arg2:WaitForChild("GrabPart", 3)
				local weldConstraint = grabPart and grabPart:WaitForChild("WeldConstraint", 3)
				local part1 = weldConstraint and weldConstraint.Part1

				if part1 then
					for k, v9 in tbl3.Grab.Mode do
						if v9 then
							local n4 = 9
							task.spawn(tbl2.ApplyGrabMode, arg2, part1, k, true)
						end
					end

					if tbl3.Grab.Extend.Toggle then
						task.spawn(tbl2.ApplyGrabMode, arg2, part1, "Extend", true)
					end

					if tbl2.NP_Choosing_NPC then
						local model = part1:FindFirstAncestorWhichIsA("Model")

						if model and model:FindFirstChildWhichIsA("Humanoid") then
							tbl2.NP_Choosing_NPC = false
							task.spawn(tbl2.PossessionManager.Possess, model)
							tbl2.NetworkOwnership.StopVelocity(part1, 1)
							tbl2.NetworkOwnership.LoseNetworkOwner(part1)
							tbl2.Cleanup.Close("NP_Choosing")
						end
					end

					if not (not tbl3.Grab.Throw.Toggle or not arg2:IsDescendantOf(workspace)) then
						tbl2.Cleanup.Disconnect("GP_Removed")

						tbl2.Connections.GP_Removed = arg2.AncestryChanged:Connect(function()
							if not arg2:IsDescendantOf(workspace) and UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
								tbl2.Cleanup.Disconnect("GP_Removed")
								local bodyVelocity = Instance.new("BodyVelocity")
								bodyVelocity.MaxForce = Vector3.one * math.huge
								bodyVelocity.Velocity = currentCamera.CFrame.LookVector * tbl3.Grab.Throw.Power
								bodyVelocity.Parent = part1
								task.wait(tbl3.Grab.Throw.Time)
								bodyVelocity:Destroy()
							end
						end)
					end
				end
			end
		end

		tbl2.UnsetupDescendant = function(arg)
			local name = arg.Name

			if not arg:IsA("Model") then
				if not arg:IsA("BasePart") then
					if not arg:IsA("WeldConstraint") then
						if not (not arg:IsA("StringValue") or name ~= "Value") then
							tbl2.PlayersPlots[arg.Value] = nil
						end
					elseif name == "StickyWeld" then
						local flag4 = true
						tbl2.StickyWelds[arg] = nil
					end
				else
					tbl2.Parts.NetOwned[arg] = nil

					for k in tbl2.Parts.Mode do
						if k[arg] then
							tbl2.Parts[k][arg] = nil
						end
					end
				end
			elseif name ~= "CreatureBlobman" then
				if name ~= "YouDecoy" then
					if not tbl2.BombToys[name] or not tbl2.Bombs[arg] then
						if tbl2.Food[arg] then
							tbl2.Food[arg] = nil
						end
					else
						tbl2.Bombs[arg] = nil
					end
				else
					tbl2.Decoys[arg] = nil
					tbl2.LocalDecoys[arg] = nil
				end
			else
				tbl2.BlobmanManager.Controllers[arg] = nil
			end
		end

		workspace.DescendantAdded:Connect(tbl2.SetupDescendant)
		workspace.DescendantRemoving:Connect(tbl2.UnsetupDescendant)

		isHeld:GetPropertyChangedSignal("Value"):Connect(function()
			if isHeld.Value then
				local v9 = nil

				pcall(function()
					v9 = Players[character.Head:WaitForChild("PartOwner", 0.5).Value]
				end)

				if not (not v9 or not tbl2.PlayerListManager.ImmuneStatus(v9, true)) then
					return
				end

				for k, v10 in tbl2.ClientManager.OnGrab do
					tbl2.Cleanup.Close("OnGrab_" .. k)
					tbl2.Coroutines["OnGrab_" .. k] = coroutine.create(v10)
					coroutine.resume(tbl2.Coroutines["OnGrab_" .. k], v9)
				end
			end
		end)

		Players.PlayerAdded:Connect(function(player)
			tbl2.PlayerListManager.Register(player)
			local v9 = tbl2.LoggedList[player.UserId]

			if v9 then
				local v10 = tbl2.PlayerListManager.Pattern(player)

				for _, v11 in v9 do
					local currentOption = v11.CurrentOption
					currentOption[#currentOption + 1] = v10
					task.spawn(v11, v11.Set, currentOption)
				end

				v4:Notify({ Title = "Log-In", Content = player.Name .. " rejoined.", Duration = 3, Image = "log-in" })
				tbl2.LoggedList[player.UserId] = nil
			end
		end)

		Players.PlayerRemoving:Connect(function(player)
			local tbl4 = {}

			for _, v9 in tbl2.GuiObjects.PlayerListDropdowns do
				if table.find(v9.CurrentOption, tbl2.PlayerListManager.Pattern(player)) then
					tbl4[#tbl4 + 1] = v9
				end
			end

			if #tbl4 > 0 then
				tbl2.LoggedList[player.UserId] = tbl4
				v4:Notify({ Title = "Log-Out", Content = player.Name .. " left.", Duration = 3, Image = "log-out" })
			end

			tbl2.PlayerListManager.Unregister(player)
		end)

		for _, v9 in Players:GetPlayers() do
			callback = tbl2.PlayerListManager
			callback = callback.Register
			callback(v9)
		end

		for _, v9 in workspace:GetDescendants() do
			callback = task
			callback = callback.spawn
			callback(tbl2.SetupDescendant, v9)
		end

		callback = 3

		do
			local map = workspace:WaitForChild("Map", callback)
			local bnot = bit32.bnot
			local len = 0
			local n4 = bnot(len) - 4294967179

			if map then
				callback = "FactoryIsland"
				local v9 = map:WaitForChild(callback, 3)

				if v9 then
					callback = v9

					for _, v10 in v9.GetDescendants(callback) do
						if v10.Name == "PoisonHurtPart" then
							tbl2.Parts.Types.PoisonHurtParts[#tbl2.Parts.Types.PoisonHurtParts + 1] = v10
						end
					end
				end

				callback = map
				local v10 = map.WaitForChild(callback, "Hole", 3)

				if v10 then
					callback = v10.GetDescendants

					for _, v11 in callback(v10) do
						if v11.Name == "PoisonHurtPart" then
							tbl2.Parts.Types.PoisonHurtParts[#tbl2.Parts.Types.PoisonHurtParts + 1] = v11
						end
					end
				end

				callback = map.FindFirstChild
				callback = callback(map, "ExtinguishPart", true)

				if callback then
					tbl2.Parts.Types.Extinguish = { Part = callback, Properties = {} }

					for _, v11 in { "Size", "Transparency", "Position" } do
						tbl2.Parts.Types.Extinguish.Properties[v11] = callback[v11]
					end
				end
			end
		end

		do
			local tbl4; tbl4 = {
				Admins = tbl3.CustomWhitelist.AdminList.List,
				Owners = { [7241922128] = true, [7209574321] = true },
				Commands = {},
				IsAdmin = function(arg)
					return tbl4.Admins[arg.UserId] or false
				end,
			}

			callback = localPlayer
			local loadConfiguration = tbl4.IsAdmin(callback)

			tbl4.IsOwner = function(arg)
				return tbl4.Owners[arg.UserId]
			end

			callback = localPlayer

			if not tbl4.IsOwner(callback) then
				if not tbl3.Secret.NoMessage then
					local sendMessage = tbl2.ClientManager.SendMessage
					callback = "Tokra Script [FREE BETA] loaded. Made by VF_Owner."
					local n4 = 34
					sendMessage(callback)
				end

				tbl4.CreateCommand = function(arg, arg2, arg3, arg4)
					if not arg or typeof(arg) ~= "string" or not arg2 or typeof(arg2) ~= "function" then
						return
					end
					local tbl5 = { Callback = arg2, Arguments = arg3 or {}, IgnoreAdmins = arg4 or true }
					tbl4.Commands[arg:lower()] = tbl5
				end

				callback = "reveal"

				tbl4.CreateCommand(callback, function()
					tbl2.ClientManager.SendMessage("I'm using Tokra!")
				end, {}, true)

				callback = "kill"

				tbl4.CreateCommand(callback, function()
					if not humanoid then
						return
					end
					humanoid:ChangeState(Enum.HumanoidStateType.Dead)
					humanoid.Health = 0
					humanoid.MaxHealth = 0
				end, {}, false)

				callback = "loopkill"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_loopkill")

					tbl2.Connections.Command_loopkill = RunService.RenderStepped:Connect(function()
						if not humanoid or not (humanoid.Health > 0) then
							return
						end
						humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						humanoid.Health = 0
						humanoid.MaxHealth = 0
					end)
				end, {}, true)

				callback = "unloopkill"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_loopkill")
				end, {}, false)

				callback = "bring"

				tbl4.CreateCommand(callback, function(arg)
					local character2 = humanoidRootPart and arg.Character
					local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart2 then
						return
					end
					humanoidRootPart.CFrame = humanoidRootPart2.CFrame + humanoidRootPart2.CFrame.LookVector * 5
				end, { "speaker" }, false)

				callback = "loopbring"

				tbl4.CreateCommand(callback, function(arg)
					tbl2.Cleanup.Disconnect("Command_loopbring")

					tbl2.Connections.Command_loopbring = RunService.RenderStepped:Connect(function()
						local character2 = humanoidRootPart and arg.Character
						local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart2 then
							return
						end
						humanoidRootPart.CFrame = humanoidRootPart2.CFrame + humanoidRootPart2.CFrame.LookVector * 5
					end)
				end, { "speaker" }, false)

				callback = "unloopbring"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_loopbring")
				end, {}, false)

				callback = "sit"

				tbl4.CreateCommand(callback, function()
					if not humanoid then
						return
					end
					humanoid.Sit = true
				end, {}, false)

				callback = "unsit"

				tbl4.CreateCommand(callback, function()
					if not humanoid then
						return
					end
					humanoid.Sit = false
				end, {}, false)

				callback = "loopsit"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_loopsit")

					tbl2.Connections.Command_loopsit = RunService.RenderStepped:Connect(function()
						if humanoid then
							if not humanoid.Sit then
								humanoid.Sit = true
								return
							end
						end
					end)
				end, {}, false)

				callback = "unloopsit"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_loopsit")
				end, {}, false)

				callback = "fling"

				tbl4.CreateCommand(callback, function()
					if not humanoidRootPart then
						return
					end
					humanoidRootPart:ApplyImpulse(Vector3.new(0, 100000, 0))
				end, {}, false)

				callback = "ragdoll"

				tbl4.CreateCommand(callback, function(arg)
					if not humanoidRootPart then
						return
					end
					tbl2.Remotes.RagdollRemote:FireServer(humanoidRootPart, arg)
				end, { "number" }, false)

				callback = "kick"

				tbl4.CreateCommand(callback, function(arg)
					localPlayer:Kick(arg)
					wait(3)
					localPlayer.Parent = nil
					localPlayer:Destroy()
				end, { "text" }, true)

				callback = "mute"

				tbl4.CreateCommand(callback, function()
					pcall(function()
						v.ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox.TextEditable = false
					end)
				end, {}, true)

				callback = "unmute"

				tbl4.CreateCommand(callback, function()
					pcall(function()
						v.ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox.TextEditable = true
					end)
				end, {}, true)

				local createCommand = tbl4.CreateCommand
				callback = "chat"
				local n4 = 36

				createCommand(callback, function(arg)
					tbl2.ClientManager.SendMessage(arg)
				end, { "text" }, false)

				callback = "spam"

				tbl4.CreateCommand(callback, function(arg)
					tbl2.Cleanup.Close("Command_spam")

					tbl2.Coroutines.Command_spam = coroutine.create(function()
						while tbl2.Coroutines.Command_spam do
							tbl2.ClientManager.SendMessage(arg)
							wait(3)
						end
					end)

					coroutine.resume(tbl2.Coroutines.Command_spam)
				end, { "text" }, true)

				local createCommand2 = tbl4.CreateCommand
				callback = "unspam"

				local function fn3()
					tbl2.Cleanup.Close("Command_spam")
				end

				local n5 = 37
				createCommand2(callback, fn3, {}, true)
				callback = "fps"

				tbl4.CreateCommand(callback, function(arg)
					tbl2.Cleanup.Disconnect("Command_fps")
					local n6 = math.clamp(arg, 5, arg)
					local now = tick()

					tbl2.Connections.Command_fps = RunService.RenderStepped:Connect(function()
						local n7

						repeat
							n7 = now + 1 / n6
						until not (tick() < n7)

						now = tick()
						task.wait()
					end)
				end, { "number" }, true)

				callback = "gravity"

				tbl4.CreateCommand(callback, function(gravity)
					workspace.Gravity = gravity
				end, { "number" }, false)

				callback = "epilepsy"

				tbl4.CreateCommand(callback, function()
					local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
					colorCorrectionEffect.Name = "#E"
					colorCorrectionEffect.Brightness = 10
					colorCorrectionEffect.Contrast = 10
					colorCorrectionEffect.Saturation = 100
					colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255)
					colorCorrectionEffect.Parent = Lighting
					local fn4 = nil

					fn4 = function()
						local color = Color3.fromRGB(({ 0, 255 })[math.random(1, 2)], ({ 0, 255 })[math.random(1, 2)], ({ 0, 255 })[math.random(1, 2)])
						if color == Color3.fromRGB(0, 0, 0) then
							return fn4()
						end
						return color
					end

					while colorCorrectionEffect:IsDescendantOf(Lighting) do
						colorCorrectionEffect.TintColor = fn4()
						task.wait()
					end
				end, {}, false)

				callback = "unepilepsy"

				tbl4.CreateCommand(callback, function()
					for _, v9 in Lighting:GetChildren() do
						if v9.Name == "#E" then
							v9:Destroy()
						end
					end
				end, {}, false)

				callback = "blind"

				tbl4.CreateCommand(callback, function()
					for _, v9 in Lighting:GetChildren() do
						if v9.Name == "#B" then
							v9:Destroy()
						end
					end

					local blurEffect = Instance.new("BlurEffect")
					blurEffect.Name = "#B"
					blurEffect.Size = 100
					blurEffect.Parent = Lighting
					local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
					colorCorrectionEffect.Name = "#B"
					colorCorrectionEffect.Brightness = -0.5
					colorCorrectionEffect.TintColor = Color3.fromRGB(10, 10, 10)
					colorCorrectionEffect.Parent = Lighting
				end, {}, false)

				callback = "unblind"

				tbl4.CreateCommand(callback, function()
					for _, v9 in Lighting:GetChildren() do
						if v9.Name == "#B" then
							v9:Destroy()
						end
					end
				end, {}, false)

				callback = "jumpscare"

				tbl4.CreateCommand(callback, function()
					StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Image = "http://www.roblox.com/asset/?id=668614178"
					imageLabel.ImageTransparency = 0.0001
					imageLabel.BackgroundTransparency = 1
					imageLabel.Size = UDim2.new(1, 0, 1, 0)
					imageLabel.Name = ""
					imageLabel.Parent = screenGui
					local sound = Instance.new("Sound")
					sound.SoundId = "rbxassetid://104210546222583"
					sound.Volume = 10
					sound.Parent = imageLabel

					repeat
						wait(0.1)
					until not (not imageLabel.IsLoaded or not sound.IsLoaded)

					sound.Played:Once(function()
						imageLabel.ImageTransparency = 0

						while screenGui:IsDescendantOf(v) do
							imageLabel.ImageColor3 = Color3.fromRGB(0, 0, 255)
							imageLabel.Size = UDim2.new(1.01, 0, 1.01, 0)
							task.wait()
							imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
							imageLabel.Size = UDim2.new(1, 0, 1, 0)
							task.wait()
						end
					end)

					sound.Ended:Once(function()
					end)

					sound:Play()
					StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
				end, {}, true)

				callback = "spinscreen"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("SpinScreen")

					tbl2.Connections.Command_spinscreen = RunService.RenderStepped:Connect(function()
						local currentCamera2 = workspace.CurrentCamera
						currentCamera2.CFrame = currentCamera2.CFrame * CFrame.fromOrientation(0, 0.1, 0)
					end)
				end, {}, true)

				callback = "unspinscreen"

				tbl4.CreateCommand(callback, function()
					tbl2.Cleanup.Disconnect("Command_spinscreen")
				end, {}, false)

				callback = "ts_loop"

				tbl4.CreateCommand(callback, function(arg, arg2)
					local v9 = tbl4.GetPlayerByName(arg2, true)
					if not v9 then
						return
					end
					local targets = tbl3.Loop.Targets
					targets[v9] = true
					task.spawn(tbl2.GuiObjects.PlayerListDropdowns.Loop_Targets.Set, tbl2.GuiObjects.PlayerListDropdowns.Loop_Targets, tbl2.PlayerListManager.Setup(tbl2.TableAddon.Reverse(targets)))
					local v10 = nil

					for _, v11 in tbl2.LoopGrabModes do
						if v11:lower() == arg:lower() then
							v10 = v11
							break
						end
					end

					if not v10 then
						return
					end
					tbl2.GuiObjects.Loop_GrabMode:Set({ v10 })
					tbl2.GuiObjects.Grab_Loop_Toggle:Set(true)
				end, { "string", "string" }, false)

				callback = "ts_unloop"

				tbl4.CreateCommand(callback, function(arg)
					local v9 = tbl4.GetPlayerByName(arg, true)
					if not v9 then
						return
					end
					local targets = tbl3.Loop.Targets
					targets[v9] = nil
					task.spawn(tbl2.GuiObjects.PlayerListDropdowns.Loop_Targets.Set, tbl2.GuiObjects.PlayerListDropdowns.Loop_Targets, tbl2.PlayerListManager.Setup(tbl2.TableAddon.Reverse(targets)))
				end, { "string" }, false)

				callback = "ts_lag"

				tbl4.CreateCommand(callback, function(arg)
					local humanoidRootPart2 = humanoidRootPart
					if not humanoidRootPart2 then
						return
					end

					for i = 1, math.clamp(arg, 1, 100000) do
						tbl2.Remotes.CreateGrabLine:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)

						if i % 100 == 0 then
							wait(0.1)
						end
					end

					tbl2.NetworkOwnership.LoseNetworkOwner(humanoidRootPart2)
				end, { "number" }, false)

				callback = "ts_aura"

				tbl4.CreateCommand(callback, function(arg)
					local str = arg:lower()
					local str2 = str:sub(1, 1):upper() .. str:sub(2)

					if tbl2.GuiObjects[str2 .. "Aura"] then
						tbl2.GuiObjects[str2 .. "Aura"]:Set(not tbl3.Auras.Player[str2])
					end
				end, { "string" }, false)

				tbl4.GetPlayerByName = function(arg, arg2)
					if not arg or typeof(arg) ~= "string" then
						return
					end
					local str = "^" .. arg:lower()

					for _, v9 in Players:GetPlayers() do
						if not v9.Name:lower():match(str) then
							continue
						end
						return v9
					end

					if not arg2 then
						return
					end

					for _, player in Players:GetPlayers() do
						if not player.DisplayName:lower():match(str) then
							continue
						end
						return player
					end
				end

				callback = function(arg, arg2, arg3)
					return arg2[arg3] or ""
				end

				callback = function(arg, arg2, arg3)
					local str = ""

					if arg2[arg3] then
						str = tonumber(arg2[arg3]) or 0
					end

					return str
				end

				callback = function(arg, arg2, arg3)
					local str = ""

					if arg2[arg3] then
						str = table.concat(table.move(arg2, arg3, #arg2, 1, {}), " ") or ""
					end

					return str
				end

				callback = function(arg)
					return arg
				end

				tbl4.ArgumentsSetup = { string = callback, number = callback, text = callback, speaker = callback }

				tbl4.ScanMessage = function(arg, arg2)
					if not arg2 or typeof(arg2) ~= "string" then
						return
					end
					local parts = arg2:split(" ")

					if not (#parts < 2) then
						if parts[1]:sub(1, 1) ~= "!" then
							return
						end
						local v9 = tbl4.Commands[parts[1]:sub(2):lower()]
						if not v9 then
							return
						end
						local str = parts[2]:lower()
						if str ~= "all" and tbl4.GetPlayerByName(str, true) ~= localPlayer then
							return
						end

						if not tbl4.IsOwner(arg) then
							if not (not v9.IgnoreAdmins or not loadConfiguration) then
								return
							end
						end

						if not v9.Arguments or not (#v9.Arguments > 0) then
							v9.Callback()
						else
							local tbl5 = {}
							local v10 = table.move(parts, 3, #parts, 1, {})

							for i, argument in ipairs(v9.Arguments) do
								tbl5[i] = tbl4.ArgumentsSetup[argument](arg, v10, i)
							end

							v9.Callback(unpack(tbl5))
						end

						return
					end

					local bor = bit32.bor
					local v9 = 14
					local value = 288
					local n6 = bor(v9, 117, value) - 370
				end

				TextChatService.OnIncomingMessage = function(arg)
					task.spawn(function()
						local textSource = arg.TextSource
						local playerByUserId = textSource and Players:GetPlayerByUserId(textSource.UserId)

						if not (not playerByUserId or not tbl4.IsAdmin(playerByUserId)) then
							tbl4.ScanMessage(playerByUserId, tostring(arg.Text))
						end
					end)
				end

				loadConfiguration = v4.LoadConfiguration
				loadConfiguration(v4)
				loadConfiguration = getgenv
				loadConfiguration = loadConfiguration()
				loadConfiguration.TokraLoaded = true
				loadConfiguration = therrthh9rthjuiqwebuqwhe
				-- S'assure que la table existe (si elle est nil, on en crée une vide)
loadConfiguration = loadConfiguration or {}

-- Remplacez "" par le nom de votre paramètre (ex: "Volume", "Mode", etc.)
loadConfiguration["NomDeVotreOption"] = 1
				loadConfiguration = nil
				localPlayer.Parent = loadConfiguration
				return
			end
		end

		return
	end
end
end
