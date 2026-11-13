-- BarbieXD7733 Custom Shiftlock Cursor for Delta
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local guiParent = (gethui and gethui()) or CoreGui

if guiParent:FindFirstChild("BarbieXD7733CustomCursor") then
	guiParent.BarbieXD7733CustomCursor:Destroy()
end

local DEFAULT_CURSOR = "rbxasset://textures/MouseLockedCursor.png"
local currentCursor = DEFAULT_CURSOR
local currentCursorSize = 32 -- Default size

local trackedShiftlockImages = {}

local PRESETS = {
	{Name = "Mocha", Id = "rbxassetid://76125386606642"},
	{Name = "Cute cat cursor", Id = "rbxassetid://115621178181770"},
	{Name = "Pusheen cursor", Id = "rbxassetid://76717953553846"},
	{Name = "Blue star", Id = "rbxassetid://83195808570985"},
	{Name = "Purple star", Id = "rbxassetid://127724131032024"},
	{Name = "Chococat", Id = "rbxassetid://115069155973802"},
	{Name = "Purple", Id = "rbxassetid://96210137292975"},
	{Name = "Blue diamond", Id = "rbxassetid://128065040057921"},
	{Name = "Pink", Id = "rbxassetid://100964344771909"},
	{Name = "Black", Id = "rbxassetid://126118614650506"},
	{Name = "Red", Id = "rbxassetid://98863374632416"},
	{Name = "Green", Id = "rbxassetid://119759612874277"},
	{Name = "Red diamond", Id = "rbxassetid://81281657295791"},
	{Name = "Dark red", Id = "rbxassetid://77360168838913"},
	{Name = "Hot pink", Id = "rbxassetid://135587296644561"},
	{Name = "Pink star", Id = "rbxassetid://72898609756214"},
	{Name = "White diamond", Id = "rbxassetid://73128745789593"},
	{Name = "Cinnamoroll", Id = "rbxassetid://126471280546023"},
	{Name = "Dark blue", Id = "rbxassetid://131845346583590"},
	{Name = "Apple jack", Id = "rbxassetid://76704206998486"},
	{Name = "Red 2024", Id = "rbxassetid://125424179008721"},
	{Name = "Star red", Id = "rbxassetid://88698068299046"},
	{Name = "Orange 2024", Id = "rbxassetid://116575842694212"},
	{Name = "Pink 2024", Id = "rbxassetid://106837847493613"},
	{Name = "Hello kitty bow", Id = "rbxassetid://114869796882261"},
	{Name = "Kuromi", Id = "rbxassetid://103448700055588"},
	{Name = "Teal", Id = "rbxassetid://94596734893693"},
	{Name = "Green 2024", Id = "rbxassetid://95872766524109"},
	{Name = "Hello kitty", Id = "rbxassetid://127352230802210"},
	{Name = "White", Id = "rbxassetid://71805522735110"},
	{Name = "Purple 2024", Id = "rbxassetid://101335475206859"}
}

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BarbieXD7733CustomCursor"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = guiParent

-- Floating White Circle Button ("CC")
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "CCToggleButton"
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(0, 20, 0.42, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Text = "CC"
toggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.Font = Enum.Font.GothamBlack
toggleBtn.TextSize = 15
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = screenGui

local btnCorner = Instance.new("UICorner", toggleBtn)
btnCorner.CornerRadius = UDim.new(1, 0)

local btnStroke = Instance.new("UIStroke", toggleBtn)
btnStroke.Color = Color3.fromRGB(130, 80, 255)
btnStroke.Thickness = 2

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 310, 0, 390)
mainFrame.Position = UDim2.new(0.5, -155, 0.5, -195)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner", mainFrame)
frameCorner.CornerRadius = UDim.new(0, 12)

local frameStroke = Instance.new("UIStroke", mainFrame)
frameStroke.Color = Color3.fromRGB(130, 80, 255)
frameStroke.Thickness = 1.5

