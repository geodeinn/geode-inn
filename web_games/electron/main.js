const { app, BrowserWindow, Menu } = require('electron');
const path = require('path');
let mainWindow;
function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1024, height: 700, minWidth: 480, minHeight: 600,
    backgroundColor: '#0d0b08', title: 'The Geode Inn',
    autoHideMenuBar: true,
    webPreferences: { contextIsolation: true, nodeIntegration: false }
  });
  mainWindow.loadFile(path.join(__dirname, '..', 'geode_inn.html'));
  mainWindow.setMenuBarVisibility(false);
}
app.whenReady().then(() => {
  createWindow();
  Menu.setApplicationMenu(null);
  app.on('activate', () => { if (BrowserWindow.getAllWindows().length === 0) createWindow(); });
});
app.on('window-all-closed', () => { if (process.platform !== 'darwin') app.quit(); });
