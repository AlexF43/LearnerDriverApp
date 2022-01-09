//
//  DriveDetailsView.swift
//  Learner Driver App
//
//  Created by Alex Fogg on 7/1/22.
//

import SwiftUI
import CoreData

struct DriveDetailsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    var item: Item
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(item.timestamp!, formatter: itemFormatter)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct DriveDetailsView_Previews: PreviewProvider {
    static var previews: some View {
//        let newItem = Item(context: viewContext)
//        newItem.timestamp = Date()
        DriveDetailsView(item: Item())
    }
}
