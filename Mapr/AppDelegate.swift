import CoreData
import SwiftUI

@main
struct Mapr: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
        #if os(macOS)
        Settings {
            SettingsView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
        #endif
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Mapr")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