-- Top Accent Bar
local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1, 0, 0, 42)
topBar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
topBar.BorderSizePixel = 0

local topBarCorner = Instance.new("UICorner", topBar)
topBarCorner.CornerRadius = UDim.new(0, 12)

local fixCover = Instance.new("Frame", topBar)
fixCover.Size = UDim2.new(1, 0, 0, 10)
fixCover.Position = UDim2.new(0, 0, 1, -10)
fixCover.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
fixCover.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", topBar)
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 12, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Made by BarbieXD7733 || Custom Cursors"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextColor3 = Color3.fromRGB(240, 240, 250)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 11

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -34, 0.5, -14)
closeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 6)

-- Live Active Cursor Preview Box (Left of Input)
local activePreviewFrame = Instance.new("Frame", mainFrame)
activePreviewFrame.Size = UDim2.new(0, 36, 0, 36)
activePreviewFrame.Position = UDim2.new(0.05, 0, 0, 56)
activePreviewFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 32)

local previewCorner = Instance.new("UICorner", activePreviewFrame)
previewCorner.CornerRadius = UDim.new(0, 8)

local previewStroke = Instance.new("UIStroke", activePreviewFrame)
previewStroke.Color = Color3.fromRGB(130, 80, 255)
previewStroke.Thickness = 1

local activePreviewImg = Instance.new("ImageLabel", activePreviewFrame)
activePreviewImg.Size = UDim2.new(0, 24, 0, 24)
activePreviewImg.Position = UDim2.new(0.5, -12, 0.5, -12)
activePreviewImg.BackgroundTransparency = 1
activePreviewImg.Image = currentCursor

-- Decal ID Input Box
local inputBox = Instance.new("TextBox", mainFrame)
inputBox.Size = UDim2.new(0.53, 0, 0, 36)
inputBox.Position = UDim2.new(0.20, 0, 0, 56)
inputBox.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
inputBox.PlaceholderText = "Decal / Image ID..."
inputBox.Text = ""
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 13
inputBox.ClearTextOnFocus = false

local inputCorner = Instance.new("UICorner", inputBox)
inputCorner.CornerRadius = UDim.new(0, 8)

local inputStroke = Instance.new("UIStroke", inputBox)
inputStroke.Color = Color3.fromRGB(45, 45, 60)
inputStroke.Thickness = 1

-- Apply Button
local applyBtn = Instance.new("TextButton", mainFrame)
applyBtn.Size = UDim2.new(0.19, 0, 0, 36)
applyBtn.Position = UDim2.new(0.76, 0, 0, 56)
applyBtn.BackgroundColor3 = Color3.fromRGB(130, 80, 255)
applyBtn.Text = "Set"
applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applyBtn.Font = Enum.Font.GothamBold
applyBtn.TextSize = 13

local applyCorner = Instance.new("UICorner", applyBtn)
applyCorner.CornerRadius = UDim.new(0, 8)

-- Cursor Size Slider UI
local sizeLabel = Instance.new("TextLabel", mainFrame)
sizeLabel.Size = UDim2.new(0.9, 0, 0, 20)
sizeLabel.Position = UDim2.new(0.05, 0, 0, 100)
sizeLabel.BackgroundTransparency = 1
sizeLabel.Text = "CURSOR SIZE: 32 (Max 50)"
sizeLabel.TextXAlignment = Enum.TextXAlignment.Left
sizeLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
sizeLabel.Font = Enum.Font.GothamBold
sizeLabel.TextSize = 11

local sliderBar = Instance.new("Frame", mainFrame)
sliderBar.Size = UDim2.new(0.9, 0, 0, 16)
sliderBar.Position = UDim2.new(0.05, 0, 0, 122)
sliderBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)

local sliderCorner = Instance.new("UICorner", sliderBar)
sliderCorner.CornerRadius = UDim.new(1, 0)

