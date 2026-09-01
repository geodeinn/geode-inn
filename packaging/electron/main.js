const { app, BrowserWindow, ipcMain, session } = require('electron');
const path = require('path');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    minWidth: 800,
    minHeight: 600,
    fullscreenable: true,
    title: 'Geode Inn Arcade',
    backgroundColor: '#0a0a0f',
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      contextIsolation: true,
      nodeIntegration: false,
    },
  });

  // Load the arcade HTML — bundled locally for offline play
  mainWindow.loadFile('arcade.html');

  // Fullscreen on launch
  mainWindow.maximize();

  // Handle gamepad input via Chromium's built-in Gamepad API
  // No extra config needed — Chromium handles it natively

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

// Steam integration hook — check for Steam API when running as Steam app
ipcMain.handle('get-steam-mode', () => {
  return process.env.SteamAppId !== undefined || process.env.SteamGameId !== undefined;
});

// Save data persistence — uses Electron's userData path
const { userData } = app.getPath ? { userData: app.getPath('userData') } : {};
ipcMain.handle('get-save-path', () => {
  return app.getPath('userData');
});
