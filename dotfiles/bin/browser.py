#!/usr/bin/python
# -*- coding: <<encoding>> -*-
#-------------------------------------------------------------------------------
#   <<project>>
#
#-------------------------------------------------------------------------------

import wxversion
import subprocess
#wxversion.select("2.8")
import wx, wx.html
import sys

class HtmlWindow(wx.html.HtmlWindow):
	def __init__(self, parent, id, size=(600,400)):
		wx.html.HtmlWindow.__init__(self,parent, id, size=size)
		if "gtk2" in wx.PlatformInfo:
			self.SetStandardFonts()

	def OnLinkClicked(self, link):
		wx.LaunchDefaultBrowser(link.GetHref())

class AboutBox(wx.Dialog):
	def __init__(self):
		wx.Dialog.__init__(self, None, -1, "About <<project>>",
			style=wx.DEFAULT_DIALOG_STYLE|wx.THICK_FRAME|wx.RESIZE_BORDER|
				wx.TAB_TRAVERSAL)
		hwin = HtmlWindow(self, -1, size=(400,200))
		vers = {}
		vers["python"] = sys.version.split()[0]
		vers["wxpy"] = wx.VERSION_STRING
		hwin.SetPage(aboutText % vers)
		btn = hwin.FindWindowById(wx.ID_OK)
		irep = hwin.GetInternalRepresentation()
		hwin.SetSize((irep.GetWidth()+25, irep.GetHeight()+10))
		self.SetClientSize(hwin.GetSize())
		self.CentreOnParent(wx.BOTH)
		self.SetFocus()

class Frame(wx.Frame):
	def __init__(self, title):
		wx.Frame.__init__(self, None, title=title, pos=(150,150), size=(200,300))
		self.Bind(wx.EVT_CLOSE, self.OnClose)

		panel = wx.Panel(self)
		box = wx.BoxSizer(wx.VERTICAL)

		m_text = wx.StaticText(panel, -1, "Select a browser")
		m_text.SetFont(wx.Font(14, wx.SWISS, wx.NORMAL, wx.BOLD))
		m_text.SetSize(m_text.GetBestSize())
		box.Add(m_text, 0, wx.ALL, 10)

		m_close = wx.Button(panel, wx.ID_CLOSE, "Firefox")
		m_close.Bind(wx.EVT_BUTTON, self.Firefox)
		box.Add(m_close, 0, wx.ALL, 10)

		m_close = wx.Button(panel, wx.ID_CLOSE, "Chromium")
		m_close.Bind(wx.EVT_BUTTON, self.OnClose)
		box.Add(m_close, 0, wx.ALL, 10)

		m_close = wx.Button(panel, wx.ID_CLOSE, "Chrome")
		m_close.Bind(wx.EVT_BUTTON, self.OnClose)
		box.Add(m_close, 0, wx.ALL, 10)

		m_close = wx.Button(panel, wx.ID_CLOSE, "Close")
		m_close.Bind(wx.EVT_BUTTON, self.OnClose)
		box.Add(m_close, 0, wx.ALL, 10)

		panel.SetSizer(box)
		panel.Layout()

	def OnClose(self, event):
		dlg = wx.MessageDialog(self,
			"Do you really want to close this application?",
			"Confirm Exit", wx.OK|wx.CANCEL|wx.ICON_QUESTION)
		result = dlg.ShowModal()
		dlg.Destroy()
		if result == wx.ID_OK:
			self.Destroy()

	def OnAbout(self, event):
		dlg = AboutBox()
		dlg.ShowModal()
		dlg.Destroy()

	def Firefox(self,event):
		subprocess.call(['firefox'])
		self.Destroy()

	def Chromium(self,event):
		subprocess.call(['chromium'])
		self.Destroy()

	def Chrome(self,event):
		subprocess.call(['google-chrome-stable'])
		self.Destroy()

app = wx.App(redirect=True)   # Error messages go to popup window
top = Frame("<<project>>")
top.Show()
app.MainLoop()
