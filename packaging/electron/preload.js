const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('geodeDesktop', {
  isDesktop: true,
  steamMode: () => ipcRenderer.invoke('get-steam-mode'),
  savePath: () => ipcRenderer.invoke('get-save-path'),
  platform: process.platform,
});