local sliderFill = Instance.new("Frame", sliderBar)
sliderFill.Size = UDim2.new(32/50, 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(130, 80, 255)

local fillCorner = Instance.new("UICorner", sliderFill)
fillCorner.CornerRadius = UDim.new(1, 0)

local sliderButton = Instance.new("TextButton", sliderBar)
sliderButton.Size = UDim2.new(0, 20, 0, 20)
sliderButton.Position = UDim2.new(32/50, -10, 0.5, -10)
sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderButton.Text = ""

local knobCorner = Instance.new("UICorner", sliderButton)
knobCorner.CornerRadius = UDim.new(1, 0)

-- Presets Section Header
local presetsLabel = Instance.new("TextLabel", mainFrame)
presetsLabel.Size = UDim2.new(0.9, 0, 0, 22)
presetsLabel.Position = UDim2.new(0.05, 0, 0, 148)
presetsLabel.BackgroundTransparency = 1
presetsLabel.Text = "PRESETS"
presetsLabel.TextXAlignment = Enum.TextXAlignment.Left
presetsLabel.TextColor3 = Color3.fromRGB(140, 140, 165)
presetsLabel.Font = Enum.Font.GothamBold
presetsLabel.TextSize = 11

-- Scrollable Presets List
local scrollFrame = Instance.new("ScrollingFrame", mainFrame)
scrollFrame.Size = UDim2.new(0.9, 0, 0, 190)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 174)
scrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 3
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(130, 80, 255)

local scrollCorner = Instance.new("UICorner", scrollFrame)
scrollCorner.CornerRadius = UDim.new(0, 8)

local listLayout = Instance.new("UIListLayout", scrollFrame)
listLayout.Padding = UDim.new(0, 6)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local listPadding = Instance.new("UIPadding", scrollFrame)
listPadding.PaddingTop = UDim.new(0, 6)

-- Dragging Functionality for Touch / Mobile
local function makeDraggable(obj, onClick)
	local dragging, dragInput, dragStart, startPos, moved = false, nil, nil, nil, false
	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging, moved = true, false
			dragStart, startPos = input.Position, obj.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					if not moved and onClick then onClick() end
				end
			end)
		end
	end)
	obj.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			if delta.Magnitude > 5 then moved = true end
			obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- Slider Logic (1 to 50)
local function updateSize(inputX)
	local barAbsolutePos = sliderBar.AbsolutePosition.X
	local barAbsoluteSize = sliderBar.AbsoluteSize.X
	local relativeX = math.clamp(inputX - barAbsolutePos, 0, barAbsoluteSize)
	local percentage = relativeX / barAbsoluteSize
	
	currentCursorSize = math.clamp(math.floor(percentage * 49 + 1), 1, 50)
	
	sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
	sliderButton.Position = UDim2.new(percentage, -10, 0.5, -10)
	sizeLabel.Text = "CURSOR SIZE: " .. tostring(currentCursorSize) .. " (Max 50)"

	for imgObj, _ in pairs(trackedShiftlockImages) do
		if imgObj and imgObj.Parent then
			imgObj.Size = UDim2.new(0, currentCursorSize, 0, currentCursorSize)
		end
	end
end

local sliding = false
sliderButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliding = true
	end
end)
sliderBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliding = true
		updateSize(input.Position.X)
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		sliding = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		updateSize(input.Position.X)
	end
end)

-- Decal ID to Asset ID Resolver
local function resolveId(raw)
	local str = tostring(raw):gsub("%s+", "")
	if str == "" then return nil end
	if str:find("rbxasset://") then return str end

	local cleanId = str:match("%d+")
	if not cleanId then return str end

	local success, res = pcall(function()
		return game:GetObjects("rbxassetid://" .. cleanId)
	end)
	if success and res and res[1] and res[1]:IsA("Decal") then
		return res[1].Texture
	end
	return "rbxassetid://" .. cleanId
end

