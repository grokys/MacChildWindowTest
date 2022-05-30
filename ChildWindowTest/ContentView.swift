//
//  ContentView.swift
//  ChildWindowTest
//
//  Created by Steven Kirk on 21/02/22.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        Button("Hello World", action:  openChild)
            .padding(50)
    }
    
    func openChild()  {
        let win = NSWindow();
        win.windowController = ChildWindowController()
        let parent = NSApp.mainWindow
        parent?.addChildWindow(win, ordered: NSWindow.OrderingMode.above)
        win.makeKeyAndOrderFront(self)
        win.contentView = NSHostingView(rootView: ChildView(win: win))
    }
}

class ChildWindowController :NSWindowController, NSWindowDelegate {
    func windowDidChangeScreen(_ notification: Notification) {
        
    }
}

struct ChildView: View {
    var _win: NSWindow;
    
    init(win: NSWindow) {
        _win = win
    }
    
    var body: some View {
        Button("hello", action: debugMe)
            .padding(50)
    }
    
    func debugMe() {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
