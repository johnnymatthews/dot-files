#Requires -RunAsAdministrator

# Install apps using winget.
# --------------------------
winget install --id Mozilla.Firefox -e 
winget install --id Flow-Launcher.Flow-Launcher -e
winget install --id Valve.Steam -e
winget install --id Nvidia.GeForceExperience -e
winget install --id Alacritty.Alacritty -e
winget install --id Canonical.Ubuntu.2204 -e 
winget install --id Bitwarden.Bitwarden -e 
winget install --id ProtonTechnologies.ProtonVPN -e 
# --------------------------




# Install WSL.
# github.com/fleschutz/PowerShell/blob/main/scripts/install-wsl.ps1
# -----------------------------------------------------------------

try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	if ($false) {

		& wsl --install

	} else {
		"👉 Step 1/3: Enable WSL..."
		& dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

		"👉 Step 2/3: Enable virtual machine platform..."
		& dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

		"👉 Step 3/3: Enable WSL version 2..."
		& wsl --set-default-version 2
	}

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ installed Windows Subsystem for Linux (WSL) in $Elapsed sec"
	"  NOTE: reboot now, then visit the Microsoft Store and install a Linux distribution (e.g. Ubuntu, openSUSE, SUSE Linux, Kali Linux, Debian, Fedora, Pengwin, or Alpine)"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
# -----------------------------------------------------------------
