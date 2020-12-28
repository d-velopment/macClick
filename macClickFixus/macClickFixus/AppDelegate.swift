//
//  AppDelegate.swift
//  macClickFixus
//
//  Created by Admin on 28.12.2020.
//

import Cocoa
import AVFoundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: 16)
    var player = AVAudioPlayer()
    var timer = Timer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        NSApp.setActivationPolicy(NSApplication.ActivationPolicy.accessory)
        
        statusItem.button?.title = "ᮖ" // ᮿ
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
        
        let soundURL = Bundle.main.path(forResource: "silence", ofType: "mp3")

        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundURL!))
        } catch {
            print("No sound found by URL")
        }
        
        player.play()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.player.currentTime = 0
            self.player.play()
        })
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        self.player.stop()
        self.timer.invalidate()
    }

    @objc func showSettings() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as?
            ViewController else {
            fatalError("No ViewController")
        }
        
        guard let button = statusItem.button else {
            fatalError("Issue with the menu bar")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }

}