-- Sync all shiftlock cursors
local function syncShiftlockUI(newIcon)
	mouse.Icon = newIcon
	activePreviewImg.Image = newIcon

	for imgObj, _ in pairs(trackedShiftlockImages) do
		if imgObj and imgObj.Parent then
			imgObj.Image = newIcon
			imgObj.Size = UDim2.new(0, currentCursorSize, 0, currentCursorSize)
		else
			trackedShiftlockImages[imgObj] = nil
		end
	end

	local containers = {player:FindFirstChild("PlayerGui"), guiParent}
	for _, container in ipairs(containers) do
		if container then
			for _, v in ipairs(container:GetDescendants()) do
				if v:IsA("ImageLabel") and v ~= activePreviewImg and not v:IsDescendantOf(screenGui) then
					local nameLower = v.Name:lower()
					if v.Image == DEFAULT_CURSOR or trackedShiftlockImages[v] or nameLower:find("cursor") or nameLower:find("crosshair") or nameLower:find("shiftlock") then
						if v.Size.X.Offset <= 80 and v.Size.Y.Offset <= 80 then
							trackedShiftlockImages[v] = true
							v.Image = newIcon
							v.Size = UDim2.new(0, currentCursorSize, 0, currentCursorSize)
						end
					end
				end
			end
		end
	end
end

-- Apply Cursor Function
local function applyCursor(idInput)
	local resolved = resolveId(idInput)
	if not resolved then return end

	currentCursor = resolved
	syncShiftlockUI(currentCursor)

	applyBtn.Text = "✓"
	applyBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 120)
	task.delay(0.6, function()
		if applyBtn and applyBtn.Parent then
			applyBtn.Text = "Set"
			applyBtn.BackgroundColor3 = Color3.fromRGB(130, 80, 255)
		end
	end)
end

-- Keep Locked Cursor Active on Shiftlock every frame
RunService.RenderStepped:Connect(function()
	if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
		if mouse.Icon ~= currentCursor then
			mouse.Icon = currentCursor
		end
	end
	for imgObj, _ in pairs(trackedShiftlockImages) do
		if imgObj and imgObj.Parent then
			if imgObj.Image ~= currentCursor then
				imgObj.Image = currentCursor
			end
			if imgObj.Size.X.Offset ~= currentCursorSize then
				imgObj.Size = UDim2.new(0, currentCursorSize, 0, currentCursorSize)
			end
		end
	end
end)

-- Build Preset Buttons with Live Image Previews
for _, cData in ipairs(PRESETS) do
	local itemBtn = Instance.new("TextButton", scrollFrame)
	itemBtn.Size = UDim2.new(0.92, 0, 0, 36)
	itemBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
	itemBtn.Text = "   " .. cData.Name
	itemBtn.TextXAlignment = Enum.TextXAlignment.Left
	itemBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
	itemBtn.Font = Enum.Font.GothamMedium
	itemBtn.TextSize = 13

	local itemCorner = Instance.new("UICorner", itemBtn)
	itemCorner.CornerRadius = UDim.new(0, 6)

	local preview = Instance.new("ImageLabel", itemBtn)
	preview.Size = UDim2.new(0, 24, 0, 24)
	preview.Position = UDim2.new(1, -32, 0.5, -12)
	preview.BackgroundTransparency = 1
	preview.Image = cData.Id

	itemBtn.MouseButton1Click:Connect(function()
		inputBox.Text = cData.Id:match("%d+") or ""
		applyCursor(cData.Id)
	end)
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #PRESETS * 42 + 10)

-- Connect Toggles and Draggables
makeDraggable(toggleBtn, function()
	mainFrame.Visible = not mainFrame.Visible
end)
makeDraggable(mainFrame)

closeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

applyBtn.MouseButton1Click:Connect(function()
	applyCursor(inputBox.Text)
end)

inputBox.FocusLost:Connect(function(enterPressed)
	if enterPressed and inputBox.Text:gsub("%s+", "") ~= "" then
		applyCursor(inputBox.Text)
	end
end)
